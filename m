Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B91357A04
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 04:03:09 +0200 (CEST)
Received: from localhost ([::1]:35448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUK0i-0005Co-V9
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 22:03:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lUJw3-0008Gu-4D
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 21:58:19 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:37871)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lUJvy-0005yP-5z
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 21:58:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1617847094; x=1649383094;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Lkr+JhBNY2qcYxFWTtd4czy57lY5ISskM/gJzPPYpXQ=;
 b=lhA+wnjGgvXfDOzt6YCNq46aBXpHzdnC0wb+KFx6jCuvJVzApsIH7UlL
 Jo9ScdrEBB+cTD8y/f6l3fR+XWRpmceMPtwmNk4XaAW4zkC/UNeCbcuf6
 pgtO8YRMZ2gOcrIHSmusDXJRINkuGuVJc62BEElJyoAlyErx9l4U4KgrM I=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 07 Apr 2021 18:57:57 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg01-sd.qualcomm.com with ESMTP; 07 Apr 2021 18:57:56 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id CF4CD1854; Wed,  7 Apr 2021 20:57:54 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 13/26] Hexagon (target/hexagon) cleanup ternary operators
 in semantics
Date: Wed,  7 Apr 2021 20:57:34 -0500
Message-Id: <1617847067-9867-14-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617847067-9867-1-git-send-email-tsimpson@quicinc.com>
References: <1617847067-9867-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=199.106.114.38;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-01.qualcomm.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: ale@rev.ng, philmd@redhat.com, tsimpson@quicinc.com,
 richard.henderson@linaro.org, bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Change  (cond ? (res = x) : (res = y)) to res = (cond ? x : y)

This makes the semnatics easier to for idef-parser to deal with

The following instructions are impacted
    C2_any8
    C2_all8
    C2_mux
    C2_muxii
    C2_muxir
    C2_muxri

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
---
 target/hexagon/imported/compare.idef | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/hexagon/imported/compare.idef b/target/hexagon/imported/compare.idef
index 3551467..abd016f 100644
--- a/target/hexagon/imported/compare.idef
+++ b/target/hexagon/imported/compare.idef
@@ -198,11 +198,11 @@ Q6INSN(C4_or_orn,"Pd4=or(Ps4,or(Pt4,!Pu4))",ATTRIBS(A_CRSLOT23),
 
 Q6INSN(C2_any8,"Pd4=any8(Ps4)",ATTRIBS(A_CRSLOT23),
 "Logical ANY of low 8 predicate bits",
-{ PsV ? (PdV=0xff) : (PdV=0x00); })
+{ PdV = (PsV ? 0xff : 0x00); })
 
 Q6INSN(C2_all8,"Pd4=all8(Ps4)",ATTRIBS(A_CRSLOT23),
 "Logical ALL of low 8 predicate bits",
-{ (PsV==0xff) ? (PdV=0xff) : (PdV=0x00); })
+{ PdV = (PsV == 0xff ? 0xff : 0x00); })
 
 Q6INSN(C2_vitpack,"Rd32=vitpack(Ps4,Pt4)",ATTRIBS(),
 "Pack the odd and even bits of two predicate registers",
@@ -212,7 +212,7 @@ Q6INSN(C2_vitpack,"Rd32=vitpack(Ps4,Pt4)",ATTRIBS(),
 
 Q6INSN(C2_mux,"Rd32=mux(Pu4,Rs32,Rt32)",ATTRIBS(),
 "Scalar MUX",
-{ (fLSBOLD(PuV)) ? (RdV=RsV):(RdV=RtV); })
+{ RdV = (fLSBOLD(PuV) ? RsV : RtV); })
 
 
 Q6INSN(C2_cmovenewit,"if (Pu4.new) Rd32=#s12",ATTRIBS(A_ARCHV2),
@@ -269,18 +269,18 @@ Q6INSN(C2_ccombinewf,"if (!Pu4) Rdd32=combine(Rs32,Rt32)",ATTRIBS(A_ARCHV2),
 
 Q6INSN(C2_muxii,"Rd32=mux(Pu4,#s8,#S8)",ATTRIBS(A_ARCHV2),
 "Scalar MUX immediates",
-{ fIMMEXT(siV); (fLSBOLD(PuV)) ? (RdV=siV):(RdV=SiV); })
+{ fIMMEXT(siV); RdV = (fLSBOLD(PuV) ? siV : SiV); })
 
 
 
 Q6INSN(C2_muxir,"Rd32=mux(Pu4,Rs32,#s8)",ATTRIBS(A_ARCHV2),
 "Scalar MUX register immediate",
-{ fIMMEXT(siV); (fLSBOLD(PuV)) ? (RdV=RsV):(RdV=siV); })
+{ fIMMEXT(siV); RdV = (fLSBOLD(PuV) ? RsV : siV); })
 
 
 Q6INSN(C2_muxri,"Rd32=mux(Pu4,#s8,Rs32)",ATTRIBS(A_ARCHV2),
 "Scalar MUX register immediate",
-{ fIMMEXT(siV); (fLSBOLD(PuV)) ? (RdV=siV):(RdV=RsV); })
+{ fIMMEXT(siV); RdV = (fLSBOLD(PuV) ? siV : RsV); })
 
 
 
-- 
2.7.4


