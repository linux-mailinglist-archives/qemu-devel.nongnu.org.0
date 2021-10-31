Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF37F440F98
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Oct 2021 17:57:00 +0100 (CET)
Received: from localhost ([::1]:52744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhE8h-0001fT-S3
	for lists+qemu-devel@lfdr.de; Sun, 31 Oct 2021 12:56:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mhDvu-0001wP-8w
 for qemu-devel@nongnu.org; Sun, 31 Oct 2021 12:43:46 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:31506)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mhDvp-0008Ap-RK
 for qemu-devel@nongnu.org; Sun, 31 Oct 2021 12:43:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1635698621; x=1667234621;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xroskLBBDSJOa4Pu8DXfVck1qbes8XJoZRGHPWIu/E4=;
 b=yXY3gNRkGNlO81p3bvNRkgsrAFG6eRusEkPlVnAWrb5HVfK7DQ5AYPpD
 X4ZSY40UvM+046Rw8358YDui07nZC0IavP46eH5+wLM2aOj0Un8m3uBDP
 Upn+/Jf8l25OaTWjrTKljKWpenLyQI/qG2rKycXno/4jz4r9ZqhlTx5CK 4=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 31 Oct 2021 09:43:30 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg04-sd.qualcomm.com with ESMTP; 31 Oct 2021 09:43:30 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 64FD62BD5; Sun, 31 Oct 2021 11:43:29 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/30] Hexagon HVX (target/hexagon) instruction utility
 functions
Date: Sun, 31 Oct 2021 11:42:49 -0500
Message-Id: <1635698589-31849-11-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635698589-31849-1-git-send-email-tsimpson@quicinc.com>
References: <1635698589-31849-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-02.qualcomm.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, tsimpson@quicinc.com,
 richard.henderson@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnVuY3Rpb25zIHRvIHN1cHBvcnQgc2NhdHRlci9nYXRoZXIKQWRkIG5ldyBmaWxlIHRvIHRhcmdl
dC9oZXhhZ29uL21lc29uLmJ1aWxkCgpSZXZpZXdlZC1ieTogUmljaGFyZCBIZW5kZXJzb24gPHJp
Y2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+ClNpZ25lZC1vZmYtYnk6IFRheWxvciBTaW1wc29u
IDx0c2ltcHNvbkBxdWljaW5jLmNvbT4KLS0tCiB0YXJnZXQvaGV4YWdvbi9tbXZlYy9zeXN0ZW1f
ZXh0X21tdmVjLmggfCAyNSArKysrKysrKysrKysrKysrKysKIHRhcmdldC9oZXhhZ29uL21tdmVj
L3N5c3RlbV9leHRfbW12ZWMuYyB8IDQ3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KwogdGFyZ2V0L2hleGFnb24vbWVzb24uYnVpbGQgICAgICAgICAgICAgIHwgIDEgKwogMyBmaWxl
cyBjaGFuZ2VkLCA3MyBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgdGFyZ2V0L2hl
eGFnb24vbW12ZWMvc3lzdGVtX2V4dF9tbXZlYy5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgdGFyZ2V0
L2hleGFnb24vbW12ZWMvc3lzdGVtX2V4dF9tbXZlYy5jCgpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hl
eGFnb24vbW12ZWMvc3lzdGVtX2V4dF9tbXZlYy5oIGIvdGFyZ2V0L2hleGFnb24vbW12ZWMvc3lz
dGVtX2V4dF9tbXZlYy5oCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAuLmJjZWZi
ZmYKLS0tIC9kZXYvbnVsbAorKysgYi90YXJnZXQvaGV4YWdvbi9tbXZlYy9zeXN0ZW1fZXh0X21t
dmVjLmgKQEAgLTAsMCArMSwyNSBAQAorLyoKKyAqICBDb3B5cmlnaHQoYykgMjAxOS0yMDIxIFF1
YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIEFsbCBSaWdodHMgUmVzZXJ2ZWQuCisgKgor
ICogIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBp
dCBhbmQvb3IgbW9kaWZ5CisgKiAgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJh
bCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkKKyAqICB0aGUgRnJlZSBTb2Z0d2FyZSBG
b3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyIG9mIHRoZSBMaWNlbnNlLCBvcgorICogIChhdCB5
b3VyIG9wdGlvbikgYW55IGxhdGVyIHZlcnNpb24uCisgKgorICogIFRoaXMgcHJvZ3JhbSBpcyBk
aXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAorICogIGJ1dCBX
SVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9m
CisgKiAgTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NF
LiAgU2VlIHRoZQorICogIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFp
bHMuCisgKgorICogIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBH
ZW5lcmFsIFB1YmxpYyBMaWNlbnNlCisgKiAgYWxvbmcgd2l0aCB0aGlzIHByb2dyYW07IGlmIG5v
dCwgc2VlIDxodHRwOi8vd3d3LmdudS5vcmcvbGljZW5zZXMvPi4KKyAqLworCisjaWZuZGVmIEhF
WEFHT05fU1lTVEVNX0VYVF9NTVZFQ19ICisjZGVmaW5lIEhFWEFHT05fU1lTVEVNX0VYVF9NTVZF
Q19ICisKK3ZvaWQgbWVtX2dhdGhlcl9zdG9yZShDUFVIZXhhZ29uU3RhdGUgKmVudiwgdGFyZ2V0
X3Vsb25nIHZhZGRyLCBpbnQgc2xvdCk7Cit2b2lkIG1lbV92ZWN0b3Jfc2NhdHRlcl9pbml0KENQ
VUhleGFnb25TdGF0ZSAqZW52KTsKK3ZvaWQgbWVtX3ZlY3Rvcl9nYXRoZXJfaW5pdChDUFVIZXhh
Z29uU3RhdGUgKmVudik7CisKKyNlbmRpZgpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vbW12
ZWMvc3lzdGVtX2V4dF9tbXZlYy5jIGIvdGFyZ2V0L2hleGFnb24vbW12ZWMvc3lzdGVtX2V4dF9t
bXZlYy5jCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAuLjgzNTFmMmMKLS0tIC9k
ZXYvbnVsbAorKysgYi90YXJnZXQvaGV4YWdvbi9tbXZlYy9zeXN0ZW1fZXh0X21tdmVjLmMKQEAg
LTAsMCArMSw0NyBAQAorLyoKKyAqICBDb3B5cmlnaHQoYykgMjAxOS0yMDIxIFF1YWxjb21tIElu
bm92YXRpb24gQ2VudGVyLCBJbmMuIEFsbCBSaWdodHMgUmVzZXJ2ZWQuCisgKgorICogIFRoaXMg
cHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3Ig
bW9kaWZ5CisgKiAgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMg
TGljZW5zZSBhcyBwdWJsaXNoZWQgYnkKKyAqICB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9u
OyBlaXRoZXIgdmVyc2lvbiAyIG9mIHRoZSBMaWNlbnNlLCBvcgorICogIChhdCB5b3VyIG9wdGlv
bikgYW55IGxhdGVyIHZlcnNpb24uCisgKgorICogIFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRl
ZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAorICogIGJ1dCBXSVRIT1VUIEFO
WSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mCisgKiAgTUVS
Q0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRo
ZQorICogIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCisgKgor
ICogIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1
YmxpYyBMaWNlbnNlCisgKiAgYWxvbmcgd2l0aCB0aGlzIHByb2dyYW07IGlmIG5vdCwgc2VlIDxo
dHRwOi8vd3d3LmdudS5vcmcvbGljZW5zZXMvPi4KKyAqLworCisjaW5jbHVkZSAicWVtdS9vc2Rl
cC5oIgorI2luY2x1ZGUgImNwdS5oIgorI2luY2x1ZGUgIm1tdmVjL3N5c3RlbV9leHRfbW12ZWMu
aCIKKwordm9pZCBtZW1fZ2F0aGVyX3N0b3JlKENQVUhleGFnb25TdGF0ZSAqZW52LCB0YXJnZXRf
dWxvbmcgdmFkZHIsIGludCBzbG90KQoreworICAgIHNpemVfdCBzaXplID0gc2l6ZW9mKE1NVmVj
dG9yKTsKKworICAgIGVudi0+dnN0b3JlX3BlbmRpbmdbc2xvdF0gPSAxOworICAgIGVudi0+dnN0
b3JlW3Nsb3RdLnZhICAgPSB2YWRkcjsKKyAgICBlbnYtPnZzdG9yZVtzbG90XS5zaXplID0gc2l6
ZTsKKyAgICBtZW1jcHkoJmVudi0+dnN0b3JlW3Nsb3RdLmRhdGEudWJbMF0sICZlbnYtPnRtcF9W
UmVnc1swXSwgc2l6ZSk7CisKKyAgICAvKiBPbiBhIGdhdGhlciBzdG9yZSwgb3ZlcndyaXRlIHRo
ZSBzdG9yZSBtYXNrIHRvIGVtdWxhdGUgZHJvcHBlZCBnYXRoZXJzICovCisgICAgYml0bWFwX2Nv
cHkoZW52LT52c3RvcmVbc2xvdF0ubWFzaywgZW52LT52dGNtX2xvZy5tYXNrLCBzaXplKTsKK30K
Kwordm9pZCBtZW1fdmVjdG9yX3NjYXR0ZXJfaW5pdChDUFVIZXhhZ29uU3RhdGUgKmVudikKK3sK
KyAgICBiaXRtYXBfemVybyhlbnYtPnZ0Y21fbG9nLm1hc2ssIE1BWF9WRUNfU0laRV9CWVRFUyk7
CisKKyAgICBlbnYtPnZ0Y21fcGVuZGluZyA9IHRydWU7CisgICAgZW52LT52dGNtX2xvZy5vcCA9
IGZhbHNlOworICAgIGVudi0+dnRjbV9sb2cub3Bfc2l6ZSA9IDA7Cit9CisKK3ZvaWQgbWVtX3Zl
Y3Rvcl9nYXRoZXJfaW5pdChDUFVIZXhhZ29uU3RhdGUgKmVudikKK3sKKyAgICBiaXRtYXBfemVy
byhlbnYtPnZ0Y21fbG9nLm1hc2ssIE1BWF9WRUNfU0laRV9CWVRFUyk7Cit9CmRpZmYgLS1naXQg
YS90YXJnZXQvaGV4YWdvbi9tZXNvbi5idWlsZCBiL3RhcmdldC9oZXhhZ29uL21lc29uLmJ1aWxk
CmluZGV4IGM2ZDg1OGYuLjBiZmFhNDEgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29uL21lc29u
LmJ1aWxkCisrKyBiL3RhcmdldC9oZXhhZ29uL21lc29uLmJ1aWxkCkBAIC0xNzQsNiArMTc0LDcg
QEAgaGV4YWdvbl9zcy5hZGQoZmlsZXMoCiAgICAgJ3ByaW50aW5zbi5jJywKICAgICAnYXJjaC5j
JywKICAgICAnZm1hX2VtdS5jJywKKyAgICAnbW12ZWMvc3lzdGVtX2V4dF9tbXZlYy5jJywKICkp
CiAKIHRhcmdldF9hcmNoICs9IHsnaGV4YWdvbic6IGhleGFnb25fc3N9Ci0tIAoyLjcuNAoK

