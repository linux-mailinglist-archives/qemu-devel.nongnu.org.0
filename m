Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D9970119F
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 23:53:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxacV-0002ua-8i; Fri, 12 May 2023 17:48:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pxacM-0002nW-SU
 for qemu-devel@nongnu.org; Fri, 12 May 2023 17:48:03 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pxaby-000668-3U
 for qemu-devel@nongnu.org; Fri, 12 May 2023 17:48:02 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34CJQAwo027259; Fri, 12 May 2023 21:47:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=0AwmGICvGw8fZgsgQy/Vsws+UTFMNX3SrPpAXqpVQX4=;
 b=QQDnrrYVIaGX1zuWhTZOY2MHPsApJW2pgQ+IavGFmpqjaqNP7ggbhHes5l9lwwKEPWoz
 awPvXNM1Jy4RjZQ7w6+V1I15A2xp/N7N8uok5Qc9c37g5aAzuCwVdnA/3ZKwOsVahBaz
 0DreNLYG8kRxble/94VhMQPC2VMRbAeNDqCxP9ZbHcHIorekG10P4BMoTpzOZsBGMOKz
 ofUQih7PVbPT3ZyEhoIRuXC5t5X2fJEokg5UaAnYcmBUagjs8SpQ1+r+sY0bLtBlcJFY
 xUjaz9bsGrxf6/+STF1baYh3kg3uwSEsApA5F1MCcM3vFTR0haVEoRjzfgRLTK15CYFx AQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qhj9s1p4m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 21:47:26 +0000
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 34CLlN9f024128; 
 Fri, 12 May 2023 21:47:25 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 3qf6j64msn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 21:47:25 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34CLlOL8024183;
 Fri, 12 May 2023 21:47:24 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 34CLlNia024127
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 21:47:24 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id 391BD6DB; Fri, 12 May 2023 14:47:22 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com,
 stefanha@redhat.com, ale@rev.ng, anjo@rev.ng, quic_mliebel@quicinc.com
Subject: [PULL 34/44] Hexagon: list available CPUs with `-cpu help`
Date: Fri, 12 May 2023 14:46:56 -0700
Message-Id: <20230512214706.946068-35-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230512214706.946068-1-tsimpson@quicinc.com>
References: <20230512214706.946068-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: a5NeoFW9Wjtz2WhGACFJ6Ajmg77ALgj5
X-Proofpoint-GUID: a5NeoFW9Wjtz2WhGACFJ6Ajmg77ALgj5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-12_14,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=949 mlxscore=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305120183
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

RnJvbTogTWF0aGV1cyBUYXZhcmVzIEJlcm5hcmRpbm8gPHF1aWNfbWF0aGJlcm5AcXVpY2luYy5j
b20+CgpDdXJyZW50bHksIHFlbXUtaGV4YWdvbiBvbmx5IG1vZGVscyB0aGUgdjY3IGNwdS4gTm9u
ZXRoZWxlc3MgaWYgd2UgdHJ5CnRvIGdldCB0aGlzIGluZm9ybWF0aW9uIHdpdGggYC1jcHUgaGVs
cGAsIHFlbXUganVzdCBleGlzdHMgd2l0aCBhbiBlcnJvcgpjb2RlIGFuZCBubyBvdXRwdXQuIExl
dCdzIGNvcnJlY3QgdGhhdC4KClRoZSBjb2RlIGlzIGJhc2ljYWxseSBhIGNvcHkgZnJvbSB0YXJn
ZXQvYWxwaGEvY3B1LmgsIGJ1dCB3ZSBzdHJpcCB0aGUKIi1oZXhhZ29uLWNwdSIgc3VmZml4IGJl
Zm9yZSBwcmludGluZy4gVGhpcyBpcyB0byBhdm9pZCBjb25mdXNpbmcKc2l0dWF0aW9ucyBsaWtl
IHRoZSBmb2xsb3dpbmc6CgogICAgJCBxZW11LWhleGFnb24gLWNwdSBoZWxwCgogICAgQXZhaWxh
YmxlIENQVXM6CiAgICAgIHY2Ny1oZXhhZ29uLWNwdQoKICAgICQgcWVtdS1oZXhhZ29uIC1jcHUg
djY3LWhleGFnb24tY3B1IC4vcHJvZwoKICAgIHFlbXUtaGV4YWdvbjogdW5hYmxlIHRvIGZpbmQg
Q1BVIG1vZGVsICd2NjctaGV4YWdvbi1jcHUnCgpTaWduZWQtb2ZmLWJ5OiBNYXRoZXVzIFRhdmFy
ZXMgQmVybmFyZGlubyA8cXVpY19tYXRoYmVybkBxdWljaW5jLmNvbT4KU2lnbmVkLW9mZi1ieTog
VGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgpUZXN0ZWQtYnk6IFRheWxvciBT
aW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IFRheWxvciBTaW1wc29u
IDx0c2ltcHNvbkBxdWljaW5jLmNvbT4KTWVzc2FnZS1JZDogPGI5NDZlMTdjN2UxN2VlZDkwOTU3
MDBiNTRjNWVhZDM2ZTVkNTVkZmEuMTY4MzIyNTgwNC5naXQucXVpY19tYXRoYmVybkBxdWljaW5j
LmNvbT4KLS0tCiB0YXJnZXQvaGV4YWdvbi9jcHUuaCB8ICAzICsrKwogdGFyZ2V0L2hleGFnb24v
Y3B1LmMgfCAyMCArKysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vY3B1LmggYi90YXJnZXQvaGV4
YWdvbi9jcHUuaAppbmRleCBkMDk1ZGM2NjQ3Li5iZmNiMTA1N2RkIDEwMDY0NAotLS0gYS90YXJn
ZXQvaGV4YWdvbi9jcHUuaAorKysgYi90YXJnZXQvaGV4YWdvbi9jcHUuaApAQCAtNDgsNiArNDgs
OSBAQAogI2RlZmluZSBUWVBFX0hFWEFHT05fQ1BVX1Y3MSBIRVhBR09OX0NQVV9UWVBFX05BTUUo
InY3MSIpCiAjZGVmaW5lIFRZUEVfSEVYQUdPTl9DUFVfVjczIEhFWEFHT05fQ1BVX1RZUEVfTkFN
RSgidjczIikKIAordm9pZCBoZXhhZ29uX2NwdV9saXN0KHZvaWQpOworI2RlZmluZSBjcHVfbGlz
dCBoZXhhZ29uX2NwdV9saXN0CisKICNkZWZpbmUgTU1VX1VTRVJfSURYIDAKIAogdHlwZWRlZiBz
dHJ1Y3QgewpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vY3B1LmMgYi90YXJnZXQvaGV4YWdv
bi9jcHUuYwppbmRleCBkNGRmYzM4MmFiLi43ZTEyNzA1OWM3IDEwMDY0NAotLS0gYS90YXJnZXQv
aGV4YWdvbi9jcHUuYworKysgYi90YXJnZXQvaGV4YWdvbi9jcHUuYwpAQCAtMzEsNiArMzEsMjYg
QEAgc3RhdGljIHZvaWQgaGV4YWdvbl92NjlfY3B1X2luaXQoT2JqZWN0ICpvYmopIHsgfQogc3Rh
dGljIHZvaWQgaGV4YWdvbl92NzFfY3B1X2luaXQoT2JqZWN0ICpvYmopIHsgfQogc3RhdGljIHZv
aWQgaGV4YWdvbl92NzNfY3B1X2luaXQoT2JqZWN0ICpvYmopIHsgfQogCitzdGF0aWMgdm9pZCBo
ZXhhZ29uX2NwdV9saXN0X2VudHJ5KGdwb2ludGVyIGRhdGEsIGdwb2ludGVyIHVzZXJfZGF0YSkK
K3sKKyAgICBPYmplY3RDbGFzcyAqb2MgPSBkYXRhOworICAgIGNoYXIgKm5hbWUgPSBnX3N0cmR1
cChvYmplY3RfY2xhc3NfZ2V0X25hbWUob2MpKTsKKyAgICBpZiAoZ19zdHJfaGFzX3N1ZmZpeChu
YW1lLCBIRVhBR09OX0NQVV9UWVBFX1NVRkZJWCkpIHsKKyAgICAgICAgbmFtZVtzdHJsZW4obmFt
ZSkgLSBzdHJsZW4oSEVYQUdPTl9DUFVfVFlQRV9TVUZGSVgpXSA9ICdcMCc7CisgICAgfQorICAg
IHFlbXVfcHJpbnRmKCIgICVzXG4iLCBuYW1lKTsKKyAgICBnX2ZyZWUobmFtZSk7Cit9CisKK3Zv
aWQgaGV4YWdvbl9jcHVfbGlzdCh2b2lkKQoreworICAgIEdTTGlzdCAqbGlzdDsKKyAgICBsaXN0
ID0gb2JqZWN0X2NsYXNzX2dldF9saXN0X3NvcnRlZChUWVBFX0hFWEFHT05fQ1BVLCBmYWxzZSk7
CisgICAgcWVtdV9wcmludGYoIkF2YWlsYWJsZSBDUFVzOlxuIik7CisgICAgZ19zbGlzdF9mb3Jl
YWNoKGxpc3QsIGhleGFnb25fY3B1X2xpc3RfZW50cnksIE5VTEwpOworICAgIGdfc2xpc3RfZnJl
ZShsaXN0KTsKK30KKwogc3RhdGljIE9iamVjdENsYXNzICpoZXhhZ29uX2NwdV9jbGFzc19ieV9u
YW1lKGNvbnN0IGNoYXIgKmNwdV9tb2RlbCkKIHsKICAgICBPYmplY3RDbGFzcyAqb2M7Ci0tIAoy
LjI1LjEKCg==

