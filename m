Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D823ABE7A
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 23:55:59 +0200 (CEST)
Received: from localhost ([::1]:47130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltzzS-0001di-Eb
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 17:55:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1ltzwT-00058R-Kn
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 17:52:53 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:51073)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1ltzwR-0006ey-NS
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 17:52:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1623966771; x=1655502771;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d4hsfiq+bx63MAcpSi0v+g4/tmd9eKaiYEqw9CQibfs=;
 b=wmNOtuYq1/ilKtHmxmQ6wz9IWFebGHQ6Dp7JmyJSF6DWmdQUGZeZAiL0
 WbzflywaZpLQh1ufS2UKhQ+UBG3RXW7r64PlivKdtL8GHZTzVlDqP+CZ/
 ubP60sReTC/V8AYdgHLYd0Km7SgZclCPR8jp5ebakm7c5zh0CuMlhSohH k=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 17 Jun 2021 14:52:44 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg04-sd.qualcomm.com with ESMTP; 17 Jun 2021 14:52:44 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id C6EA8FF6; Thu, 17 Jun 2021 16:52:43 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: tsimpson@quicinc.com
Subject: [PULL 3/4] Hexagon (target/hexagon) cleanup gen_store_conditional[48]
 functions
Date: Thu, 17 Jun 2021 16:52:34 -0500
Message-Id: <1623966755-30225-4-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1623966755-30225-1-git-send-email-tsimpson@quicinc.com>
References: <1623966755-30225-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=199.106.114.38;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-01.qualcomm.com
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
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UHJldmlvdXNseSB0aGUgc3RvcmUtY29uZGl0aW9uYWwgY29kZSB3YXMgd3JpdGluZyB0byBoZXhf
cHJlZFtwcmVkbnVtXS4KVGhlbiwgdGhlIGZHRU5fVENHIG92ZXJyaWRlIHdhcyByZWFkaW5nIGZy
b20gdGhlcmUgdG8gdGhlIGRlc3RpbmF0aW9uCnZhcmlhYmxlIHNvIHRoYXQgdGhlIHBhY2tldCBj
b21taXQgbG9naWMgd291bGQgaGFuZGxlIGl0IHByb3Blcmx5LgoKVGhlIGNvcnJlY3QgaW1wbGVt
ZW50YXRpb24gaXMgdG8gd3JpdGUgdG8gdGhlIGRlc3RpbmF0aW9uIHZhcmlhYmxlCmFuZCBkb24n
dCBoYXZlIHRoZSBleHRyYSByZWFkIGluIHRoZSBvdmVycmlkZS4KClJlbW92ZSB0aGUgdW51c2Vk
IGFyZ3VtZW50cyBmcm9tIGdlbl9zdG9yZV9jb25kaXRpb25hbFs0OF0KClJldmlld2VkLWJ5OiBS
aWNoYXJkIEhlbmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4KU2lnbmVkLW9m
Zi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgotLS0KIHRhcmdldC9o
ZXhhZ29uL2dlbl90Y2cuaCB8ICA0ICsrLS0KIHRhcmdldC9oZXhhZ29uL21hY3Jvcy5oICB8ICAy
ICstCiB0YXJnZXQvaGV4YWdvbi9nZW5wdHIuYyAgfCAxMCArKysrLS0tLS0tCiAzIGZpbGVzIGNo
YW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90YXJn
ZXQvaGV4YWdvbi9nZW5fdGNnLmggYi90YXJnZXQvaGV4YWdvbi9nZW5fdGNnLmgKaW5kZXggYTM3
NWQ2YS4uZWU5NGM5MCAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFnb24vZ2VuX3RjZy5oCisrKyBi
L3RhcmdldC9oZXhhZ29uL2dlbl90Y2cuaApAQCAtNDI0LDkgKzQyNCw5IEBACiAjZGVmaW5lIGZH
RU5fVENHX0w0X2xvYWRkX2xvY2tlZChTSE9SVENPREUpIFwKICAgICBTSE9SVENPREUKICNkZWZp
bmUgZkdFTl9UQ0dfUzJfc3RvcmV3X2xvY2tlZChTSE9SVENPREUpIFwKLSAgICBkbyB7IFNIT1JU
Q09ERTsgUkVBRF9QUkVHKFBkViwgUGROKTsgfSB3aGlsZSAoMCkKKyAgICBTSE9SVENPREUKICNk
ZWZpbmUgZkdFTl9UQ0dfUzRfc3RvcmVkX2xvY2tlZChTSE9SVENPREUpIFwKLSAgICBkbyB7IFNI
T1JUQ09ERTsgUkVBRF9QUkVHKFBkViwgUGROKTsgfSB3aGlsZSAoMCkKKyAgICBTSE9SVENPREUK
IAogI2RlZmluZSBmR0VOX1RDR19TVE9SRShTSE9SVENPREUpIFwKICAgICBkbyB7IFwKZGlmZiAt
LWdpdCBhL3RhcmdldC9oZXhhZ29uL21hY3Jvcy5oIGIvdGFyZ2V0L2hleGFnb24vbWFjcm9zLmgK
aW5kZXggMmIyMDhmMy4uODRmYTY4NyAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFnb24vbWFjcm9z
LmgKKysrIGIvdGFyZ2V0L2hleGFnb24vbWFjcm9zLmgKQEAgLTU5MSw3ICs1OTEsNyBAQCBzdGF0
aWMgaW5saW5lIFRDR3YgZ2VuX3JlYWRfaXJlZyhUQ0d2IHJlc3VsdCwgVENHdiB2YWwsIGludCBz
aGlmdCkKIAogI2lmZGVmIFFFTVVfR0VORVJBVEUKICNkZWZpbmUgZlNUT1JFX0xPQ0tFRChOVU0s
IFNJWkUsIEVBLCBTUkMsIFBSRUQpIFwKLSAgICBnZW5fc3RvcmVfY29uZGl0aW9uYWwjI1NJWkUo
ZW52LCBjdHgsIFBkTiwgUFJFRCwgRUEsIFNSQyk7CisgICAgZ2VuX3N0b3JlX2NvbmRpdGlvbmFs
IyNTSVpFKGN0eCwgUFJFRCwgRUEsIFNSQyk7CiAjZW5kaWYKIAogI2lmZGVmIFFFTVVfR0VORVJB
VEUKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jIGIvdGFyZ2V0L2hleGFnb24v
Z2VucHRyLmMKaW5kZXggNzk3YTZjMC4uYmQxOGNiMSAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFn
b24vZ2VucHRyLmMKKysrIGIvdGFyZ2V0L2hleGFnb24vZ2VucHRyLmMKQEAgLTMzNCw4ICszMzQs
NyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgZ2VuX2xvYWRfbG9ja2VkOHUoVENHdl9pNjQgZGVzdCwg
VENHdiB2YWRkciwgaW50IG1lbV9pbmRleCkKICAgICB0Y2dfZ2VuX21vdl9pNjQoaGV4X2xsc2Nf
dmFsX2k2NCwgZGVzdCk7CiB9CiAKLXN0YXRpYyBpbmxpbmUgdm9pZCBnZW5fc3RvcmVfY29uZGl0
aW9uYWw0KENQVUhleGFnb25TdGF0ZSAqZW52LAotICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgRGlzYXNDb250ZXh0ICpjdHgsIGludCBwcmVkbnVtLAorc3RhdGljIGlu
bGluZSB2b2lkIGdlbl9zdG9yZV9jb25kaXRpb25hbDQoRGlzYXNDb250ZXh0ICpjdHgsCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBUQ0d2IHByZWQsIFRDR3YgdmFk
ZHIsIFRDR3Ygc3JjKQogewogICAgIFRDR0xhYmVsICpmYWlsID0gZ2VuX25ld19sYWJlbCgpOwpA
QCAtMzQ5LDcgKzM0OCw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBnZW5fc3RvcmVfY29uZGl0aW9u
YWw0KENQVUhleGFnb25TdGF0ZSAqZW52LAogICAgIHRtcCA9IHRjZ190ZW1wX25ldygpOwogICAg
IHRjZ19nZW5fYXRvbWljX2NtcHhjaGdfdGwodG1wLCBoZXhfbGxzY19hZGRyLCBoZXhfbGxzY192
YWwsIHNyYywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGN0eC0+bWVtX2lkeCwgTU9f
MzIpOwotICAgIHRjZ19nZW5fbW92Y29uZF90bChUQ0dfQ09ORF9FUSwgaGV4X3ByZWRbcHJlZG51
bV0sIHRtcCwgaGV4X2xsc2NfdmFsLAorICAgIHRjZ19nZW5fbW92Y29uZF90bChUQ0dfQ09ORF9F
USwgcHJlZCwgdG1wLCBoZXhfbGxzY192YWwsCiAgICAgICAgICAgICAgICAgICAgICAgIG9uZSwg
emVybyk7CiAgICAgdGNnX3RlbXBfZnJlZShvbmUpOwogICAgIHRjZ190ZW1wX2ZyZWUoemVybyk7
CkBAIC0zNjMsOCArMzYyLDcgQEAgc3RhdGljIGlubGluZSB2b2lkIGdlbl9zdG9yZV9jb25kaXRp
b25hbDQoQ1BVSGV4YWdvblN0YXRlICplbnYsCiAgICAgdGNnX2dlbl9tb3ZpX3RsKGhleF9sbHNj
X2FkZHIsIH4wKTsKIH0KIAotc3RhdGljIGlubGluZSB2b2lkIGdlbl9zdG9yZV9jb25kaXRpb25h
bDgoQ1BVSGV4YWdvblN0YXRlICplbnYsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBEaXNhc0NvbnRleHQgKmN0eCwgaW50IHByZWRudW0sCitzdGF0aWMgaW5saW5l
IHZvaWQgZ2VuX3N0b3JlX2NvbmRpdGlvbmFsOChEaXNhc0NvbnRleHQgKmN0eCwKICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFRDR3YgcHJlZCwgVENHdiB2YWRkciwg
VENHdl9pNjQgc3JjKQogewogICAgIFRDR0xhYmVsICpmYWlsID0gZ2VuX25ld19sYWJlbCgpOwpA
QCAtMzgwLDcgKzM3OCw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBnZW5fc3RvcmVfY29uZGl0aW9u
YWw4KENQVUhleGFnb25TdGF0ZSAqZW52LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGN0eC0+bWVtX2lkeCwgTU9fNjQpOwogICAgIHRjZ19nZW5fbW92Y29uZF9pNjQoVENHX0NPTkRf
RVEsIHRtcCwgdG1wLCBoZXhfbGxzY192YWxfaTY0LAogICAgICAgICAgICAgICAgICAgICAgICAg
b25lLCB6ZXJvKTsKLSAgICB0Y2dfZ2VuX2V4dHJsX2k2NF9pMzIoaGV4X3ByZWRbcHJlZG51bV0s
IHRtcCk7CisgICAgdGNnX2dlbl9leHRybF9pNjRfaTMyKHByZWQsIHRtcCk7CiAgICAgdGNnX3Rl
bXBfZnJlZV9pNjQob25lKTsKICAgICB0Y2dfdGVtcF9mcmVlX2k2NCh6ZXJvKTsKICAgICB0Y2df
dGVtcF9mcmVlX2k2NCh0bXApOwotLSAKMi43LjQKCg==

