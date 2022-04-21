Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F562509BE3
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 11:18:31 +0200 (CEST)
Received: from localhost ([::1]:44384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhSxK-0004iq-A1
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 05:18:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nhSuW-00032P-Py
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 05:15:36 -0400
Received: from mail.loongson.cn ([114.242.206.163]:34734 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nhSuT-0007Ry-Kd
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 05:15:36 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxz9etIGFi+RYrAA--.26813S3; 
 Thu, 21 Apr 2022 17:15:25 +0800 (CST)
Subject: Re: [PATCH v1 25/43] target/loongarch: Add LoongArch CSR instruction
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220415094058.3584233-1-yangxiaojuan@loongson.cn>
 <20220415094058.3584233-26-yangxiaojuan@loongson.cn>
 <3409287c-ac98-2087-3d00-1bd23c1a00da@linaro.org>
 <8193af0c-4ba3-3154-45a5-de8fefa0ddad@loongson.cn>
 <a9c3e36b-4c94-a9d3-52d7-a88bc4734db9@linaro.org>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <84439ddd-c701-4750-3113-1a1ab15740b6@loongson.cn>
Date: Thu, 21 Apr 2022 17:15:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <a9c3e36b-4c94-a9d3-52d7-a88bc4734db9@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf9Dxz9etIGFi+RYrAA--.26813S3
X-Coremail-Antispam: 1UD129KBjvJXoWxtr4rJFy3JryrZF4rArykuFg_yoWxXF4fpr
 n5tr1UuryUXwn5Xr1DGr1UWFyrJr18Jw1UJrn8JFy5GF4UJF1jqrWUWr1agr15Jr48Xr45
 Ar45Xr1kZF17Jw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvq14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
 xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
 bIxvr21lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
 8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
 xVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
 8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E
 87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0x
 ZFpf9x0JUywZ7UUUUU=
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
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
Cc: mark.cave-ayland@ilande.co.uk, gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2022/4/20 上午1:05, Richard Henderson wrote:
> You'd use a store, just like you were already doing in trans_csrwr.
>
> But here's how I'd improve this.  For avoidance of doubt, all of this 
> would go in trans_priviledged.c.inc -- there's no use of csr_offsets[] 
> outside of that file.

Thanks you very much,  I had tested this with bios,  it worked well, and 
I have two questions.

1. CSRFL_IO,   how to use it.   I don't understand  CPUState options  
'can_do_Io',
2./* fall through */,   this may have warning,  should we care about this?

Thanks.
Xiaojuan
> r~
>
> ----
>
>
> typedef void (*GenCSRRead)(TCGv dest, TCGv_ptr env);
> typedef void (*GenCSRWrite)(TCGv dest, TCGv_ptr env, TCGv src);
>
> typedef struct {
>     int offset;
>     int flags;
>     GenCSRRead readfn;
>     GenCSRWrite writefn;
> } CSRInfo;
>
> enum {
>     CSRFL_READONLY  = (1 << 0),
>     CSRFL_EXITTB    = (1 << 1),
>     CSRFL_IO        = (1 << 2),
> };
>
> #define CSR_OFF_FUNCS(NAME, FL, RD, WR) \
>     [LOONGARCH_CSR_##NAME] = {                             \
>         .offset = offsetof(CPULoongArchState, CSR_##NAME), \
>         .flags = FL, .readfn = RD, .writefn = WR           \
>     }
> #define CSR_OFF_FLAGS(NAME, FL) \
>     CSR_OFF_FUNCS(NAME, FL, NULL, NULL)
> #define CSR_OFF(NAME) \
>     CSR_OFF_FLAGS(NAME, 0)
>
> static const CSRInfo csr_info[] = {
>     CSR_OFF(CRMD),
>     CSR_OFF_FLAGS(CPUID, CSRFL_READONLY),
>     CSR_OFF_FUNCS(TCFG, CSRFL_IO, NULL, gen_helper_csrwr_tcfg),
>     CSR_OFF_FUNCS(TVAL, CSRFL_READONLY | CSRFL_IO, 
> gen_helper_csrrd_tval, NULL),
>     CSR_OFF_FUNCS(TICLR, CSRFL_IO, NULL, gen_helper_csrwr_ticlr),
>     CSR_OFF_FUNCS(ESTAT, CSRFL_EXITTB, NULL, gen_helper_csrwr_estat),
>     ...
> };
>
> static const CSRInfo *get_csr(unsigned csr_num)
> {
>     const CSRInfo *csr;
>     if (csr_num < ARRAY_SIZE(csr_info)) {
>         return NULL;
>     }
>     csr = &csr_info[csr_num];
>     if (csr->offset == 0) {
>         return NULL; /* undefined */
>     }
>     return csr;
> }
>
> static bool check_csr_flags(DisasContext *ctx, const CSRInfo *csr, 
> bool write)
> {
>     if ((info->flags & CSRFL_READONLY) && write) {
>         return false;
>     }
>     if ((info->flags & CSRFL_IO) &&
>         (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT)) {
>         gen_io_start();
>         ctx->base.is_jmp = DISAS_EXIT_UPDATE;
>     } else if ((info->flags & CSRFL_EXITTB) && write) {
>         ctx->base.is_jmp = DISAS_EXIT_UPDATE;
>     }
>     return true;
> }
>
> static bool trans_csrrd(DisasContext *ctx, arg_csrrd *a)
> {
>     TCGv dest;
>     const CSRInfo *csr;
>
>     if (check_plv(ctx)) {
>         return false;
>     }
>     csr = get_csr(a->csr);
>     if (csr == NULL) {
>         /* CSR is undefined: read as 0 */
>         dest = tcg_constant_tl(0);
>     } else {
>         check_csr_flags(ctx, csr, false);
>         dest = gpr_dst(ctx, a->rd, EXT_NONE);
>         if (csr->readfn) {
>             csr_readfn(dest, cpu_env);
>         } else {
>             tcg_gen_ld_tl(dest, cpu_env, csr->offset);
>         }
>     }
>     gen_set_gpr(a->rd, dest, EXT_NONE);
>     return true;
> }
>
> static bool trans_csrwr(DisasContext *ctx, arg_csrwr *a)
> {
>     TCGv dest, src1;
>     const CSRInfo *csr;
>
>     if (check_plv(ctx)) {
>         return false;
>     }
>     csr = get_csr_info(a->csr);
>     if (csr == NULL) {
>         /* CSR is undefined: write ignored, read old value as 0. */
>         gen_set_gpr(a->rd, tcg_constant_tl(0), EXT_NONE);
>         return true;
>     }
>     if (!check_csr_flags(ctx, csr, true)) {
>         /* CSR is readonly: trap. */
>         return false;
>     }
>     src1 = gpr_src(ctx, a->rd, EXT_NONE);
>     if (csr->writefn) {
>         dest = gpr_dst(ctx, a->rd, EXT_NONE);
>         csr->writefn(dest, cpu_env, src1);
>     } else {
>          dest = temp_new(ctx);
>          tcg_gen_ld_tl(dest, cpu_env, csr->offset);
>          tcg_gen_st_tl(src1, cpu_env, csr->offset);
>     }
>     gen_set_gpr(a->rd, dest, EXT_NONE);
>     return true;
> }
>
> static bool trans_csrxchg(DisasContext *ctx, arg_csrxchg *a)
> {
>     TCGv src1, mask, oldv, newv, temp;
>     const CSRInfo *csr;
>
>     if (check_plv(ctx)) {
>         return false;
>     }
>     csr = get_csr_info(a->csr);
>     if (csr == NULL) {
>         /* CSR is undefined: write ignored, read old value as 0. */
>         gen_set_gpr(a->rd, tcg_constant_tl(0), EXT_NONE);
>         return true;
>     }
>     if (!check_csr_flags(ctx, csr, true)) {
>         /* CSR is readonly: trap. */
>         return false;
>     }
>
>     /* So far only readonly csrs have readfn. */
>     assert(csr->readfn == NULL);
>
>     src1 = gpr_src(ctx, a->rd, EXT_NONE);
>     mask = gpr_src(ctx, a->rj, EXT_NONE);
>     oldv = tcg_temp_new();
>     newv = tcg_temp_new();
>     temp = tcg_temp_new();
>
>     tcg_gen_ld_tl(oldv, cpu_env, csr->offset);
>     tcg_gen_and_tl(newv, src1, mask);
>     tcg_gen_andc_tl(temp, oldv, mask);
>     tcg_gen_or_tl(newv, newv, temp);
>
>     if (csr->writefn) {
>         csr->writefn(oldv, cpu_env, newv);
>     } else {
>         tcg_gen_st_tl(newv, cpu_env, csr->offset);
>     }
>     gen_set_gpr(a->rd, oldv, EXT_NONE);
>
>     tcg_temp_free(temp);
>     tcg_temp_free(newv);
>     tcg_temp_free(oldv);
>     return true;
> }
>
> and then in loongarch_tr_tb_stop:
>
>     case DISAS_EXIT_UPDATE:
>         tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
>
>         /* fall through */
>     case DISAS_EXIT:
>
>         tcg_gen_exit_tb(NULL, 0);
>
>         break; 


