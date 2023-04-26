Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BAA6EEBA4
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 02:46:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prTFc-000854-Sm; Tue, 25 Apr 2023 20:43:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1prTFY-00083y-1q
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 20:43:12 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1prTF8-0006PX-Bt
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 20:43:11 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33Q0QAPn026594; Wed, 26 Apr 2023 00:42:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=1pNQrCtMiKM3Wyl2fHUxOZ4jdbg6AggfRyWi/YMOjnA=;
 b=gdyAJrfQo7rWRKIe5d1FqkP8mBW/YUvKKRfTDJKPpe2hGkru9qDuhP20nYnrUDv9zK0E
 GGiyBgdRVytedn0COzd23s9ohQqKjZdVMXLYd29wkZZxBo6omruCUbG8WtG6vkhZ8xMI
 gWXjJv+R3GYNkdNUsgCqfBxuumoBV3VxykpqeTCIRsLYUZ9ckkFQgpc8vXki2P6PlGBM
 rPlMg52RALTYDEjM60Nf1Ls6GV8jPLOnd++BxHrC6L8MhNlt8ju5biTyFjV9TbYVXExv
 Z0QfKCDz6xlHv9F1LVTcA6nROLdyL3PoXHHVsvacYKR83aDMUxE9U9wnCUmOzbb1rBTV DA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q6kw08ntf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 00:42:37 +0000
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 33Q0eEGn015713; 
 Wed, 26 Apr 2023 00:42:36 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 3q48nm4ycx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 00:42:36 +0000
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33Q0gaox017525;
 Wed, 26 Apr 2023 00:42:36 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 33Q0gZSU017523
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 00:42:36 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id A370368B; Tue, 25 Apr 2023 17:42:35 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH 13/21] Hexagon (target/hexagon) Short-circuit packet HVX writes
Date: Tue, 25 Apr 2023 17:42:28 -0700
Message-Id: <20230426004234.1319401-4-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230426004234.1319401-1-tsimpson@quicinc.com>
References: <20230426004234.1319401-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: RFtYvZiAY9dyEckuhDsjWq6AA2v1whwK
X-Proofpoint-ORIG-GUID: RFtYvZiAY9dyEckuhDsjWq6AA2v1whwK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-25_11,2023-04-25_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=796
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304260004
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

SW4gY2VydGFpbiBjYXNlcywgd2UgY2FuIGF2b2lkIHRoZSBvdmVyaGVhZCBvZiB3cml0aW5nIHRv
IGZ1dHVyZV9WUmVncwphbmQgd3JpdGUgZGlyZWN0bHkgdG8gVlJlZ3MuICBXZSBjb25zaWRlciBI
VlggcmVhZHMvd3JpdGVzIHdoZW4gY29tcHV0aW5nCmN0eC0+bmVlZF9jb21taXQuICBUaGVuLCB3
ZSBjYW4gZWFybHktZXhpdCBmcm9tIGdlbl9jb21taXRfaHZ4LgoKU2lnbmVkLW9mZi1ieTogVGF5
bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgotLS0KIHRhcmdldC9oZXhhZ29uL2dl
bnB0ci5jICAgIHwgIDYgKysrKy0KIHRhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5jIHwgNDYgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KIDIgZmlsZXMgY2hhbmdlZCwgNTAg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdv
bi9nZW5wdHIuYyBiL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jCmluZGV4IGRhNjhkMTllZDMuLjhl
NWFmYWI5MzEgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jCisrKyBiL3Rhcmdl
dC9oZXhhZ29uL2dlbnB0ci5jCkBAIC0xMTAxLDcgKzExMDEsMTEgQEAgc3RhdGljIHZvaWQgZ2Vu
X2xvZ192cmVnX3dyaXRlX3BhaXIoRGlzYXNDb250ZXh0ICpjdHgsIGludHB0cl90IHNyY29mZiwg
aW50IG51bSwKIAogc3RhdGljIGludHB0cl90IGdldF9yZXN1bHRfcXJlZyhEaXNhc0NvbnRleHQg
KmN0eCwgaW50IHFudW0pCiB7Ci0gICAgcmV0dXJuICBvZmZzZXRvZihDUFVIZXhhZ29uU3RhdGUs
IGZ1dHVyZV9RUmVnc1txbnVtXSk7CisgICAgaWYgKGN0eC0+bmVlZF9jb21taXQpIHsKKyAgICAg
ICAgcmV0dXJuICBvZmZzZXRvZihDUFVIZXhhZ29uU3RhdGUsIGZ1dHVyZV9RUmVnc1txbnVtXSk7
CisgICAgfSBlbHNlIHsKKyAgICAgICAgcmV0dXJuICBvZmZzZXRvZihDUFVIZXhhZ29uU3RhdGUs
IFFSZWdzW3FudW1dKTsKKyAgICB9CiB9CiAKIHN0YXRpYyB2b2lkIGdlbl92cmVnX2xvYWQoRGlz
YXNDb250ZXh0ICpjdHgsIGludHB0cl90IGRzdG9mZiwgVENHdiBzcmMsCmRpZmYgLS1naXQgYS90
YXJnZXQvaGV4YWdvbi90cmFuc2xhdGUuYyBiL3RhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5jCmlu
ZGV4IDA3ZWQzNmY2YTguLjhlMDI0YjJjZDIgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29uL3Ry
YW5zbGF0ZS5jCisrKyBiL3RhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5jCkBAIC03MCw2ICs3MCwx
MCBAQCBpbnRwdHJfdCBjdHhfZnV0dXJlX3ZyZWdfb2ZmKERpc2FzQ29udGV4dCAqY3R4LCBpbnQg
cmVnbnVtLAogewogICAgIGludHB0cl90IG9mZnNldDsKIAorICAgIGlmICghY3R4LT5uZWVkX2Nv
bW1pdCkgeworICAgICAgICByZXR1cm4gb2Zmc2V0b2YoQ1BVSGV4YWdvblN0YXRlLCBWUmVnc1ty
ZWdudW1dKTsKKyAgICB9CisKICAgICAvKiBTZWUgaWYgaXQgaXMgYWxyZWFkeSBhbGxvY2F0ZWQg
Ki8KICAgICBmb3IgKGludCBpID0gMDsgaSA8IGN0eC0+ZnV0dXJlX3ZyZWdzX2lkeDsgaSsrKSB7
CiAgICAgICAgIGlmIChjdHgtPmZ1dHVyZV92cmVnc19udW1baV0gPT0gcmVnbnVtKSB7CkBAIC0z
NzQsNyArMzc4LDcgQEAgc3RhdGljIGJvb2wgbmVlZF9jb21taXQoRGlzYXNDb250ZXh0ICpjdHgp
CiAgICAgICAgIHJldHVybiB0cnVlOwogICAgIH0KIAotICAgIGlmIChwa3QtPm51bV9pbnNucyA9
PSAxKSB7CisgICAgaWYgKHBrdC0+bnVtX2luc25zID09IDEgJiYgIXBrdC0+cGt0X2hhc19odngp
IHsKICAgICAgICAgcmV0dXJuIGZhbHNlOwogICAgIH0KIApAQCAtMzk0LDYgKzM5OCw0MCBAQCBz
dGF0aWMgYm9vbCBuZWVkX2NvbW1pdChEaXNhc0NvbnRleHQgKmN0eCkKICAgICAgICAgfQogICAg
IH0KIAorICAgIC8qIENoZWNrIGZvciBvdmVybGFwIGJldHdlZW4gSFZYIHJlYWRzIGFuZCB3cml0
ZXMgKi8KKyAgICBmb3IgKGludCBpID0gMDsgaSA8IGN0eC0+dnJlZ19sb2dfaWR4OyBpKyspIHsK
KyAgICAgICAgaW50IHZudW0gPSBjdHgtPnZyZWdfbG9nW2ldOworICAgICAgICBpZiAodGVzdF9i
aXQodm51bSwgY3R4LT52cmVnc19yZWFkKSkgeworICAgICAgICAgICAgcmV0dXJuIHRydWU7Cisg
ICAgICAgIH0KKyAgICB9CisgICAgaWYgKCFiaXRtYXBfZW1wdHkoY3R4LT52cmVnc191cGRhdGVk
X3RtcCwgTlVNX1ZSRUdTKSkgeworICAgICAgICBpbnQgaSA9IGZpbmRfZmlyc3RfYml0KGN0eC0+
dnJlZ3NfdXBkYXRlZF90bXAsIE5VTV9WUkVHUyk7CisgICAgICAgIHdoaWxlIChpIDwgTlVNX1ZS
RUdTKSB7CisgICAgICAgICAgICBpZiAodGVzdF9iaXQoaSwgY3R4LT52cmVnc19yZWFkKSkgewor
ICAgICAgICAgICAgICAgIHJldHVybiB0cnVlOworICAgICAgICAgICAgfQorICAgICAgICAgICAg
aSA9IGZpbmRfbmV4dF9iaXQoY3R4LT52cmVnc191cGRhdGVkX3RtcCwgTlVNX1ZSRUdTLCBpICsg
MSk7CisgICAgICAgIH0KKyAgICB9CisgICAgaWYgKCFiaXRtYXBfZW1wdHkoY3R4LT52cmVnc19z
ZWxlY3QsIE5VTV9WUkVHUykpIHsKKyAgICAgICAgaW50IGkgPSBmaW5kX2ZpcnN0X2JpdChjdHgt
PnZyZWdzX3NlbGVjdCwgTlVNX1ZSRUdTKTsKKyAgICAgICAgd2hpbGUgKGkgPCBOVU1fVlJFR1Mp
IHsKKyAgICAgICAgICAgIGlmICh0ZXN0X2JpdChpLCBjdHgtPnZyZWdzX3JlYWQpKSB7CisgICAg
ICAgICAgICAgICAgcmV0dXJuIHRydWU7CisgICAgICAgICAgICB9CisgICAgICAgICAgICBpID0g
ZmluZF9uZXh0X2JpdChjdHgtPnZyZWdzX3NlbGVjdCwgTlVNX1ZSRUdTLCBpICsgMSk7CisgICAg
ICAgIH0KKyAgICB9CisKKyAgICAvKiBDaGVjayBmb3Igb3ZlcmxhcCBiZXR3ZWVuIEhWWCBwcmVk
aWNhdGUgcmVhZHMgYW5kIHdyaXRlcyAqLworICAgIGZvciAoaW50IGkgPSAwOyBpIDwgY3R4LT5x
cmVnX2xvZ19pZHg7IGkrKykgeworICAgICAgICBpbnQgcW51bSA9IGN0eC0+cXJlZ19sb2dbaV07
CisgICAgICAgIGlmICh0ZXN0X2JpdChxbnVtLCBjdHgtPnFyZWdzX3JlYWQpKSB7CisgICAgICAg
ICAgICByZXR1cm4gdHJ1ZTsKKyAgICAgICAgfQorICAgIH0KKwogICAgIHJldHVybiBmYWxzZTsK
IH0KIApAQCAtNzg3LDYgKzgyNSwxMiBAQCBzdGF0aWMgdm9pZCBnZW5fY29tbWl0X2h2eChEaXNh
c0NvbnRleHQgKmN0eCkKIHsKICAgICBpbnQgaTsKIAorICAgIC8qIEVhcmx5IGV4aXQgaWYgbm90
IG5lZWRlZCAqLworICAgIGlmICghY3R4LT5uZWVkX2NvbW1pdCkgeworICAgICAgICBnX2Fzc2Vy
dCghcGt0X2hhc19odnhfc3RvcmUoY3R4LT5wa3QpKTsKKyAgICAgICAgcmV0dXJuOworICAgIH0K
KwogICAgIC8qCiAgICAgICogICAgZm9yIChpID0gMDsgaSA8IGN0eC0+dnJlZ19sb2dfaWR4OyBp
KyspIHsKICAgICAgKiAgICAgICAgaW50IHJudW0gPSBjdHgtPnZyZWdfbG9nW2ldOwotLSAKMi4y
NS4xCgo=

