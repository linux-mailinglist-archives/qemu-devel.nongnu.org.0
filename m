Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA0B4242CF
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 18:37:29 +0200 (CEST)
Received: from localhost ([::1]:59500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY9v6-0004zK-S2
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 12:37:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mY99H-000802-PF
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:48:05 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:26526)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mY99F-0001oQ-H0
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:48:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1633535281; x=1665071281;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R2uNPI4ZU+ZJpRZm4AVOZuHf0H99ndZVoMGIrxCx5l4=;
 b=iq1OyMgk4JIU04Ot8f8kO5NzTlzQ7GDF5nzCle/baNV95HBXxPb+aG7u
 tWKnhvIU+CluRcVf35H3O4k0k2OV8kT3TKDNOijwDOUvIHMN6Byvt0rc/
 POz4LIy7JR7LRxnJ0gk+72dzS8BXnE141czobXT2bF2aWocXH0qA2SvNR o=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 06 Oct 2021 08:47:54 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg04-sd.qualcomm.com with ESMTP; 06 Oct 2021 08:47:53 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 511D1115A; Wed,  6 Oct 2021 10:47:53 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/3] target/hexagon: Remove unused TCG temporary from
 predicated loads
Date: Wed,  6 Oct 2021 10:47:50 -0500
Message-Id: <1633535271-17986-3-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633535271-17986-1-git-send-email-tsimpson@quicinc.com>
References: <1633535271-17986-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: peter.maydell@linaro.org, tsimpson@quicinc.com,
 richard.henderson@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFtc2F0Lm9yZz4KClRoZSBnZW5f
cHJlZF9jYW5jZWwoKSBmdW5jdGlvbiwgaW50cm9kdWNlZCBpbiBjb21taXQgYTY0NmU5OWNiOTAK
KEhleGFnb24gbWFjcm9zKSBkb2Vzbid0IHVzZSB0aGUgJ29uZScgVENHIHRlbXBvcmFyeTsgcmVt
b3ZlIGl0LgoKUmV2aWV3ZWQtYnk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNv
bkBsaW5hcm8ub3JnPgpSZXZpZXdlZC1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNp
bmMuY29tPgpTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8ZjRidWdAYW1z
YXQub3JnPgpNZXNzYWdlLUlkOiA8MjAyMTEwMDMwMDQ3NTAuMzYwODk4My0yLWY0YnVnQGFtc2F0
Lm9yZz4KLS0tCiB0YXJnZXQvaGV4YWdvbi9tYWNyb3MuaCB8IDIgLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL21hY3Jvcy5oIGIv
dGFyZ2V0L2hleGFnb24vbWFjcm9zLmgKaW5kZXggMDk0YjhkYS4uYWU2NjYzYyAxMDA2NDQKLS0t
IGEvdGFyZ2V0L2hleGFnb24vbWFjcm9zLmgKKysrIGIvdGFyZ2V0L2hleGFnb24vbWFjcm9zLmgK
QEAgLTE5MCw3ICsxOTAsNiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgZ2VuX3ByZWRfY2FuY2VsKFRD
R3YgcHJlZCwgaW50IHNsb3RfbnVtKQogICAgIFRDR3Ygc2xvdF9tYXNrID0gdGNnX2NvbnN0X3Rs
KDEgPDwgc2xvdF9udW0pOwogICAgIFRDR3YgdG1wID0gdGNnX3RlbXBfbmV3KCk7CiAgICAgVENH
diB6ZXJvID0gdGNnX2NvbnN0X3RsKDApOwotICAgIFRDR3Ygb25lID0gdGNnX2NvbnN0X3RsKDEp
OwogICAgIHRjZ19nZW5fb3JfdGwoc2xvdF9tYXNrLCBoZXhfc2xvdF9jYW5jZWxsZWQsIHNsb3Rf
bWFzayk7CiAgICAgdGNnX2dlbl9hbmRpX3RsKHRtcCwgcHJlZCwgMSk7CiAgICAgdGNnX2dlbl9t
b3Zjb25kX3RsKFRDR19DT05EX0VRLCBoZXhfc2xvdF9jYW5jZWxsZWQsIHRtcCwgemVybywKQEAg
LTE5OCw3ICsxOTcsNiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgZ2VuX3ByZWRfY2FuY2VsKFRDR3Yg
cHJlZCwgaW50IHNsb3RfbnVtKQogICAgIHRjZ190ZW1wX2ZyZWUoc2xvdF9tYXNrKTsKICAgICB0
Y2dfdGVtcF9mcmVlKHRtcCk7CiAgICAgdGNnX3RlbXBfZnJlZSh6ZXJvKTsKLSAgICB0Y2dfdGVt
cF9mcmVlKG9uZSk7CiB9CiAjZGVmaW5lIFBSRURfTE9BRF9DQU5DRUwoUFJFRCwgRUEpIFwKICAg
ICBnZW5fcHJlZF9jYW5jZWwoUFJFRCwgaW5zbi0+aXNfZW5kbG9vcCA/IDQgOiBpbnNuLT5zbG90
KQotLSAKMi43LjQKCg==

