Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D2C5229AC
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 04:28:50 +0200 (CEST)
Received: from localhost ([::1]:52896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noc5p-0007dj-FJ
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 22:28:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1noc41-0006P3-0R; Tue, 10 May 2022 22:26:57 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:38994 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1noc3y-0003ML-GK; Tue, 10 May 2022 22:26:56 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowACXn5PoHntiM2WzBQ--.5093S2;
 Wed, 11 May 2022 10:26:48 +0800 (CST)
Subject: Re: [PATCH qemu v2 06/10] target/riscv: rvv: Add mask agnostic for
 vector fix-point arithmetic instructions
To: ~eopxd <yueh.ting.chen@gmail.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>,
 WeiWei Li <liweiwei@iscas.ac.cn>, eop Chen <eop.chen@sifive.com>
References: <165220716770.22380.2493420346587893209-6@git.sr.ht>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <4430669e-011c-e98f-d7a1-bc5b133d9fea@iscas.ac.cn>
Date: Wed, 11 May 2022 10:26:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <165220716770.22380.2493420346587893209-6@git.sr.ht>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowACXn5PoHntiM2WzBQ--.5093S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCr4xAFyrGFW7JFy8GF4xtFb_yoW5Cr43pr
 WIyr9IyFZIkFy3X3s3WF4jvr15X3Z5Gw4DCwn5Aw1rWryqgrs5ArykGwn7ZrWUG3s7ur4Y
 y3WrArs2qan5XaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
 4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
 Yx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbV
 WUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07Al
 zVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
 0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFyl
 IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
 AFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6Fyj6rWUJwCI42IY6I8E87Iv67AKxVWU
 JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUOG
 QDUUUUU
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.84; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/3/17 下午4:52, ~eopxd 写道:
> From: Yueh-Ting (eop) Chen <eop.chen@sifive.com>
>
> Signed-off-by: eop Chen <eop.chen@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> ---
>   target/riscv/vector_helper.c | 26 ++++++++++++++++----------
>   1 file changed, 16 insertions(+), 10 deletions(-)


Reviewed-by: Weiwei Li<liweiwei@iscas.ac.cn>

Regards,
Weiwei Li
>
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 9bb259586d..4e48c92617 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -2131,10 +2131,12 @@ static inline void
>   vext_vv_rm_1(void *vd, void *v0, void *vs1, void *vs2,
>                CPURISCVState *env,
>                uint32_t vl, uint32_t vm, int vxrm,
> -             opivv2_rm_fn *fn)
> +             opivv2_rm_fn *fn, uint32_t vma, uint32_t esz)
>   {
>       for (uint32_t i = env->vstart; i < vl; i++) {
>           if (!vm && !vext_elem_mask(v0, i)) {
> +            /* set masked-off elements to 1s */
> +            vext_set_elems_1s(vd, vma, i * esz, (i + 1) * esz);
>               continue;
>           }
>           fn(vd, vs1, vs2, i, env, vxrm);
> @@ -2152,23 +2154,24 @@ vext_vv_rm_2(void *vd, void *v0, void *vs1, void *vs2,
>       uint32_t vl = env->vl;
>       uint32_t total_elems = vext_get_total_elems(env, desc, esz);
>       uint32_t vta = vext_vta(desc);
> +    uint32_t vma = vext_vma(desc);
>   
>       switch (env->vxrm) {
>       case 0: /* rnu */
>           vext_vv_rm_1(vd, v0, vs1, vs2,
> -                     env, vl, vm, 0, fn);
> +                     env, vl, vm, 0, fn, vma, esz);
>           break;
>       case 1: /* rne */
>           vext_vv_rm_1(vd, v0, vs1, vs2,
> -                     env, vl, vm, 1, fn);
> +                     env, vl, vm, 1, fn, vma, esz);
>           break;
>       case 2: /* rdn */
>           vext_vv_rm_1(vd, v0, vs1, vs2,
> -                     env, vl, vm, 2, fn);
> +                     env, vl, vm, 2, fn, vma, esz);
>           break;
>       default: /* rod */
>           vext_vv_rm_1(vd, v0, vs1, vs2,
> -                     env, vl, vm, 3, fn);
> +                     env, vl, vm, 3, fn, vma, esz);
>           break;
>       }
>       /* set tail elements to 1s */
> @@ -2252,10 +2255,12 @@ static inline void
>   vext_vx_rm_1(void *vd, void *v0, target_long s1, void *vs2,
>                CPURISCVState *env,
>                uint32_t vl, uint32_t vm, int vxrm,
> -             opivx2_rm_fn *fn)
> +             opivx2_rm_fn *fn, uint32_t vma, uint32_t esz)
>   {
>       for (uint32_t i = env->vstart; i < vl; i++) {
>           if (!vm && !vext_elem_mask(v0, i)) {
> +            /* set masked-off elements to 1s */
> +            vext_set_elems_1s(vd, vma, i * esz, (i + 1) * esz);
>               continue;
>           }
>           fn(vd, s1, vs2, i, env, vxrm);
> @@ -2273,23 +2278,24 @@ vext_vx_rm_2(void *vd, void *v0, target_long s1, void *vs2,
>       uint32_t vl = env->vl;
>       uint32_t total_elems = vext_get_total_elems(env, desc, esz);
>       uint32_t vta = vext_vta(desc);
> +    uint32_t vma = vext_vma(desc);
>   
>       switch (env->vxrm) {
>       case 0: /* rnu */
>           vext_vx_rm_1(vd, v0, s1, vs2,
> -                     env, vl, vm, 0, fn);
> +                     env, vl, vm, 0, fn, vma, esz);
>           break;
>       case 1: /* rne */
>           vext_vx_rm_1(vd, v0, s1, vs2,
> -                     env, vl, vm, 1, fn);
> +                     env, vl, vm, 1, fn, vma, esz);
>           break;
>       case 2: /* rdn */
>           vext_vx_rm_1(vd, v0, s1, vs2,
> -                     env, vl, vm, 2, fn);
> +                     env, vl, vm, 2, fn, vma, esz);
>           break;
>       default: /* rod */
>           vext_vx_rm_1(vd, v0, s1, vs2,
> -                     env, vl, vm, 3, fn);
> +                     env, vl, vm, 3, fn, vma, esz);
>           break;
>       }
>       /* set tail elements to 1s */


