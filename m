Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C49F0650AFA
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 12:56:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7EjJ-0000Fq-Ay; Mon, 19 Dec 2022 06:54:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1p7EjA-0000F1-Tg; Mon, 19 Dec 2022 06:54:41 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1p7Ej9-0007wp-8d; Mon, 19 Dec 2022 06:54:40 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8FF9860791;
 Mon, 19 Dec 2022 11:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1671450876; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7lnRqOFlcPGe5RaCGczGCpL0rMxcQIKVLlnS29R8+Pw=;
 b=o16xBVvJp/icvmDOi1JzXFmI+G/Y5lKk9zOrpHJGSteGmKSzz8/ZDAa69PmShwU4szEYbm
 QFShaWJXbg7xF9e1ahjap8gLMgTSKeNTYkNMwLB61/lea3pDbdlaYGW/+9FwK4x33YE/g7
 mPs8cAAu88ckm67Jui45yo78lXpkV7w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1671450876;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7lnRqOFlcPGe5RaCGczGCpL0rMxcQIKVLlnS29R8+Pw=;
 b=uP0ke4wpzAfuFTTwFxOAOU+LUTFgCalbOMD/iovroKONNgMw9tdORIi27dTn/o4tmf9/eG
 JcagJZYAXoYgAOBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1418613910;
 Mon, 19 Dec 2022 11:54:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id O9t9MvtQoGNpaAAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 19 Dec 2022 11:54:35 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Alex =?utf-8?Q?Benn?=
 =?utf-8?Q?=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 3/5] target/arm: wrap semihosting and psci calls with
 tcg_enabled
In-Reply-To: <7f555a78-1533-7be6-f627-6e594a19c04d@linaro.org>
References: <20221216212944.28229-1-farosas@suse.de>
 <20221216212944.28229-4-farosas@suse.de>
 <7f555a78-1533-7be6-f627-6e594a19c04d@linaro.org>
Date: Mon, 19 Dec 2022 08:54:33 -0300
Message-ID: <87o7rz8v7q.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=195.135.220.29; envelope-from=farosas@suse.de;
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
>> -    if (arm_is_psci_call(cpu, cs->exception_index)) {
>> -        arm_handle_psci_call(cpu);
>> -        qemu_log_mask(CPU_LOG_INT, "...handled as PSCI call\n");
>> -        return;
>> -    }
>> +    if (tcg_enabled()) {
>> +        if (arm_is_psci_call(cpu, cs->exception_index)) {
>
> This could be
>
>      if (tcg_enabled() && arm_is_psci_call(...))
>
> because...
>
>> -    /*
>> -     * Semihosting semantics depend on the register width of the code
>> -     * that caused the exception, not the target exception level, so
>> -     * must be handled here.
>> -     */
>> +        /*
>> +         * Semihosting semantics depend on the register width of the code
>> +         * that caused the exception, not the target exception level, so
>> +         * must be handled here.
>> +         */
>>   #ifdef CONFIG_TCG
>> -    if (cs->exception_index == EXCP_SEMIHOST) {
>> -        tcg_handle_semihosting(cs);
>> -        return;
>> -    }
>> +        if (cs->exception_index == EXCP_SEMIHOST) {
>
> If you were able to replace the ifdef, that would be one thing, but since you aren't I 
> don't think this requires a separate check.  There is no way to generate EXCP_SEMIHOST 
> except via TCG.

Right, I had to keep the ifdef that was being removed in the original
patch because tcg_handle_semihosting had moved elsewhere in Claudio's
series.

>
> I guess I don't insist, since you're working toward Claudio's much larger patch set, so
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

If you don't mind I'll leave like this then, unless this comes to a v2.

Thank you

