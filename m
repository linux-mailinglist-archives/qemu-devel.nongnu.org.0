Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF13645735
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 11:11:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2rNl-0003RG-8b; Wed, 07 Dec 2022 05:10:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1p2rNN-0003Nv-1L
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 05:10:06 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1p2rNK-000165-35
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 05:10:04 -0500
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 30E061FE8D;
 Wed,  7 Dec 2022 10:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1670407799; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D7WH3H32Ke9fe2Bru6ISLbp7Lp31mp74DZI5W5U5jCQ=;
 b=rg32SLawJ+j4Xwec7vc5BO+hlZ2zITDnLktw3jzhQGp5W1c1fmGsf0lGjyfKk4E5nRtFcy
 P5ZjCWbWCgrqyzLfVSw/A5b09vzvNGsNu4oqOMTg75CqqHp8M0lZNUHx40fmMqaKQvssx4
 YZpK1DiwHJFqeHl7ZabTORVcmQsq3dk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1670407799;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D7WH3H32Ke9fe2Bru6ISLbp7Lp31mp74DZI5W5U5jCQ=;
 b=hpzFFk5LHhFmVCTOoNIlHkRbuRr3bJhgwereWb04pTmMWgtH+F2kqU53uLkFbyq8HY0/z7
 iVJYeGeD86i3d6CA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 0199E136B4;
 Wed,  7 Dec 2022 10:09:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id yUx6OnZmkGMaAwAAGKfGzw
 (envelope-from <cfontana@suse.de>); Wed, 07 Dec 2022 10:09:58 +0000
Message-ID: <efc84e64-5b64-33f7-bbaa-239bd361d46f@suse.de>
Date: Wed, 7 Dec 2022 11:09:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 02/11] exec: Restrict hwaddr.h to sysemu/
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210517111111.1068153-1-f4bug@amsat.org>
 <20210517111111.1068153-3-f4bug@amsat.org>
 <5d1a9740-df5c-fa6e-8c67-1dcd7174df66@suse.de>
 <34f8c636-6963-8974-39e7-497167c5119a@suse.de>
 <3cee55bd-9ab6-ffaa-9abc-877f60f8f036@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <3cee55bd-9ab6-ffaa-9abc-877f60f8f036@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d;
 envelope-from=cfontana@suse.de; helo=smtp-out2.suse.de
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.27,
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

On 12/6/22 18:09, Philippe Mathieu-Daudé wrote:
> On 6/12/22 16:38, Claudio Fontana wrote:
>> On 12/6/22 15:53, Claudio Fontana wrote:
>>> On 5/17/21 13:11, Philippe Mathieu-Daudé wrote:
>>>> Guard declarations within hwaddr.h against inclusion
>>>> from user-mode emulation.
>>>>
>>>> To make it clearer this header is sysemu specific,
>>>> move it to the sysemu/ directory.
>>>
>>> Hi Philippe,
>>>
>>> do we need include/exec/sysemu/... .h
>>>
>>> as opposed to just use the existing
>>>
>>> include/sysemu/
>>>
>>> ?
>>
>> ...and I would if anything go include/sysemu/exec/ not include/exec/sysemu ,
>>
>> to highlight first that it is part of the sysemu build, when trying to reason about what gets built for sysemu vs anything else.
> 
> While refreshing this series I moved these files directly in 
> include/sysemu/. Do you think the exec/ subdirectory {help|meaning}ful?
> 

Hi Philippe, not so much, I think include/sysemu/ is enough.

Ciao,

Claudio

