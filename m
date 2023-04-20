Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B666E88B9
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 05:28:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppKwr-0003gq-HC; Wed, 19 Apr 2023 23:27:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1ppKwj-0003fO-ES
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 23:26:58 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1ppKwf-0000Ij-Eg
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 23:26:56 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33K2QKJm023407; Thu, 20 Apr 2023 03:26:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=P8DlNKJ5yX9HIqgCcrGCYPtfx/s1D5RT2UHcWHueBBE=;
 b=QDWJk/+fvhOUBqBsq4CBU4gNk0D8aGCEwhgMoOXeClOH26CWLmAvR8OzyF4MlR969FaP
 GXUB1eDXdyOJkryXLx7dA/jELrlxq62vco4+9CS/WiiOFTsrHa6JrUGZ8QyRSIcDRnBa
 WOdrkXdglTFmI1BXSiZ3RYf5WqEFhlDzpzP1KCT98VUhmyCGza98IyNJ+JgNzvKFtsCl
 FkS4opkJMAnu3rZxHtx6O7lclzWPKMD8XDCktJgUbkNEyxBLVbk1p6pMWQs5DzFmZmg0
 EFFhTG3A3BS3PWplvKIsM/qYIQntABI5y++2nHX3r11o6nsiQE7IPngjVZx0bJHLlLda wQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q2p4v8ss5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 03:26:49 +0000
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 33K3Qmer021094; 
 Thu, 20 Apr 2023 03:26:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 3q2e95vg1k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 03:26:48 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33K3Qm4S021086;
 Thu, 20 Apr 2023 03:26:48 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 33K3QlIm021082
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 03:26:48 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id 16A036A9; Wed, 19 Apr 2023 20:26:47 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com,
 stefanha@redhat.com, ale@rev.ng, anjo@rev.ng, quic_mliebel@quicinc.com
Subject: [PULL 11/11] Hexagon (target/hexagon) Additional instructions handled
 by idef-parser
Date: Wed, 19 Apr 2023 20:26:34 -0700
Message-Id: <20230420032634.105311-12-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230420032634.105311-1-tsimpson@quicinc.com>
References: <20230420032634.105311-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: MzkgWN0FzJDC0eawq4hJTm6KwKYu51ho
X-Proofpoint-ORIG-GUID: MzkgWN0FzJDC0eawq4hJTm6KwKYu51ho
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-19_16,2023-04-18_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 spamscore=0 mlxlogscore=777 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304200025
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Q3VycmVudGx5LCBpZGVmLXBhcnNlciBza2lwcyBhbGwgZmxvYXRpbmcgcG9pbnQgaW5zdHJ1Y3Rp
b25zLiAgSG93ZXZlciwKdGhlcmUgYXJlIHNvbWUgZmxvYXRpbmcgcG9pbnQgaW5zdHJ1Y3Rpb25z
IHRoYXQgY2FuIGJlIGhhbmRsZWQuCgpUaGUgZm9sbG93aW5nIGluc3RydWN0aW9ucyBhcmUgbm93
IHBhcnNlZAogICAgRjJfc2ZpbW1fcAogICAgRjJfc2ZpbW1fbgogICAgRjJfZGZpbW1fcAogICAg
RjJfZGZpbW1fbgogICAgRjJfZGZtcHlsbAogICAgRjJfZGZtcHlsaAoKVG8gbWFrZSB0aGVzZSBp
bnN0cnVjdGlvbnMgd29yaywgd2UgZml4IHNvbWUgYnVncyBpbiBwYXJzZXItaGVscGVycy5jCiAg
ICBnZW5fcnZhbHVlX2V4dGVuZAogICAgZ2VuX2Nhc3Rfb3AKClRlc3QgY2FzZXMgYWRkZWQgdG8g
dGVzdHMvdGNnL2hleGFnb24vZnBzdHVmZi5jCgpTaWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNv
biA8dHNpbXBzb25AcXVpY2luYy5jb20+ClJldmlld2VkLWJ5OiBBbnRvbiBKb2hhbnNzb24gPGFu
am9AcmV2Lm5nPgpUZXN0ZWQtYnk6IEFudG9uIEpvaGFuc3NvbiA8YW5qb0ByZXYubmc+Ck1lc3Nh
Z2UtSWQ6IDwyMDIzMDQwNzIwNTI0Ni4zOTUxOTYtMS10c2ltcHNvbkBxdWljaW5jLmNvbT4KLS0t
CiB0YXJnZXQvaGV4YWdvbi9pZGVmLXBhcnNlci9wYXJzZXItaGVscGVycy5jIHwgMTYgKysrLS0t
CiB0ZXN0cy90Y2cvaGV4YWdvbi9mcHN0dWZmLmMgICAgICAgICAgICAgICAgIHwgNTQgKysrKysr
KysrKysrKysrKysrKysrCiB0YXJnZXQvaGV4YWdvbi9nZW5faWRlZl9wYXJzZXJfZnVuY3MucHkg
ICAgIHwgMTAgKysrLQogMyBmaWxlcyBjaGFuZ2VkLCA3MiBpbnNlcnRpb25zKCspLCA4IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2lkZWYtcGFyc2VyL3BhcnNlci1o
ZWxwZXJzLmMgYi90YXJnZXQvaGV4YWdvbi9pZGVmLXBhcnNlci9wYXJzZXItaGVscGVycy5jCmlu
ZGV4IDg2NTExZWZiNjIuLmZkNGQxOTZhNzkgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29uL2lk
ZWYtcGFyc2VyL3BhcnNlci1oZWxwZXJzLmMKKysrIGIvdGFyZ2V0L2hleGFnb24vaWRlZi1wYXJz
ZXIvcGFyc2VyLWhlbHBlcnMuYwpAQCAtMzg2LDEzICszODYsMTAgQEAgSGV4VmFsdWUgZ2VuX3J2
YWx1ZV9leHRlbmQoQ29udGV4dCAqYywgWVlMVFlQRSAqbG9jcCwgSGV4VmFsdWUgKnJ2YWx1ZSkK
IAogICAgIGlmIChydmFsdWUtPnR5cGUgPT0gSU1NRURJQVRFKSB7CiAgICAgICAgIEhleFZhbHVl
IHJlcyA9IGdlbl9pbW1fcWVtdV90bXAoYywgbG9jcCwgNjQsIHJ2YWx1ZS0+c2lnbmVkbmVzcyk7
Ci0gICAgICAgIGJvb2wgaXNfdW5zaWduZWQgPSAocnZhbHVlLT5zaWduZWRuZXNzID09IFVOU0lH
TkVEKTsKLSAgICAgICAgY29uc3QgY2hhciAqc2lnbl9zdWZmaXggPSBpc191bnNpZ25lZCA/ICJ1
IiA6ICIiOwogICAgICAgICBnZW5fY19pbnRfdHlwZShjLCBsb2NwLCA2NCwgcnZhbHVlLT5zaWdu
ZWRuZXNzKTsKLSAgICAgICAgT1VUKGMsIGxvY3AsICIgIiwgJnJlcywgIiA9ICIpOwotICAgICAg
ICBPVVQoYywgbG9jcCwgIigiLCBzaWduX3N1ZmZpeCwgImludDY0X3QpICIpOwotICAgICAgICBP
VVQoYywgbG9jcCwgIigiLCBzaWduX3N1ZmZpeCwgImludDMyX3QpICIpOwotICAgICAgICBPVVQo
YywgbG9jcCwgcnZhbHVlLCAiO1xuIik7CisgICAgICAgIE9VVChjLCBsb2NwLCAiICIsICZyZXMs
ICIgPSAoIik7CisgICAgICAgIGdlbl9jX2ludF90eXBlKGMsIGxvY3AsIDY0LCBydmFsdWUtPnNp
Z25lZG5lc3MpOworICAgICAgICBPVVQoYywgbG9jcCwgIikiLCBydmFsdWUsICI7XG4iKTsKICAg
ICAgICAgcmV0dXJuIHJlczsKICAgICB9IGVsc2UgewogICAgICAgICBIZXhWYWx1ZSByZXMgPSBn
ZW5fdG1wKGMsIGxvY3AsIDY0LCBydmFsdWUtPnNpZ25lZG5lc3MpOwpAQCAtOTYzLDcgKzk2MCwx
MiBAQCBIZXhWYWx1ZSBnZW5fY2FzdF9vcChDb250ZXh0ICpjLAogICAgIGlmIChzcmMtPmJpdF93
aWR0aCA9PSB0YXJnZXRfd2lkdGgpIHsKICAgICAgICAgcmV0dXJuICpzcmM7CiAgICAgfSBlbHNl
IGlmIChzcmMtPnR5cGUgPT0gSU1NRURJQVRFKSB7Ci0gICAgICAgIEhleFZhbHVlIHJlcyA9ICpz
cmM7CisgICAgICAgIEhleFZhbHVlIHJlczsKKyAgICAgICAgaWYgKHNyYy0+Yml0X3dpZHRoIDwg
dGFyZ2V0X3dpZHRoKSB7CisgICAgICAgICAgICByZXMgPSBnZW5fcnZhbHVlX2V4dGVuZChjLCBs
b2NwLCBzcmMpOworICAgICAgICB9IGVsc2UgeworICAgICAgICAgICAgcmVzID0gKnNyYzsKKyAg
ICAgICAgfQogICAgICAgICByZXMuYml0X3dpZHRoID0gdGFyZ2V0X3dpZHRoOwogICAgICAgICBy
ZXMuc2lnbmVkbmVzcyA9IHNpZ25lZG5lc3M7CiAgICAgICAgIHJldHVybiByZXM7CmRpZmYgLS1n
aXQgYS90ZXN0cy90Y2cvaGV4YWdvbi9mcHN0dWZmLmMgYi90ZXN0cy90Y2cvaGV4YWdvbi9mcHN0
dWZmLmMKaW5kZXggOTBjZTlhNmVmMy4uMjhmOTM5NzE1NSAxMDA2NDQKLS0tIGEvdGVzdHMvdGNn
L2hleGFnb24vZnBzdHVmZi5jCisrKyBiL3Rlc3RzL3RjZy9oZXhhZ29uL2Zwc3R1ZmYuYwpAQCAt
MjAsNiArMjAsNyBAQAogICovCiAKICNpbmNsdWRlIDxzdGRpby5oPgorI2luY2x1ZGUgPGZsb2F0
Lmg+CiAKIGNvbnN0IGludCBGUElOVkZfQklUID0gMTsgICAgICAgICAgICAgICAgIC8qIEludmFs
aWQgKi8KIGNvbnN0IGludCBGUElOVkYgPSAxIDw8IEZQSU5WRl9CSVQ7CkBAIC03MDYsNiArNzA3
LDU3IEBAIHN0YXRpYyB2b2lkIGNoZWNrX2Zsb2F0MmludF9jb252cygpCiAgICAgY2hlY2tfZnBz
dGF0dXModXNyLCBGUElOVkYpOwogfQogCitzdGF0aWMgdm9pZCBjaGVja19mbG9hdF9jb25zdHMo
dm9pZCkKK3sKKyAgICBpbnQgcmVzMzI7CisgICAgdW5zaWduZWQgbG9uZyBsb25nIHJlczY0Owor
CisgICAgYXNtKCIlMCA9IHNmbWFrZSgjJTEpOm5lZ1xuXHQiIDogIj1yIihyZXMzMikgOiAiaSIo
MHhmKSk7CisgICAgY2hlY2szMihyZXMzMiwgMHhiYzllMDAwMCk7CisKKyAgICBhc20oIiUwID0g
c2ZtYWtlKCMlMSk6cG9zXG5cdCIgOiAiPXIiKHJlczMyKSA6ICJpIigweGYpKTsKKyAgICBjaGVj
azMyKHJlczMyLCAweDNjOWUwMDAwKTsKKworICAgIGFzbSgiJTAgPSBkZm1ha2UoIyUxKTpuZWdc
blx0IiA6ICI9ciIocmVzNjQpIDogImkiKDB4ZikpOworICAgIGNoZWNrNjQocmVzNjQsIDB4YmY5
M2MwMDAwMDAwMDAwMFVMTCk7CisKKyAgICBhc20oIiUwID0gZGZtYWtlKCMlMSk6cG9zXG5cdCIg
OiAiPXIiKHJlczY0KSA6ICJpIigweGYpKTsKKyAgICBjaGVjazY0KHJlczY0LCAweDNmOTNjMDAw
MDAwMDAwMDBVTEwpOworfQorCitzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgbG9uZyBkZm1w
eWxsKGRvdWJsZSB4LCBkb3VibGUgeSkKK3sKKyAgICB1bnNpZ25lZCBsb25nIGxvbmcgcmVzNjQ7
CisgICAgYXNtKCIlMCA9IGRmbXB5bGwoJTEsICUyKSIgOiAiPXIiKHJlczY0KSA6ICJyIih4KSwg
InIiKHkpKTsKKyAgICByZXR1cm4gcmVzNjQ7Cit9CisKK3N0YXRpYyBpbmxpbmUgdW5zaWduZWQg
bG9uZyBsb25nIGRmbXB5bGgoZG91YmxlIGFjYywgZG91YmxlIHgsIGRvdWJsZSB5KQoreworICAg
IHVuc2lnbmVkIGxvbmcgbG9uZyByZXM2NCA9ICoodW5zaWduZWQgbG9uZyBsb25nICopJmFjYzsK
KyAgICBhc20oIiUwICs9IGRmbXB5bGgoJTEsICUyKSIgOiAiK3IiKHJlczY0KSA6ICJyIih4KSwg
InIiKHkpKTsKKyAgICByZXR1cm4gcmVzNjQ7Cit9CisKK3N0YXRpYyB2b2lkIGNoZWNrX2RmbXB5
eHgodm9pZCkKK3sKKyAgICB1bnNpZ25lZCBsb25nIGxvbmcgcmVzNjQ7CisKKyAgICByZXM2NCA9
IGRmbXB5bGwoREJMX01JTiwgREJMX01JTik7CisgICAgY2hlY2s2NChyZXM2NCwgMFVMTCk7Cisg
ICAgcmVzNjQgPSBkZm1weWxsKC0xLjAsIERCTF9NSU4pOworICAgIGNoZWNrNjQocmVzNjQsIDBV
TEwpOworICAgIHJlczY0ID0gZGZtcHlsbChEQkxfTUFYLCBEQkxfTUFYKTsKKyAgICBjaGVjazY0
KHJlczY0LCAweDFmZmZmZmZmZFVMTCk7CisKKyAgICByZXM2NCA9IGRmbXB5bGgoREJMX01JTiwg
REJMX01JTiwgREJMX01JTik7CisgICAgY2hlY2s2NChyZXM2NCwgMHgxMDAwMDAwMDAwMDAwMFVM
TCk7CisgICAgcmVzNjQgPSBkZm1weWxoKC0xLjAsIERCTF9NQVgsIERCTF9NSU4pOworICAgIGNo
ZWNrNjQocmVzNjQsIDB4YzAwZmZmZmZmZmUwMDAwMFVMTCk7CisgICAgcmVzNjQgPSBkZm1weWxo
KERCTF9NQVgsIDAuMCwgLTEuMCk7CisgICAgY2hlY2s2NChyZXM2NCwgMHg3ZmVmZmZmZmZmZmZm
ZmZmVUxMKTsKK30KKwogaW50IG1haW4oKQogewogICAgIGNoZWNrX2NvbXBhcmVfZXhjZXB0aW9u
KCk7CkBAIC03MTgsNiArNzcwLDggQEAgaW50IG1haW4oKQogICAgIGNoZWNrX3NmZml4dXBkKCk7
CiAgICAgY2hlY2tfc2ZmbXMoKTsKICAgICBjaGVja19mbG9hdDJpbnRfY29udnMoKTsKKyAgICBj
aGVja19mbG9hdF9jb25zdHMoKTsKKyAgICBjaGVja19kZm1weXh4KCk7CiAKICAgICBwdXRzKGVy
ciA/ICJGQUlMIiA6ICJQQVNTIik7CiAgICAgcmV0dXJuIGVyciA/IDEgOiAwOwpkaWZmIC0tZ2l0
IGEvdGFyZ2V0L2hleGFnb24vZ2VuX2lkZWZfcGFyc2VyX2Z1bmNzLnB5IGIvdGFyZ2V0L2hleGFn
b24vZ2VuX2lkZWZfcGFyc2VyX2Z1bmNzLnB5CmluZGV4IGFmZTY4YmRiNmYuLmI3NjY3OThhZDUg
MTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29uL2dlbl9pZGVmX3BhcnNlcl9mdW5jcy5weQorKysg
Yi90YXJnZXQvaGV4YWdvbi9nZW5faWRlZl9wYXJzZXJfZnVuY3MucHkKQEAgLTEwMyw3ICsxMDMs
MTUgQEAgZGVmIG1haW4oKToKICAgICAgICAgICAgICAgICBjb250aW51ZQogICAgICAgICAgICAg
aWYgdGFnLnN0YXJ0c3dpdGgoIlY2XyIpOgogICAgICAgICAgICAgICAgIGNvbnRpbnVlCi0gICAg
ICAgICAgICBpZiB0YWcuc3RhcnRzd2l0aCgiRiIpOgorICAgICAgICAgICAgaWYgKCB0YWcuc3Rh
cnRzd2l0aCgiRiIpIGFuZAorICAgICAgICAgICAgICAgICB0YWcgbm90IGluIHsKKyAgICAgICAg
ICAgICAgICAgICAgICJGMl9zZmltbV9wIiwKKyAgICAgICAgICAgICAgICAgICAgICJGMl9zZmlt
bV9uIiwKKyAgICAgICAgICAgICAgICAgICAgICJGMl9kZmltbV9wIiwKKyAgICAgICAgICAgICAg
ICAgICAgICJGMl9kZmltbV9uIiwKKyAgICAgICAgICAgICAgICAgICAgICJGMl9kZm1weWxsIiwK
KyAgICAgICAgICAgICAgICAgICAgICJGMl9kZm1weWxoIgorICAgICAgICAgICAgICAgICB9KToK
ICAgICAgICAgICAgICAgICBjb250aW51ZQogICAgICAgICAgICAgaWYgdGFnLmVuZHN3aXRoKCJf
bG9ja2VkIik6CiAgICAgICAgICAgICAgICAgY29udGludWUKLS0gCjIuMjUuMQoK

