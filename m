Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAE66DC6EE
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 14:51:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plqyr-0000Jj-0X; Mon, 10 Apr 2023 08:50:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1plqyo-0000Hs-KG; Mon, 10 Apr 2023 08:50:42 -0400
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1plqym-0005MY-TZ; Mon, 10 Apr 2023 08:50:42 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0A5C31FDCD;
 Mon, 10 Apr 2023 12:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1681131036; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e2Uys96eshA/XpUSHgzibBLVcW2vmr8GQRQfTJ4Zdr8=;
 b=VGyj3jgpvilucik3KxQeqoiMfqkYJpJf4IGSGn6LVMrIPqj4KgJBH4wIiApffPY5xE2YlG
 Tv60Tc5eWWjl1JzK5JNh64dHxhr6f4QBWjPtDrjE8d0Q5RhPPZTIiJtQhULI+ZI9l6ONT+
 4NngN5WUFMtsWimpjGThnD16eKznEw0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1681131036;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e2Uys96eshA/XpUSHgzibBLVcW2vmr8GQRQfTJ4Zdr8=;
 b=sJDfFpx2atRBoIGU+Uyn3m/XPexvZA74gmCkO3LA1sS/GWoBeo0pY56XnhQForf2QF9/Ac
 o4lsuyfiL+LPxsCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8636513902;
 Mon, 10 Apr 2023 12:50:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id N8GHExsGNGTgNQAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 10 Apr 2023 12:50:35 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Nicholas Piggin <npiggin@gmail.com>, =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: danielhb413@gmail.com, david@gibson.dropbear.id.au, groug@kaod.org,
 qemu-ppc@nongnu.org, Anton Johansson <anjo@rev.ng>
Subject: Re: [PATCH for-8.0 v2] target/ppc: Fix temp usage in gen_op_arith_modw
In-Reply-To: <CRRV3SRW7H2U.14JIRTJFPXRSU@wheely>
References: <20230408070547.3609447-1-richard.henderson@linaro.org>
 <606b0b02-a167-8cb1-db0f-119442d0aa16@kaod.org>
 <CRRV3SRW7H2U.14JIRTJFPXRSU@wheely>
Date: Mon, 10 Apr 2023 09:50:28 -0300
Message-ID: <87leizkijv.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=farosas@suse.de;
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

"Nicholas Piggin" <npiggin@gmail.com> writes:

> On Sun Apr 9, 2023 at 7:24 AM AEST, C=C3=A9dric Le Goater wrote:
>> On 4/8/23 09:05, Richard Henderson wrote:
>> > Fix a crash writing to 't3', which is now a constant.
>> > Instead, write the result of the remu to 't1'.
>> >=20
>> > Fixes: 7058ff5231a ("target/ppc: Avoid tcg_const_* in translate.c")
>> > Reported-by: Nicholas Piggin <npiggin@gmail.com>
>> > Reviewed-by: Anton Johansson <anjo@rev.ng>
>> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>
>> Looks good:
>>
>>    https://gitlab.com/legoater/qemu/-/pipelines/831847446
>>
>> I have a PR ready for this same branch. If you want to me send,
>> just tell.
>
> Thanks Richard and Cedric. LGTM.
>
>> I don't think we have tcg tests for the prefix or mma instructions
>> introduced in P10. That would be good to have.
>
> I agree, we need to do a bit better on ppc.
>
> I'm trying to get a handle on all the tests we have for these things,
> I haven't looked too closely before. kvm-unit-tests actually works
> well for TCG and I did find some (system level) prefix issues with it.
> I don't know if that's the right place to focus on instruction level
> testing though. QEMU's tcg tests sounds like a better place for it,
> but is it only for userspace tests?

Last time we looked at adding softmmu to the tests:

https://lore.kernel.org/all/20220324190854.156898-1-leandro.lupori@eldorado=
.org.br/

