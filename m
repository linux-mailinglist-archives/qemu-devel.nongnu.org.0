Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B58EF61E2D5
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 16:02:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orh9A-0005ES-RW; Sun, 06 Nov 2022 10:01:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1orh98-0005EH-Ei
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 10:01:14 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1orh96-0005Bc-57
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 10:01:14 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 09435748130;
 Sun,  6 Nov 2022 16:01:05 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id CCEEC747FAD; Sun,  6 Nov 2022 16:01:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id CAF54747FAB;
 Sun,  6 Nov 2022 16:01:04 +0100 (CET)
Date: Sun, 6 Nov 2022 16:01:04 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Richard Henderson <richard.henderson@linaro.org>
cc: qemu-devel@nongnu.org, philmd@linaro.org, sw@weilnetz.de
Subject: Re: [RESEND PATCH 1/6] disas/nanomips: Move setjmp into nanomips_dis
In-Reply-To: <20221106023735.5277-2-richard.henderson@linaro.org>
Message-ID: <486518ea-6a53-93ec-f261-fa5b62021ace@eik.bme.hu>
References: <20221106023735.5277-1-richard.henderson@linaro.org>
 <20221106023735.5277-2-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1587091625-1667746864=:56819"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1587091625-1667746864=:56819
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sun, 6 Nov 2022, Richard Henderson wrote:
> Reduce the number of local variables within the scope of the
> setjmp by moving it to the existing helper.  The actual length
> returned from Disassemble is not used, because we have already
> determined the length while reading bytes.  Fixes:
>
> nanomips.c: In function ‘print_insn_nanomips’:
> nanomips.c:21925:14: error: variable ‘insn1’ might be clobbered by ‘longjmp’ or ‘vfork’ [-Werror=clobbered]
> nanomips.c:21925:25: error: variable ‘insn2’ might be clobbered by ‘longjmp’ or ‘vfork’ [-Werror=clobbered]
> nanomips.c:21925:36: error: variable ‘insn3’ might be clobbered by ‘longjmp’ or ‘vfork’ [-Werror=clobbered]
> nanomips.c:21926:22: error: variable ‘buf’ might be clobbered by ‘longjmp’ or ‘vfork’ [-Werror=clobbered]
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> disas/nanomips.c | 44 ++++++++++++++++++++------------------------
> 1 file changed, 20 insertions(+), 24 deletions(-)
>
> diff --git a/disas/nanomips.c b/disas/nanomips.c
> index 9647f1a8e3..9a69e6880a 100644
> --- a/disas/nanomips.c
> +++ b/disas/nanomips.c
> @@ -21905,22 +21905,27 @@ static const Pool MAJOR[2] = {
>        0x0                 },        /* P16 */
> };
>
> -static int nanomips_dis(char **buf,
> -                 Dis_info *info,
> -                 unsigned short one,
> -                 unsigned short two,
> -                 unsigned short three)
> +static bool nanomips_dis(char **buf, Dis_info *info,
> +                         unsigned short one,
> +                         unsigned short two,
> +                         unsigned short three)
> {
>     uint16 bits[3] = {one, two, three};
> -
>     TABLE_ENTRY_TYPE type;
> -    int size = Disassemble(bits, buf, &type, MAJOR, 2, info);
> -    return size;
> +    int ret;
> +
> +    ret = sigsetjmp(info->buf, 0);
> +    if (ret != 0) {
> +        return false;
> +    }
> +
> +    ret = Disassemble(bits, buf, &type, MAJOR, 2, info);
> +    return ret >= 0;
> }

Maybe you could lose ret too and simplify it to something like this?

if (sigsetjmp(info->buf, 0)) {
     return false;
}

return Disassemble(bits, buf, &type, MAJOR, 2, info) >= 0;

Storing the return value in a local car just to use it in the next line 
does not seem necessary to me but it's just an idea, not really important 
so as you like.

Regards,
BALATON Zoltan

> int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
> {
> -    int status;
> +    int status, length;
>     bfd_byte buffer[2];
>     uint16_t insn1 = 0, insn2 = 0, insn3 = 0;
>     g_autofree char *buf = NULL;
> @@ -21950,6 +21955,7 @@ int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
>     } else {
>         insn1 = bfd_getl16(buffer);
>     }
> +    length = 2;
>     (*info->fprintf_func)(info->stream, "%04x ", insn1);
>
>     /* Handle 32-bit opcodes.  */
> @@ -21965,6 +21971,7 @@ int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
>         } else {
>             insn2 = bfd_getl16(buffer);
>         }
> +        length = 4;
>         (*info->fprintf_func)(info->stream, "%04x ", insn2);
>     } else {
>         (*info->fprintf_func)(info->stream, "     ");
> @@ -21982,27 +21989,16 @@ int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
>         } else {
>             insn3 = bfd_getl16(buffer);
>         }
> +        length = 6;
>         (*info->fprintf_func)(info->stream, "%04x ", insn3);
>     } else {
>         (*info->fprintf_func)(info->stream, "     ");
>     }
>
>     /* Handle runtime errors. */
> -    if (sigsetjmp(disassm_info.buf, 0) != 0) {
> -        info->insn_type = dis_noninsn;
> -        return insn3 ? 6 : insn2 ? 4 : 2;
> +    if (nanomips_dis(&buf, &disassm_info, insn1, insn2, insn3)) {
> +        (*info->fprintf_func) (info->stream, "%s", buf);
>     }
>
> -    int length = nanomips_dis(&buf, &disassm_info, insn1, insn2, insn3);
> -
> -    /* FIXME: Should probably use a hash table on the major opcode here.  */
> -
> -    (*info->fprintf_func) (info->stream, "%s", buf);
> -    if (length > 0) {
> -        return length / 8;
> -    }
> -
> -    info->insn_type = dis_noninsn;
> -
> -    return insn3 ? 6 : insn2 ? 4 : 2;
> +    return length;
> }
>
--3866299591-1587091625-1667746864=:56819--

