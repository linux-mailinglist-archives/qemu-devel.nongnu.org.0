Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 801D243F5E1
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 06:07:00 +0200 (CEST)
Received: from localhost ([::1]:56612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgJAR-0001kJ-32
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 00:06:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mgJ6t-0008A3-5n
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:03:19 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:52636)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mgJ6m-0004H1-W1
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:03:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1635480192; x=1667016192;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=96J5MWjDjaR23ssNxAieWpgeW3YrcUIZib/EFDyxk+g=;
 b=uvtI/PpDgCNClkiyvCEWGFcY53PhnwybG1RB4qE5szoXZ5setbeKFVgi
 PsLkVN+BxFH1531nETTewGl3AsQ2LmHphGc97C/qXiw+UuPl+qnLrQlZG
 jLSD5+9l8lMu1qF0sdz3JLv0Y6eN7WwKp8HPJb9ThSUa9f8i1jdqxqEFU g=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 28 Oct 2021 21:03:09 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg02-sd.qualcomm.com with ESMTP; 28 Oct 2021 21:03:08 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 732EE1864; Thu, 28 Oct 2021 23:03:08 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/2] Hexagon (target/hexagon) cleanup and bug fix
Date: Thu, 28 Oct 2021 23:02:56 -0500
Message-Id: <1635480178-26461-1-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-02.qualcomm.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBjNTJkNjllN2RiYWFlZDBmZmRlZjgx
MjVlNzkyMTg2NzJjMzAxNjFkOgoKICBNZXJnZSByZW1vdGUtdHJhY2tpbmcgYnJhbmNoICdyZW1v
dGVzL2NzY2hvZW5lYmVjay90YWdzL3B1bGwtOXAtMjAyMTEwMjcnIGludG8gc3RhZ2luZyAoMjAy
MS0xMC0yNyAxMTo0NToxOCAtMDcwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIGdpdCByZXBvc2l0
b3J5IGF0OgoKICBodHRwczovL2dpdGh1Yi5jb20vcXVpYy9xZW11IHRhZ3MvcHVsbC1oZXgtMjAy
MTEwMjgKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBiOWRkNmZmOTFkMjliOWUzOGFm
ZDdmYWNmMWQ2ODNmMzRiZDFlYzEwOgoKICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgcHV0IHdy
aXRlcyB0byBVU1IgaW50byB0ZW1wIHVudGlsIGNvbW1pdCAoMjAyMS0xMC0yOCAyMjoyMjo0OSAt
MDUwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KRm9sbG93dXAgdG8gcmVwbGFjZSBtb3JlIHRjZ19jb25zdF8qIHdpdGgg
dGNnX2NvbnN0YW50X3RsKgpGaXggYnVnIHRvIGRlbGF5IHdyaXRlcyB0byBVU1IgdW50aWwgcGFj
a2V0IGNvbW1pdAoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQpUYXlsb3IgU2ltcHNvbiAoMik6CiAgICAgIEhleGFnb24gKHRh
cmdldC9oZXhhZ29uKSBtb3JlIHRjZ19jb25zdGFudF8qCiAgICAgIEhleGFnb24gKHRhcmdldC9o
ZXhhZ29uKSBwdXQgd3JpdGVzIHRvIFVTUiBpbnRvIHRlbXAgdW50aWwgY29tbWl0CgogdGFyZ2V0
L2hleGFnb24vZ2VuX3RjZy5oICAgICAgICAgIHwgICA5ICsrLS0KIHRhcmdldC9oZXhhZ29uL21h
Y3Jvcy5oICAgICAgICAgICB8ICAgOSArKy0tCiB0YXJnZXQvaGV4YWdvbi9hdHRyaWJzX2RlZi5o
LmluYyAgfCAgIDEgKwogdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmMgICAgICAgIHwgIDEyICsr
Ky0tCiB0ZXN0cy90Y2cvaGV4YWdvbi9vdmVyZmxvdy5jICAgICAgfCAxMDcgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysKIHRhcmdldC9oZXhhZ29uL2dlbl90Y2dfZnVuY3Mu
cHkgICB8ICAxMSArLS0tCiB0YXJnZXQvaGV4YWdvbi9oZXhfY29tbW9uLnB5ICAgICAgfCAgIDIg
KwogdGVzdHMvdGNnL2hleGFnb24vTWFrZWZpbGUudGFyZ2V0IHwgICAxICsKIDggZmlsZXMgY2hh
bmdlZCwgMTI5IGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAw
NjQ0IHRlc3RzL3RjZy9oZXhhZ29uL292ZXJmbG93LmMK

