Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24825393B3F
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 04:02:33 +0200 (CEST)
Received: from localhost ([::1]:56170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmRpY-0004pY-7j
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 22:02:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lmRnp-000465-0J; Thu, 27 May 2021 22:00:45 -0400
Received: from [115.124.28.52] (port=47494 helo=out28-52.mail.aliyun.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lmRnm-00046D-ON; Thu, 27 May 2021 22:00:44 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07453547|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0777681-0.00232441-0.919908;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047194; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.KJqC6pe_1622167231; 
Received: from 172.27.117.59(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KJqC6pe_1622167231) by smtp.aliyun-inc.com(10.147.40.2);
 Fri, 28 May 2021 10:00:31 +0800
Subject: Re: [PATCH] target/riscv: hardwire bits in hideleg and hedeleg
To: Jose Martins <josemartins90@gmail.com>, qemu-devel@nongnu.org
References: <20210522155902.374439-1-josemartins90@gmail.com>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <a148ce4f-ce1e-afe6-2a4e-0787ce9d4877@c-sky.com>
Date: Fri, 28 May 2021 10:00:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210522155902.374439-1-josemartins90@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Host-Lookup-Failed: Reverse DNS lookup failed for 115.124.28.52 (deferred)
Received-SPF: none client-ip=115.124.28.52; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-52.mail.aliyun.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>

Zhiwei

On 5/22/21 11:59 PM, Jose Martins wrote:
> The specification mandates for certain bits to be hardwired in the
> hypervisor delegation registers. This was not being enforced.
>
> Signed-off-by: Jose Martins <josemartins90@gmail.com>
> ---
>   target/riscv/csr.c | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index d2585395bf..9b74a00cc9 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -394,6 +394,7 @@ static int read_timeh(CPURISCVState *env, int csrno, target_ulong *val)
>   
>   static const target_ulong delegable_ints = S_MODE_INTERRUPTS |
>                                              VS_MODE_INTERRUPTS;
> +static const target_ulong vs_delegable_ints = VS_MODE_INTERRUPTS;
>   static const target_ulong all_ints = M_MODE_INTERRUPTS | S_MODE_INTERRUPTS |
>                                        VS_MODE_INTERRUPTS;
>   static const target_ulong delegable_excps =
> @@ -416,6 +417,14 @@ static const target_ulong delegable_excps =
>       (1ULL << (RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT)) |
>       (1ULL << (RISCV_EXCP_VIRT_INSTRUCTION_FAULT)) |
>       (1ULL << (RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT));
> +static const target_ulong vs_delegable_excps = delegable_excps &
> +    ~((1ULL << (RISCV_EXCP_S_ECALL)) |
> +    (1ULL << (RISCV_EXCP_VS_ECALL)) |
> +    (1ULL << (RISCV_EXCP_M_ECALL)) |
> +    (1ULL << (RISCV_EXCP_INST_GUEST_PAGE_FAULT)) |
> +    (1ULL << (RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT)) |
> +    (1ULL << (RISCV_EXCP_VIRT_INSTRUCTION_FAULT)) |
> +    (1ULL << (RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT)));
>   static const target_ulong sstatus_v1_10_mask = SSTATUS_SIE | SSTATUS_SPIE |
>       SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SPP | SSTATUS_FS | SSTATUS_XS |
>       SSTATUS_SUM | SSTATUS_MXR | SSTATUS_SD;
> @@ -963,7 +972,7 @@ static int read_hedeleg(CPURISCVState *env, int csrno, target_ulong *val)
>   
>   static int write_hedeleg(CPURISCVState *env, int csrno, target_ulong val)
>   {
> -    env->hedeleg = val;
> +    env->hedeleg = val & vs_delegable_excps;
>       return 0;
>   }
>   
> @@ -975,7 +984,7 @@ static int read_hideleg(CPURISCVState *env, int csrno, target_ulong *val)
>   
>   static int write_hideleg(CPURISCVState *env, int csrno, target_ulong val)
>   {
> -    env->hideleg = val;
> +    env->hideleg = val & vs_delegable_ints;
>       return 0;
>   }
>   

