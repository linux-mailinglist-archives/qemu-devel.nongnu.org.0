Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7EA29F95E
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Oct 2020 01:01:42 +0100 (CET)
Received: from localhost ([::1]:34462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kYHrR-0001MY-3V
	for lists+qemu-devel@lfdr.de; Thu, 29 Oct 2020 20:01:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1kYHoq-00082W-Ee
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 19:59:00 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:45885)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1kYHon-0004LV-Jk
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 19:59:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1604015937; x=1635551937;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4f+yrouQI3NudYB1A+H0tABtTSGqVFWBVFWxpAC3i14=;
 b=NrJ/efwTThwgut4BLlNBdcMAL/bpbYU37debtILeuJJI8Vk0g7/5zy11
 3X/6cOmYcH1VzZRFMpo8w3t/4tAekVGNh/jW1a3GHXdL6JTZ8qL1toaG7
 4nnMqT6MRwT9mRTEzd8ImilvgqNB/zXy3o9FHTyLMsunMJ3rDH5IquDr2 E=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 29 Oct 2020 16:58:53 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg01-sd.qualcomm.com with ESMTP; 29 Oct 2020 16:58:53 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 54EE9411B; Thu, 29 Oct 2020 18:58:53 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: tsimpson@quicinc.com
Subject: [RFC PATCH v5 10/33] Hexagon (target/hexagon) instruction and packet
 types
Date: Thu, 29 Oct 2020 18:58:27 -0500
Message-Id: <1604015931-23005-11-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604015931-23005-1-git-send-email-tsimpson@quicinc.com>
References: <1604015931-23005-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=199.106.114.38;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-01.qualcomm.com
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
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlIGluc25fdCBhbmQgcGFja2V0X3QgYXJlIHRoZSBpbnRlcmZhY2UgYmV0d2VlbiBpbnN0cnVj
dGlvbiBkZWNvZGluZyBhbmQKVENHIGNvZGUgZ2VuZXJhdGlvbgoKU2lnbmVkLW9mZi1ieTogVGF5
bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgotLS0KIHRhcmdldC9oZXhhZ29uL2lu
c24uaCB8IDc0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDc0IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0
NCB0YXJnZXQvaGV4YWdvbi9pbnNuLmgKCmRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9pbnNu
LmggYi90YXJnZXQvaGV4YWdvbi9pbnNuLmgKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAw
MDAwMC4uNWY1N2FjZQotLS0gL2Rldi9udWxsCisrKyBiL3RhcmdldC9oZXhhZ29uL2luc24uaApA
QCAtMCwwICsxLDc0IEBACisvKgorICogIENvcHlyaWdodChjKSAyMDE5LTIwMjAgUXVhbGNvbW0g
SW5ub3ZhdGlvbiBDZW50ZXIsIEluYy4gQWxsIFJpZ2h0cyBSZXNlcnZlZC4KKyAqCisgKiAgVGhp
cyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9v
ciBtb2RpZnkKKyAqICBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1Ymxp
YyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQorICogIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRp
b247IGVpdGhlciB2ZXJzaW9uIDIgb2YgdGhlIExpY2Vuc2UsIG9yCisgKiAgKGF0IHlvdXIgb3B0
aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi4KKyAqCisgKiAgVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1
dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsCisgKiAgYnV0IFdJVEhPVVQg
QU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YKKyAqICBN
RVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUg
dGhlCisgKiAgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KKyAq
CisgKiAgWW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwg
UHVibGljIExpY2Vuc2UKKyAqICBhbG9uZyB3aXRoIHRoaXMgcHJvZ3JhbTsgaWYgbm90LCBzZWUg
PGh0dHA6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy8+LgorICovCisKKyNpZm5kZWYgSEVYQUdPTl9J
TlNOX0gKKyNkZWZpbmUgSEVYQUdPTl9JTlNOX0gKKworI2luY2x1ZGUgImNwdS5oIgorCisjZGVm
aW5lIElOU1RSVUNUSU9OU19NQVggNyAgICAvKiAyIHBhaXJzICsgbG9vcGVuZCAqLworI2RlZmlu
ZSBSRUdfT1BFUkFORFNfTUFYIDUKKyNkZWZpbmUgSU1NRURTX01BWCAyCisKK3N0cnVjdCBJbnN0
cnVjdGlvbjsKK3N0cnVjdCBQYWNrZXQ7CitzdHJ1Y3QgRGlzYXNDb250ZXh0OworCit0eXBlZGVm
IHZvaWQgKCpTZW1hbnRpY0luc24pKENQVUhleGFnb25TdGF0ZSAqZW52LAorICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBzdHJ1Y3QgRGlzYXNDb250ZXh0ICpjdHgsCisgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHN0cnVjdCBJbnN0cnVjdGlvbiAqaW5zbiwKKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgc3RydWN0IFBhY2tldCAqcGt0KTsKKworc3RydWN0IEluc3RydWN0aW9u
IHsKKyAgICBTZW1hbnRpY0luc24gZ2VuZXJhdGU7ICAgICAgICAgICAgLyogcG9pbnRlciB0byBn
ZW5wdHIgcm91dGluZSAqLworICAgIHVpbnQ4X3QgcmVnbm9bUkVHX09QRVJBTkRTX01BWF07ICAg
IC8qIHJlZyBvcGVyYW5kcyBpbmNsdWRpbmcgcHJlZGljYXRlcyAqLworICAgIHVpbnQxNl90IG9w
Y29kZTsKKworICAgIHVpbnQzMl90IGljbGFzczo2OworICAgIHVpbnQzMl90IHNsb3Q6MzsKKyAg
ICB1aW50MzJfdCBwYXJ0MToxOyAgICAgICAgLyoKKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICogY21wLWp1bXBzIGFyZSBzcGxpdCBpbnRvIHR3byBpbnNucy4KKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICogc2V0IGZvciB0aGUgY29tcGFyZSBhbmQgY2xlYXIgZm9yIHRoZSBq
dW1wCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqLworICAgIHVpbnQzMl90IGV4dGVu
c2lvbl92YWxpZDoxOyAgIC8qIEhhcyBhIGNvbnN0YW50IGV4dGVuZGVyIGF0dGFjaGVkICovCisg
ICAgdWludDMyX3Qgd2hpY2hfZXh0ZW5kZWQ6MTsgICAgLyogSWYgaGFzIGFuIGV4dGVuZGVyLCB3
aGljaCBpbW1lZGlhdGUgKi8KKyAgICB1aW50MzJfdCBpc19lbmRsb29wOjE7ICAgLyogVGhpcyBp
cyBhbiBlbmQgb2YgbG9vcCAqLworICAgIHVpbnQzMl90IG5ld192YWx1ZV9wcm9kdWNlcl9zbG90
OjQ7CisgICAgaW50MzJfdCBpbW1lZFtJTU1FRFNfTUFYXTsgICAgLyogaW1tZWRpYXRlIGZpZWxk
ICovCit9OworCit0eXBlZGVmIHN0cnVjdCBJbnN0cnVjdGlvbiBJbnNuOworCitzdHJ1Y3QgUGFj
a2V0IHsKKyAgICB1aW50MTZfdCBudW1faW5zbnM7CisgICAgdWludDE2X3QgZW5jb2RfcGt0X3Np
emVfaW5fYnl0ZXM7CisKKyAgICAvKiBQcmUtZGVjb2RlcyBhYm91dCBDT0YgKi8KKyAgICB1aW50
MzJfdCBwa3RfaGFzX2NvZjoxOyAgICAgICAgICAvKiBIYXMgYW55IGNoYW5nZS1vZi1mbG93ICov
CisgICAgdWludDMyX3QgcGt0X2hhc19lbmRsb29wOjE7CisKKyAgICB1aW50MzJfdCBwa3RfaGFz
X2RjemVyb2E6MTsKKworICAgIHVpbnQzMl90IHBrdF9oYXNfc3RvcmVfczA6MTsKKyAgICB1aW50
MzJfdCBwa3RfaGFzX3N0b3JlX3MxOjE7CisKKyAgICBJbnNuIGluc25bSU5TVFJVQ1RJT05TX01B
WF07Cit9OworCit0eXBlZGVmIHN0cnVjdCBQYWNrZXQgUGFja2V0OworCisjZW5kaWYKLS0gCjIu
Ny40Cgo=

