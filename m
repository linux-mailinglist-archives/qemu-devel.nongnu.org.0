Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 751A56CEC3A
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 16:54:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phXAi-0007CQ-Ku; Wed, 29 Mar 2023 10:53:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schwab@suse.de>) id 1phXAg-0007CH-JI
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 10:53:06 -0400
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <schwab@suse.de>) id 1phXAe-0001V3-Qt
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 10:53:06 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 49E801FDEE;
 Wed, 29 Mar 2023 14:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680101583; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W70CvgaXpVvSeaEjLN6vl79tccp+ZboSleBC1E0iyy4=;
 b=SAZWJnhEFULQERyiA6g6ZGZQW5/rTdHR3DuTTAE8eLojVOFyK97fOyRfLmu8f3zdDB8CLx
 GGIhk3MauRBm+oWnsiIgq2dzGM4vQlSWpGy0nUyvKE4txAwYSA5K1xKO1j2AFpU+xmaWak
 SrN0VBlWfU7jjbmWzhpl7I6nPay7IrY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680101583;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W70CvgaXpVvSeaEjLN6vl79tccp+ZboSleBC1E0iyy4=;
 b=WRzb4WY29D5Ssg/A1bUXpAaCBefvKVS91RNw1TMyXWJ8Edg5PyIPer7jbd0GfWGTzOuoRD
 mptbjH+WdsVHSFDA==
Received: from hawking.suse.de (unknown [10.168.4.11])
 by relay2.suse.de (Postfix) with ESMTP id 3600A2C17D;
 Wed, 29 Mar 2023 14:53:03 +0000 (UTC)
Received: by hawking.suse.de (Postfix, from userid 17005)
 id 225DD4A0378; Wed, 29 Mar 2023 16:53:03 +0200 (CEST)
From: Andreas Schwab <schwab@suse.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Laurent Vivier
 <laurent@vivier.eu>,  qemu-devel@nongnu.org
Subject: Re: [PATCH v2] linux-user: preserve incoming order of environment
 variables in the target
References: <mvmy1nfslvi.fsf@suse.de> <ZCREaEiPyzYogkFj@redhat.com>
 <9e0612a6-cfad-bcb3-8699-faa7e8588349@linaro.org>
X-Yow: Yow!  Is my fallout shelter termite proof?
Date: Wed, 29 Mar 2023 16:53:03 +0200
In-Reply-To: <9e0612a6-cfad-bcb3-8699-faa7e8588349@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Wed, 29 Mar 2023 16:02:52
 +0200")
Message-ID: <mvmpm8rsj74.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=schwab@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mär 29 2023, Philippe Mathieu-Daudé wrote:

> On 29/3/23 16:00, Daniel P. Berrangé wrote:
>> On Wed, Mar 29, 2023 at 03:55:13PM +0200, Andreas Schwab wrote:
>>> Do not reverse the order of environment variables in the target environ
>>> array relative to the incoming environ order.  Some testsuites depend on a
>>> specific order, even though it is not defined by any standard.
>>>
>>> Signed-off-by: Andreas Schwab <schwab@suse.de>
>>> ---
>>>   linux-user/main.c | 6 ++++++
>>>   1 file changed, 6 insertions(+)
>> bsd-user/main.c appears to have an identical code pattern that
>> will need the same fix
>> 
>>>
>>> diff --git a/linux-user/main.c b/linux-user/main.c
>>> index 4b18461969..dbfd3ee8f1 100644
>>> --- a/linux-user/main.c
>>> +++ b/linux-user/main.c
>>> @@ -691,7 +691,13 @@ int main(int argc, char **argv, char **envp)
>>>       envlist = envlist_create();
>>>         /* add current environment into the list */
>>> +    /* envlist_setenv adds to the front of the list; to preserve environ
>>> +       order add from back to front */
>
> Also, QEMU coding style now requires:
>
>   /*
>    * this comment form.
>    */

It's unfortunate that the next comment just below doesn't follow the
correct style, so I didn't notice.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

