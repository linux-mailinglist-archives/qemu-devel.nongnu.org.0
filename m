Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1858B6EEBA9
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 02:47:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prTFn-0000PD-SQ; Tue, 25 Apr 2023 20:43:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1prTFf-00089a-Hm
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 20:43:19 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1prTF7-0006PY-Dc
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 20:43:19 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33Q002Oo032089; Wed, 26 Apr 2023 00:42:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=/d3FRWkTpZISIIVGbudFajzV3tIP1chZQxuxcU3x5qw=;
 b=VMIXbBYQAKDZ5wJLmeiaAz1lSmP8EygkQ5TLkej2f/FiWqDGivcsjzdJJx1whiYoEGY3
 YMhj9OJWYK3nw6doEy3p0Im+4Us82O++P6FIn+uGajs1QS9Z0EmvBCb+rWxo6GHNkBsk
 eGn328G1Wp2WgvAe8CqOAEUe25DwDK99bVEzNlOg4OWrb7xTRRnYDyia3VTvMwlSXpM3
 RsLXnFgw7YXEhJERg7AuBqQjS7x+5EMtLnr+vThuPFrU7Y9aiiBnSGK20nkbFjMTBLz4
 X5SPA5Fc4eQNXzWzZEW/lrM+X776Eaf3ydjeFHUtGv7C/bXXN2rikWs3DdjgjhBPf3AT vw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q6bdra8cq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 00:42:37 +0000
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 33Q0ga0V001938; 
 Wed, 26 Apr 2023 00:42:36 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 3q48nmd04n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 00:42:36 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33Q0dnjH031130;
 Wed, 26 Apr 2023 00:42:36 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 33Q0gZZg001926
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 00:42:36 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id A5B0A68D; Tue, 25 Apr 2023 17:42:35 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH 14/21] Hexagon (target/hexagon) Short-circuit more HVX single
 instruction packets
Date: Tue, 25 Apr 2023 17:42:29 -0700
Message-Id: <20230426004234.1319401-5-tsimpson@quicinc.com>
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
X-Proofpoint-GUID: bIvQ--4XNPv0M3uk8NK0NX8MCwf7FSlH
X-Proofpoint-ORIG-GUID: bIvQ--4XNPv0M3uk8NK0NX8MCwf7FSlH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-25_11,2023-04-25_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 mlxscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 mlxlogscore=999 spamscore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304260004
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=tsimpson@qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

VGhlIGdlbmVyYXRlZCBoZWxwZXJzIGZvciBIVlggdXNlIHBhc3MtYnktcmVmZXJlbmNlLCBzbyB0
aGV5IGNhbid0CnNob3J0LWNpcmN1aXQgd2hlbiB0aGUgcmVhZHMvd3JpdGVzIG92ZXJsYXAuICBU
aGUgaW5zdHJ1Y3Rpb25zIHdpdGgKb3ZlcnJpZGVzIGFyZSBPSyBiZWNhdXNlIHRoZXkgdXNlIHRj
Z19nZW5fZ3ZlY18qLgoKV2UgYWRkIGEgZmxhZyBoYXNfaHZ4X2hlbHBlciB0byBEaXNhc0NvbnRl
eHQgYW5kIGV4dGVuZCBnZW5fYW5hbHl6ZV9mdW5jcwp0byBzZXQgdGhlIGZsYWcgd2hlbiB0aGUg
aW5zdHJ1Y3Rpb24gaXMgYW4gSFZYIGluc3RydWN0aW9uIHdpdGggYQpnZW5lcmF0ZWQgaGVscGVy
LgoKV2UgYWRkIGFuIG92ZXJyaWRlIGZvciBWNl92Y29tYmluZSBzbyB0aGF0IGl0IGNhbiBiZSBz
aG9ydC1jaXJjdWl0ZWQKYWxvbmcgd2l0aCBhIHRlc3QgY2FzZSBpbiB0ZXN0cy90Y2cvaGV4YWdv
bi9odnhfbWlzYy5jCgpTaWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVp
Y2luYy5jb20+Ci0tLQogdGFyZ2V0L2hleGFnb24vZ2VuX3RjZ19odnguaCAgICAgICAgfCAyMyAr
KysrKysrKysrKysrKysrKysrKysrKwogdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmggICAgICAg
ICAgfCAgMSArCiB0YXJnZXQvaGV4YWdvbi90cmFuc2xhdGUuYyAgICAgICAgICB8IDE3ICsrKysr
KysrKysrKysrKy0tCiB0ZXN0cy90Y2cvaGV4YWdvbi9odnhfbWlzYy5jICAgICAgICB8IDIxICsr
KysrKysrKysrKysrKysrKysrKwogdGFyZ2V0L2hleGFnb24vZ2VuX2FuYWx5emVfZnVuY3MucHkg
fCAgNSArKysrKwogNSBmaWxlcyBjaGFuZ2VkLCA2NSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2dlbl90Y2dfaHZ4LmggYi90YXJnZXQv
aGV4YWdvbi9nZW5fdGNnX2h2eC5oCmluZGV4IGQ0YWVmZThlM2YuLjE5NjgwZDg1MDUgMTAwNjQ0
Ci0tLSBhL3RhcmdldC9oZXhhZ29uL2dlbl90Y2dfaHZ4LmgKKysrIGIvdGFyZ2V0L2hleGFnb24v
Z2VuX3RjZ19odnguaApAQCAtMTI4LDYgKzEyOCwyOSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgYXNz
ZXJ0X3ZoaXN0X3RtcChEaXNhc0NvbnRleHQgKmN0eCkKICAgICB0Y2dfZ2VuX2d2ZWNfbW92KE1P
XzY0LCBWZFZfb2ZmLCBWdVZfb2ZmLCBcCiAgICAgICAgICAgICAgICAgICAgICBzaXplb2YoTU1W
ZWN0b3IpLCBzaXplb2YoTU1WZWN0b3IpKQogCisvKgorICogVmVjdG9yIGNvbWJpbmUKKyAqCisg
KiBCZSBjYXJlZnVsIHRoYXQgdGhlIHNvdXJjZSBhbmQgZGVzdCBkb24ndCBvdmVybGFwCisgKi8K
KyNkZWZpbmUgZkdFTl9UQ0dfVjZfdmNvbWJpbmUoU0hPUlRDT0RFKSBcCisgICAgZG8geyBcCisg
ICAgICAgIGlmIChWZGRWX29mZiAhPSBWdVZfb2ZmKSB7IFwKKyAgICAgICAgICAgIHRjZ19nZW5f
Z3ZlY19tb3YoTU9fNjQsIFZkZFZfb2ZmLCBWdlZfb2ZmLCBcCisgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHNpemVvZihNTVZlY3RvciksIHNpemVvZihNTVZlY3RvcikpOyBcCisgICAgICAg
ICAgICB0Y2dfZ2VuX2d2ZWNfbW92KE1PXzY0LCBWZGRWX29mZiArIHNpemVvZihNTVZlY3Rvciks
IFZ1Vl9vZmYsIFwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKE1NVmVjdG9y
KSwgc2l6ZW9mKE1NVmVjdG9yKSk7IFwKKyAgICAgICAgfSBlbHNlIHsgXAorICAgICAgICAgICAg
aW50cHRyX3QgdG1wb2ZmID0gb2Zmc2V0b2YoQ1BVSGV4YWdvblN0YXRlLCB2dG1wKTsgXAorICAg
ICAgICAgICAgdGNnX2dlbl9ndmVjX21vdihNT182NCwgdG1wb2ZmLCBWdVZfb2ZmLCBcCisgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHNpemVvZihNTVZlY3RvciksIHNpemVvZihNTVZlY3Rv
cikpOyBcCisgICAgICAgICAgICB0Y2dfZ2VuX2d2ZWNfbW92KE1PXzY0LCBWZGRWX29mZiwgVnZW
X29mZiwgXAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplb2YoTU1WZWN0b3IpLCBz
aXplb2YoTU1WZWN0b3IpKTsgXAorICAgICAgICAgICAgdGNnX2dlbl9ndmVjX21vdihNT182NCwg
VmRkVl9vZmYgKyBzaXplb2YoTU1WZWN0b3IpLCB0bXBvZmYsIFwKKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgc2l6ZW9mKE1NVmVjdG9yKSwgc2l6ZW9mKE1NVmVjdG9yKSk7IFwKKyAgICAg
ICAgfSBcCisgICAgfSB3aGlsZSAoMCkKKwogLyogVmVjdG9yIGNvbmRpdGlvbmFsIG1vdmUgKi8K
ICNkZWZpbmUgZkdFTl9UQ0dfVkVDX0NNT1YoUFJFRCkgXAogICAgIGRvIHsgXApkaWZmIC0tZ2l0
IGEvdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmggYi90YXJnZXQvaGV4YWdvbi90cmFuc2xhdGUu
aAppbmRleCAzZjZmZDM0NTJjLi4yNmJjYWUwMzk1IDEwMDY0NAotLS0gYS90YXJnZXQvaGV4YWdv
bi90cmFuc2xhdGUuaAorKysgYi90YXJnZXQvaGV4YWdvbi90cmFuc2xhdGUuaApAQCAtNjgsNiAr
NjgsNyBAQCB0eXBlZGVmIHN0cnVjdCBEaXNhc0NvbnRleHQgewogICAgIGJvb2wgaXNfdGlnaHRf
bG9vcDsKICAgICBib29sIG5lZWRfcGt0X2hhc19zdG9yZV9zMTsKICAgICBib29sIHNob3J0X2Np
cmN1aXQ7CisgICAgYm9vbCBoYXNfaHZ4X2hlbHBlcjsKIH0gRGlzYXNDb250ZXh0OwogCiBzdGF0
aWMgaW5saW5lIHZvaWQgY3R4X2xvZ19wcmVkX3dyaXRlKERpc2FzQ29udGV4dCAqY3R4LCBpbnQg
cG51bSkKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5jIGIvdGFyZ2V0L2hl
eGFnb24vdHJhbnNsYXRlLmMKaW5kZXggOGUwMjRiMmNkMi4uMjY3ZTY0NTNhYyAxMDA2NDQKLS0t
IGEvdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmMKKysrIGIvdGFyZ2V0L2hleGFnb24vdHJhbnNs
YXRlLmMKQEAgLTM3OCw4ICszNzgsMjAgQEAgc3RhdGljIGJvb2wgbmVlZF9jb21taXQoRGlzYXND
b250ZXh0ICpjdHgpCiAgICAgICAgIHJldHVybiB0cnVlOwogICAgIH0KIAotICAgIGlmIChwa3Qt
Pm51bV9pbnNucyA9PSAxICYmICFwa3QtPnBrdF9oYXNfaHZ4KSB7Ci0gICAgICAgIHJldHVybiBm
YWxzZTsKKyAgICBpZiAocGt0LT5udW1faW5zbnMgPT0gMSkgeworICAgICAgICBpZiAocGt0LT5w
a3RfaGFzX2h2eCkgeworICAgICAgICAgICAgLyoKKyAgICAgICAgICAgICAqIFRoZSBIVlggaW5z
dHJ1Y3Rpb25zIHdpdGggZ2VuZXJhdGVkIGhlbHBlcnMgdXNlCisgICAgICAgICAgICAgKiBwYXNz
LWJ5LXJlZmVyZW5jZSwgc28gdGhleSBuZWVkIHRoZSByZWFkL3dyaXRlIG92ZXJsYXAKKyAgICAg
ICAgICAgICAqIGNoZWNrIGJlbG93LgorICAgICAgICAgICAgICogVGhlIEhWWCBpbnN0cnVjdGlv
bnMgd2l0aCBvdmVycmlkZXMgYXJlIE9LLgorICAgICAgICAgICAgICovCisgICAgICAgICAgICBp
ZiAoIWN0eC0+aGFzX2h2eF9oZWxwZXIpIHsKKyAgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7
CisgICAgICAgICAgICB9CisgICAgICAgIH0gZWxzZSB7CisgICAgICAgICAgICByZXR1cm4gZmFs
c2U7CisgICAgICAgIH0KICAgICB9CiAKICAgICAvKiBDaGVjayBmb3Igb3ZlcmxhcCBiZXR3ZWVu
IHJlZ2lzdGVyIHJlYWRzIGFuZCB3cml0ZXMgKi8KQEAgLTQ1NCw2ICs0NjYsNyBAQCBzdGF0aWMg
dm9pZCBhbmFseXplX3BhY2tldChEaXNhc0NvbnRleHQgKmN0eCkKIHsKICAgICBQYWNrZXQgKnBr
dCA9IGN0eC0+cGt0OwogICAgIGN0eC0+bmVlZF9wa3RfaGFzX3N0b3JlX3MxID0gZmFsc2U7Cisg
ICAgY3R4LT5oYXNfaHZ4X2hlbHBlciA9IGZhbHNlOwogICAgIGZvciAoaW50IGkgPSAwOyBpIDwg
cGt0LT5udW1faW5zbnM7IGkrKykgewogICAgICAgICBJbnNuICppbnNuID0gJnBrdC0+aW5zbltp
XTsKICAgICAgICAgY3R4LT5pbnNuID0gaW5zbjsKZGlmZiAtLWdpdCBhL3Rlc3RzL3RjZy9oZXhh
Z29uL2h2eF9taXNjLmMgYi90ZXN0cy90Y2cvaGV4YWdvbi9odnhfbWlzYy5jCmluZGV4IGQwZTY0
ZTAzNWYuLmM4OWZlMDI1M2QgMTAwNjQ0Ci0tLSBhL3Rlc3RzL3RjZy9oZXhhZ29uL2h2eF9taXNj
LmMKKysrIGIvdGVzdHMvdGNnL2hleGFnb24vaHZ4X21pc2MuYwpAQCAtNDU0LDYgKzQ1NCwyNSBA
QCBzdGF0aWMgdm9pZCB0ZXN0X2xvYWRfY3VyX3ByZWRpY2F0ZWQodm9pZCkKICAgICBjaGVja19v
dXRwdXRfdyhfX0xJTkVfXywgQlVGU0laRSk7CiB9CiAKK3N0YXRpYyB2b2lkIHRlc3RfdmNvbWJp
bmUodm9pZCkKK3sKKyAgICBmb3IgKGludCBpID0gMDsgaSA8IEJVRlNJWkUgLyAyOyBpKyspIHsK
KyAgICAgICAgYXNtIHZvbGF0aWxlKCJ2MiA9IHZzcGxhdCglMClcblx0IgorICAgICAgICAgICAg
ICAgICAgICAgInYzID0gdnNwbGF0KCUxKVxuXHQiCisgICAgICAgICAgICAgICAgICAgICAidjM6
MiA9IHZjb21iaW5lKHYyLCB2Mylcblx0IgorICAgICAgICAgICAgICAgICAgICAgInZtZW0oJTIr
IzApID0gdjJcblx0IgorICAgICAgICAgICAgICAgICAgICAgInZtZW0oJTIrIzEpID0gdjNcblx0
IgorICAgICAgICAgICAgICAgICAgICAgOgorICAgICAgICAgICAgICAgICAgICAgOiAiciIoMiAq
IGkpLCAiciIoMiAqIGkgKyAxKSwgInIiKCZvdXRwdXRbMiAqIGldKQorICAgICAgICAgICAgICAg
ICAgICAgOiAidjIiLCAidjMiLCAibWVtb3J5Iik7CisgICAgICAgIGZvciAoaW50IGogPSAwOyBq
IDwgTUFYX1ZFQ19TSVpFX0JZVEVTIC8gNDsgaisrKSB7CisgICAgICAgICAgICBleHBlY3RbMiAq
IGldLndbal0gPSAyICogaSArIDE7CisgICAgICAgICAgICBleHBlY3RbMiAqIGkgKyAxXS53W2pd
ID0gMiAqIGk7CisgICAgICAgIH0KKyAgICB9CisgICAgY2hlY2tfb3V0cHV0X3coX19MSU5FX18s
IEJVRlNJWkUpOworfQorCiBpbnQgbWFpbigpCiB7CiAgICAgaW5pdF9idWZmZXJzKCk7CkBAIC00
OTQsNiArNTEzLDggQEAgaW50IG1haW4oKQogICAgIHRlc3RfbG9hZF90bXBfcHJlZGljYXRlZCgp
OwogICAgIHRlc3RfbG9hZF9jdXJfcHJlZGljYXRlZCgpOwogCisgICAgdGVzdF92Y29tYmluZSgp
OworCiAgICAgcHV0cyhlcnIgPyAiRkFJTCIgOiAiUEFTUyIpOwogICAgIHJldHVybiBlcnIgPyAx
IDogMDsKIH0KZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2dlbl9hbmFseXplX2Z1bmNzLnB5
IGIvdGFyZ2V0L2hleGFnb24vZ2VuX2FuYWx5emVfZnVuY3MucHkKaW5kZXggODZhZWM1YWM0Yi4u
MzZkYTY2OTQ1MCAxMDA3NTUKLS0tIGEvdGFyZ2V0L2hleGFnb24vZ2VuX2FuYWx5emVfZnVuY3Mu
cHkKKysrIGIvdGFyZ2V0L2hleGFnb24vZ2VuX2FuYWx5emVfZnVuY3MucHkKQEAgLTIxMiw2ICsy
MTIsMTEgQEAgZGVmIGdlbl9hbmFseXplX2Z1bmMoZiwgdGFnLCByZWdzLCBpbW1zKToKICAgICBp
ZiBoYXNfZ2VuZXJhdGVkX2hlbHBlciBhbmQgIkFfU0NBTEFSX0xPQUQiIGluIGhleF9jb21tb24u
YXR0cmliZGljdFt0YWddOgogICAgICAgICBmLndyaXRlKCIgICAgY3R4LT5uZWVkX3BrdF9oYXNf
c3RvcmVfczEgPSB0cnVlO1xuIikKIAorICAgICMjIE1hcmsgSFZYIGluc3RydWN0aW9ucyB3aXRo
IGdlbmVyYXRlZCBoZWxwZXJzCisgICAgaWYgKGhhc19nZW5lcmF0ZWRfaGVscGVyIGFuZAorICAg
ICAgICAiQV9DVkkiIGluIGhleF9jb21tb24uYXR0cmliZGljdFt0YWddKToKKyAgICAgICAgZi53
cml0ZSgiICAgIGN0eC0+aGFzX2h2eF9oZWxwZXIgPSB0cnVlO1xuIikKKwogICAgIGYud3JpdGUo
In1cblxuIikKIAogCi0tIAoyLjI1LjEKCg==

