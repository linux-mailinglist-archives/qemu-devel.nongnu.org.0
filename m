Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A10516F0EBB
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 01:07:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psAbN-0001mU-6O; Thu, 27 Apr 2023 19:00:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1psAb9-0001kD-Tm
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 19:00:23 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1psAb5-0001M5-2x
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 19:00:23 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33RML8Pg011240; Thu, 27 Apr 2023 23:00:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=h8od1REsnSJUd5qVePV6upZNcaVbMesxdRLAxjcfhW0=;
 b=F25KVVjLVULf9qXmb15lQSVFK2VAKVS8Sz6+YU5jo4qvBFWc9+9obmxzxcbeAJHNeRDg
 s0w8MtiZpEvBegx568Pa4PVRiBJZlaePG5HhNHEJWxSPqCUlNppxIAk4EcsBwoHD8FZZ
 BR0tn0K7IRE8G0T4vMNbmYRRdDjRUSzGOY4O0/bTHXuvkg6roQr87c9EBiVlHgNs7QXw
 YYcen4lO4+cLcVkyzyWkfXpNY76Osvycb/Q3x+2cvAZWYkerzHl2/iErAKpOcQIQvgCw
 r+eV49hgPKkKWlZOr35+8G8FF8FOx/F5cHX5+bszjaSRj9DFBm3+A+B6V6x4H/muDphm dw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q7m4ya57t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 23:00:16 +0000
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 33RMx7uG024632; 
 Thu, 27 Apr 2023 23:00:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 3q48nmt3y2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 23:00:16 +0000
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33RN0EDU026453;
 Thu, 27 Apr 2023 23:00:15 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 33RN0EnM026431
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 23:00:14 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id C9CAE6A9; Thu, 27 Apr 2023 16:00:13 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH v2 09/21] Hexagon (target/hexagon) Don't overlap dest writes
 with source reads
Date: Thu, 27 Apr 2023 16:00:00 -0700
Message-Id: <20230427230012.3800327-10-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230427230012.3800327-1-tsimpson@quicinc.com>
References: <20230427230012.3800327-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: PHkaqFuaZakkPlnyqjd7HWktnHltO-LZ
X-Proofpoint-ORIG-GUID: PHkaqFuaZakkPlnyqjd7HWktnHltO-LZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-27_09,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 mlxlogscore=921
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304270203
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=tsimpson@qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

V2hlbiBnZW5lcmF0aW5nIFRDRywgbWFrZSBzdXJlIHdlIGhhdmUgcmVhZCBhbGwgdGhlIG9wZXJh
bmQgcmVnaXN0ZXJzCmJlZm9yZSB3cml0aW5nIHRvIHRoZSBkZXN0aW5hdGlvbiByZWdpc3RlcnMu
CgpUaGlzIGlzIGEgcHJlcmVxdWVzaXRlIGZvciBzaG9ydC1jaXJjdWl0aW5nIHdoZXJlIHRoZSBz
b3VyY2UgYW5kIGRlc3QKb3BlcmFuZHMgY291bGQgYmUgdGhlIHNhbWUuCgpTaWduZWQtb2ZmLWJ5
OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+ClJldmlld2VkLWJ5OiBSaWNo
YXJkIEhlbmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4KLS0tCiB0YXJnZXQv
aGV4YWdvbi9nZW5wdHIuYyB8IDQ1ICsrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0t
LS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vZ2VucHRyLmMgYi90YXJnZXQvaGV4YWdvbi9n
ZW5wdHIuYwppbmRleCAyMDE0YTgwNjhhLi5hZmY5ZmZlMzdiIDEwMDY0NAotLS0gYS90YXJnZXQv
aGV4YWdvbi9nZW5wdHIuYworKysgYi90YXJnZXQvaGV4YWdvbi9nZW5wdHIuYwpAQCAtOTcxLDYg
Kzk3MSw3IEBAIHN0YXRpYyB2b2lkIGdlbl9jbXBpX2p1bXBudihEaXNhc0NvbnRleHQgKmN0eCwK
IC8qIFNoaWZ0IGxlZnQgd2l0aCBzYXR1cmF0aW9uICovCiBzdGF0aWMgdm9pZCBnZW5fc2hsX3Nh
dChEaXNhc0NvbnRleHQgKmN0eCwgVENHdiBkc3QsIFRDR3Ygc3JjLCBUQ0d2IHNoaWZ0X2FtdCkK
IHsKKyAgICBUQ0d2IHRtcCA9IHRjZ190ZW1wX25ldygpOyAgICAvKiBJbiBjYXNlIGRzdCA9PSBz
cmMgKi8KICAgICBUQ0d2IHVzciA9IGdldF9yZXN1bHRfZ3ByKGN0eCwgSEVYX1JFR19VU1IpOwog
ICAgIFRDR3Ygc2gzMiA9IHRjZ190ZW1wX25ldygpOwogICAgIFRDR3YgZHN0X3NhciA9IHRjZ190
ZW1wX25ldygpOwpAQCAtOTk1LDE3ICs5OTYsMTcgQEAgc3RhdGljIHZvaWQgZ2VuX3NobF9zYXQo
RGlzYXNDb250ZXh0ICpjdHgsIFRDR3YgZHN0LCBUQ0d2IHNyYywgVENHdiBzaGlmdF9hbXQpCiAg
ICAgICovCiAKICAgICB0Y2dfZ2VuX2FuZGlfdGwoc2gzMiwgc2hpZnRfYW10LCAzMSk7Ci0gICAg
dGNnX2dlbl9tb3Zjb25kX3RsKFRDR19DT05EX0VRLCBkc3QsIHNoMzIsIHNoaWZ0X2FtdCwKKyAg
ICB0Y2dfZ2VuX21vdmNvbmRfdGwoVENHX0NPTkRfRVEsIHRtcCwgc2gzMiwgc2hpZnRfYW10LAog
ICAgICAgICAgICAgICAgICAgICAgICBzcmMsIHRjZ19jb25zdGFudF90bCgwKSk7Ci0gICAgdGNn
X2dlbl9zaGxfdGwoZHN0LCBkc3QsIHNoMzIpOwotICAgIHRjZ19nZW5fc2FyX3RsKGRzdF9zYXIs
IGRzdCwgc2gzMik7CisgICAgdGNnX2dlbl9zaGxfdGwodG1wLCB0bXAsIHNoMzIpOworICAgIHRj
Z19nZW5fc2FyX3RsKGRzdF9zYXIsIHRtcCwgc2gzMik7CiAgICAgdGNnX2dlbl9tb3Zjb25kX3Rs
KFRDR19DT05EX0xULCBzYXR2YWwsIHNyYywgdGNnX2NvbnN0YW50X3RsKDApLCBtaW4sIG1heCk7
CiAKICAgICB0Y2dfZ2VuX3NldGNvbmRfdGwoVENHX0NPTkRfTkUsIG92ZiwgZHN0X3Nhciwgc3Jj
KTsKICAgICB0Y2dfZ2VuX3NobGlfdGwob3ZmLCBvdmYsIHJlZ19maWVsZF9pbmZvW1VTUl9PVkZd
Lm9mZnNldCk7CiAgICAgdGNnX2dlbl9vcl90bCh1c3IsIHVzciwgb3ZmKTsKIAotICAgIHRjZ19n
ZW5fbW92Y29uZF90bChUQ0dfQ09ORF9FUSwgZHN0LCBkc3Rfc2FyLCBzcmMsIGRzdCwgc2F0dmFs
KTsKKyAgICB0Y2dfZ2VuX21vdmNvbmRfdGwoVENHX0NPTkRfRVEsIGRzdCwgZHN0X3Nhciwgc3Jj
LCB0bXAsIHNhdHZhbCk7CiB9CiAKIHN0YXRpYyB2b2lkIGdlbl9zYXIoVENHdiBkc3QsIFRDR3Yg
c3JjLCBUQ0d2IHNoaWZ0X2FtdCkKQEAgLTEyMjgsMjIgKzEyMjksMjggQEAgdm9pZCBnZW5fc2F0
X2kzMihUQ0d2IGRlc3QsIFRDR3Ygc291cmNlLCBpbnQgd2lkdGgpCiAKIHZvaWQgZ2VuX3NhdF9p
MzJfb3ZmbChUQ0d2IG92ZmwsIFRDR3YgZGVzdCwgVENHdiBzb3VyY2UsIGludCB3aWR0aCkKIHsK
LSAgICBnZW5fc2F0X2kzMihkZXN0LCBzb3VyY2UsIHdpZHRoKTsKLSAgICB0Y2dfZ2VuX3NldGNv
bmRfdGwoVENHX0NPTkRfTkUsIG92ZmwsIHNvdXJjZSwgZGVzdCk7CisgICAgVENHdiB0bXAgPSB0
Y2dfdGVtcF9uZXcoKTsgICAgLyogSW4gY2FzZSBkZXN0ID09IHNvdXJjZSAqLworICAgIGdlbl9z
YXRfaTMyKHRtcCwgc291cmNlLCB3aWR0aCk7CisgICAgdGNnX2dlbl9zZXRjb25kX3RsKFRDR19D
T05EX05FLCBvdmZsLCBzb3VyY2UsIHRtcCk7CisgICAgdGNnX2dlbl9tb3ZfdGwoZGVzdCwgdG1w
KTsKIH0KIAogdm9pZCBnZW5fc2F0dV9pMzIoVENHdiBkZXN0LCBUQ0d2IHNvdXJjZSwgaW50IHdp
ZHRoKQogeworICAgIFRDR3YgdG1wID0gdGNnX3RlbXBfbmV3KCk7ICAgIC8qIEluIGNhc2UgZGVz
dCA9PSBzb3VyY2UgKi8KICAgICBUQ0d2IG1heF92YWwgPSB0Y2dfY29uc3RhbnRfdGwoKDEgPDwg
d2lkdGgpIC0gMSk7CiAgICAgVENHdiB6ZXJvID0gdGNnX2NvbnN0YW50X3RsKDApOwotICAgIHRj
Z19nZW5fbW92Y29uZF90bChUQ0dfQ09ORF9HVFUsIGRlc3QsIHNvdXJjZSwgbWF4X3ZhbCwgbWF4
X3ZhbCwgc291cmNlKTsKLSAgICB0Y2dfZ2VuX21vdmNvbmRfdGwoVENHX0NPTkRfTFQsIGRlc3Qs
IHNvdXJjZSwgemVybywgemVybywgZGVzdCk7CisgICAgdGNnX2dlbl9tb3Zjb25kX3RsKFRDR19D
T05EX0dUVSwgdG1wLCBzb3VyY2UsIG1heF92YWwsIG1heF92YWwsIHNvdXJjZSk7CisgICAgdGNn
X2dlbl9tb3Zjb25kX3RsKFRDR19DT05EX0xULCB0bXAsIHNvdXJjZSwgemVybywgemVybywgdG1w
KTsKKyAgICB0Y2dfZ2VuX21vdl90bChkZXN0LCB0bXApOwogfQogCiB2b2lkIGdlbl9zYXR1X2kz
Ml9vdmZsKFRDR3Ygb3ZmbCwgVENHdiBkZXN0LCBUQ0d2IHNvdXJjZSwgaW50IHdpZHRoKQogewot
ICAgIGdlbl9zYXR1X2kzMihkZXN0LCBzb3VyY2UsIHdpZHRoKTsKLSAgICB0Y2dfZ2VuX3NldGNv
bmRfdGwoVENHX0NPTkRfTkUsIG92ZmwsIHNvdXJjZSwgZGVzdCk7CisgICAgVENHdiB0bXAgPSB0
Y2dfdGVtcF9uZXcoKTsgICAgLyogSW4gY2FzZSBkZXN0ID09IHNvdXJjZSAqLworICAgIGdlbl9z
YXR1X2kzMih0bXAsIHNvdXJjZSwgd2lkdGgpOworICAgIHRjZ19nZW5fc2V0Y29uZF90bChUQ0df
Q09ORF9ORSwgb3ZmbCwgc291cmNlLCB0bXApOworICAgIHRjZ19nZW5fbW92X3RsKGRlc3QsIHRt
cCk7CiB9CiAKIHZvaWQgZ2VuX3NhdF9pNjQoVENHdl9pNjQgZGVzdCwgVENHdl9pNjQgc291cmNl
LCBpbnQgd2lkdGgpCkBAIC0xMjU2LDI3ICsxMjYzLDMzIEBAIHZvaWQgZ2VuX3NhdF9pNjQoVENH
dl9pNjQgZGVzdCwgVENHdl9pNjQgc291cmNlLCBpbnQgd2lkdGgpCiAKIHZvaWQgZ2VuX3NhdF9p
NjRfb3ZmbChUQ0d2IG92ZmwsIFRDR3ZfaTY0IGRlc3QsIFRDR3ZfaTY0IHNvdXJjZSwgaW50IHdp
ZHRoKQogeworICAgIFRDR3ZfaTY0IHRtcCA9IHRjZ190ZW1wX25ld19pNjQoKTsgLyogSW4gY2Fz
ZSBkZXN0ID09IHNvdXJjZSAqLwogICAgIFRDR3ZfaTY0IG92ZmxfNjQ7Ci0gICAgZ2VuX3NhdF9p
NjQoZGVzdCwgc291cmNlLCB3aWR0aCk7CisgICAgZ2VuX3NhdF9pNjQodG1wLCBzb3VyY2UsIHdp
ZHRoKTsKICAgICBvdmZsXzY0ID0gdGNnX3RlbXBfbmV3X2k2NCgpOwotICAgIHRjZ19nZW5fc2V0
Y29uZF9pNjQoVENHX0NPTkRfTkUsIG92ZmxfNjQsIGRlc3QsIHNvdXJjZSk7CisgICAgdGNnX2dl
bl9zZXRjb25kX2k2NChUQ0dfQ09ORF9ORSwgb3ZmbF82NCwgdG1wLCBzb3VyY2UpOworICAgIHRj
Z19nZW5fbW92X2k2NChkZXN0LCB0bXApOwogICAgIHRjZ19nZW5fdHJ1bmNfaTY0X3RsKG92Zmws
IG92ZmxfNjQpOwogfQogCiB2b2lkIGdlbl9zYXR1X2k2NChUQ0d2X2k2NCBkZXN0LCBUQ0d2X2k2
NCBzb3VyY2UsIGludCB3aWR0aCkKIHsKKyAgICBUQ0d2X2k2NCB0bXAgPSB0Y2dfdGVtcF9uZXdf
aTY0KCk7ICAgIC8qIEluIGNhc2UgZGVzdCA9PSBzb3VyY2UgKi8KICAgICBUQ0d2X2k2NCBtYXhf
dmFsID0gdGNnX2NvbnN0YW50X2k2NCgoMUxMIDw8IHdpZHRoKSAtIDFMTCk7CiAgICAgVENHdl9p
NjQgemVybyA9IHRjZ19jb25zdGFudF9pNjQoMCk7Ci0gICAgdGNnX2dlbl9tb3Zjb25kX2k2NChU
Q0dfQ09ORF9HVFUsIGRlc3QsIHNvdXJjZSwgbWF4X3ZhbCwgbWF4X3ZhbCwgc291cmNlKTsKLSAg
ICB0Y2dfZ2VuX21vdmNvbmRfaTY0KFRDR19DT05EX0xULCBkZXN0LCBzb3VyY2UsIHplcm8sIHpl
cm8sIGRlc3QpOworICAgIHRjZ19nZW5fbW92Y29uZF9pNjQoVENHX0NPTkRfR1RVLCB0bXAsIHNv
dXJjZSwgbWF4X3ZhbCwgbWF4X3ZhbCwgc291cmNlKTsKKyAgICB0Y2dfZ2VuX21vdmNvbmRfaTY0
KFRDR19DT05EX0xULCB0bXAsIHNvdXJjZSwgemVybywgemVybywgdG1wKTsKKyAgICB0Y2dfZ2Vu
X21vdl9pNjQoZGVzdCwgdG1wKTsKIH0KIAogdm9pZCBnZW5fc2F0dV9pNjRfb3ZmbChUQ0d2IG92
ZmwsIFRDR3ZfaTY0IGRlc3QsIFRDR3ZfaTY0IHNvdXJjZSwgaW50IHdpZHRoKQogeworICAgIFRD
R3ZfaTY0IHRtcCA9IHRjZ190ZW1wX25ld19pNjQoKTsgICAgLyogSW4gY2FzZSBkZXN0ID09IHNv
dXJjZSAqLwogICAgIFRDR3ZfaTY0IG92ZmxfNjQ7Ci0gICAgZ2VuX3NhdHVfaTY0KGRlc3QsIHNv
dXJjZSwgd2lkdGgpOworICAgIGdlbl9zYXR1X2k2NCh0bXAsIHNvdXJjZSwgd2lkdGgpOwogICAg
IG92ZmxfNjQgPSB0Y2dfdGVtcF9uZXdfaTY0KCk7Ci0gICAgdGNnX2dlbl9zZXRjb25kX2k2NChU
Q0dfQ09ORF9ORSwgb3ZmbF82NCwgZGVzdCwgc291cmNlKTsKKyAgICB0Y2dfZ2VuX3NldGNvbmRf
aTY0KFRDR19DT05EX05FLCBvdmZsXzY0LCB0bXAsIHNvdXJjZSk7CisgICAgdGNnX2dlbl9tb3Zf
aTY0KGRlc3QsIHRtcCk7CiAgICAgdGNnX2dlbl90cnVuY19pNjRfdGwob3ZmbCwgb3ZmbF82NCk7
CiB9CiAKLS0gCjIuMjUuMQoK

