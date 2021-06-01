Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED949397CFE
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 01:23:00 +0200 (CEST)
Received: from localhost ([::1]:37608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loDit-0007eG-WE
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 19:23:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1loDft-0003ll-Fk
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 19:19:53 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:13693)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1loDfr-00068C-St
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 19:19:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1622589591; x=1654125591;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SZSkrrhaBeKQKfdK4xedzJEP4GqJqb5Th27SOw+n+WY=;
 b=nJv1R475CdpkBw7LzDrLBEOxGBp1XEzxwN9guIh8pIS+PNImprIF8wuN
 5znlrDeVwQWU8nc+Cp62pJQfkdRyRIknJmQqsiO7IyNrXspjUybx7SC9O
 P0PPOKTrGFjoE9FdB24aSnJ5J6K8LmOBt+buGgUWbDkoxXfXxDEp0XynM Q=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 01 Jun 2021 16:19:46 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP; 01 Jun 2021 16:19:46 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 06F90B42; Tue,  1 Jun 2021 18:19:46 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] Hexagon (target/hexagon) bug fixes and cleanup
Date: Tue,  1 Jun 2021 18:19:40 -0500
Message-Id: <1622589584-22571-1-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
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

Rml4ZXMgZm9yIGJ1Z3MgZm91bmQgYnkgaW5zcGVjdGlvbiBhbmQgaW50ZXJuYWwgdGVzdGluZwpU
ZXN0cyBhZGRlZCB0byB0ZXN0cy90Y2cvaGV4YWdvbi9taXNjLmMKCioqKiBDaGFuZ2VzIGluIHYy
ICoqKgpBZGRlZCBwYXRjaGVzIDMgYW5kIDQKClRheWxvciBTaW1wc29uICg0KToKICBIZXhhZ29u
ICh0YXJnZXQvaGV4YWdvbikgZml4IGJ1ZyBpbiBmTFNCTkVXKgogIEhleGFnb24gKHRhcmdldC9o
ZXhhZ29uKSBmaXggbDJmZXRjaCBpbnN0cnVjdGlvbnMKICBIZXhhZ29uICh0YXJnZXQvaGV4YWdv
bikgY2xlYW51cCBnZW5fc3RvcmVfY29uZGl0aW9uYWxbNDhdIGZ1bmN0aW9ucwogIEhleGFnb24g
KHRhcmdldC9oZXhhZ29uKSByZW1vdmUgdW51c2VkIFRDRyB2YXJpYWJsZXMKCiB0YXJnZXQvaGV4
YWdvbi9nZW5fdGNnLmggICAgICAgICAgICAgIHwgMTUgKysrKysrKysrLS0KIHRhcmdldC9oZXhh
Z29uL21hY3Jvcy5oICAgICAgICAgICAgICAgfCAyOSArKysrKysrKy0tLS0tLS0tLS0tLS0KIHRh
cmdldC9oZXhhZ29uL2dlbnB0ci5jICAgICAgICAgICAgICAgfCAxNiArKystLS0tLS0tLS0KIHRh
cmdldC9oZXhhZ29uL29wX2hlbHBlci5jICAgICAgICAgICAgfCAgNSAtLS0tCiB0YXJnZXQvaGV4
YWdvbi90cmFuc2xhdGUuYyAgICAgICAgICAgIHwgMTEgKystLS0tLS0KIHRlc3RzL3RjZy9oZXhh
Z29uL21pc2MuYyAgICAgICAgICAgICAgfCA0OCArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrLQogdGFyZ2V0L2hleGFnb24vaW1wb3J0ZWQvZW5jb2RlX3BwLmRlZiB8ICAzICsrKwog
NyBmaWxlcyBjaGFuZ2VkLCA4MCBpbnNlcnRpb25zKCspLCA0NyBkZWxldGlvbnMoLSkKCi0tIAoy
LjcuNAoK

