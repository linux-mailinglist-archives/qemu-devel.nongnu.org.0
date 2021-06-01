Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE75397D00
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 01:24:11 +0200 (CEST)
Received: from localhost ([::1]:41256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loDk2-0001eU-MS
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 19:24:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1loDfv-0003qJ-Ha
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 19:19:55 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:61942)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1loDfs-0006Bp-EE
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 19:19:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1622589592; x=1654125592;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=91bR1ug+W+/hoEJkk4AWpyw3b7kvj8OtlmKcu3LMV7g=;
 b=cZ5O1a4jOKs4/Etse0A48Q+odT26SEH1IjpvgpvP5g42/Z5CeonNcwDk
 FaG2UI1qjdO7QrivbZGZSssT8hfXi7vFlSY5QWC8GWRrI5+1mW6BWgk2E
 Yz6jYDgq1tCVeJKsMqUpoAlJmauWFr6uysayhJeD+FcZBtyppcTjy7yHq M=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 01 Jun 2021 16:19:47 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg04-sd.qualcomm.com with ESMTP; 01 Jun 2021 16:19:46 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 3ED1FDCF; Tue,  1 Jun 2021 18:19:46 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/4] Hexagon (target/hexagon) cleanup
 gen_store_conditional[48] functions
Date: Tue,  1 Jun 2021 18:19:43 -0500
Message-Id: <1622589584-22571-4-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622589584-22571-1-git-send-email-tsimpson@quicinc.com>
References: <1622589584-22571-1-git-send-email-tsimpson@quicinc.com>
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
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: ale@rev.ng, philmd@redhat.com, tsimpson@quicinc.com,
 richard.henderson@linaro.org, bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UHJldmlvdXNseSB0aGUgc3RvcmUtY29uZGl0aW9uYWwgY29kZSB3YXMgd3JpdGluZyB0byBoZXhf
cHJlZFtwcmVkbnVtXS4KVGhlbiwgdGhlIGZHRU5fVENHIG92ZXJyaWRlIHdhcyByZWFkaW5nIGZy
b20gdGhlcmUgdG8gdGhlIGRlc3RpbmF0aW9uCnZhcmlhYmxlIHNvIHRoYXQgdGhlIHBhY2tldCBj
b21taXQgbG9naWMgd291bGQgaGFuZGxlIGl0IHByb3Blcmx5LgoKVGhlIGNvcnJlY3QgaW1wbGVt
ZW50YXRpb24gaXMgdG8gd3JpdGUgdG8gdGhlIGRlc3RpbmF0aW9uIHZhcmlhYmxlCmFuZCBkb24n
dCBoYXZlIHRoZSBleHRyYSByZWFkIGluIHRoZSBvdmVycmlkZS4KClJlbW92ZSB0aGUgdW51c2Vk
IGFyZ3VtZW50cyBmcm9tIGdlbl9zdG9yZV9jb25kaXRpb25hbFs0OF0KClNpZ25lZC1vZmYtYnk6
IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4KLS0tCiB0YXJnZXQvaGV4YWdv
bi9nZW5fdGNnLmggfCAgNCArKy0tCiB0YXJnZXQvaGV4YWdvbi9tYWNyb3MuaCAgfCAgMiArLQog
dGFyZ2V0L2hleGFnb24vZ2VucHRyLmMgIHwgMTAgKysrKy0tLS0tLQogMyBmaWxlcyBjaGFuZ2Vk
LCA3IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hl
eGFnb24vZ2VuX3RjZy5oIGIvdGFyZ2V0L2hleGFnb24vZ2VuX3RjZy5oCmluZGV4IGEzNzVkNmEu
LmVlOTRjOTAgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29uL2dlbl90Y2cuaAorKysgYi90YXJn
ZXQvaGV4YWdvbi9nZW5fdGNnLmgKQEAgLTQyNCw5ICs0MjQsOSBAQAogI2RlZmluZSBmR0VOX1RD
R19MNF9sb2FkZF9sb2NrZWQoU0hPUlRDT0RFKSBcCiAgICAgU0hPUlRDT0RFCiAjZGVmaW5lIGZH
RU5fVENHX1MyX3N0b3Jld19sb2NrZWQoU0hPUlRDT0RFKSBcCi0gICAgZG8geyBTSE9SVENPREU7
IFJFQURfUFJFRyhQZFYsIFBkTik7IH0gd2hpbGUgKDApCisgICAgU0hPUlRDT0RFCiAjZGVmaW5l
IGZHRU5fVENHX1M0X3N0b3JlZF9sb2NrZWQoU0hPUlRDT0RFKSBcCi0gICAgZG8geyBTSE9SVENP
REU7IFJFQURfUFJFRyhQZFYsIFBkTik7IH0gd2hpbGUgKDApCisgICAgU0hPUlRDT0RFCiAKICNk
ZWZpbmUgZkdFTl9UQ0dfU1RPUkUoU0hPUlRDT0RFKSBcCiAgICAgZG8geyBcCmRpZmYgLS1naXQg
YS90YXJnZXQvaGV4YWdvbi9tYWNyb3MuaCBiL3RhcmdldC9oZXhhZ29uL21hY3Jvcy5oCmluZGV4
IDJiMjA4ZjMuLjg0ZmE2ODcgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29uL21hY3Jvcy5oCisr
KyBiL3RhcmdldC9oZXhhZ29uL21hY3Jvcy5oCkBAIC01OTEsNyArNTkxLDcgQEAgc3RhdGljIGlu
bGluZSBUQ0d2IGdlbl9yZWFkX2lyZWcoVENHdiByZXN1bHQsIFRDR3YgdmFsLCBpbnQgc2hpZnQp
CiAKICNpZmRlZiBRRU1VX0dFTkVSQVRFCiAjZGVmaW5lIGZTVE9SRV9MT0NLRUQoTlVNLCBTSVpF
LCBFQSwgU1JDLCBQUkVEKSBcCi0gICAgZ2VuX3N0b3JlX2NvbmRpdGlvbmFsIyNTSVpFKGVudiwg
Y3R4LCBQZE4sIFBSRUQsIEVBLCBTUkMpOworICAgIGdlbl9zdG9yZV9jb25kaXRpb25hbCMjU0la
RShjdHgsIFBSRUQsIEVBLCBTUkMpOwogI2VuZGlmCiAKICNpZmRlZiBRRU1VX0dFTkVSQVRFCmRp
ZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9nZW5wdHIuYyBiL3RhcmdldC9oZXhhZ29uL2dlbnB0
ci5jCmluZGV4IDc5N2E2YzAuLmJkMThjYjEgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29uL2dl
bnB0ci5jCisrKyBiL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jCkBAIC0zMzQsOCArMzM0LDcgQEAg
c3RhdGljIGlubGluZSB2b2lkIGdlbl9sb2FkX2xvY2tlZDh1KFRDR3ZfaTY0IGRlc3QsIFRDR3Yg
dmFkZHIsIGludCBtZW1faW5kZXgpCiAgICAgdGNnX2dlbl9tb3ZfaTY0KGhleF9sbHNjX3ZhbF9p
NjQsIGRlc3QpOwogfQogCi1zdGF0aWMgaW5saW5lIHZvaWQgZ2VuX3N0b3JlX2NvbmRpdGlvbmFs
NChDUFVIZXhhZ29uU3RhdGUgKmVudiwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIERpc2FzQ29udGV4dCAqY3R4LCBpbnQgcHJlZG51bSwKK3N0YXRpYyBpbmxpbmUg
dm9pZCBnZW5fc3RvcmVfY29uZGl0aW9uYWw0KERpc2FzQ29udGV4dCAqY3R4LAogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVENHdiBwcmVkLCBUQ0d2IHZhZGRyLCBU
Q0d2IHNyYykKIHsKICAgICBUQ0dMYWJlbCAqZmFpbCA9IGdlbl9uZXdfbGFiZWwoKTsKQEAgLTM0
OSw3ICszNDgsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgZ2VuX3N0b3JlX2NvbmRpdGlvbmFsNChD
UFVIZXhhZ29uU3RhdGUgKmVudiwKICAgICB0bXAgPSB0Y2dfdGVtcF9uZXcoKTsKICAgICB0Y2df
Z2VuX2F0b21pY19jbXB4Y2hnX3RsKHRtcCwgaGV4X2xsc2NfYWRkciwgaGV4X2xsc2NfdmFsLCBz
cmMsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjdHgtPm1lbV9pZHgsIE1PXzMyKTsK
LSAgICB0Y2dfZ2VuX21vdmNvbmRfdGwoVENHX0NPTkRfRVEsIGhleF9wcmVkW3ByZWRudW1dLCB0
bXAsIGhleF9sbHNjX3ZhbCwKKyAgICB0Y2dfZ2VuX21vdmNvbmRfdGwoVENHX0NPTkRfRVEsIHBy
ZWQsIHRtcCwgaGV4X2xsc2NfdmFsLAogICAgICAgICAgICAgICAgICAgICAgICBvbmUsIHplcm8p
OwogICAgIHRjZ190ZW1wX2ZyZWUob25lKTsKICAgICB0Y2dfdGVtcF9mcmVlKHplcm8pOwpAQCAt
MzYzLDggKzM2Miw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBnZW5fc3RvcmVfY29uZGl0aW9uYWw0
KENQVUhleGFnb25TdGF0ZSAqZW52LAogICAgIHRjZ19nZW5fbW92aV90bChoZXhfbGxzY19hZGRy
LCB+MCk7CiB9CiAKLXN0YXRpYyBpbmxpbmUgdm9pZCBnZW5fc3RvcmVfY29uZGl0aW9uYWw4KENQ
VUhleGFnb25TdGF0ZSAqZW52LAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgRGlzYXNDb250ZXh0ICpjdHgsIGludCBwcmVkbnVtLAorc3RhdGljIGlubGluZSB2b2lk
IGdlbl9zdG9yZV9jb25kaXRpb25hbDgoRGlzYXNDb250ZXh0ICpjdHgsCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBUQ0d2IHByZWQsIFRDR3YgdmFkZHIsIFRDR3Zf
aTY0IHNyYykKIHsKICAgICBUQ0dMYWJlbCAqZmFpbCA9IGdlbl9uZXdfbGFiZWwoKTsKQEAgLTM4
MCw3ICszNzgsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgZ2VuX3N0b3JlX2NvbmRpdGlvbmFsOChD
UFVIZXhhZ29uU3RhdGUgKmVudiwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjdHgt
Pm1lbV9pZHgsIE1PXzY0KTsKICAgICB0Y2dfZ2VuX21vdmNvbmRfaTY0KFRDR19DT05EX0VRLCB0
bXAsIHRtcCwgaGV4X2xsc2NfdmFsX2k2NCwKICAgICAgICAgICAgICAgICAgICAgICAgIG9uZSwg
emVybyk7Ci0gICAgdGNnX2dlbl9leHRybF9pNjRfaTMyKGhleF9wcmVkW3ByZWRudW1dLCB0bXAp
OworICAgIHRjZ19nZW5fZXh0cmxfaTY0X2kzMihwcmVkLCB0bXApOwogICAgIHRjZ190ZW1wX2Zy
ZWVfaTY0KG9uZSk7CiAgICAgdGNnX3RlbXBfZnJlZV9pNjQoemVybyk7CiAgICAgdGNnX3RlbXBf
ZnJlZV9pNjQodG1wKTsKLS0gCjIuNy40Cgo=

