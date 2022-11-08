Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3872062195D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 17:29:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osRTY-0006nC-4b; Tue, 08 Nov 2022 11:29:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1osRTU-0006lZ-P2
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 11:29:20 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1osRTM-0008TW-Ci
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 11:29:20 -0500
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A8FruF9023994; Tue, 8 Nov 2022 16:29:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=UGVruvYqCh9axsEhRCcB27L/yqDTdkayk2PiQ+BIvco=;
 b=Envv+v95F5KHWnmrFembMrd7xgGqb1Ukj76WGPEjKCczDltAjH3lXYDj0W4hs/GLmHd8
 VEiYQelNOO/9BsjGfiKM55FUuMuuCvKTvynjkFJfOZRQjq5x7eOycoFujQcZMwWn3YGg
 vLORIDftWCGTDWPIC74MVdEGR60+FN2+6xCUaO8AvATaIP8B4RZsHruIJcMa/70BSpY+
 CJqAGbNKYXvl7jy0UhSeJ169RwY0ZalLq6hL3y2JZuKvmd8MqER/DEkZq3Lw+xIY92fU
 b77ahxQAyME67h5ulq1RVv0GOW52FAo2FrFBKKgeCGT8zY8KXEWZ9tQhjoQiyVHLLg8T dg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kq7g4jydr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Nov 2022 16:29:10 +0000
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 2A8GRpJV014218; 
 Tue, 8 Nov 2022 16:29:09 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 3kngwkvdjp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 08 Nov 2022 16:29:09 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A8GT89v015162;
 Tue, 8 Nov 2022 16:29:08 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.235.220])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTP id 2A8GT8BM015160;
 Tue, 08 Nov 2022 16:29:08 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id A9AB5500102; Tue,  8 Nov 2022 08:29:07 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH v5 07/11] Hexagon (target/hexagon) Add overrides for direct
 call instructions
Date: Tue,  8 Nov 2022 08:29:02 -0800
Message-Id: <20221108162906.3166-8-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221108162906.3166-1-tsimpson@quicinc.com>
References: <20221108162906.3166-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: PfbnInGXukmIVhopTSiynUHwTUYZVGyS
X-Proofpoint-GUID: PfbnInGXukmIVhopTSiynUHwTUYZVGyS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_11,2022-11-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=735 bulkscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211080101
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

