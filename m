Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8873664F2E8
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 22:04:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6He1-0002mI-EZ; Fri, 16 Dec 2022 15:49:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1p6Hdz-0002ks-8O
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 15:49:23 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1p6Hdu-0004Oy-LZ
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 15:49:23 -0500
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BGKBt2i030294; Fri, 16 Dec 2022 20:49:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=HD6nkzBmJCbxhKNAI6KdbJOdH0+Ax+eOslL9GFMlOT0=;
 b=Z4HpsW676nxao7fzioTMMn+I0gc8dev0EFnVEjSFF2FwFlvRlWNTReOOhISVrwdnxxVd
 bcG5dnqUi9DFzUwjwDxLjdxGLVAWO2Z8m/0JokiggP7gcbg3zzufgDe2x5pBpmLhS3gJ
 4Um2+osE5tU/xcQVxTbW/nhiywug4VbgujaNzVlxQ5vQHiZtl5UeJ2y7EVIRlsUw//ww
 VcnWtkHB7d3m9YFGJsL6gdIdBaCPLAM5otnn9d79ZO8vK/D7BUR9J8p0BcvlW8SZ/78t
 EZlqWKNof2Ph6w++BCwezoY/lM4sFGzhTY+09HxeqSNrhBVEW6NFssTB8DPeUfDfaZvY vw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mg06rws59-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Dec 2022 20:49:14 +0000
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 2BGKhYTB030818; 
 Fri, 16 Dec 2022 20:49:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTP id 3mgwcgrm6k-1;
 Fri, 16 Dec 2022 20:49:14 +0000
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BGKnDZ2005666;
 Fri, 16 Dec 2022 20:49:13 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.235.220])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTP id 2BGKnDDm005675;
 Fri, 16 Dec 2022 20:49:13 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id E9398500102; Fri, 16 Dec 2022 12:49:12 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com,
 stefanha@redhat.com
Subject: [PULL 07/21] Hexagon (target/hexagon) Add overrides for direct call
 instructions
Date: Fri, 16 Dec 2022 12:48:31 -0800
Message-Id: <20221216204845.19290-8-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221216204845.19290-1-tsimpson@quicinc.com>
References: <20221216204845.19290-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: PMG9CzKcANmctmf0yI_u9DvSSA4409HB
X-Proofpoint-ORIG-GUID: PMG9CzKcANmctmf0yI_u9DvSSA4409HB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-16_14,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=623 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212160185
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=tsimpson@qualcomm.com; helo=mx0a-0031df01.pphosted.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

QWRkIG92ZXJyaWRlcyBmb3IKICAgIEoyX2NhbGwKICAgIEoyX2NhbGx0CiAgICBKMl9jYWxsZgoK
UmV2aWV3ZWQtYnk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8u
b3JnPgpTaWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+
Ck1lc3NhZ2UtSWQ6IDwyMDIyMTEwODE2MjkwNi4zMTY2LTgtdHNpbXBzb25AcXVpY2luYy5jb20+
Ci0tLQogdGFyZ2V0L2hleGFnb24vZ2VuX3RjZy5oIHwgIDggKysrKysrCiB0YXJnZXQvaGV4YWdv
bi9nZW5wdHIuYyAgfCA1NSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
CiAyIGZpbGVzIGNoYW5nZWQsIDYzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90YXJnZXQv
aGV4YWdvbi9nZW5fdGNnLmggYi90YXJnZXQvaGV4YWdvbi9nZW5fdGNnLmgKaW5kZXggZGYyNzlh
YjQzYi4uMWJkYzc4N2EwMiAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFnb24vZ2VuX3RjZy5oCisr
KyBiL3RhcmdldC9oZXhhZ29uL2dlbl90Y2cuaApAQCAtNjEyLDYgKzYxMiwxNCBAQAogICAgICAg
ICB0Y2dfdGVtcF9mcmVlKHRtcCk7IFwKICAgICB9IHdoaWxlICgwKQogCisjZGVmaW5lIGZHRU5f
VENHX0oyX2NhbGwoU0hPUlRDT0RFKSBcCisgICAgZ2VuX2NhbGwoY3R4LCByaVYpCisKKyNkZWZp
bmUgZkdFTl9UQ0dfSjJfY2FsbHQoU0hPUlRDT0RFKSBcCisgICAgZ2VuX2NvbmRfY2FsbChjdHgs
IFB1ViwgVENHX0NPTkRfRVEsIHJpVikKKyNkZWZpbmUgZkdFTl9UQ0dfSjJfY2FsbGYoU0hPUlRD
T0RFKSBcCisgICAgZ2VuX2NvbmRfY2FsbChjdHgsIFB1ViwgVENHX0NPTkRfTkUsIHJpVikKKwog
I2RlZmluZSBmR0VOX1RDR19KMl9wYXVzZShTSE9SVENPREUpIFwKICAgICBkbyB7IFwKICAgICAg
ICAgdWlWID0gdWlWOyBcCmRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9nZW5wdHIuYyBiL3Rh
cmdldC9oZXhhZ29uL2dlbnB0ci5jCmluZGV4IGNkM2Q3NDUyNWUuLjU4MGM0MDM4NzkgMTAwNjQ0
Ci0tLSBhL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jCisrKyBiL3RhcmdldC9oZXhhZ29uL2dlbnB0
ci5jCkBAIC00NTYsNiArNDU2LDYxIEBAIHN0YXRpYyBUQ0d2IGdlbl84Yml0c29mKFRDR3YgcmVz
dWx0LCBUQ0d2IHZhbHVlKQogICAgIHJldHVybiByZXN1bHQ7CiB9CiAKK3N0YXRpYyB2b2lkIGdl
bl93cml0ZV9uZXdfcGNfYWRkcihEaXNhc0NvbnRleHQgKmN0eCwgVENHdiBhZGRyLAorICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFRDR0NvbmQgY29uZCwgVENHdiBwcmVkKQorewor
ICAgIFRDR0xhYmVsICpwcmVkX2ZhbHNlID0gTlVMTDsKKyAgICBpZiAoY29uZCAhPSBUQ0dfQ09O
RF9BTFdBWVMpIHsKKyAgICAgICAgcHJlZF9mYWxzZSA9IGdlbl9uZXdfbGFiZWwoKTsKKyAgICAg
ICAgdGNnX2dlbl9icmNvbmRpX3RsKGNvbmQsIHByZWQsIDAsIHByZWRfZmFsc2UpOworICAgIH0K
KworICAgIGlmIChjdHgtPnBrdC0+cGt0X2hhc19tdWx0aV9jb2YpIHsKKyAgICAgICAgLyogSWYg
dGhlcmUgYXJlIG11bHRpcGxlIGJyYW5jaGVzIGluIGEgcGFja2V0LCBpZ25vcmUgdGhlIHNlY29u
ZCBvbmUgKi8KKyAgICAgICAgdGNnX2dlbl9tb3Zjb25kX3RsKFRDR19DT05EX05FLCBoZXhfZ3By
W0hFWF9SRUdfUENdLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgaGV4X2JyYW5jaF90YWtl
biwgdGNnX2NvbnN0YW50X3RsKDApLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgaGV4X2dw
cltIRVhfUkVHX1BDXSwgYWRkcik7CisgICAgICAgIHRjZ19nZW5fbW92aV90bChoZXhfYnJhbmNo
X3Rha2VuLCAxKTsKKyAgICB9IGVsc2UgeworICAgICAgICB0Y2dfZ2VuX21vdl90bChoZXhfZ3By
W0hFWF9SRUdfUENdLCBhZGRyKTsKKyAgICB9CisKKyAgICBpZiAoY29uZCAhPSBUQ0dfQ09ORF9B
TFdBWVMpIHsKKyAgICAgICAgZ2VuX3NldF9sYWJlbChwcmVkX2ZhbHNlKTsKKyAgICB9Cit9CisK
K3N0YXRpYyB2b2lkIGdlbl93cml0ZV9uZXdfcGNfcGNyZWwoRGlzYXNDb250ZXh0ICpjdHgsIGlu
dCBwY19vZmYsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFRDR0NvbmQgY29u
ZCwgVENHdiBwcmVkKQoreworICAgIHRhcmdldF91bG9uZyBkZXN0ID0gY3R4LT5wa3QtPnBjICsg
cGNfb2ZmOworICAgIGdlbl93cml0ZV9uZXdfcGNfYWRkcihjdHgsIHRjZ19jb25zdGFudF90bChk
ZXN0KSwgY29uZCwgcHJlZCk7Cit9CisKK3N0YXRpYyB2b2lkIGdlbl9jYWxsKERpc2FzQ29udGV4
dCAqY3R4LCBpbnQgcGNfb2ZmKQoreworICAgIFRDR3YgbmV4dF9QQyA9CisgICAgICAgIHRjZ19j
b25zdGFudF90bChjdHgtPnBrdC0+cGMgKyBjdHgtPnBrdC0+ZW5jb2RfcGt0X3NpemVfaW5fYnl0
ZXMpOworICAgIGdlbl9sb2dfcmVnX3dyaXRlKEhFWF9SRUdfTFIsIG5leHRfUEMpOworICAgIGdl
bl93cml0ZV9uZXdfcGNfcGNyZWwoY3R4LCBwY19vZmYsIFRDR19DT05EX0FMV0FZUywgTlVMTCk7
Cit9CisKK3N0YXRpYyB2b2lkIGdlbl9jb25kX2NhbGwoRGlzYXNDb250ZXh0ICpjdHgsIFRDR3Yg
cHJlZCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgVENHQ29uZCBjb25kLCBpbnQgcGNfb2Zm
KQoreworICAgIFRDR3YgbmV4dF9QQzsKKyAgICBUQ0d2IGxzYiA9IHRjZ190ZW1wX2xvY2FsX25l
dygpOworICAgIFRDR0xhYmVsICpza2lwID0gZ2VuX25ld19sYWJlbCgpOworICAgIHRjZ19nZW5f
YW5kaV90bChsc2IsIHByZWQsIDEpOworICAgIGdlbl93cml0ZV9uZXdfcGNfcGNyZWwoY3R4LCBw
Y19vZmYsIGNvbmQsIGxzYik7CisgICAgdGNnX2dlbl9icmNvbmRpX3RsKGNvbmQsIGxzYiwgMCwg
c2tpcCk7CisgICAgdGNnX3RlbXBfZnJlZShsc2IpOworICAgIG5leHRfUEMgPQorICAgICAgICB0
Y2dfY29uc3RhbnRfdGwoY3R4LT5wa3QtPnBjICsgY3R4LT5wa3QtPmVuY29kX3BrdF9zaXplX2lu
X2J5dGVzKTsKKyAgICBnZW5fbG9nX3JlZ193cml0ZShIRVhfUkVHX0xSLCBuZXh0X1BDKTsKKyAg
ICBnZW5fc2V0X2xhYmVsKHNraXApOworfQorCiAvKiBTaGlmdCBsZWZ0IHdpdGggc2F0dXJhdGlv
biAqLwogc3RhdGljIHZvaWQgZ2VuX3NobF9zYXQoVENHdiBkc3QsIFRDR3Ygc3JjLCBUQ0d2IHNo
aWZ0X2FtdCkKIHsKLS0gCjIuMTcuMQoK

