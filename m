Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C524650E74
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 16:16:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7HsI-000458-5c; Mon, 19 Dec 2022 10:16:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1p7HsG-00043u-0h; Mon, 19 Dec 2022 10:16:16 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1p7HsE-0001e3-HP; Mon, 19 Dec 2022 10:16:15 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7252160ECC;
 Mon, 19 Dec 2022 15:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1671462972; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DoKVAwB8Or20QMd90+mS/yKcsYPxnzunqseZ2wR63pM=;
 b=K2vTes51N2USub2tXvt6TYEmhaCjtYmPoYmND/AZd0dnBSreR35csvRubrVQ8Cr43UoAlC
 BzWZ5+3fuqjxwmv/qTGDaTtveMT7LkOQG2tqebSGBjbjNpv5XSkjUU1MEAWzpnvgp59aMu
 dSngDG/pL9wS83x3S+ch3DHPDz6hoio=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1671462972;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DoKVAwB8Or20QMd90+mS/yKcsYPxnzunqseZ2wR63pM=;
 b=kygEKdhNKEIOU0qXIwvfuGMxPgLcGcEdAL+cIPeb1fCKpemI7mz31VxJWEeafVc6r9c9E+
 EpmTZWqVoSNfniAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F310813498;
 Mon, 19 Dec 2022 15:16:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id heg1LTuAoGMpVAAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 19 Dec 2022 15:16:11 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Alex =?utf-8?Q?Benn?=
 =?utf-8?Q?=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 5/5] target/arm: only perform TCG cpu and machine inits
 if TCG enabled
In-Reply-To: <42c455aa-c93f-9167-59ef-ddf2b46ca2e4@linaro.org>
References: <20221216212944.28229-1-farosas@suse.de>
 <20221216212944.28229-6-farosas@suse.de>
 <42c455aa-c93f-9167-59ef-ddf2b46ca2e4@linaro.org>
Date: Mon, 19 Dec 2022 12:16:09 -0300
Message-ID: <87len38lvq.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
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

Richard Henderson <richard.henderson@linaro.org> writes:

> On 12/16/22 13:29, Fabiano Rosas wrote:
>> -    /*
>> -     * Misaligned thumb pc is architecturally impossible.
>> -     * We have an assert in thumb_tr_translate_insn to verify this.
>> -     * Fail an incoming migrate to avoid this assert.
>> -     */
>> -    if (!is_a64(env) && env->thumb && (env->regs[15] & 1)) {
>> -        return -1;
>> -    }
>> +        /*
>> +         * Misaligned thumb pc is architecturally impossible.
>> +         * We have an assert in thumb_tr_translate_insn to verify this.
>> +         * Fail an incoming migrate to avoid this assert.
>> +         */
>> +        if (!is_a64(env) && env->thumb && (env->regs[15] & 1)) {
>> +            return -1;
>> +        }
>
> This is a sanity check rejecting malformed vmsave.  While hw virt won't have the same 
> assert as mentioned in the comment, it won't be happy and will raise some sort of cpu 
> exception later.  I think it's better to reject the bad vmload early.  I suppose we could 
> expand the comment to that effect, so that it doesn't appear to be wholly tcg inspired.

I see, I'll leave it out of tcg_enabled() and update the comment.

> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
>
> r~

