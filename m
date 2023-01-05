Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4665F65EC95
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 14:12:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDQ31-00034O-Lz; Thu, 05 Jan 2023 08:12:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pDQ2z-00031v-Sf; Thu, 05 Jan 2023 08:12:41 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pDQ2x-0005QG-OX; Thu, 05 Jan 2023 08:12:41 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 52B1234695;
 Thu,  5 Jan 2023 13:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1672924357; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WzghHjmiibt/gZgn8wRCdDuc7ZDiIi5G54b+NyRvHes=;
 b=zUTpVZOEMCpgOGwhWUPnyFNQ1iL7BobQmc0xc6Bm8IE3z+I5Q1k5Fjnd32xWQHsz1eWnFo
 pm0YWwdjyIQiYH8eduVJWCNkQyu1YtYwdVzDf9JKR5eiXpCom7cHU79U/IyiCC2Y0+exTu
 oK3peQWLZYdvsi3Kp3CrAE+TikbIEgA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1672924357;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WzghHjmiibt/gZgn8wRCdDuc7ZDiIi5G54b+NyRvHes=;
 b=uvuxLFo0o3ubrld30GMm1GmbB3Dsl7UPDVTPDQMnREZwAzM3iNOpoC4zsxbTlqrG52pdaT
 DyVjdmi3KKrO1qDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CF501138DF;
 Thu,  5 Jan 2023 13:12:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KIU2JcTMtmOfZAAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 05 Jan 2023 13:12:36 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Alex =?utf-8?Q?Benn?=
 =?utf-8?Q?=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
Subject: Re: [RFC PATCH 19/27] target/arm: Move common cpregs code into a
 separate file
In-Reply-To: <2b66b91d-aae1-a94a-053b-05af0d5d59a7@linaro.org>
References: <20230104215835.24692-1-farosas@suse.de>
 <20230104215835.24692-20-farosas@suse.de>
 <2b66b91d-aae1-a94a-053b-05af0d5d59a7@linaro.org>
Date: Thu, 05 Jan 2023 10:12:34 -0300
Message-ID: <87mt6xnn0d.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
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

Richard Henderson <richard.henderson@linaro.org> writes:

> On 1/4/23 13:58, Fabiano Rosas wrote:
>> Code moved verbatim.
>> 
>> Signed-off-by: Fabiano Rosas<farosas@suse.de>
>> ---
>> Extracted from:
>> https://lore.kernel.org/r/20210416162824.25131-15-cfontana@suse.de
>> [RFC v14 14/80] target/arm: split cpregs from tcg/helper.c
>> ---
>>   target/arm/cpregs.c    | 482 +++++++++++++++++++++++++++++++++++++++++
>>   target/arm/helper.c    | 472 ----------------------------------------
>>   target/arm/meson.build |   1 +
>>   3 files changed, 483 insertions(+), 472 deletions(-)
>>   create mode 100644 target/arm/cpregs.c
>
> Ok, now I'd like to know what the intended difference between cpregs.c and 
> cpustate-list.c.  If it were only write_cpustate_to_list and write_list_to_cpustate in the 
> latter file, that might be one thing.  But get_arm_cp_reginfo definitely belongs in cpregs.c.

Well, to be honest, this came from a reviewed patch from the original
series, so I assumed it had already been discussed and didn't put much
thought into it.

I'll have to rethink this split a little bit due to your comment in
patch 20 anyway, so I might just drop this new file.

Thanks

>
>
> r~

