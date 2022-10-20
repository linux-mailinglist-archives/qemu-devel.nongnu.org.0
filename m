Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2183560651E
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 17:54:55 +0200 (CEST)
Received: from localhost ([::1]:41708 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXsj-0004Bb-MS
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:54:53 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXsE-00072A-FL
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:54:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1olXPB-0006lu-CQ
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 11:24:21 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131]:57690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1olXOy-0007wV-BP
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 11:24:20 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29KBFNfB007547;
 Thu, 20 Oct 2022 15:24:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=qcppdkim1;
 bh=AFBW3OHn8a+TSS8ZY8+IYAWjiVEQdFMLRvJOOsZY3Ms=;
 b=gap9DxcX9L49nnLt6tjvzcZD8o06lEye+bROcFBHywhTUxwSKzqvoYpeWJMHll/m50Hd
 K1+mb/nXfWD281Tz9N9ivvMaGxz9TlvmcFq4iy6ZOMvNNCvJkpetFOIaRVWBXGOSWmgy
 omDs6Gu0p8NmlKeAQsV+zPZ3fA34Xpao4L4AMDY8kA7XqhAzFNi1NFbJs2+Lz9iUzTrk
 crPGwzPHBky+k0hh0Hoy9yXYi+1mte1sRVpEi0XdK4tPe8DlMBPwX7YN3H1rzi6GBff3
 /3u90cSpfzMAzZVC4Ou4mOHSLnNThsI9Jp5i67lGu4xZyA4ztghrcTwddoANbxNBHR1f zA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kavfm1tc9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Oct 2022 15:24:01 +0000
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 29KFO0YC009447; 
 Thu, 20 Oct 2022 15:24:00 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 3kam2fn558-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Oct 2022 15:24:00 +0000
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29KFO0EM009438;
 Thu, 20 Oct 2022 15:24:00 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-mathbern-lv.qualcomm.com
 [10.47.235.147])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 29KFO00j009415
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Oct 2022 15:24:00 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 4229910)
 id 3A8B85195; Thu, 20 Oct 2022 12:24:00 -0300 (-03)
From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
To: tsimpson@quicinc.com
Cc: ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, philmd@linaro.org,
 qemu-devel@nongnu.org, quic_mathbern@quicinc.com,
 richard.henderson@linaro.org
Subject: Re: [PATCH 6/8] Hexagon (target/hexagon) Add overrides for various
 forms of jump
Date: Thu, 20 Oct 2022 12:23:57 -0300
Message-Id: <3957bd3b267ea26ae687510d73736f6a80c30d99.1666270633.git.quic_mathbern@quicinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221019223739.3868-7-tsimpson@quicinc.com>
References: <20221019223739.3868-7-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Db5kTclqd-4YcgP7lNImV3CQGGjv82rC
X-Proofpoint-ORIG-GUID: Db5kTclqd-4YcgP7lNImV3CQGGjv82rC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-20_06,2022-10-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 mlxlogscore=637
 impostorscore=0 bulkscore=0 clxscore=1011 mlxscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210200091
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=mathbern@qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Taylor Simpson <tsimpson@quicinc.com> wrote:
> diff --git a/target/hexagon/gen_tcg.h b/target/hexagon/gen_tcg.h
> index b56b216110..dbafcae2de 100644
> --- a/target/hexagon/gen_tcg.h
> +++ b/target/hexagon/gen_tcg.h
>
> +#define fGEN_TCG_J4_cmplt_f_jumpnv_t(SHORTCODE) \
> +    gen_cmp_jumpnv(ctx, pkt, TCG_COND_GE, NsN, RtV, riV)
> +#define fGEN_TCG_J4_cmplt_f_jumpnv_nt(SHORTCODE) \
> +    gen_cmp_jumpnv(ctx, pkt, TCG_COND_GE, NsN, RtV, riV)
> +

Nitpick: any reason not to place these two !COND variants...

> +
> +#define fGEN_TCG_J4_cmplt_t_jumpnv_t(SHORTCODE) \
> +    gen_cmp_jumpnv(ctx, pkt, TCG_COND_LT, NsN, RtV, riV)
> +#define fGEN_TCG_J4_cmplt_t_jumpnv_nt(SHORTCODE) \
> +    gen_cmp_jumpnv(ctx, pkt, TCG_COND_LT, NsN, RtV, riV)
> +

...below these COND variants, like you did in the other insns?

> diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c
> index 6e494c0bd8..fba76d3b38 100644
> --- a/target/hexagon/genptr.c
> +++ b/target/hexagon/genptr.c
> @@ -456,6 +456,35 @@ static TCGv gen_8bitsof(TCGv result, TCGv value)
>      return result;
>  }
>  
> +static void gen_write_new_pc_addr(DisasContext *ctx, Packet *pkt,
> +                                  TCGv addr, TCGv pred)
> +{
> +    TCGLabel *pred_false = NULL;
> +    if (pkt->pkt_has_multi_cof) {
> +        if (pred != NULL) {
> +            pred_false = gen_new_label();
> +            tcg_gen_brcondi_tl(TCG_COND_EQ, pred, 0, pred_false);
> +        }
> +        /* If there are multiple branches in a packet, ignore the second one */
> +        tcg_gen_movcond_tl(TCG_COND_NE, hex_gpr[HEX_REG_PC],
> +                           hex_branch_taken, tcg_constant_tl(0),
> +                           hex_gpr[HEX_REG_PC], addr);
> +        tcg_gen_movi_tl(hex_branch_taken, 1);
> +        if (pred != NULL) {
> +            gen_set_label(pred_false);
> +        }
> +    } else {
> +        if (pred != NULL) {
> +            pred_false = gen_new_label();
> +            tcg_gen_brcondi_tl(TCG_COND_EQ, pred, 0, pred_false);
> +        }
> +        tcg_gen_mov_tl(hex_gpr[HEX_REG_PC], addr);
> +        if (pred != NULL) {
> +            gen_set_label(pred_false);
> +        }
> +    }

Another nitpick: we could possibly extract the common code out of the
if-else branches for clarity (but note my other comment about this
function at patch 7):

static void gen_write_new_pc_addr(DisasContext *ctx, Packet *pkt,
                                  TCGv addr, TCGv pred)
{
    TCGLabel *pred_false = NULL;
    if (pred != NULL) {
        pred_false = gen_new_label();
        tcg_gen_brcondi_tl(TCG_COND_EQ, pred, 0, pred_false);
    }
    if (pkt->pkt_has_multi_cof) {
        /* If there are multiple branches in a packet, ignore the second one */
        tcg_gen_movcond_tl(TCG_COND_NE, hex_gpr[HEX_REG_PC],
                           hex_branch_taken, tcg_constant_tl(0),
                           hex_gpr[HEX_REG_PC], addr);
        tcg_gen_movi_tl(hex_branch_taken, 1);
    } else {
        tcg_gen_mov_tl(hex_gpr[HEX_REG_PC], addr);
    }
    if (pred != NULL) {
        gen_set_label(pred_false);
    }
}

> -- 
>2.17.1

The rest of the patch LGTM.

