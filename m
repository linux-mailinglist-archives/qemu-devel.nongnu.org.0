Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0C129F9EE
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Oct 2020 01:45:36 +0100 (CET)
Received: from localhost ([::1]:32974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kYIXv-0006GK-MS
	for lists+qemu-devel@lfdr.de; Thu, 29 Oct 2020 20:45:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1kYHyb-00040C-GJ
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 20:09:08 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:14578)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1kYHyS-0005Pf-9z
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 20:09:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1604016536; x=1635552536;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+xXU0Gd1wUe3SSmyqUo96jQ5pVBSiFlE7hyiqmhJjHI=;
 b=xnAqH8AJMdhXXHWk1VuTSPnEF7tQmjj9TL7/CAs9AseL9zm3T95QjVdM
 Iy7yMwEdZm3aefQL+0ksrHK+VduXV7rFxkfLwpRc49eDTcT9sI6dfzJYs
 AUFTklUL1YasJ+citWY7K6IZajEFy23UkY7ZKDt8wD+QDVF/MIOZ08Bje o=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 29 Oct 2020 17:08:44 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg01-sd.qualcomm.com with ESMTP; 29 Oct 2020 17:08:43 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id AF3F44121; Thu, 29 Oct 2020 19:08:43 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v5 08/33] Hexagon (target/hexagon) GDB Stub
Date: Thu, 29 Oct 2020 19:08:14 -0500
Message-Id: <1604016519-28065-9-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604016519-28065-1-git-send-email-tsimpson@quicinc.com>
References: <1604016519-28065-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-02.qualcomm.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/29 19:58:53
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: ale@rev.ng, bcain@quicinc.com, richard.henderson@linaro.org,
 at.org@qualcomm.com, laurent@vivier.eu, tsimpson@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

R0RCIHJlZ2lzdGVyIHJlYWQgYW5kIHdyaXRlIHJvdXRpbmVzCgpTaWduZWQtb2ZmLWJ5OiBUYXls
b3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+ClJldmlld2VkLWJ5OiBSaWNoYXJkIEhl
bmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4KLS0tCiB0YXJnZXQvaGV4YWdv
bi9pbnRlcm5hbC5oIHwgIDMgKysrCiB0YXJnZXQvaGV4YWdvbi9jcHUuYyAgICAgIHwgIDIgKysK
IHRhcmdldC9oZXhhZ29uL2dkYnN0dWIuYyAgfCA0NyArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCA1MiBpbnNlcnRpb25zKCsp
CiBjcmVhdGUgbW9kZSAxMDA2NDQgdGFyZ2V0L2hleGFnb24vZ2Ric3R1Yi5jCgpkaWZmIC0tZ2l0
IGEvdGFyZ2V0L2hleGFnb24vaW50ZXJuYWwuaCBiL3RhcmdldC9oZXhhZ29uL2ludGVybmFsLmgK
aW5kZXggMzI3YmFkOS4uOTYxMzE4YSAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFnb24vaW50ZXJu
YWwuaAorKysgYi90YXJnZXQvaGV4YWdvbi9pbnRlcm5hbC5oCkBAIC0yOSw2ICsyOSw5IEBACiAg
ICAgICAgIH0gXAogICAgIH0gd2hpbGUgKDApCiAKK2V4dGVybiBpbnQgaGV4YWdvbl9nZGJfcmVh
ZF9yZWdpc3RlcihDUFVTdGF0ZSAqY3B1LCBHQnl0ZUFycmF5ICpidWYsIGludCByZWcpOworZXh0
ZXJuIGludCBoZXhhZ29uX2dkYl93cml0ZV9yZWdpc3RlcihDUFVTdGF0ZSAqY3B1LCB1aW50OF90
ICpidWYsIGludCByZWcpOworCiBleHRlcm4gdm9pZCBoZXhhZ29uX2RlYnVnKENQVUhleGFnb25T
dGF0ZSAqZW52KTsKIAogZXh0ZXJuIGNvbnN0IGNoYXIgKiBjb25zdCBoZXhhZ29uX3JlZ25hbWVz
W1RPVEFMX1BFUl9USFJFQURfUkVHU107CmRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9jcHUu
YyBiL3RhcmdldC9oZXhhZ29uL2NwdS5jCmluZGV4IDVlMGRhM2YuLjMyYWE5ODIgMTAwNjQ0Ci0t
LSBhL3RhcmdldC9oZXhhZ29uL2NwdS5jCisrKyBiL3RhcmdldC9oZXhhZ29uL2NwdS5jCkBAIC0y
ODAsNiArMjgwLDggQEAgc3RhdGljIHZvaWQgaGV4YWdvbl9jcHVfY2xhc3NfaW5pdChPYmplY3RD
bGFzcyAqYywgdm9pZCAqZGF0YSkKICAgICBjYy0+ZHVtcF9zdGF0ZSA9IGhleGFnb25fZHVtcF9z
dGF0ZTsKICAgICBjYy0+c2V0X3BjID0gaGV4YWdvbl9jcHVfc2V0X3BjOwogICAgIGNjLT5zeW5j
aHJvbml6ZV9mcm9tX3RiID0gaGV4YWdvbl9jcHVfc3luY2hyb25pemVfZnJvbV90YjsKKyAgICBj
Yy0+Z2RiX3JlYWRfcmVnaXN0ZXIgPSBoZXhhZ29uX2dkYl9yZWFkX3JlZ2lzdGVyOworICAgIGNj
LT5nZGJfd3JpdGVfcmVnaXN0ZXIgPSBoZXhhZ29uX2dkYl93cml0ZV9yZWdpc3RlcjsKICAgICBj
Yy0+Z2RiX251bV9jb3JlX3JlZ3MgPSBUT1RBTF9QRVJfVEhSRUFEX1JFR1M7CiAgICAgY2MtPmdk
Yl9zdG9wX2JlZm9yZV93YXRjaHBvaW50ID0gdHJ1ZTsKICAgICBjYy0+ZGlzYXNfc2V0X2luZm8g
PSBoZXhhZ29uX2NwdV9kaXNhc19zZXRfaW5mbzsKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29u
L2dkYnN0dWIuYyBiL3RhcmdldC9oZXhhZ29uL2dkYnN0dWIuYwpuZXcgZmlsZSBtb2RlIDEwMDY0
NAppbmRleCAwMDAwMDAwLi5lOGMxMGIyCi0tLSAvZGV2L251bGwKKysrIGIvdGFyZ2V0L2hleGFn
b24vZ2Ric3R1Yi5jCkBAIC0wLDAgKzEsNDcgQEAKKy8qCisgKiAgQ29weXJpZ2h0KGMpIDIwMTkt
MjAyMCBRdWFsY29tbSBJbm5vdmF0aW9uIENlbnRlciwgSW5jLiBBbGwgUmlnaHRzIFJlc2VydmVk
LgorICoKKyAqICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3Ry
aWJ1dGUgaXQgYW5kL29yIG1vZGlmeQorICogIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05V
IEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5CisgKiAgdGhlIEZyZWUgU29m
dHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiBvZiB0aGUgTGljZW5zZSwgb3IKKyAq
ICAoYXQgeW91ciBvcHRpb24pIGFueSBsYXRlciB2ZXJzaW9uLgorICoKKyAqICBUaGlzIHByb2dy
YW0gaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwKKyAq
ICBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJy
YW50eSBvZgorICogIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIg
UFVSUE9TRS4gIFNlZSB0aGUKKyAqICBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9y
ZSBkZXRhaWxzLgorICoKKyAqICBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRo
ZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZQorICogIGFsb25nIHdpdGggdGhpcyBwcm9ncmFt
OyBpZiBub3QsIHNlZSA8aHR0cDovL3d3dy5nbnUub3JnL2xpY2Vuc2VzLz4uCisgKi8KKworI2lu
Y2x1ZGUgInFlbXUvb3NkZXAuaCIKKyNpbmNsdWRlICJxZW11LWNvbW1vbi5oIgorI2luY2x1ZGUg
ImV4ZWMvZ2Ric3R1Yi5oIgorI2luY2x1ZGUgImNwdS5oIgorI2luY2x1ZGUgImludGVybmFsLmgi
CisKK2ludCBoZXhhZ29uX2dkYl9yZWFkX3JlZ2lzdGVyKENQVVN0YXRlICpjcywgR0J5dGVBcnJh
eSAqbWVtX2J1ZiwgaW50IG4pCit7CisgICAgSGV4YWdvbkNQVSAqY3B1ID0gSEVYQUdPTl9DUFUo
Y3MpOworICAgIENQVUhleGFnb25TdGF0ZSAqZW52ID0gJmNwdS0+ZW52OworCisgICAgaWYgKG4g
PCBUT1RBTF9QRVJfVEhSRUFEX1JFR1MpIHsKKyAgICAgICAgcmV0dXJuIGdkYl9nZXRfcmVnbCht
ZW1fYnVmLCBlbnYtPmdwcltuXSk7CisgICAgfQorCisgICAgZ19hc3NlcnRfbm90X3JlYWNoZWQo
KTsKK30KKworaW50IGhleGFnb25fZ2RiX3dyaXRlX3JlZ2lzdGVyKENQVVN0YXRlICpjcywgdWlu
dDhfdCAqbWVtX2J1ZiwgaW50IG4pCit7CisgICAgSGV4YWdvbkNQVSAqY3B1ID0gSEVYQUdPTl9D
UFUoY3MpOworICAgIENQVUhleGFnb25TdGF0ZSAqZW52ID0gJmNwdS0+ZW52OworCisgICAgaWYg
KG4gPCBUT1RBTF9QRVJfVEhSRUFEX1JFR1MpIHsKKyAgICAgICAgZW52LT5ncHJbbl0gPSBsZHR1
bF9wKG1lbV9idWYpOworICAgICAgICByZXR1cm4gc2l6ZW9mKHRhcmdldF91bG9uZyk7CisgICAg
fQorCisgICAgZ19hc3NlcnRfbm90X3JlYWNoZWQoKTsKK30KLS0gCjIuNy40Cgo=

