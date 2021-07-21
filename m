Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F4C3D18FB
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 23:21:52 +0200 (CEST)
Received: from localhost ([::1]:49556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Jf5-0006Yq-MC
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 17:21:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1m6JdF-0004ii-Oc
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 17:19:57 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:23035)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1m6JdD-0001IN-K1
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 17:19:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1626902395; x=1658438395;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wC7BztmSMyIsLHHpVKyJv+/iquEpk4XiuQs+HPkp/js=;
 b=wLE8okjOjH7ZUs12HbyEfF/zc73TmYPzVhIhBqtISwXofHJxEsA6EcHK
 z4bDSEe+cG3r9tme4y4ecMaG4RP9wd6PD5qSrWI4U+sbuRC6X31HQscvj
 aFauoew0ZwyXwAXbBgpb9TdYIXWBO39vXxUjRWnPhOvnNZlfgx3sFApFx g=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 21 Jul 2021 14:19:52 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg05-sd.qualcomm.com with ESMTP; 21 Jul 2021 14:19:52 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id AB2B4115D; Wed, 21 Jul 2021 16:19:51 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/3] SIGSEGV fixes
Date: Wed, 21 Jul 2021 16:19:32 -0500
Message-Id: <1626902375-7002-1-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
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

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA3NDU3YjQwN2VkZDZlODU1NWU0YjQ2
NDg4YWFiMmYxMzk1OWZjY2Y4OgoKICBNZXJnZSByZW1vdGUtdHJhY2tpbmcgYnJhbmNoICdyZW1v
dGVzL3RodXRoLWdpdGxhYi90YWdzL3B1bGwtcmVxdWVzdC0yMDIxLTA3LTE5JyBpbnRvIHN0YWdp
bmcgKDIwMjEtMDctMTkgMTE6MzQ6MDggKzAxMDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBnaXQg
cmVwb3NpdG9yeSBhdDoKCiAgaHR0cHM6Ly9naXRodWIuY29tL3F1aWMvcWVtdSB0YWdzL3B1bGwt
aGV4LTIwMjEwNzIxCgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gOTUzZWEzZTRiNDI2
ZWUwYzgzNDkzNDNjNTNlMzM1OGNmZWM3MjBmMjoKCiAgbGludXgtdGVzdCAodGVzdHMvdGNnL211
bHRpYXJjaC9saW51eC10ZXN0LmMpIGFkZCBjaGVjayAoMjAyMS0wNy0yMSAxNTo1NDoyOCAtMDUw
MCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KVGhlIEhleGFnb24gdGFyZ2V0IHdhcyBzaWxlbnRseSBmYWlsaW5nIHRoZSBT
SUdTRUdWIHRlc3QgYmVjYXVzZQp0aGUgc2lnbmFsIGhhbmRsZXIgd2FzIG5vdCBjYWxsZWQuCgpQ
YXRjaCAxLzMgZml4ZXMgdGhlIEhleGFnb24gdGFyZ2V0ClBhdGNoIDIvMyBkcm9wcyBpbmNsdWRl
IHFlbXUuaCBmcm9tIHRhcmdldC9oZXhhZ29uL29wX2hlbHBlci5jClBhdGNoIDMvMyBhZGRzIGEg
Y2hlY2sgdGhhdCB0aGUgc2lnbmFsIGhhbmRsZXIgaXMgY2FsbGVkCgotLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClBldGVyIE1h
eWRlbGwgKDEpOgogICAgICB0YXJnZXQvaGV4YWdvbjogRHJvcCBpbmNsdWRlIG9mIHFlbXUuaAoK
VGF5bG9yIFNpbXBzb24gKDIpOgogICAgICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgcmVtb3Zl
IHB1dF91c2VyXyovZ2V0X3VzZXJfKgogICAgICBsaW51eC10ZXN0ICh0ZXN0cy90Y2cvbXVsdGlh
cmNoL2xpbnV4LXRlc3QuYykgYWRkIGNoZWNrCgogdGFyZ2V0L2hleGFnb24vb3BfaGVscGVyLmMg
ICAgICAgfCA0MiArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiB0ZXN0
cy90Y2cvbXVsdGlhcmNoL2xpbnV4LXRlc3QuYyB8ICA4ICsrKysrKysrCiAyIGZpbGVzIGNoYW5n
ZWQsIDI4IGluc2VydGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQo=

