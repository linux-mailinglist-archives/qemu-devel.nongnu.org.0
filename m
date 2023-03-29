Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA6F6CDB7D
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 16:05:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phWQ2-00019M-LC; Wed, 29 Mar 2023 10:04:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schwab@suse.de>) id 1phWPy-00018j-Hb
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 10:04:51 -0400
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <schwab@suse.de>) id 1phWPt-0001mD-Ci
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 10:04:49 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 1C6AE1FDD4;
 Wed, 29 Mar 2023 14:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680098684; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y51txhdeE2km30hGWYWD5qB1LDAn50evJsyF8plR9EI=;
 b=0L4+ZeC5/kPIQ4PqI4SDKOpGP+NMZUB0hqptUZWMKktBPoaYtFd1EyFj8ZAUNEtoXWMMdM
 K79cAEsOT8ghqE8lle2ZQxqvLt9dAGPxDN6iW18CTQ3NzCK7ZP8l9cc3vE+kVs5SeYrKzd
 DAeqRxegUyS7wCp/5xMk3T3aZ4kfQ5U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680098684;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y51txhdeE2km30hGWYWD5qB1LDAn50evJsyF8plR9EI=;
 b=hgzDQK5Q9XPPTSthcbhfPCM3RU+m9+Lq8FRDy4+j7F9F74pAgjJjEI3Y2xD1DytoQySmpA
 ikQ2slef7KjeP+Cg==
Received: from hawking.suse.de (unknown [10.168.4.11])
 by relay2.suse.de (Postfix) with ESMTP id 0C9382C165;
 Wed, 29 Mar 2023 14:04:43 +0000 (UTC)
Received: by hawking.suse.de (Postfix, from userid 17005)
 id D64834A0378; Wed, 29 Mar 2023 16:04:43 +0200 (CEST)
From: Andreas Schwab <schwab@suse.de>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Laurent Vivier <laurent@vivier.eu>,  qemu-devel@nongnu.org
Subject: Re: [PATCH v2] linux-user: preserve incoming order of environment
 variables in the target
References: <mvmy1nfslvi.fsf@suse.de> <ZCREaEiPyzYogkFj@redhat.com>
X-Yow: I just heard the SEVENTIES were over!! And I was just getting in touch
 with my LEISURE SUIT!!
Date: Wed, 29 Mar 2023 16:04:43 +0200
In-Reply-To: <ZCREaEiPyzYogkFj@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Wed, 29 Mar 2023 15:00:08 +0100")
Message-ID: <mvmtty3slfo.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=schwab@suse.de;
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

On Mär 29 2023, Daniel P. Berrangé wrote:

> On Wed, Mar 29, 2023 at 03:55:13PM +0200, Andreas Schwab wrote:
>> Do not reverse the order of environment variables in the target environ
>> array relative to the incoming environ order.  Some testsuites depend on a
>> specific order, even though it is not defined by any standard.
>> 
>> Signed-off-by: Andreas Schwab <schwab@suse.de>
>> ---
>>  linux-user/main.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>
> bsd-user/main.c appears to have an identical code pattern that
> will need the same fix

Yes, but I cannot test it, so I like to let someone else produce the
patch.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

