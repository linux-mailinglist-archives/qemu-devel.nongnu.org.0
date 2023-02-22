Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C6969F607
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 15:01:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUpdz-0006rc-Gh; Wed, 22 Feb 2023 08:58:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pUpdx-0006r9-Mr; Wed, 22 Feb 2023 08:58:49 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pUpdw-0001C2-4V; Wed, 22 Feb 2023 08:58:49 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B40511FF7D;
 Wed, 22 Feb 2023 13:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677074325; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MgLoWDV7twra41hKGjkyZA+PYex7B29ScxcYPwlSsb4=;
 b=jAZ85MBHtGxbhwMilSwbczavNxu0ghSF08CT3FnVS2HGhJE1eyW4GtuEV2dHIt+Jz6/KM7
 4zIvDF15vOGO7QTw7V86epLclBQ++YsK1mV0e1unv6aV3Qc2XzVt9SE4WteRu5HwP4LCDO
 HDCSyLlzTcAYr6zPswqSPjpXPjtEfEI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677074325;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MgLoWDV7twra41hKGjkyZA+PYex7B29ScxcYPwlSsb4=;
 b=3YWl0stPRmybYFYrpde78RCdUBWGnVHtp9cWpjLoeD8Tggqxi9b75llG0/gRAHlfiqHcvS
 V5nSgxGipV7U/vDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 428BE139DB;
 Wed, 22 Feb 2023 13:58:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UvJ1A5Uf9mOAdgAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 22 Feb 2023 13:58:45 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Philippe =?utf-8?Q?Mathieu?=
 =?utf-8?Q?-Daud=C3=A9?=
 <philmd@linaro.org>, Richard Henderson <richard.henderson@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v6 19/29] target/arm: Move 64-bit TCG CPUs into tcg/
In-Reply-To: <CAFEAcA__kyfbPv5tmSTiBJ_O15ND5-QpKpATx856s8XCoUNORw@mail.gmail.com>
References: <20230217201150.22032-1-farosas@suse.de>
 <20230217201150.22032-20-farosas@suse.de>
 <CAFEAcA__kyfbPv5tmSTiBJ_O15ND5-QpKpATx856s8XCoUNORw@mail.gmail.com>
Date: Wed, 22 Feb 2023 10:58:42 -0300
Message-ID: <87356xol7x.fsf@suse.de>
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

Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 17 Feb 2023 at 20:15, Fabiano Rosas <farosas@suse.de> wrote:
>>
>> Move the 64-bit CPUs that are TCG-only:
>> - cortex-a35
>> - cortex-a55
>> - cortex-a72
>> - cortex-a76
>> - a64fx
>> - neoverse-n1
>>
>> Keep the CPUs that can be used with KVM:
>> - cortex-a57
>> - cortex-a53
>> - max
>> - host
>>
>> For the special case "max" CPU, there's a nuance that while KVM/HVF
>> use the "host" model instead, we still cannot move all of the TCG code
>> into the tcg directory because the qtests might reach the !kvm && !hvf
>> branch. Keep the cortex_a57_initfn() call to cover that scenario.
>>
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>
>
>> -/* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
>> - * otherwise, a CPU with as many features enabled as our emulation supports.
>> - * The version of '-cpu max' for qemu-system-arm is defined in cpu.c;
>> - * this only needs to handle 64 bits.
>> - */
>>  static void aarch64_max_initfn(Object *obj)
>>  {
>> -    ARMCPU *cpu = ARM_CPU(obj);
>> -    uint64_t t;
>> -    uint32_t u;
>> -
>>      if (kvm_enabled() || hvf_enabled()) {
>>          /* With KVM or HVF, '-cpu max' is identical to '-cpu host' */
>>          aarch64_host_initfn(obj);
>>          return;
>>      }
>>
>> +    if (tcg_enabled() || qtest_enabled()) {
>> +        aarch64_a57_initfn(obj);
>> +    }
>> +
>
>
>
>> +    if (tcg_enabled()) {
>> +        aarch64_max_tcg_initfn(obj);
>> +    }
>
> Why do this only for TCG, and not qtest ?

I was trying to give qtest a minimum set of features, since it shouldn't
require any to begin with.

I could probably revert to the old behavior of having this code for
qtest as well without breaking the build. It's just a matter of moving
some stuff back from the tcg-only land.

