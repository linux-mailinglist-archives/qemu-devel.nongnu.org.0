Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EC85F359D
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 20:28:15 +0200 (CEST)
Received: from localhost ([::1]:48770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofQAo-00044p-Em
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 14:28:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1ofPyX-0006Cn-Qr
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 14:15:35 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131]:54900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1ofPyR-0000pN-Q2
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 14:15:31 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 293GcVPx012364;
 Mon, 3 Oct 2022 18:15:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-type : content-transfer-encoding; s=qcppdkim1;
 bh=PxxPM6pVKCbSsk6AsuCOOwHeR8WdyUGqEJoL4V+NODk=;
 b=UNu29PEQmQOCxRbLNHimyilDoOfYON2O1bNZJ5qfy6afO9jyjLsyHisVMEU3pW3iVR2I
 ATSukOBzvjjyDvH2JsXt3+AYnAxuEYvJcPymt4TJO44tKewlsIXHZV953ezBECVs+bnN
 fUiJZX5OGXoaVSaQcDhZmBwSatLjcn35ovzjQ5zdmdsMYF9J0CErZ542KkY2G9sMy5UC
 jaMimdz12NRwgqURdbyleFML8ZCl0UxPhiedDqHX2rJ9oYM1hm2slvDUjYgpfgi4Xv1O
 lmTFqtDaYt4X4POAYcsXOGyTY3AG/5RKYvbx0tYsaVWABye63UzUeinOBkoT6XzTRS3A Ww== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jxawu4g61-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Oct 2022 18:15:15 +0000
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 293IFE03013431; 
 Mon, 3 Oct 2022 18:15:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTP id 3jxemkgptv-1;
 Mon, 03 Oct 2022 18:15:14 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 293ID5nd009286;
 Mon, 3 Oct 2022 18:15:14 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.235.220])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTP id 293IFDcS013421;
 Mon, 03 Oct 2022 18:15:14 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 877A25000B0; Mon,  3 Oct 2022 11:15:13 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, f4bug@amsat.org,
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com,
 stefanha@redhat.com
Subject: [PULL v3 4/4] Hexagon (gen_tcg_funcs.py): avoid duplicated tcg code
 on A_CVI_NEW
Date: Mon,  3 Oct 2022 11:15:11 -0700
Message-Id: <20221003181511.5535-5-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221003181511.5535-1-tsimpson@quicinc.com>
References: <20221003181511.5535-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 9VB27m4twm11iUFFvtTczaSL-939unIU
X-Proofpoint-ORIG-GUID: 9VB27m4twm11iUFFvtTczaSL-939unIU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-03_02,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=361 phishscore=0
 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210030109
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

RnJvbTogTWF0aGV1cyBUYXZhcmVzIEJlcm5hcmRpbm8gPHF1aWNfbWF0aGJlcm5AcXVpY2luYy5j
b20+CgpIZXhhZ29uIGluc3RydWN0aW9ucyB3aXRoIHRoZSBBX0NWSV9ORVcgYXR0cmlidXRlIHBy
b2R1Y2UgYSB2ZWN0b3IgdmFsdWUKdGhhdCBjYW4gYmUgdXNlZCBpbiB0aGUgc2FtZSBwYWNrZXQu
IFRoZSBweXRob24gZnVuY3Rpb24gcmVzcG9uc2libGUgZm9yCmdlbmVyYXRpbmcgY29kZSBmb3Ig
c3VjaCBpbnN0cnVjdGlvbnMgaGFzIGEgdHlwbyAoImlmIiBpbnN0ZWFkIG9mCiJlbGlmIiksIHdo
aWNoIG1ha2VzIGdlbnB0cl9kc3Rfd3JpdGVfZXh0KCkgYmUgZXhlY3V0ZWQgdHdpY2UsIHRodXMg
YWxzbwpnZW5lcmF0aW5nIHRoZSBzYW1lIHRjZyBjb2RlIHR3aWNlLiBGb3J0dW5hdGVseSwgdGhp
cyBkb2Vzbid0IGNhdXNlIGFueQpwcm9ibGVtcyBmb3IgY29ycmVjdG5lc3MsIGJ1dCBpdCBpcyBs
ZXNzIGVmZmljaWVudCB0aGFuIGl0IGNvdWxkIGJlLiBGaXgKaXQgYnkgdXNpbmcgYW4gImVsaWYi
IGFuZCBhdm9pZGluZyB0aGUgdW5uZWNlc3NhcnkgZXh0cmEgY29kZSBnZW4uCgpTaWduZWQtb2Zm
LWJ5OiBNYXRoZXVzIFRhdmFyZXMgQmVybmFyZGlubyA8cXVpY19tYXRoYmVybkBxdWljaW5jLmNv
bT4KU2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgpS
ZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFtc2F0Lm9yZz4KUmV2
aWV3ZWQtYnk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3Jn
PgpSZXZpZXdlZC1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgpNZXNz
YWdlLUlkOiA8ZmE3MDZiMTkyYjJhM2EwZmZiZDM5OWZhOGRiZjBkNWIyYzViODJkOS4xNjY0NTY4
NDkyLmdpdC5xdWljX21hdGhiZXJuQHF1aWNpbmMuY29tPgotLS0KIHRhcmdldC9oZXhhZ29uL2dl
bl90Y2dfZnVuY3MucHkgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9nZW5fdGNnX2Z1bmNzLnB5
IGIvdGFyZ2V0L2hleGFnb24vZ2VuX3RjZ19mdW5jcy5weQppbmRleCBkNzJjNjg5YWQ3Li42ZGVh
MDJiMGI5IDEwMDc1NQotLS0gYS90YXJnZXQvaGV4YWdvbi9nZW5fdGNnX2Z1bmNzLnB5CisrKyBi
L3RhcmdldC9oZXhhZ29uL2dlbl90Y2dfZnVuY3MucHkKQEAgLTU0OCw3ICs1NDgsNyBAQCBkZWYg
Z2VucHRyX2RzdF93cml0ZV9vcG4oZixyZWd0eXBlLCByZWdpZCwgdGFnKToKICAgICAgICAgaWYg
KGhleF9jb21tb24uaXNfaHZ4X3JlZyhyZWd0eXBlKSk6CiAgICAgICAgICAgICBpZiAoaGV4X2Nv
bW1vbi5pc19uZXdfcmVzdWx0KHRhZykpOgogICAgICAgICAgICAgICAgIGdlbnB0cl9kc3Rfd3Jp
dGVfZXh0KGYsIHRhZywgcmVndHlwZSwgcmVnaWQsICJFWFRfTkVXIikKLSAgICAgICAgICAgIGlm
IChoZXhfY29tbW9uLmlzX3RtcF9yZXN1bHQodGFnKSk6CisgICAgICAgICAgICBlbGlmIChoZXhf
Y29tbW9uLmlzX3RtcF9yZXN1bHQodGFnKSk6CiAgICAgICAgICAgICAgICAgZ2VucHRyX2RzdF93
cml0ZV9leHQoZiwgdGFnLCByZWd0eXBlLCByZWdpZCwgIkVYVF9UTVAiKQogICAgICAgICAgICAg
ZWxzZToKICAgICAgICAgICAgICAgICBnZW5wdHJfZHN0X3dyaXRlX2V4dChmLCB0YWcsIHJlZ3R5
cGUsIHJlZ2lkLCAiRVhUX0RGTCIpCi0tIAoyLjE3LjEKCg==

