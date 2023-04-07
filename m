Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 567256DB579
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 22:53:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkt4r-0007pl-W9; Fri, 07 Apr 2023 16:52:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pkt4p-0007pO-B6
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 16:52:55 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pkt4n-000737-7k
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 16:52:55 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 337KX0x8019606; Fri, 7 Apr 2023 20:52:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=28TCsG3mfEAT8KlGZLgJjsOLHmK2t1ay63syPe92THk=;
 b=F6M49zCWVZGmpvQAUkMDtDYQ+RT8lecvoXz0mf9VdxrZ5IEUOr8GUr2fOy0zPKpZKWjz
 upalAsw/A6r8oOBTJ1H2KIA3SCw7246ISfTESZEUtMtMLIbISqEcIRmO8Kj9P7+6VjFP
 zWOIDAakwHqNMpEk2CwIyQ61KRk0NYXg+fhPMLCwjSuhevli5wodicJvv+/Bcz60qEqa
 jalkSGyAcVSoXkzktnJTDR7iEIOEnf2cXtwas3L7SU0KHQXYts87fSWN8USHfQBFDY84
 cS+J/3O2DcXR/UUgjASr1smwxdwvK5Z1TUFki2zm9vGDKFBCBsgAT5pEHP2Xv8IwdKdz vA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pth8bsagg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Apr 2023 20:52:49 +0000
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 337Kqnid016968; 
 Fri, 7 Apr 2023 20:52:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 3ppdpmdhwn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Apr 2023 20:52:49 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 337KnWaQ014089;
 Fri, 7 Apr 2023 20:52:48 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 337KqmBE016960
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Apr 2023 20:52:48 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id 58B36666; Fri,  7 Apr 2023 13:52:48 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH] Hexagon (target/hexagon) Additional instructions handled by
 idef-parser
Date: Fri,  7 Apr 2023 13:52:46 -0700
Message-Id: <20230407205246.395196-1-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 1jPaybTEyswYsTHT17GxaM3_ZGdUWxXB
X-Proofpoint-ORIG-GUID: 1jPaybTEyswYsTHT17GxaM3_ZGdUWxXB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-07_13,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 mlxscore=0 mlxlogscore=754
 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304070188
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

Q3VycmVudGx5LCBpZGVmLXBhcnNlciBza2lwcyBhbGwgZmxvYXRpbmcgcG9pbnQgaW5zdHJ1Y3Rp
b25zLiAgSG93ZXZlciwKdGhlcmUgYXJlIHNvbWUgZmxvYXRpbmcgcG9pbnQgaW5zdHJ1Y3Rpb25z
IHRoYXQgY2FuIGJlIGhhbmRsZWQuCgpUaGUgZm9sbG93aW5nIGluc3RydWN0aW9ucyBhcmUgbm93
IHBhcnNlZAogICAgRjJfc2ZpbW1fcAogICAgRjJfc2ZpbW1fbgogICAgRjJfZGZpbW1fcAogICAg
RjJfZGZpbW1fbgogICAgRjJfZGZtcHlsbAogICAgRjJfZGZtcHlsaAoKVG8gbWFrZSB0aGVzZSBp
bnN0cnVjdGlvbnMgd29yaywgd2UgZml4IHNvbWUgYnVncyBpbiBwYXJzZXItaGVscGVycy5jCiAg
ICBnZW5fcnZhbHVlX2V4dGVuZAogICAgZ2VuX2Nhc3Rfb3AKClRlc3QgY2FzZXMgYWRkZWQgdG8g
dGVzdHMvdGNnL2hleGFnb24vZnBzdHVmZi5jCgpTaWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNv
biA8dHNpbXBzb25AcXVpY2luYy5jb20+Ci0tLQogdGFyZ2V0L2hleGFnb24vaWRlZi1wYXJzZXIv
cGFyc2VyLWhlbHBlcnMuYyB8IDE2ICsrKy0tLQogdGVzdHMvdGNnL2hleGFnb24vZnBzdHVmZi5j
ICAgICAgICAgICAgICAgICB8IDU0ICsrKysrKysrKysrKysrKysrKysrKwogdGFyZ2V0L2hleGFn
b24vZ2VuX2lkZWZfcGFyc2VyX2Z1bmNzLnB5ICAgICB8IDEwICsrKy0KIDMgZmlsZXMgY2hhbmdl
ZCwgNzIgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90YXJnZXQv
aGV4YWdvbi9pZGVmLXBhcnNlci9wYXJzZXItaGVscGVycy5jIGIvdGFyZ2V0L2hleGFnb24vaWRl
Zi1wYXJzZXIvcGFyc2VyLWhlbHBlcnMuYwppbmRleCAxOGNkZTZhMWJlLi4wYjE2MGU2ZjU4IDEw
MDY0NAotLS0gYS90YXJnZXQvaGV4YWdvbi9pZGVmLXBhcnNlci9wYXJzZXItaGVscGVycy5jCisr
KyBiL3RhcmdldC9oZXhhZ29uL2lkZWYtcGFyc2VyL3BhcnNlci1oZWxwZXJzLmMKQEAgLTM4Niwx
MyArMzg2LDEwIEBAIEhleFZhbHVlIGdlbl9ydmFsdWVfZXh0ZW5kKENvbnRleHQgKmMsIFlZTFRZ
UEUgKmxvY3AsIEhleFZhbHVlICpydmFsdWUpCiAKICAgICBpZiAocnZhbHVlLT50eXBlID09IElN
TUVESUFURSkgewogICAgICAgICBIZXhWYWx1ZSByZXMgPSBnZW5faW1tX3FlbXVfdG1wKGMsIGxv
Y3AsIDY0LCBydmFsdWUtPnNpZ25lZG5lc3MpOwotICAgICAgICBib29sIGlzX3Vuc2lnbmVkID0g
KHJ2YWx1ZS0+c2lnbmVkbmVzcyA9PSBVTlNJR05FRCk7Ci0gICAgICAgIGNvbnN0IGNoYXIgKnNp
Z25fc3VmZml4ID0gaXNfdW5zaWduZWQgPyAidSIgOiAiIjsKICAgICAgICAgZ2VuX2NfaW50X3R5
cGUoYywgbG9jcCwgNjQsIHJ2YWx1ZS0+c2lnbmVkbmVzcyk7Ci0gICAgICAgIE9VVChjLCBsb2Nw
LCAiICIsICZyZXMsICIgPSAiKTsKLSAgICAgICAgT1VUKGMsIGxvY3AsICIoIiwgc2lnbl9zdWZm
aXgsICJpbnQ2NF90KSAiKTsKLSAgICAgICAgT1VUKGMsIGxvY3AsICIoIiwgc2lnbl9zdWZmaXgs
ICJpbnQzMl90KSAiKTsKLSAgICAgICAgT1VUKGMsIGxvY3AsIHJ2YWx1ZSwgIjtcbiIpOworICAg
ICAgICBPVVQoYywgbG9jcCwgIiAiLCAmcmVzLCAiID0gKCIpOworICAgICAgICBnZW5fY19pbnRf
dHlwZShjLCBsb2NwLCA2NCwgcnZhbHVlLT5zaWduZWRuZXNzKTsKKyAgICAgICAgT1VUKGMsIGxv
Y3AsICIpIiwgcnZhbHVlLCAiO1xuIik7CiAgICAgICAgIHJldHVybiByZXM7CiAgICAgfSBlbHNl
IHsKICAgICAgICAgSGV4VmFsdWUgcmVzID0gZ2VuX3RtcChjLCBsb2NwLCA2NCwgcnZhbHVlLT5z
aWduZWRuZXNzKTsKQEAgLTk2Myw3ICs5NjAsMTIgQEAgSGV4VmFsdWUgZ2VuX2Nhc3Rfb3AoQ29u
dGV4dCAqYywKICAgICBpZiAoc3JjLT5iaXRfd2lkdGggPT0gdGFyZ2V0X3dpZHRoKSB7CiAgICAg
ICAgIHJldHVybiAqc3JjOwogICAgIH0gZWxzZSBpZiAoc3JjLT50eXBlID09IElNTUVESUFURSkg
ewotICAgICAgICBIZXhWYWx1ZSByZXMgPSAqc3JjOworICAgICAgICBIZXhWYWx1ZSByZXM7Cisg
ICAgICAgIGlmIChzcmMtPmJpdF93aWR0aCA8IHRhcmdldF93aWR0aCkgeworICAgICAgICAgICAg
cmVzID0gZ2VuX3J2YWx1ZV9leHRlbmQoYywgbG9jcCwgc3JjKTsKKyAgICAgICAgfSBlbHNlIHsK
KyAgICAgICAgICAgIHJlcyA9ICpzcmM7CisgICAgICAgIH0KICAgICAgICAgcmVzLmJpdF93aWR0
aCA9IHRhcmdldF93aWR0aDsKICAgICAgICAgcmVzLnNpZ25lZG5lc3MgPSBzaWduZWRuZXNzOwog
ICAgICAgICByZXR1cm4gcmVzOwpkaWZmIC0tZ2l0IGEvdGVzdHMvdGNnL2hleGFnb24vZnBzdHVm
Zi5jIGIvdGVzdHMvdGNnL2hleGFnb24vZnBzdHVmZi5jCmluZGV4IDkwY2U5YTZlZjMuLjI4Zjkz
OTcxNTUgMTAwNjQ0Ci0tLSBhL3Rlc3RzL3RjZy9oZXhhZ29uL2Zwc3R1ZmYuYworKysgYi90ZXN0
cy90Y2cvaGV4YWdvbi9mcHN0dWZmLmMKQEAgLTIwLDYgKzIwLDcgQEAKICAqLwogCiAjaW5jbHVk
ZSA8c3RkaW8uaD4KKyNpbmNsdWRlIDxmbG9hdC5oPgogCiBjb25zdCBpbnQgRlBJTlZGX0JJVCA9
IDE7ICAgICAgICAgICAgICAgICAvKiBJbnZhbGlkICovCiBjb25zdCBpbnQgRlBJTlZGID0gMSA8
PCBGUElOVkZfQklUOwpAQCAtNzA2LDYgKzcwNyw1NyBAQCBzdGF0aWMgdm9pZCBjaGVja19mbG9h
dDJpbnRfY29udnMoKQogICAgIGNoZWNrX2Zwc3RhdHVzKHVzciwgRlBJTlZGKTsKIH0KIAorc3Rh
dGljIHZvaWQgY2hlY2tfZmxvYXRfY29uc3RzKHZvaWQpCit7CisgICAgaW50IHJlczMyOworICAg
IHVuc2lnbmVkIGxvbmcgbG9uZyByZXM2NDsKKworICAgIGFzbSgiJTAgPSBzZm1ha2UoIyUxKTpu
ZWdcblx0IiA6ICI9ciIocmVzMzIpIDogImkiKDB4ZikpOworICAgIGNoZWNrMzIocmVzMzIsIDB4
YmM5ZTAwMDApOworCisgICAgYXNtKCIlMCA9IHNmbWFrZSgjJTEpOnBvc1xuXHQiIDogIj1yIihy
ZXMzMikgOiAiaSIoMHhmKSk7CisgICAgY2hlY2szMihyZXMzMiwgMHgzYzllMDAwMCk7CisKKyAg
ICBhc20oIiUwID0gZGZtYWtlKCMlMSk6bmVnXG5cdCIgOiAiPXIiKHJlczY0KSA6ICJpIigweGYp
KTsKKyAgICBjaGVjazY0KHJlczY0LCAweGJmOTNjMDAwMDAwMDAwMDBVTEwpOworCisgICAgYXNt
KCIlMCA9IGRmbWFrZSgjJTEpOnBvc1xuXHQiIDogIj1yIihyZXM2NCkgOiAiaSIoMHhmKSk7Cisg
ICAgY2hlY2s2NChyZXM2NCwgMHgzZjkzYzAwMDAwMDAwMDAwVUxMKTsKK30KKworc3RhdGljIGlu
bGluZSB1bnNpZ25lZCBsb25nIGxvbmcgZGZtcHlsbChkb3VibGUgeCwgZG91YmxlIHkpCit7Cisg
ICAgdW5zaWduZWQgbG9uZyBsb25nIHJlczY0OworICAgIGFzbSgiJTAgPSBkZm1weWxsKCUxLCAl
MikiIDogIj1yIihyZXM2NCkgOiAiciIoeCksICJyIih5KSk7CisgICAgcmV0dXJuIHJlczY0Owor
fQorCitzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgbG9uZyBkZm1weWxoKGRvdWJsZSBhY2Ms
IGRvdWJsZSB4LCBkb3VibGUgeSkKK3sKKyAgICB1bnNpZ25lZCBsb25nIGxvbmcgcmVzNjQgPSAq
KHVuc2lnbmVkIGxvbmcgbG9uZyAqKSZhY2M7CisgICAgYXNtKCIlMCArPSBkZm1weWxoKCUxLCAl
MikiIDogIityIihyZXM2NCkgOiAiciIoeCksICJyIih5KSk7CisgICAgcmV0dXJuIHJlczY0Owor
fQorCitzdGF0aWMgdm9pZCBjaGVja19kZm1weXh4KHZvaWQpCit7CisgICAgdW5zaWduZWQgbG9u
ZyBsb25nIHJlczY0OworCisgICAgcmVzNjQgPSBkZm1weWxsKERCTF9NSU4sIERCTF9NSU4pOwor
ICAgIGNoZWNrNjQocmVzNjQsIDBVTEwpOworICAgIHJlczY0ID0gZGZtcHlsbCgtMS4wLCBEQkxf
TUlOKTsKKyAgICBjaGVjazY0KHJlczY0LCAwVUxMKTsKKyAgICByZXM2NCA9IGRmbXB5bGwoREJM
X01BWCwgREJMX01BWCk7CisgICAgY2hlY2s2NChyZXM2NCwgMHgxZmZmZmZmZmRVTEwpOworCisg
ICAgcmVzNjQgPSBkZm1weWxoKERCTF9NSU4sIERCTF9NSU4sIERCTF9NSU4pOworICAgIGNoZWNr
NjQocmVzNjQsIDB4MTAwMDAwMDAwMDAwMDBVTEwpOworICAgIHJlczY0ID0gZGZtcHlsaCgtMS4w
LCBEQkxfTUFYLCBEQkxfTUlOKTsKKyAgICBjaGVjazY0KHJlczY0LCAweGMwMGZmZmZmZmZlMDAw
MDBVTEwpOworICAgIHJlczY0ID0gZGZtcHlsaChEQkxfTUFYLCAwLjAsIC0xLjApOworICAgIGNo
ZWNrNjQocmVzNjQsIDB4N2ZlZmZmZmZmZmZmZmZmZlVMTCk7Cit9CisKIGludCBtYWluKCkKIHsK
ICAgICBjaGVja19jb21wYXJlX2V4Y2VwdGlvbigpOwpAQCAtNzE4LDYgKzc3MCw4IEBAIGludCBt
YWluKCkKICAgICBjaGVja19zZmZpeHVwZCgpOwogICAgIGNoZWNrX3NmZm1zKCk7CiAgICAgY2hl
Y2tfZmxvYXQyaW50X2NvbnZzKCk7CisgICAgY2hlY2tfZmxvYXRfY29uc3RzKCk7CisgICAgY2hl
Y2tfZGZtcHl4eCgpOwogCiAgICAgcHV0cyhlcnIgPyAiRkFJTCIgOiAiUEFTUyIpOwogICAgIHJl
dHVybiBlcnIgPyAxIDogMDsKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2dlbl9pZGVmX3Bh
cnNlcl9mdW5jcy5weSBiL3RhcmdldC9oZXhhZ29uL2dlbl9pZGVmX3BhcnNlcl9mdW5jcy5weQpp
bmRleCA5MTc3NTNkNmQ4Li45YmVkN2VlNTVlIDEwMDY0NAotLS0gYS90YXJnZXQvaGV4YWdvbi9n
ZW5faWRlZl9wYXJzZXJfZnVuY3MucHkKKysrIGIvdGFyZ2V0L2hleGFnb24vZ2VuX2lkZWZfcGFy
c2VyX2Z1bmNzLnB5CkBAIC04OSw3ICs4OSwxNSBAQCBkZWYgbWFpbigpOgogICAgICAgICAgICAg
ICAgIGNvbnRpbnVlCiAgICAgICAgICAgICBpZiAoIHRhZy5zdGFydHN3aXRoKCdWNl8nKSApIDoK
ICAgICAgICAgICAgICAgICBjb250aW51ZQotICAgICAgICAgICAgaWYgKCB0YWcuc3RhcnRzd2l0
aCgnRicpICkgOgorICAgICAgICAgICAgaWYgKCB0YWcuc3RhcnRzd2l0aCgnRicpIGFuZAorICAg
ICAgICAgICAgICAgICB0YWcgbm90IGluIHsKKyAgICAgICAgICAgICAgICAgICAgICdGMl9zZmlt
bV9wJywKKyAgICAgICAgICAgICAgICAgICAgICdGMl9zZmltbV9uJywKKyAgICAgICAgICAgICAg
ICAgICAgICdGMl9kZmltbV9wJywKKyAgICAgICAgICAgICAgICAgICAgICdGMl9kZmltbV9uJywK
KyAgICAgICAgICAgICAgICAgICAgICdGMl9kZm1weWxsJywKKyAgICAgICAgICAgICAgICAgICAg
ICdGMl9kZm1weWxoJworICAgICAgICAgICAgICAgICB9KToKICAgICAgICAgICAgICAgICBjb250
aW51ZQogICAgICAgICAgICAgaWYgKCB0YWcuZW5kc3dpdGgoJ19sb2NrZWQnKSApIDoKICAgICAg
ICAgICAgICAgICBjb250aW51ZQotLSAKMi4yNS4xCgo=

