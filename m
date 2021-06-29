Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2737A3B7702
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 19:17:28 +0200 (CEST)
Received: from localhost ([::1]:44846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyHMV-0000NC-6k
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 13:17:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lyHK5-0005sb-9M
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 13:14:57 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:17372)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lyHK3-0001dx-FE
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 13:14:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1624986895; x=1656522895;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2rDaFm281FT7nU8a4h97GjdCKIU85aT9rAQAECGF+Qw=;
 b=YSRkCch3/btypPuG2DbupV3St8OZyEcnDs7b4beDHVCvpdaon7u8JY7J
 p9dJH2u9ddBBS6sLM1GrZWyvQJwTpjWHGLGQ2VspV3GDr/sKDzpNvbwXX
 vCfhi6dvRTMUKf+/9NbUVgMXpg9Ddrf8U9ucBgA9PT8YtCEclnHJz+4Ju k=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 29 Jun 2021 10:14:51 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP; 29 Jun 2021 10:14:50 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 94604E3B; Tue, 29 Jun 2021 12:14:50 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 0/4] Hexagon (target/hexagon) bug fixes
Date: Tue, 29 Jun 2021 12:14:32 -0500
Message-Id: <1624986876-2264-1-git-send-email-tsimpson@quicinc.com>
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
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: ale@rev.ng, peter.maydell@linaro.org, bcain@quicinc.com,
 richard.henderson@linaro.org, tsimpson@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCAxM2Q1Zjg3Y2MzYjk0YmZjY2M1MDEx
NDJkZjRhN2IxMmZlZTNhNmU3OgoKICBNZXJnZSByZW1vdGUtdHJhY2tpbmcgYnJhbmNoICdyZW1v
dGVzL3J0aC1naXRsYWIvdGFncy9wdWxsLWF4cC0yMDIxMDYyOCcgaW50byBzdGFnaW5nICgyMDIx
LTA2LTI5IDEwOjAyOjQyICswMTAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgZ2l0IHJlcG9zaXRv
cnkgYXQ6CgogIGh0dHBzOi8vZ2l0aHViLmNvbS9xdWljL3FlbXUgdGFncy9wdWxsLWhleC0yMDIx
MDYyOQoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIGZiODU4ZmI3NmIxYjJkZmRmNjRm
ODI2NjlkZjEyNzBjMGMxOWEwMzM6CgogIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSByZW1vdmUg
dW51c2VkIFRDRyB2YXJpYWJsZXMgKDIwMjEtMDYtMjkgMTE6MzI6NTAgLTA1MDApCgotLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CkZpeGVzIGZvciBidWdzIGZvdW5kIGJ5IGluc3BlY3Rpb24gYW5kIGludGVybmFsIHRlc3RpbmcK
VGVzdHMgYWRkZWQgdG8gdGVzdHMvdGNnL2hleGFnb24vbWlzYy5jCgotLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClRheWxvciBT
aW1wc29uICg0KToKICAgICAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIGZpeCBidWcgaW4gZkxT
Qk5FVyoKICAgICAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIGZpeCBsMmZldGNoIGluc3RydWN0
aW9ucwogICAgICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgY2xlYW51cCBnZW5fc3RvcmVfY29u
ZGl0aW9uYWxbNDhdIGZ1bmN0aW9ucwogICAgICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgcmVt
b3ZlIHVudXNlZCBUQ0cgdmFyaWFibGVzCgogdGFyZ2V0L2hleGFnb24vZ2VuX3RjZy5oICAgICAg
ICAgICAgICB8IDE1ICsrKysrKysrKy0tCiB0YXJnZXQvaGV4YWdvbi9tYWNyb3MuaCAgICAgICAg
ICAgICAgIHwgMzAgKysrKysrKystLS0tLS0tLS0tLS0tLQogdGFyZ2V0L2hleGFnb24vZ2VucHRy
LmMgICAgICAgICAgICAgICB8IDIyICsrKy0tLS0tLS0tLS0tLS0KIHRhcmdldC9oZXhhZ29uL29w
X2hlbHBlci5jICAgICAgICAgICAgfCAgNSAtLS0tCiB0YXJnZXQvaGV4YWdvbi90cmFuc2xhdGUu
YyAgICAgICAgICAgIHwgMTEgKystLS0tLS0KIHRlc3RzL3RjZy9oZXhhZ29uL21pc2MuYyAgICAg
ICAgICAgICAgfCA0OCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQogdGFyZ2V0
L2hleGFnb24vaW1wb3J0ZWQvZW5jb2RlX3BwLmRlZiB8ICAzICsrKwogNyBmaWxlcyBjaGFuZ2Vk
LCA4MCBpbnNlcnRpb25zKCspLCA1NCBkZWxldGlvbnMoLSkK

