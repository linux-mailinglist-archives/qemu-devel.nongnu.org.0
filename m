Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0393ABE64
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 23:54:32 +0200 (CEST)
Received: from localhost ([::1]:42620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltzy3-00074A-26
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 17:54:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1ltzwQ-00055P-1R
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 17:52:50 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:58027)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1ltzwN-0006ef-Ln
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 17:52:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1623966767; x=1655502767;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w/AzGUoAOWhhZzSJA5kHl52py6VYG1u6F0h/rs1/LIE=;
 b=wij4eseuR5aJuitCCPpYRRw5fRd6HSNKI5e0lwadaRUdnGYeIPGymDPt
 Lt2xy9wsGhxkH9DW50RESEyh1+uAI8SsXxNCuunsAu3DY8CgolBBJzLuh
 husiIPA+1eZmYnqS3cdejOL8cINNiwwODrVL53HfNQiIK1/42C15LFoJl o=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 17 Jun 2021 14:52:44 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg05-sd.qualcomm.com with ESMTP; 17 Jun 2021 14:52:43 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id B57E2F43; Thu, 17 Jun 2021 16:52:43 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: tsimpson@quicinc.com
Subject: [PULL 2/4] Hexagon (target/hexagon) fix l2fetch instructions
Date: Thu, 17 Jun 2021 16:52:33 -0500
Message-Id: <1623966755-30225-3-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1623966755-30225-1-git-send-email-tsimpson@quicinc.com>
References: <1623966755-30225-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-02.qualcomm.com
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

WTRfbDJmZXRjaCA9PSBsMmZldGNoKFJzMzIsIFJ0MzIpClk1X2wyZmV0Y2ggPT0gbDJmZXRjaChS
czMyLCBSdHQzMikKClRoZSBzZW1hbnRpY3MgZm9yIHRoZXNlIGluc3RydWN0aW9ucyBhcmUgcHJl
c2VudCwgYnV0IHRoZSBlbmNvZGluZ3MKYXJlIG1pc3NpbmcuCgpOb3RlIHRoYXQgdGhlc2UgYXJl
IHRyZWF0ZWQgYXMgbm9wcyBpbiBxZW11LCBzbyB3ZSBhZGQgb3ZlcnJpZGVzLgoKVGVzdCBjYXNl
IGFkZGVkIHRvIHRlc3RzL3RjZy9oZXhhZ29uL21pc2MuYwoKUmV2aWV3ZWQtYnk6IFJpY2hhcmQg
SGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPj4KU2lnbmVkLW9mZi1ieTog
VGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgotLS0KIHRhcmdldC9oZXhhZ29u
L2dlbl90Y2cuaCAgICAgICAgICAgICAgfCAxMSArKysrKysrKysrKwogdGVzdHMvdGNnL2hleGFn
b24vbWlzYy5jICAgICAgICAgICAgICB8ICA5ICsrKysrKysrKwogdGFyZ2V0L2hleGFnb24vaW1w
b3J0ZWQvZW5jb2RlX3BwLmRlZiB8ICAzICsrKwogMyBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vZ2VuX3RjZy5oIGIvdGFyZ2V0L2hl
eGFnb24vZ2VuX3RjZy5oCmluZGV4IDE4ZmNkYmMuLmEzNzVkNmEgMTAwNjQ0Ci0tLSBhL3Rhcmdl
dC9oZXhhZ29uL2dlbl90Y2cuaAorKysgYi90YXJnZXQvaGV4YWdvbi9nZW5fdGNnLmgKQEAgLTcz
NCw0ICs3MzQsMTUgQEAKICNkZWZpbmUgZkdFTl9UQ0dfRjJfZGZtcHloaChTSE9SVENPREUpIFwK
ICAgICBnZW5faGVscGVyX2RmbXB5aGgoUnh4ViwgY3B1X2VudiwgUnh4ViwgUnNzViwgUnR0VikK
IAorLyogTm90aGluZyB0byBkbyBmb3IgdGhlc2UgaW4gcWVtdSwgbmVlZCB0byBzdXBwcmVzcyBj
b21waWxlciB3YXJuaW5ncyAqLworI2RlZmluZSBmR0VOX1RDR19ZNF9sMmZldGNoKFNIT1JUQ09E
RSkgXAorICAgIGRvIHsgXAorICAgICAgICBSc1YgPSBSc1Y7IFwKKyAgICAgICAgUnRWID0gUnRW
OyBcCisgICAgfSB3aGlsZSAoMCkKKyNkZWZpbmUgZkdFTl9UQ0dfWTVfbDJmZXRjaChTSE9SVENP
REUpIFwKKyAgICBkbyB7IFwKKyAgICAgICAgUnNWID0gUnNWOyBcCisgICAgfSB3aGlsZSAoMCkK
KwogI2VuZGlmCmRpZmYgLS1naXQgYS90ZXN0cy90Y2cvaGV4YWdvbi9taXNjLmMgYi90ZXN0cy90
Y2cvaGV4YWdvbi9taXNjLmMKaW5kZXggOWUxMzlmMy4uZjBiMTk0NyAxMDA2NDQKLS0tIGEvdGVz
dHMvdGNnL2hleGFnb24vbWlzYy5jCisrKyBiL3Rlc3RzL3RjZy9oZXhhZ29uL21pc2MuYwpAQCAt
MzI2LDYgKzMyNiwxMyBAQCB2b2lkIHRlc3RfbHNibmV3KHZvaWQpCiAgICAgY2hlY2socmVzdWx0
LCA1KTsKIH0KIAordm9pZCB0ZXN0X2wyZmV0Y2godm9pZCkKK3sKKyAgICAvKiBUaGVzZSBkb24n
dCBkbyBhbnl0aGluZyBpbiBxZW11LCBqdXN0IG1ha2Ugc3VyZSB0aGV5IGRvbid0IGFzc2VydCAq
LworICAgIGFzbSB2b2xhdGlsZSAoImwyZmV0Y2gocjAsIHIxKVxuXHQiCisgICAgICAgICAgICAg
ICAgICAibDJmZXRjaChyMCwgcjM6Milcblx0Iik7Cit9CisKIGludCBtYWluKCkKIHsKICAgICBp
bnQgcmVzOwpAQCAtNDU5LDYgKzQ2Niw4IEBAIGludCBtYWluKCkKIAogICAgIHRlc3RfbHNibmV3
KCk7CiAKKyAgICB0ZXN0X2wyZmV0Y2goKTsKKwogICAgIHB1dHMoZXJyID8gIkZBSUwiIDogIlBB
U1MiKTsKICAgICByZXR1cm4gZXJyOwogfQpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vaW1w
b3J0ZWQvZW5jb2RlX3BwLmRlZiBiL3RhcmdldC9oZXhhZ29uL2ltcG9ydGVkL2VuY29kZV9wcC5k
ZWYKaW5kZXggMzVhZTNkMi4uOTM5YzZmYyAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFnb24vaW1w
b3J0ZWQvZW5jb2RlX3BwLmRlZgorKysgYi90YXJnZXQvaGV4YWdvbi9pbXBvcnRlZC9lbmNvZGVf
cHAuZGVmCkBAIC00OTMsNiArNDkzLDkgQEAgREVGX0VOQzMyKFkyX2RjY2xlYW5hLCAgICAgSUNM
QVNTX1NUIiAwMDAgMDAgMDBzc3NzcyBQUC0tLS0tLSAtLS0tLS0tLSIpCiBERUZfRU5DMzIoWTJf
ZGNpbnZhLCAgICAgICBJQ0xBU1NfU1QiIDAwMCAwMCAwMXNzc3NzIFBQLS0tLS0tIC0tLS0tLS0t
IikKIERFRl9FTkMzMihZMl9kY2NsZWFuaW52YSwgIElDTEFTU19TVCIgMDAwIDAwIDEwc3Nzc3Mg
UFAtLS0tLS0gLS0tLS0tLS0iKQogCitERUZfRU5DMzIoWTRfbDJmZXRjaCwgICAgICBJQ0xBU1Nf
U1QiIDAxMSAwMCAwMHNzc3NzIFBQLXR0dHR0IDAwMC0tLS0tIikKK0RFRl9FTkMzMihZNV9sMmZl
dGNoLCAgICAgIElDTEFTU19TVCIgMDExIDAxIDAwc3Nzc3MgUFAtdHR0dHQgLS0tLS0tLS0iKQor
CiAvKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKi8KIC8qICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAqLwogLyogICAgICAgICAgICAgICAgICAgICAgICAgICAgICovCi0tIAoyLjcu
NAoK

