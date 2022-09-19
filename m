Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB695BD58C
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 22:14:41 +0200 (CEST)
Received: from localhost ([::1]:44708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaNA7-0002y2-R1
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 16:14:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1oaN7i-000092-1B
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 16:12:10 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131]:61716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1oaN7f-0005UT-3X
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 16:12:09 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28JKAp8I013040;
 Mon, 19 Sep 2022 20:12:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=dFPNEQNcUr2IIouaLTW5WhHGLsJc/jpZ/kx7Jhww5NY=;
 b=HFkQNElABzKMYcA+aGqqEUXBO8Qoc/2xaD/6WEqm3wV2Qh41guFJSFmwAvAX4TDh9xMa
 aHMmuuQS20rEchdRaAxQn3z6QtsvXHBMupemeN7lZwZGjjUwbA8MUCMbH1kGfMU5FfsT
 WAYX3hwxDdyaABGcfQBCksQU7NgW8yZxdiPh/ZnmfceFYfv0JfNyGEzWSLqGa2+IQjo5
 o3wMwZxiBtuZWWm2F8Mzvxm3r+NNbf1TqbVYYHImKrl18Rxf1ZM8hZ7N9n+5I0V3pIvP
 /egbJqGWTVgHGbw0aJagtPQtN8dc2/YmAiHhXBf9WjT/HDrNXgxfuEgg0CfUmyFlcnNe UQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jn6mcdngu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Sep 2022 20:12:03 +0000
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 28JK7DLK024634; 
 Mon, 19 Sep 2022 20:12:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 3jnqpvdxs3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 19 Sep 2022 20:12:01 +0000
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28JK7Djw024600;
 Mon, 19 Sep 2022 20:12:01 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.235.220])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTP id 28JKC0Xq028901;
 Mon, 19 Sep 2022 20:12:01 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 9B6355000AE; Mon, 19 Sep 2022 13:12:00 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, f4bug@amsat.org,
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PULL 2/2] Hexagon (tests/tcg/hexagon): add fmin/fmax tests for
 signed zero
Date: Mon, 19 Sep 2022 13:11:59 -0700
Message-Id: <20220919201159.31838-3-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220919201159.31838-1-tsimpson@quicinc.com>
References: <20220919201159.31838-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 5Rf6LN92ZHGONotu19i9n4k0rS0XT6xz
X-Proofpoint-GUID: 5Rf6LN92ZHGONotu19i9n4k0rS0XT6xz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-19_05,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=774 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2209190135
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
b20+CgpTaWduZWQtb2ZmLWJ5OiBNYXRoZXVzIFRhdmFyZXMgQmVybmFyZGlubyA8cXVpY19tYXRo
YmVybkBxdWljaW5jLmNvbT4KU2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29u
QHF1aWNpbmMuY29tPgpSZXZpZXdlZC1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNp
bmMuY29tPgpUZXN0ZWQtYnk6IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4K
LS0tCiB0ZXN0cy90Y2cvaGV4YWdvbi91c3IuYyB8IDEwICsrKysrKysrKysKIDEgZmlsZSBjaGFu
Z2VkLCAxMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdGVzdHMvdGNnL2hleGFnb24vdXNy
LmMgYi90ZXN0cy90Y2cvaGV4YWdvbi91c3IuYwppbmRleCBhNTMxNTExY2VjLi5mYjQ1MTQ5ODlj
IDEwMDY0NAotLS0gYS90ZXN0cy90Y2cvaGV4YWdvbi91c3IuYworKysgYi90ZXN0cy90Y2cvaGV4
YWdvbi91c3IuYwpAQCAtODYsNiArODYsNyBAQCBjb25zdCB1aW50MzJfdCBTRl9RTmFOX25lZyA9
ICAgICAgICAgMHhmZmMwMDAwMDsKIGNvbnN0IHVpbnQzMl90IFNGX1NOYU5fbmVnID0gICAgICAg
ICAweGZmYjAwMDAwOwogY29uc3QgdWludDMyX3QgU0ZfSEVYX05hTiA9ICAgICAgICAgIDB4ZmZm
ZmZmZmY7CiBjb25zdCB1aW50MzJfdCBTRl96ZXJvID0gICAgICAgICAgICAgMHgwMDAwMDAwMDsK
K2NvbnN0IHVpbnQzMl90IFNGX3plcm9fbmVnID0gICAgICAgICAweDgwMDAwMDAwOwogY29uc3Qg
dWludDMyX3QgU0Zfb25lID0gICAgICAgICAgICAgIDB4M2Y4MDAwMDA7CiBjb25zdCB1aW50MzJf
dCBTRl9vbmVfcmVjaXAgPSAgICAgICAgMHgzZjdmMDAwMTsgICAgICAgICAvKiAwLjk5NjAuLi4g
ICovCiBjb25zdCB1aW50MzJfdCBTRl9vbmVfaW52c3FydGEgPSAgICAgMHgzZjdmMDAwMDsgICAg
ICAgICAvKiAwLjk5NjA5Mzc1ICovCkBAIC0xMDAsNiArMTAxLDcgQEAgY29uc3QgdWludDY0X3Qg
REZfUU5hTl9uZWcgPSAgICAgICAgIDB4ZmZmODAwMDAwMDAwMDAwMFVMTDsKIGNvbnN0IHVpbnQ2
NF90IERGX1NOYU5fbmVnID0gICAgICAgICAweGZmZjcwMDAwMDAwMDAwMDBVTEw7CiBjb25zdCB1
aW50NjRfdCBERl9IRVhfTmFOID0gICAgICAgICAgMHhmZmZmZmZmZmZmZmZmZmZmVUxMOwogY29u
c3QgdWludDY0X3QgREZfemVybyA9ICAgICAgICAgICAgIDB4MDAwMDAwMDAwMDAwMDAwMFVMTDsK
K2NvbnN0IHVpbnQ2NF90IERGX3plcm9fbmVnID0gICAgICAgICAweDgwMDAwMDAwMDAwMDAwMDBV
TEw7CiBjb25zdCB1aW50NjRfdCBERl9hbnkgPSAgICAgICAgICAgICAgMHgzZjgwMDAwMDAwMDAw
MDAwVUxMOwogY29uc3QgdWludDY0X3QgREZfb25lID0gICAgICAgICAgICAgIDB4M2ZmMDAwMDAw
MDAwMDAwMFVMTDsKIGNvbnN0IHVpbnQ2NF90IERGX29uZV9oaCA9ICAgICAgICAgICAweDNmZjAw
MWZmODAwMDAwMDBVTEw7ICAgICAvKiAxLjAwMDQ4Li4uICovCkBAIC05MzMsNiArOTM1LDggQEAg
aW50IG1haW4oKQogICAgIFRFU1RfUl9PUF9SUihzZm1pbiwgIFNGX1FOYU4sICAgICBTRl9vbmUs
ICAgICAgICAgU0Zfb25lLCAgICAgICBVU1JfQ0xFQVIpOwogICAgIFRFU1RfUl9PUF9SUihzZm1p
biwgIFNGX1NOYU4sICAgICBTRl9RTmFOLCAgICAgICAgU0ZfSEVYX05hTiwgICBVU1JfRlBJTlZG
KTsKICAgICBURVNUX1JfT1BfUlIoc2ZtaW4sICBTRl9RTmFOLCAgICAgU0ZfU05hTiwgICAgICAg
IFNGX0hFWF9OYU4sICAgVVNSX0ZQSU5WRik7CisgICAgVEVTVF9SX09QX1JSKHNmbWluLCAgU0Zf
emVybywgICAgIFNGX3plcm9fbmVnLCAgICBTRl96ZXJvX25lZywgIFVTUl9DTEVBUik7CisgICAg
VEVTVF9SX09QX1JSKHNmbWluLCAgU0ZfemVyb19uZWcsIFNGX3plcm8sICAgICAgICBTRl96ZXJv
X25lZywgIFVTUl9DTEVBUik7CiAKICAgICBURVNUX1JfT1BfUlIoc2ZtYXgsICBTRl9vbmUsICAg
ICAgU0Zfc21hbGxfbmVnLCAgIFNGX29uZSwgICAgICAgVVNSX0NMRUFSKTsKICAgICBURVNUX1Jf
T1BfUlIoc2ZtYXgsICBTRl9vbmUsICAgICAgU0ZfU05hTiwgICAgICAgIFNGX29uZSwgICAgICAg
VVNSX0ZQSU5WRik7CkBAIC05NDEsNiArOTQ1LDggQEAgaW50IG1haW4oKQogICAgIFRFU1RfUl9P
UF9SUihzZm1heCwgIFNGX1FOYU4sICAgICBTRl9vbmUsICAgICAgICAgU0Zfb25lLCAgICAgICBV
U1JfQ0xFQVIpOwogICAgIFRFU1RfUl9PUF9SUihzZm1heCwgIFNGX1NOYU4sICAgICBTRl9RTmFO
LCAgICAgICAgU0ZfSEVYX05hTiwgICBVU1JfRlBJTlZGKTsKICAgICBURVNUX1JfT1BfUlIoc2Zt
YXgsICBTRl9RTmFOLCAgICAgU0ZfU05hTiwgICAgICAgIFNGX0hFWF9OYU4sICAgVVNSX0ZQSU5W
Rik7CisgICAgVEVTVF9SX09QX1JSKHNmbWF4LCAgU0ZfemVybywgICAgIFNGX3plcm9fbmVnLCAg
ICBTRl96ZXJvLCAgICAgIFVTUl9DTEVBUik7CisgICAgVEVTVF9SX09QX1JSKHNmbWF4LCAgU0Zf
emVyb19uZWcsIFNGX3plcm8sICAgICAgICBTRl96ZXJvLCAgICAgIFVTUl9DTEVBUik7CiAKICAg
ICBURVNUX1JfT1BfUlIoc2ZhZGQsICBTRl9vbmUsICAgICAgU0ZfUU5hTiwgICAgICAgIFNGX0hF
WF9OYU4sICAgVVNSX0NMRUFSKTsKICAgICBURVNUX1JfT1BfUlIoc2ZhZGQsICBTRl9vbmUsICAg
ICAgU0ZfU05hTiwgICAgICAgIFNGX0hFWF9OYU4sICAgVVNSX0ZQSU5WRik7CkBAIC0xMDAzLDYg
KzEwMDksOCBAQCBpbnQgbWFpbigpCiAgICAgVEVTVF9QX09QX1BQKGRmbWluLCAgREZfUU5hTiwg
ICBERl9hbnksICAgICAgICAgIERGX2FueSwgICAgICAgIFVTUl9DTEVBUik7CiAgICAgVEVTVF9Q
X09QX1BQKGRmbWluLCAgREZfU05hTiwgICBERl9RTmFOLCAgICAgICAgIERGX0hFWF9OYU4sICAg
IFVTUl9GUElOVkYpOwogICAgIFRFU1RfUF9PUF9QUChkZm1pbiwgIERGX1FOYU4sICAgREZfU05h
TiwgICAgICAgICBERl9IRVhfTmFOLCAgICBVU1JfRlBJTlZGKTsKKyAgICBURVNUX1BfT1BfUFAo
ZGZtaW4sICBERl96ZXJvLCAgIERGX3plcm9fbmVnLCAgICAgREZfemVyb19uZWcsICAgVVNSX0NM
RUFSKTsKKyAgICBURVNUX1BfT1BfUFAoZGZtaW4sICBERl96ZXJvX25lZywgREZfemVybywgICAg
ICAgREZfemVyb19uZWcsICAgVVNSX0NMRUFSKTsKIAogICAgIFRFU1RfUF9PUF9QUChkZm1heCwg
IERGX2FueSwgICAgREZfc21hbGxfbmVnLCAgICBERl9hbnksICAgICAgICBVU1JfQ0xFQVIpOwog
ICAgIFRFU1RfUF9PUF9QUChkZm1heCwgIERGX2FueSwgICAgREZfU05hTiwgICAgICAgICBERl9h
bnksICAgICAgICBVU1JfRlBJTlZGKTsKQEAgLTEwMTEsNiArMTAxOSw4IEBAIGludCBtYWluKCkK
ICAgICBURVNUX1BfT1BfUFAoZGZtYXgsICBERl9RTmFOLCAgIERGX2FueSwgICAgICAgICAgREZf
YW55LCAgICAgICAgVVNSX0NMRUFSKTsKICAgICBURVNUX1BfT1BfUFAoZGZtYXgsICBERl9TTmFO
LCAgIERGX1FOYU4sICAgICAgICAgREZfSEVYX05hTiwgICAgVVNSX0ZQSU5WRik7CiAgICAgVEVT
VF9QX09QX1BQKGRmbWF4LCAgREZfUU5hTiwgICBERl9TTmFOLCAgICAgICAgIERGX0hFWF9OYU4s
ICAgIFVTUl9GUElOVkYpOworICAgIFRFU1RfUF9PUF9QUChkZm1heCwgIERGX3plcm8sICAgREZf
emVyb19uZWcsICAgICBERl96ZXJvLCAgICAgICBVU1JfQ0xFQVIpOworICAgIFRFU1RfUF9PUF9Q
UChkZm1heCwgIERGX3plcm9fbmVnLCBERl96ZXJvLCAgICAgICBERl96ZXJvLCAgICAgICBVU1Jf
Q0xFQVIpOwogCiAgICAgVEVTVF9YUF9PUF9QUChkZm1weWhoLCBERl9vbmUsICAgREZfb25lLCAg
REZfb25lLCAgIERGX29uZV9oaCwgIFVTUl9DTEVBUik7CiAgICAgVEVTVF9YUF9PUF9QUChkZm1w
eWhoLCBERl96ZXJvLCAgREZfYW55LCAgREZfUU5hTiwgIERGX0hFWF9OYU4sIFVTUl9DTEVBUik7
Ci0tIAoyLjE3LjEKCg==

