Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C113D5035
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Jul 2021 23:44:07 +0200 (CEST)
Received: from localhost ([::1]:57504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7lun-000309-UU
	for lists+qemu-devel@lfdr.de; Sun, 25 Jul 2021 17:44:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1m7ltj-0001iF-R6
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 17:42:59 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:3744)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1m7ltg-0005XQ-Rn
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 17:42:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1627249376; x=1658785376;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=I6FmYXeTTecnSdP1KbsFLhoVMkXszXVMG+sV3po8MBw=;
 b=zISwdzYi2po2IoQdhVK+ZFHzRHNBfkL7+oaNF1gNt4Rg8TuAnoDLkfwA
 cyGLLNM+DFJZAbX6oP4RgtMok86d23Or07FK1sHhLsEot1eM0cRN8F6UE
 B3pv7irCm6hMn+bvpxBFDmTnYPTxA8afKxTKkG6apfuZnaPsidFVOpsK5 Q=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 25 Jul 2021 14:42:53 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg04-sd.qualcomm.com with ESMTP; 25 Jul 2021 14:42:53 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id ABE0511C0; Sun, 25 Jul 2021 16:42:52 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 0/2] Hexagon (target/hexagon) remove put_user_*/get_user_*
Date: Sun, 25 Jul 2021 16:42:46 -0500
Message-Id: <1627249368-8366-1-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: ale@rev.ng, peter.maydell@linaro.org, bcain@quicinc.com,
 richard.henderson@linaro.org, tsimpson@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA3NDU3YjQwN2VkZDZlODU1NWU0YjQ2
NDg4YWFiMmYxMzk1OWZjY2Y4OgoKICBNZXJnZSByZW1vdGUtdHJhY2tpbmcgYnJhbmNoICdyZW1v
dGVzL3RodXRoLWdpdGxhYi90YWdzL3B1bGwtcmVxdWVzdC0yMDIxLTA3LTE5JyBpbnRvIHN0YWdp
bmcgKDIwMjEtMDctMTkgMTE6MzQ6MDggKzAxMDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBnaXQg
cmVwb3NpdG9yeSBhdDoKCiAgaHR0cHM6Ly9naXRodWIuY29tL3F1aWMvcWVtdSB0YWdzL3B1bGwt
aGV4LTIwMjEwNzI1Cgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gMjVmYzliNzljZDA1
N2UzOTRmMzVkN2FmYzE4NDkzYmVjZDUxNTc5NzoKCiAgdGFyZ2V0L2hleGFnb246IERyb3AgaW5j
bHVkZSBvZiBxZW11LmggKDIwMjEtMDctMjEgMTU6NTQ6MDIgLTA1MDApCgotLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClRoZSBI
ZXhhZ29uIHRhcmdldCB3YXMgc2lsZW50bHkgZmFpbGluZyB0aGUgU0lHU0VHViB0ZXN0IGJlY2F1
c2UKdGhlIHNpZ25hbCBoYW5kbGVyIHdhcyBub3QgY2FsbGVkLgoKUGF0Y2ggMS8yIGZpeGVzIHRo
ZSBIZXhhZ29uIHRhcmdldApQYXRjaCAyLzIgZHJvcHMgaW5jbHVkZSBxZW11LmggZnJvbSB0YXJn
ZXQvaGV4YWdvbi9vcF9oZWxwZXIuYwoKKioqKiBDaGFuZ2VzIGluIHYyICoqKioKRHJvcCBjaGFu
Z2VzIHRvIGxpbnV4LXRlc3QuYyBkdWUgdG8gaW50ZXJtaXR0ZW50IGZhaWx1cmVzIG9uIHJpc2N2
CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tClBldGVyIE1heWRlbGwgKDEpOgogICAgICB0YXJnZXQvaGV4YWdvbjogRHJvcCBp
bmNsdWRlIG9mIHFlbXUuaAoKVGF5bG9yIFNpbXBzb24gKDEpOgogICAgICBIZXhhZ29uICh0YXJn
ZXQvaGV4YWdvbikgcmVtb3ZlIHB1dF91c2VyXyovZ2V0X3VzZXJfKgoKIHRhcmdldC9oZXhhZ29u
L29wX2hlbHBlci5jIHwgNDIgKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMjIgZGVsZXRpb25zKC0pCg==

