Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E98D3882F0
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 01:04:09 +0200 (CEST)
Received: from localhost ([::1]:42860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj8ky-0006nP-MG
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 19:04:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lj8hQ-00036E-RQ
 for qemu-devel@nongnu.org; Tue, 18 May 2021 19:00:28 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:43008)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lj8hO-0001ft-JU
 for qemu-devel@nongnu.org; Tue, 18 May 2021 19:00:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1621378826; x=1652914826;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PrQVS1AUWHVrWhMNld1zpqyvfrD1c3WdogdLY38SMJ0=;
 b=Q2uF17GmTn2Co1mL3N0Ai+UNlh2+qdqIBONq8E6IaxGgsJ/Ecr1MqCC/
 hHCJa9ivXa9zfsVY7hfJEJ7YHrnsZRK5w90a9Mj/CuHFO4Yi0Ky23JqEI
 oqk6rBNV4oboYB7GBKPH1uqJf78SI6HOg7RR/ZQn/Jqx5eImXsBjlKEcy w=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 18 May 2021 16:00:19 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg01-sd.qualcomm.com with ESMTP; 18 May 2021 16:00:18 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 63AB2110E; Tue, 18 May 2021 18:00:18 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] Hexagon (target/hexagon) bug fixes
Date: Tue, 18 May 2021 18:00:08 -0500
Message-Id: <1621378810-5284-1-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
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
Cc: ale@rev.ng, philmd@redhat.com, tsimpson@quicinc.com,
 richard.henderson@linaro.org, bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rml4ZXMgZm9yIGJ1Z3MgZm91bmQgYnkgaW5zcGVjdGlvbiBhbmQgaW50ZXJuYWwgdGVzdGluZwpU
ZXN0cyBhZGRlZCB0byB0ZXN0cy90Y2cvaGV4YWdvbi9taXNjLmMKClRheWxvciBTaW1wc29uICgy
KToKICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgZml4IGJ1ZyBpbiBmTFNCTkVXKgogIEhleGFn
b24gKHRhcmdldC9oZXhhZ29uKSBmaXggbDJmZXRjaCBpbnN0cnVjdGlvbnMKCiB0YXJnZXQvaGV4
YWdvbi9nZW5fdGNnLmggICAgICAgICAgICAgIHwgMTEgKysrKysrKysKIHRhcmdldC9oZXhhZ29u
L21hY3Jvcy5oICAgICAgICAgICAgICAgfCAyNyArKysrKysrKy0tLS0tLS0tLS0tLQogdGFyZ2V0
L2hleGFnb24vb3BfaGVscGVyLmMgICAgICAgICAgICB8ICA1IC0tLS0KIHRlc3RzL3RjZy9oZXhh
Z29uL21pc2MuYyAgICAgICAgICAgICAgfCA0OCArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrLQogdGFyZ2V0L2hleGFnb24vaW1wb3J0ZWQvZW5jb2RlX3BwLmRlZiB8ICAzICsrKwog
NSBmaWxlcyBjaGFuZ2VkLCA3MSBpbnNlcnRpb25zKCspLCAyMyBkZWxldGlvbnMoLSkKCi0tIAoy
LjcuNAoK

