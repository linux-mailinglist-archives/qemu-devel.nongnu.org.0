Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 680D656AD33
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 23:08:11 +0200 (CEST)
Received: from localhost ([::1]:60872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9YjK-0001ai-1r
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 17:08:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1o9YhP-0007CO-Mh
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 17:06:12 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:7000)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1o9YhN-0002SW-PH
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 17:06:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1657227970; x=1688763970;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oIf5Bu+5/7kzEHxTPaLXSbAfak8yMP7f+ILJKwoXLsw=;
 b=QXuwK69OEZW31g4V5HA3wUhNBREE83LWMPxNBtDHPe9o2XKuTEkATNJZ
 D3LFkunYXfqCyTDw2u52EUePk7IRhCm0j5kfK3v1X5nvVpTcBkBz4OCJn
 kxA1h8+qacm0G9XdfrAViBzt+F+7JrXX4wAjIS8b+XBHg7jpFTceoTGb2 M=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 07 Jul 2022 14:06:05 -0700
X-QCInternal: smtphost
Received: from hu-tsimpson-lv.qualcomm.com (HELO
 hu-devc-lv-u18-c.qualcomm.com) ([10.47.235.220])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP; 07 Jul 2022 14:06:04 -0700
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id B784650018F; Thu,  7 Jul 2022 14:06:04 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, f4bug@amsat.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, mlambert@quicinc.com
Subject: [PATCH 0/2] Hexagon (target/hexagon) bug fixes for mem_noshuf
Date: Thu,  7 Jul 2022 14:05:44 -0700
Message-Id: <20220707210546.15985-1-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=129.46.98.28; envelope-from=tsimpson@qualcomm.com;
 helo=alexa-out.qualcomm.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UmVjYWxsIHRoYXQgdGhlIHNlbWFudGljcyBvZiBhIEhleGFnb24gbWVtX25vc2h1ZiBwYWNrZXQg
YXJlIHRoYXQgdGhlCnN0b3JlIGVmZmVjdGl2ZWx5IGhhcHBlbnMgYmVmb3JlIHRoZSBsb2FkLiAg
VGhlcmUgYXJlIHR3byBidWcgZml4ZXMKaW4gdGhpcyBzZXJpZXMuCgoKVGF5bG9yIFNpbXBzb24g
KDIpOgogIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBmaXggc3RvcmUgdy9tZW1fbm9zaHVmICYg
cHJlZGljYXRlZCBsb2FkCiAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIGZpeCBidWcgaW4gbWVt
X25vc2h1ZiBsb2FkIGV4Y2VwdGlvbgoKIHRhcmdldC9oZXhhZ29uL2dlbl90Y2cuaCAgICAgICAg
ICAgICAgICAgfCAgMTAgKy0KIHRhcmdldC9oZXhhZ29uL2hlbHBlci5oICAgICAgICAgICAgICAg
ICAgfCAgIDEgKwogdGFyZ2V0L2hleGFnb24vbWFjcm9zLmggICAgICAgICAgICAgICAgICB8ICAz
NyArKysrLS0KIHRhcmdldC9oZXhhZ29uL2dlbnB0ci5jICAgICAgICAgICAgICAgICAgfCAgIDcg
KysKIHRhcmdldC9oZXhhZ29uL29wX2hlbHBlci5jICAgICAgICAgICAgICAgfCAgMjMgKysrLQog
dGVzdHMvdGNnL2hleGFnb24vbWVtX25vc2h1Zi5jICAgICAgICAgICB8IDEyMiArKysrKysrKysr
KysrKysrKystCiB0ZXN0cy90Y2cvaGV4YWdvbi9tZW1fbm9zaHVmX2V4Y2VwdGlvbi5jIHwgMTQ2
ICsrKysrKysrKysrKysrKysrKysrKysrCiB0ZXN0cy90Y2cvaGV4YWdvbi9NYWtlZmlsZS50YXJn
ZXQgICAgICAgIHwgICAxICsKIDggZmlsZXMgY2hhbmdlZCwgMzIzIGluc2VydGlvbnMoKyksIDI0
IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3RzL3RjZy9oZXhhZ29uL21lbV9u
b3NodWZfZXhjZXB0aW9uLmMKCi0tIAoyLjE3LjEKCg==

