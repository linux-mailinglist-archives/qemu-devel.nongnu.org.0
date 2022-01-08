Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE62C4883CF
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 14:47:07 +0100 (CET)
Received: from localhost ([::1]:55358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6C3m-0002Pb-I1
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 08:47:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>) id 1n6BzZ-0001M4-Fo
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 08:42:49 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:57020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>) id 1n6BzW-0005kS-Gm
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 08:42:44 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 7F935CE097D;
 Sat,  8 Jan 2022 13:42:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF3A8C36AE5;
 Sat,  8 Jan 2022 13:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641649356;
 bh=hQLJg/reC9b+EvXMNlt1up4GO6wGeIenlkDQEvW4m3g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oTaJDqri17ndldlKbvClJSSXBCdq5mYI5nozNYP8x+SFn21vj/kI+cqg5Sui3KKPX
 O+PuK+6mdgOqA17X6cVNbaM+5SwbekFYlCv0m4IQLlj2HpOAxZ1j2zqsAYuHg37+oC
 b8EK/eg+PYopiLoQe/3cha1x7sQNuKUhRLRY9OS2g3zu1t2uoBfWRFOAZLZuAP3/s1
 uOHuxbEdXOyX/BDZcRy8yKLicG6CB6GlAtaVtKBjsUqoNwHXg1+cJmn6ATj1LWuL1E
 kcvGvMyeq+9qxBCPxb9Ue6PNqZROwCVOjJoSZkNG7m7JxkoUQtqh30E6PRtGZhkqD0
 MeIM6GEITMgQA==
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maz@kernel.org>)
 id 1n6BzO-00GlKS-MH; Sat, 08 Jan 2022 13:42:34 +0000
MIME-Version: 1.0
Date: Sat, 08 Jan 2022 13:42:34 +0000
From: Marc Zyngier <maz@kernel.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3] hw/arm/virt: KVM: Enable PAuth when supported by the
 host
In-Reply-To: <a3d32f18-dbbb-e462-82ce-722f424707f9@linaro.org>
References: <20220107150154.2490308-1-maz@kernel.org>
 <a3d32f18-dbbb-e462-82ce-722f424707f9@linaro.org>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <c9a3552aa067ba691055841b5e3fb7b7@kernel.org>
X-Sender: maz@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: richard.henderson@linaro.org, qemu-devel@nongnu.org,
 kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org, kernel-team@android.com,
 eric.auger@redhat.com, peter.maydell@linaro.org, drjones@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
Received-SPF: pass client-ip=145.40.73.55; envelope-from=maz@kernel.org;
 helo=sin.source.kernel.org
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 kvm@vger.kernel.org, qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 kernel-team@android.com, kvmarm@lists.cs.columbia.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022-01-07 20:23, Richard Henderson wrote:
> On 1/7/22 7:01 AM, Marc Zyngier wrote:
>> @@ -1380,17 +1380,10 @@ void arm_cpu_finalize_features(ARMCPU *cpu, 
>> Error **errp)
>>               return;
>>           }
>>   -        /*
>> -         * KVM does not support modifications to this feature.
>> -         * We have not registered the cpu properties when KVM
>> -         * is in use, so the user will not be able to set them.
>> -         */
>> -        if (!kvm_enabled()) {
>> -            arm_cpu_pauth_finalize(cpu, &local_err);
>> -            if (local_err != NULL) {
>> +        arm_cpu_pauth_finalize(cpu, &local_err);
>> +        if (local_err != NULL) {
>>                   error_propagate(errp, local_err);
>>                   return;
>> -            }
>>           }
> 
> Indentation is still off -- error + return should be out-dented one 
> level.
> 

Duh. Clearly, my brain can't spot these. Apologies for the extra noise.

> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks. I'll repost a version shortly, unless someone shouts.

         M.
-- 
Jazz is not dead. It just smells funny...

