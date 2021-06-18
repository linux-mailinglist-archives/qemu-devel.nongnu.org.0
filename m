Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8709A3AD286
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 21:08:40 +0200 (CEST)
Received: from localhost ([::1]:38712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luJr5-0005wH-1H
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 15:08:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1luJpc-00044l-3N
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:07:08 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:21177)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1luJpZ-0004DA-2z
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:07:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1624043225; x=1655579225;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BUdhgAw+0VwBg435+PcO9zcEXJetPdW81A1YNj5tcXc=;
 b=jTJlE5KGCZ2Bxr3zbO/C72/Y4MjaEsK3UU/x+9+jfPScVZq3P63kc7op
 sOc55Jfr809w/+9YUhfOYy7FZtyeOnBtf7r1xQHeqI42x8dr5etAWSCeM
 q63KEdLOJpaBH/Jk87N9W5k4tSwacj8AabpaNd2YJ1f2CHhBnTRqhPuDp 0=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 18 Jun 2021 12:07:02 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg01-sd.qualcomm.com with ESMTP; 18 Jun 2021 12:07:02 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 03346165A; Fri, 18 Jun 2021 14:07:02 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/4] Hexagon (target/hexagon) bug fixes
Date: Fri, 18 Jun 2021 14:06:38 -0500
Message-Id: <1624043202-20124-1-git-send-email-tsimpson@quicinc.com>
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

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCAzY2NmNmNkMGUzZTFkZmQ2NjM4MTQ2
NDBiM2IxOGI1NTcxNWQ3YTc1OgoKICBNZXJnZSByZW1vdGUtdHJhY2tpbmcgYnJhbmNoICdyZW1v
dGVzL2tyYXhlbC90YWdzL2F1ZGlvLTIwMjEwNjE3LXB1bGwtcmVxdWVzdCcgaW50byBzdGFnaW5n
ICgyMDIxLTA2LTE4IDA5OjU0OjQyICswMTAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgZ2l0IHJl
cG9zaXRvcnkgYXQ6CgogIGh0dHBzOi8vZ2l0aHViLmNvbS9xdWljL3FlbXUgdGFncy9wdWxsLWhl
eC0yMDIxMDYxOAoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDEzY2UyYWUwMzAwMDEz
N2UxZGU4ZDQwZmY3Y2VhZTQ2ZmNiMzRjZDU6CgogIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBy
ZW1vdmUgdW51c2VkIFRDRyB2YXJpYWJsZXMgKDIwMjEtMDYtMTggMTM6MjY6MDcgLTA1MDApCgot
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCkZpeGVzIGZvciBidWdzIGZvdW5kIGJ5IGluc3BlY3Rpb24gYW5kIGludGVybmFsIHRl
c3RpbmcKVGVzdHMgYWRkZWQgdG8gdGVzdHMvdGNnL2hleGFnb24vbWlzYy5jCgotLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClRh
eWxvciBTaW1wc29uICg0KToKICAgICAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIGZpeCBidWcg
aW4gZkxTQk5FVyoKICAgICAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIGZpeCBsMmZldGNoIGlu
c3RydWN0aW9ucwogICAgICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgY2xlYW51cCBnZW5fc3Rv
cmVfY29uZGl0aW9uYWxbNDhdIGZ1bmN0aW9ucwogICAgICBIZXhhZ29uICh0YXJnZXQvaGV4YWdv
bikgcmVtb3ZlIHVudXNlZCBUQ0cgdmFyaWFibGVzCgogdGFyZ2V0L2hleGFnb24vZ2VuX3RjZy5o
ICAgICAgICAgICAgICB8IDE1ICsrKysrKysrKy0tCiB0YXJnZXQvaGV4YWdvbi9tYWNyb3MuaCAg
ICAgICAgICAgICAgIHwgMjkgKysrKysrKystLS0tLS0tLS0tLS0tCiB0YXJnZXQvaGV4YWdvbi9n
ZW5wdHIuYyAgICAgICAgICAgICAgIHwgMTYgKysrLS0tLS0tLS0tCiB0YXJnZXQvaGV4YWdvbi9v
cF9oZWxwZXIuYyAgICAgICAgICAgIHwgIDUgLS0tLQogdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRl
LmMgICAgICAgICAgICB8IDExICsrLS0tLS0tCiB0ZXN0cy90Y2cvaGV4YWdvbi9taXNjLmMgICAg
ICAgICAgICAgIHwgNDggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KIHRhcmdl
dC9oZXhhZ29uL2ltcG9ydGVkL2VuY29kZV9wcC5kZWYgfCAgMyArKysKIDcgZmlsZXMgY2hhbmdl
ZCwgODAgaW5zZXJ0aW9ucygrKSwgNDcgZGVsZXRpb25zKC0pCg==

