Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 234823296A9
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 08:42:26 +0100 (CET)
Received: from localhost ([::1]:46214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGzfl-0006j8-6Z
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 02:42:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lGzeB-0006DO-IM
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 02:40:47 -0500
Received: from mx2.suse.de ([195.135.220.15]:36394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lGze9-000664-Rz
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 02:40:47 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 14D33ADDC;
 Tue,  2 Mar 2021 07:40:41 +0000 (UTC)
Subject: Re: [RFC v2 24/24] target/arm: wrap call to aarch64_sve_change_el in
 tcg_enabled()
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210301164936.19446-1-cfontana@suse.de>
 <20210301164936.19446-25-cfontana@suse.de>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <95d6c4ae-94ce-c3d1-9688-7971e5d702c7@suse.de>
Date: Tue, 2 Mar 2021 08:40:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210301164936.19446-25-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Probably I should describe here that after this patch,

configure --enable-tcg --disable-kvm

is now buildable.

Ciao,

Claudio

On 3/1/21 5:49 PM, Claudio Fontana wrote:
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  target/arm/cpu-sysemu.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/target/arm/cpu-sysemu.c b/target/arm/cpu-sysemu.c
> index 451ad4f8bd..034d073c38 100644
> --- a/target/arm/cpu-sysemu.c
> +++ b/target/arm/cpu-sysemu.c
> @@ -754,11 +754,13 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
>      unsigned int cur_el = arm_current_el(env);
>      int rt;
>  
> -    /*
> -     * Note that new_el can never be 0.  If cur_el is 0, then
> -     * el0_a64 is is_a64(), else el0_a64 is ignored.
> -     */
> -    aarch64_sve_change_el(env, cur_el, new_el, is_a64(env));
> +    if (tcg_enabled()) {
> +        /*
> +         * Note that new_el can never be 0.  If cur_el is 0, then
> +         * el0_a64 is is_a64(), else el0_a64 is ignored.
> +         */
> +        aarch64_sve_change_el(env, cur_el, new_el, is_a64(env));
> +    }
>  
>      if (cur_el < new_el) {
>          /* Entry vector offset depends on whether the implemented EL
> 


