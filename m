Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAAF397CF9
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 01:22:13 +0200 (CEST)
Received: from localhost ([::1]:34770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loDi8-0005kh-5s
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 19:22:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1loDfr-0003ii-RZ
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 19:19:51 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:13693)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1loDfp-00068C-Ku
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 19:19:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1622589589; x=1654125589;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tWHtKBgnflOpZom5LwTNqGs6gHFhKWBork947kc3apk=;
 b=GFAkWr3/XPOI3g2BGwd3/3MmABAWq0Qxr13hJDe3TylKJvaNEKXtrJEX
 jlyWrfDQgA59QYKR1vTnwPIx4s/0PGvw9qESLL/lytFgv5HDSnilIgkzY
 o6TqSLXyyyJgRNrCHyns/m8xhZV9XO5lDOTToLKqRt3+TbiAjtpDZA7x/ Q=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 01 Jun 2021 16:19:46 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP; 01 Jun 2021 16:19:46 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 2BB69D93; Tue,  1 Jun 2021 18:19:46 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/4] Hexagon (target/hexagon) fix l2fetch instructions
Date: Tue,  1 Jun 2021 18:19:42 -0500
Message-Id: <1622589584-22571-3-git-send-email-tsimpson@quicinc.com>
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

WTRfbDJmZXRjaCA9PSBsMmZldGNoKFJzMzIsIFJ0MzIpClk1X2wyZmV0Y2ggPT0gbDJmZXRjaChS
czMyLCBSdHQzMikKClRoZSBzZW1hbnRpY3MgZm9yIHRoZXNlIGluc3RydWN0aW9ucyBhcmUgcHJl
c2VudCwgYnV0IHRoZSBlbmNvZGluZ3MKYXJlIG1pc3NpbmcuCgpOb3RlIHRoYXQgdGhlc2UgYXJl
IHRyZWF0ZWQgYXMgbm9wcyBpbiBxZW11LCBzbyB3ZSBhZGQgb3ZlcnJpZGVzLgoKVGVzdCBjYXNl
IGFkZGVkIHRvIHRlc3RzL3RjZy9oZXhhZ29uL21pc2MuYwoKU2lnbmVkLW9mZi1ieTogVGF5bG9y
IFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgotLS0KIHRhcmdldC9oZXhhZ29uL2dlbl90
Y2cuaCAgICAgICAgICAgICAgfCAxMSArKysrKysrKysrKwogdGVzdHMvdGNnL2hleGFnb24vbWlz
Yy5jICAgICAgICAgICAgICB8ICA5ICsrKysrKysrKwogdGFyZ2V0L2hleGFnb24vaW1wb3J0ZWQv
ZW5jb2RlX3BwLmRlZiB8ICAzICsrKwogMyBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vZ2VuX3RjZy5oIGIvdGFyZ2V0L2hleGFnb24v
Z2VuX3RjZy5oCmluZGV4IDE4ZmNkYmMuLmEzNzVkNmEgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhh
Z29uL2dlbl90Y2cuaAorKysgYi90YXJnZXQvaGV4YWdvbi9nZW5fdGNnLmgKQEAgLTczNCw0ICs3
MzQsMTUgQEAKICNkZWZpbmUgZkdFTl9UQ0dfRjJfZGZtcHloaChTSE9SVENPREUpIFwKICAgICBn
ZW5faGVscGVyX2RmbXB5aGgoUnh4ViwgY3B1X2VudiwgUnh4ViwgUnNzViwgUnR0VikKIAorLyog
Tm90aGluZyB0byBkbyBmb3IgdGhlc2UgaW4gcWVtdSwgbmVlZCB0byBzdXBwcmVzcyBjb21waWxl
ciB3YXJuaW5ncyAqLworI2RlZmluZSBmR0VOX1RDR19ZNF9sMmZldGNoKFNIT1JUQ09ERSkgXAor
ICAgIGRvIHsgXAorICAgICAgICBSc1YgPSBSc1Y7IFwKKyAgICAgICAgUnRWID0gUnRWOyBcCisg
ICAgfSB3aGlsZSAoMCkKKyNkZWZpbmUgZkdFTl9UQ0dfWTVfbDJmZXRjaChTSE9SVENPREUpIFwK
KyAgICBkbyB7IFwKKyAgICAgICAgUnNWID0gUnNWOyBcCisgICAgfSB3aGlsZSAoMCkKKwogI2Vu
ZGlmCmRpZmYgLS1naXQgYS90ZXN0cy90Y2cvaGV4YWdvbi9taXNjLmMgYi90ZXN0cy90Y2cvaGV4
YWdvbi9taXNjLmMKaW5kZXggOWUxMzlmMy4uZjBiMTk0NyAxMDA2NDQKLS0tIGEvdGVzdHMvdGNn
L2hleGFnb24vbWlzYy5jCisrKyBiL3Rlc3RzL3RjZy9oZXhhZ29uL21pc2MuYwpAQCAtMzI2LDYg
KzMyNiwxMyBAQCB2b2lkIHRlc3RfbHNibmV3KHZvaWQpCiAgICAgY2hlY2socmVzdWx0LCA1KTsK
IH0KIAordm9pZCB0ZXN0X2wyZmV0Y2godm9pZCkKK3sKKyAgICAvKiBUaGVzZSBkb24ndCBkbyBh
bnl0aGluZyBpbiBxZW11LCBqdXN0IG1ha2Ugc3VyZSB0aGV5IGRvbid0IGFzc2VydCAqLworICAg
IGFzbSB2b2xhdGlsZSAoImwyZmV0Y2gocjAsIHIxKVxuXHQiCisgICAgICAgICAgICAgICAgICAi
bDJmZXRjaChyMCwgcjM6Milcblx0Iik7Cit9CisKIGludCBtYWluKCkKIHsKICAgICBpbnQgcmVz
OwpAQCAtNDU5LDYgKzQ2Niw4IEBAIGludCBtYWluKCkKIAogICAgIHRlc3RfbHNibmV3KCk7CiAK
KyAgICB0ZXN0X2wyZmV0Y2goKTsKKwogICAgIHB1dHMoZXJyID8gIkZBSUwiIDogIlBBU1MiKTsK
ICAgICByZXR1cm4gZXJyOwogfQpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vaW1wb3J0ZWQv
ZW5jb2RlX3BwLmRlZiBiL3RhcmdldC9oZXhhZ29uL2ltcG9ydGVkL2VuY29kZV9wcC5kZWYKaW5k
ZXggMzVhZTNkMi4uOTM5YzZmYyAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFnb24vaW1wb3J0ZWQv
ZW5jb2RlX3BwLmRlZgorKysgYi90YXJnZXQvaGV4YWdvbi9pbXBvcnRlZC9lbmNvZGVfcHAuZGVm
CkBAIC00OTMsNiArNDkzLDkgQEAgREVGX0VOQzMyKFkyX2RjY2xlYW5hLCAgICAgSUNMQVNTX1NU
IiAwMDAgMDAgMDBzc3NzcyBQUC0tLS0tLSAtLS0tLS0tLSIpCiBERUZfRU5DMzIoWTJfZGNpbnZh
LCAgICAgICBJQ0xBU1NfU1QiIDAwMCAwMCAwMXNzc3NzIFBQLS0tLS0tIC0tLS0tLS0tIikKIERF
Rl9FTkMzMihZMl9kY2NsZWFuaW52YSwgIElDTEFTU19TVCIgMDAwIDAwIDEwc3Nzc3MgUFAtLS0t
LS0gLS0tLS0tLS0iKQogCitERUZfRU5DMzIoWTRfbDJmZXRjaCwgICAgICBJQ0xBU1NfU1QiIDAx
MSAwMCAwMHNzc3NzIFBQLXR0dHR0IDAwMC0tLS0tIikKK0RFRl9FTkMzMihZNV9sMmZldGNoLCAg
ICAgIElDTEFTU19TVCIgMDExIDAxIDAwc3Nzc3MgUFAtdHR0dHQgLS0tLS0tLS0iKQorCiAvKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKi8KIC8qICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAqLwogLyogICAgICAgICAgICAgICAgICAgICAgICAgICAgICovCi0tIAoyLjcuNAoK

