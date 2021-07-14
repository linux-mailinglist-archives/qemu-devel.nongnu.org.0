Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A93E63C9414
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 00:57:05 +0200 (CEST)
Received: from localhost ([::1]:55162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3noO-00085W-6H
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 18:57:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1m3nmp-00060v-CP
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 18:55:27 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:13841)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1m3nmn-0002o5-L0
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 18:55:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1626303325; x=1657839325;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fpIRN5yYpL7bU+Xjtok65qZU+RN8rMlCtNo3Jsh674g=;
 b=hmAN5C7JwQxlvGO2lLI+f2fria3RzuZzGXnUpUYUMA+Adopg2+ZBAXMp
 AJq+xusHHDuKStYnQ1PLQhWHVYeGia3sCwrIAU/WmdLrfyiLtTNgxn+Zc
 KwpWR153sO6nysF/Y2H/jV17iDpAdpTv01hctwY2GcEDT6tqysjhUM6HK g=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 14 Jul 2021 15:55:19 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg05-sd.qualcomm.com with ESMTP; 14 Jul 2021 15:55:19 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id D1234C8D; Wed, 14 Jul 2021 17:55:18 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] SIGSEGV fixes
Date: Wed, 14 Jul 2021 17:55:07 -0500
Message-Id: <1626303309-7946-1-git-send-email-tsimpson@quicinc.com>
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
Cc: ale@rev.ng, bcain@quicinc.com, alex.bennee@linaro.org,
 richard.henderson@linaro.org, tsimpson@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlIEhleGFnb24gdGFyZ2V0IHdhcyBzaWxlbnRseSBmYWlsaW5nIHRoZSBTSUdTRUdWIHRlc3Qg
YmVjYXVzZQp0aGUgc2lnbmFsIGhhbmRsZXIgd2FzIG5vdCBjYWxsZWQuCgpQYXRjaCAxLzIgZml4
ZXMgdGhlIEhleGFnb24gdGFyZ2V0ClBhdGNoIDIvMiBhZGRzIGEgY2hlY2sgdGhhdCB0aGUgc2ln
bmFsIGhhbmRsZXIgaXMgY2FsbGVkCgoqKioqIENoYW5nZXMgaW4gdjIgKioqKgpBZGRyZXNzIGZl
ZWRiYWNrIGZyb20gUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5v
cmc+Ci0gUmVwbGFjZSBwdXRfdXNlcl8qIHdpdGggY3B1X3N0Kl9kYXRhX3JhCi0gUmVwbGFjZSBn
ZXRfdXNlcl8qIHdpdGggY3B1X2xkKl9kYXRhX3JhCi0gVHJlYXQgc2lnX3NlZ3ZfY2FsbGVkIGFz
IGEgY291bnRlcgoKClRheWxvciBTaW1wc29uICgyKToKICBIZXhhZ29uICh0YXJnZXQvaGV4YWdv
bikgcmVtb3ZlIHB1dF91c2VyXyovZ2V0X3VzZXJfKgogIGxpbnV4LXRlc3QgKHRlc3RzL3RjZy9t
dWx0aWFyY2gvbGludXgtdGVzdC5jKSBhZGQgY2hlY2sKCiB0YXJnZXQvaGV4YWdvbi9vcF9oZWxw
ZXIuYyAgICAgICB8IDM5ICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLQog
dGVzdHMvdGNnL211bHRpYXJjaC9saW51eC10ZXN0LmMgfCAgOCArKysrKysrKwogdGFyZ2V0L2hl
eGFnb24vaGV4X2NvbW1vbi5weSAgICAgfCAgMiArKwogMyBmaWxlcyBjaGFuZ2VkLCAyOCBpbnNl
cnRpb25zKCspLCAyMSBkZWxldGlvbnMoLSkKCi0tIAoyLjcuNAoK

