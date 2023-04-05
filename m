Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9089A6D83F3
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 18:44:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk6EY-0005fJ-0l; Wed, 05 Apr 2023 12:43:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pk6EW-0005ev-AW
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 12:43:40 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pk6EU-0005ZA-Qp
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 12:43:40 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 335DSojL002977; Wed, 5 Apr 2023 16:43:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=U+CjJqxYtbhnFMfhAGufM53mLdrB0bd/HPc8KZQmV9o=;
 b=VkbgNXpvJgEXRSg9oEHHTdMrJfjMlcBKoABlYRsU8OQaiG1Ov5WnkfVtXvZbezlDBmQH
 dFJm/KCLFNb6pbMzPHdiPatvAwhMSbOdW/O8wA8swVlu8F3+aknvwFN7OOq5dC/oTvLT
 yh2DVCyLQm2WNWeUp3CNOUp8GjftQIbMr3YmDqgx20ek0EojarXroBjGRXzOAtAi/dsn
 yKuj+Una3RoVkfbhlxTF6ncNBgxXXMR7wXWYIlnh1Mdix9wyplQzXehc1kH9AINQjtcE
 IML0RUyY0nfW2QTIudHJAI+WWMQEoKNeCpf87GPC2Pm+9xcPUVtMy8/1S1KJTaCezCXr 2w== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3prnvg3bay-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Apr 2023 16:43:37 +0000
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 335GhSLk008888; 
 Wed, 5 Apr 2023 16:43:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 3ppdpm87x8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Apr 2023 16:43:35 +0000
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 335GhZq7009129;
 Wed, 5 Apr 2023 16:43:35 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 335GhYSd009128
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Apr 2023 16:43:35 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id 2E7EE594; Wed,  5 Apr 2023 09:43:35 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH] Hexagon (target/hexagon) Merge arguments to
 probe_pkt_scalar_hvx_stores
Date: Wed,  5 Apr 2023 09:42:10 -0700
Message-Id: <20230405164211.30015-2-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230405164211.30015-1-tsimpson@quicinc.com>
References: <20230405164211.30015-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 7xO3h-t1Gnv5Bk-pxA7sM3hq-8fYMI3Q
X-Proofpoint-ORIG-GUID: 7xO3h-t1Gnv5Bk-pxA7sM3hq-8fYMI3Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-05_09,2023-04-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 mlxscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 mlxlogscore=806
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304050150
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

UmVkdWNpbmcgdGhlIG51bWJlciBvZiBhcmd1bWVudHMgcmVkdWNlcyB0aGUgb3ZlcmhlYWQgb2Yg
dGhlIGhlbHBlcgpjYWxsCgpTaWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25A
cXVpY2luYy5jb20+Ci0tLQogdGFyZ2V0L2hleGFnb24vaGVscGVyLmggICAgfCAgNCArKy0tCiB0
YXJnZXQvaGV4YWdvbi90cmFuc2xhdGUuaCB8ICAxICsKIHRhcmdldC9oZXhhZ29uL29wX2hlbHBl
ci5jIHwgIDQgKystLQogdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmMgfCAxMCArKysrKy0tLS0t
CiA0IGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vaGVscGVyLmggYi90YXJnZXQvaGV4YWdvbi9oZWxwZXIu
aAppbmRleCAzNjhmMGI1NzA4Li5lZDdmOTg0MmY2IDEwMDY0NAotLS0gYS90YXJnZXQvaGV4YWdv
bi9oZWxwZXIuaAorKysgYi90YXJnZXQvaGV4YWdvbi9oZWxwZXIuaApAQCAtMSw1ICsxLDUgQEAK
IC8qCi0gKiAgQ29weXJpZ2h0KGMpIDIwMTktMjAyMSBRdWFsY29tbSBJbm5vdmF0aW9uIENlbnRl
ciwgSW5jLiBBbGwgUmlnaHRzIFJlc2VydmVkLgorICogIENvcHlyaWdodChjKSAyMDE5LTIwMjMg
UXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIsIEluYy4gQWxsIFJpZ2h0cyBSZXNlcnZlZC4KICAq
CiAgKiAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRl
IGl0IGFuZC9vciBtb2RpZnkKICAqICBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5l
cmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQpAQCAtMTA3LDQgKzEwNyw0IEBAIERF
Rl9IRUxQRVJfMih2d2hpc3QxMjhxbSwgdm9pZCwgZW52LCBzMzIpCiBERUZfSEVMUEVSXzQocHJv
YmVfbm9zaHVmX2xvYWQsIHZvaWQsIGVudiwgaTMyLCBpbnQsIGludCkKIERFRl9IRUxQRVJfMihw
cm9iZV9wa3Rfc2NhbGFyX3N0b3JlX3MwLCB2b2lkLCBlbnYsIGludCkKIERFRl9IRUxQRVJfMihw
cm9iZV9odnhfc3RvcmVzLCB2b2lkLCBlbnYsIGludCkKLURFRl9IRUxQRVJfMyhwcm9iZV9wa3Rf
c2NhbGFyX2h2eF9zdG9yZXMsIHZvaWQsIGVudiwgaW50LCBpbnQpCitERUZfSEVMUEVSXzIocHJv
YmVfcGt0X3NjYWxhcl9odnhfc3RvcmVzLCB2b2lkLCBlbnYsIGludCkKZGlmZiAtLWdpdCBhL3Rh
cmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5oIGIvdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmgKaW5k
ZXggZGI4MzJiMGY4OC4uNGI5ZjIxYzQxZCAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFnb24vdHJh
bnNsYXRlLmgKKysrIGIvdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmgKQEAgLTE3OCw1ICsxNzgs
NiBAQCBGSUVMRChQUk9CRV9QS1RfU0NBTEFSX0hWWF9TVE9SRVMsIEhBU19TVDEsICAgICAgICAx
LCAxKQogRklFTEQoUFJPQkVfUEtUX1NDQUxBUl9IVlhfU1RPUkVTLCBIQVNfSFZYX1NUT1JFUywg
MiwgMSkKIEZJRUxEKFBST0JFX1BLVF9TQ0FMQVJfSFZYX1NUT1JFUywgUzBfSVNfUFJFRCwgICAg
IDMsIDEpCiBGSUVMRChQUk9CRV9QS1RfU0NBTEFSX0hWWF9TVE9SRVMsIFMxX0lTX1BSRUQsICAg
ICA0LCAxKQorRklFTEQoUFJPQkVfUEtUX1NDQUxBUl9IVlhfU1RPUkVTLCBNTVVfSURYLCAgICAg
ICAgNSwgMikKIAogI2VuZGlmCmRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9vcF9oZWxwZXIu
YyBiL3RhcmdldC9oZXhhZ29uL29wX2hlbHBlci5jCmluZGV4IGM5YTE1NjAzMGUuLjA5OWMxMTFh
OGMgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29uL29wX2hlbHBlci5jCisrKyBiL3RhcmdldC9o
ZXhhZ29uL29wX2hlbHBlci5jCkBAIC00ODgsOCArNDg4LDcgQEAgdm9pZCBIRUxQRVIocHJvYmVf
aHZ4X3N0b3JlcykoQ1BVSGV4YWdvblN0YXRlICplbnYsIGludCBtbXVfaWR4KQogICAgIH0KIH0K
IAotdm9pZCBIRUxQRVIocHJvYmVfcGt0X3NjYWxhcl9odnhfc3RvcmVzKShDUFVIZXhhZ29uU3Rh
dGUgKmVudiwgaW50IG1hc2ssCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGludCBtbXVfaWR4KQordm9pZCBIRUxQRVIocHJvYmVfcGt0X3NjYWxhcl9odnhfc3RvcmVz
KShDUFVIZXhhZ29uU3RhdGUgKmVudiwgaW50IG1hc2spCiB7CiAgICAgYm9vbCBoYXNfc3QwID0g
RklFTERfRVgzMihtYXNrLCBQUk9CRV9QS1RfU0NBTEFSX0hWWF9TVE9SRVMsIEhBU19TVDApOwog
ICAgIGJvb2wgaGFzX3N0MSA9IEZJRUxEX0VYMzIobWFzaywgUFJPQkVfUEtUX1NDQUxBUl9IVlhf
U1RPUkVTLCBIQVNfU1QxKTsKQEAgLTQ5Nyw2ICs0OTYsNyBAQCB2b2lkIEhFTFBFUihwcm9iZV9w
a3Rfc2NhbGFyX2h2eF9zdG9yZXMpKENQVUhleGFnb25TdGF0ZSAqZW52LCBpbnQgbWFzaywKICAg
ICAgICAgRklFTERfRVgzMihtYXNrLCBQUk9CRV9QS1RfU0NBTEFSX0hWWF9TVE9SRVMsIEhBU19I
VlhfU1RPUkVTKTsKICAgICBib29sIHMwX2lzX3ByZWQgPSBGSUVMRF9FWDMyKG1hc2ssIFBST0JF
X1BLVF9TQ0FMQVJfSFZYX1NUT1JFUywgUzBfSVNfUFJFRCk7CiAgICAgYm9vbCBzMV9pc19wcmVk
ID0gRklFTERfRVgzMihtYXNrLCBQUk9CRV9QS1RfU0NBTEFSX0hWWF9TVE9SRVMsIFMxX0lTX1BS
RUQpOworICAgIGludCBtbXVfaWR4ID0gRklFTERfRVgzMihtYXNrLCBQUk9CRV9QS1RfU0NBTEFS
X0hWWF9TVE9SRVMsIE1NVV9JRFgpOwogCiAgICAgaWYgKGhhc19zdDApIHsKICAgICAgICAgcHJv
YmVfc3RvcmUoZW52LCAwLCBtbXVfaWR4LCBzMF9pc19wcmVkKTsKZGlmZiAtLWdpdCBhL3Rhcmdl
dC9oZXhhZ29uL3RyYW5zbGF0ZS5jIGIvdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmMKaW5kZXgg
NjY1NDc2YWI0OC4uOGMwYmU1ZDZhMiAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFnb24vdHJhbnNs
YXRlLmMKKysrIGIvdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmMKQEAgLTgwMywxMyArODAzLDEx
IEBAIHN0YXRpYyB2b2lkIGdlbl9jb21taXRfcGFja2V0KERpc2FzQ29udGV4dCAqY3R4KQogICAg
ICAgICBnX2Fzc2VydCghaGFzX3N0b3JlX3MxICYmICFoYXNfaHZ4X3N0b3JlKTsKICAgICAgICAg
cHJvY2Vzc19kY3plcm9hKGN0eCk7CiAgICAgfSBlbHNlIGlmIChoYXNfaHZ4X3N0b3JlKSB7Ci0g
ICAgICAgIFRDR3YgbWVtX2lkeCA9IHRjZ19jb25zdGFudF90bChjdHgtPm1lbV9pZHgpOwotCiAg
ICAgICAgIGlmICghaGFzX3N0b3JlX3MwICYmICFoYXNfc3RvcmVfczEpIHsKKyAgICAgICAgICAg
IFRDR3YgbWVtX2lkeCA9IHRjZ19jb25zdGFudF90bChjdHgtPm1lbV9pZHgpOwogICAgICAgICAg
ICAgZ2VuX2hlbHBlcl9wcm9iZV9odnhfc3RvcmVzKGNwdV9lbnYsIG1lbV9pZHgpOwogICAgICAg
ICB9IGVsc2UgewogICAgICAgICAgICAgaW50IG1hc2sgPSAwOwotICAgICAgICAgICAgVENHdiBt
YXNrX3RjZ3Y7CiAKICAgICAgICAgICAgIGlmIChoYXNfc3RvcmVfczApIHsKICAgICAgICAgICAg
ICAgICBtYXNrID0KQEAgLTgzNCw4ICs4MzIsMTAgQEAgc3RhdGljIHZvaWQgZ2VuX2NvbW1pdF9w
YWNrZXQoRGlzYXNDb250ZXh0ICpjdHgpCiAgICAgICAgICAgICAgICAgICAgIEZJRUxEX0RQMzIo
bWFzaywgUFJPQkVfUEtUX1NDQUxBUl9IVlhfU1RPUkVTLAogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFMxX0lTX1BSRUQsIDEpOwogICAgICAgICAgICAgfQotICAgICAgICAgICAgbWFz
a190Y2d2ID0gdGNnX2NvbnN0YW50X3RsKG1hc2spOwotICAgICAgICAgICAgZ2VuX2hlbHBlcl9w
cm9iZV9wa3Rfc2NhbGFyX2h2eF9zdG9yZXMoY3B1X2VudiwgbWFza190Y2d2LCBtZW1faWR4KTsK
KyAgICAgICAgICAgIG1hc2sgPSBGSUVMRF9EUDMyKG1hc2ssIFBST0JFX1BLVF9TQ0FMQVJfSFZY
X1NUT1JFUywgTU1VX0lEWCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGN0eC0+bWVt
X2lkeCk7CisgICAgICAgICAgICBnZW5faGVscGVyX3Byb2JlX3BrdF9zY2FsYXJfaHZ4X3N0b3Jl
cyhjcHVfZW52LAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdGNnX2NvbnN0YW50X3RsKG1hc2spKTsKICAgICAgICAgfQogICAgIH0gZWxzZSBpZiAo
aGFzX3N0b3JlX3MwICYmIGhhc19zdG9yZV9zMSkgewogICAgICAgICAvKgotLSAKMi4yNS4xCgo=

