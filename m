Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 488126C6A8A
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 15:17:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfLjl-0004Yg-Vw; Thu, 23 Mar 2023 10:16:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pfLjk-0004YY-EW
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 10:16:16 -0400
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pfLji-0004mG-N3
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 10:16:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
 Cc:To:Subject:Reply-To:MIME-Version:Date:Message-ID:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=an/42OUBJCS8PL53MdzTu2nui9vUJ1cwkxn12o5BLxQ=; b=mmVPAhwzc1p1lkvsVsJGffmBN2
 7czVfMKAD94gTFrHL6HMI+v5amYMrg3AXZuEwMGJydYwomM8gOqpqnfPG1kQC+umn24NJ/BhKYyW4
 I71gOIRbVV7QA6k4tAbpiuYPjyxVPrNNznRklrqcYeodj8rGXrFcygqpHNx+g3KQNyMw=;
Message-ID: <2df198a0-a81d-f388-9c37-0520cee316cc@rev.ng>
Date: Thu, 23 Mar 2023 15:15:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH] Hexagon (translate.c): avoid redundant PC updates on COF
To: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>,
 qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org
References: <fc059153c3f0526d97b7f13450c02b276b0908e1.1679519341.git.quic_mathbern@quicinc.com>
Content-Language: en-US
Organization: rev.ng
In-Reply-To: <fc059153c3f0526d97b7f13450c02b276b0908e1.1679519341.git.quic_mathbern@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  anjo@rev.ng
X-ACL-Warn: ,  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 3/22/23 22:17, Matheus Tavares Bernardino wrote:
> When there is a conditional change of flow or an endloop instruction, we
> preload HEX_REG_PC with ctx->next_PC at gen_start_packet(). Nonetheless,
> we still generate TCG code to do this update again at gen_goto_tb() when
> the condition for the COF is not met, thus producing redundant
> instructions. This can be seen with the following packet:
>
>   0x004002e4:  0x5c20d000 {       if (!P0) jump:t PC+0 }
>
> Which generates this TCG code:
>
>     ---- 004002e4
> -> mov_i32 pc,$0x4002e8
>     and_i32 loc9,p0,$0x1
>     mov_i32 branch_taken,loc9
>     add_i32 pkt_cnt,pkt_cnt,$0x2
>     add_i32 insn_cnt,insn_cnt,$0x2
>     brcond_i32 branch_taken,$0x0,ne,$L1
>     goto_tb $0x0
>     mov_i32 pc,$0x4002e4
>     exit_tb $0x7fb0c36e5200
>     set_label $L1
>     goto_tb $0x1
> -> mov_i32 pc,$0x4002e8
>     exit_tb $0x7fb0c36e5201
>     set_label $L0
>     exit_tb $0x7fb0c36e5203
>
> Note that even after optimizations, the redundant PC update is still
> present:
>
>     ---- 004002e4
> -> mov_i32 pc,$0x4002e8                     sync: 0  dead: 0 1  pref=0xffff
>     mov_i32 branch_taken,$0x1                sync: 0  dead: 0 1  pref=0xffff
>     add_i32 pkt_cnt,pkt_cnt,$0x2             sync: 0  dead: 0 1  pref=0xffff
>     add_i32 insn_cnt,insn_cnt,$0x2           sync: 0  dead: 0 1 2  pref=0xffff
>     goto_tb $0x1
> -> mov_i32 pc,$0x4002e8                     sync: 0  dead: 0 1  pref=0xffff
>     exit_tb $0x7fb0c36e5201
>     set_label $L0
>     exit_tb $0x7fb0c36e5203
>
> With this patch, the second redundant update is properly discarded.
>
> Note that we need the additional "move_to_pc" flag instead of just
> avoiding the update whenever `dest == ctx->next_PC`, as that could
> potentially skip updates from a COF with met condition, whose
> ctx->branch_dest just happens to be equal to ctx->next_PC.
>
> Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> ---
>   target/hexagon/translate.c | 21 +++++++++++++--------
>   1 file changed, 13 insertions(+), 8 deletions(-)
>
> diff --git target/hexagon/translate.c target/hexagon/translate.c
> index 665476ab48..58d638f734 100644
> --- target/hexagon/translate.c
> +++ target/hexagon/translate.c

Looks good, I appreciate the thorough motivation for this patch!

Reviewed-by: Anton Johansson <anjo@rev.ng>

-- 
Anton Johansson,
rev.ng Labs Srl.


