Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C69E13CAE7F
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 23:25:23 +0200 (CEST)
Received: from localhost ([::1]:47620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m48rC-0008Kb-To
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 17:25:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1m48oj-0004If-Ta
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 17:22:50 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:34921)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1m48oi-0000ka-Ak
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 17:22:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1626384168; x=1657920168;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yXaNZ5z0IkMWRit+El2FgX/idkuZwr66mInH+hye1Oo=;
 b=X9JpeSNWYsiIqwuqNICkLYkLLdwnTFDZZPj2NyNDa7Pt1+9LFa3yCudV
 OFsFv7WIBGVrTV9/OMCCtd5f/TC8NrpD0t7HQhXRzlMRBuuY92kyGaJSV
 MKf8TVbIDFFfbGylI4noenGwsUY7VTgkwlw800QzNXHSQaGhsC0V39f5N w=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 15 Jul 2021 14:22:41 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg04-sd.qualcomm.com with ESMTP; 15 Jul 2021 14:22:41 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id CE82EF45; Thu, 15 Jul 2021 16:22:40 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/2] SIGSEGV fixes
Date: Thu, 15 Jul 2021 16:22:34 -0500
Message-Id: <1626384156-6248-1-git-send-email-tsimpson@quicinc.com>
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
IGEgY291bnRlcgoKKioqKiBDaGFuZ2VzIGluIHYzICoqKioKQWRkcmVzcyBmZWVkYmFjayBmcm9t
IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPgotIFBhc3Mg
aG9zdCBQQyBhcyByZXR1cm4gYWRkcmVzcyBmb3IgY3B1X3N0XypfZGF0YV9yYS9jcHVfbGQqX2Rh
dGFfcmEKCgpUYXlsb3IgU2ltcHNvbiAoMik6CiAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIHJl
bW92ZSBwdXRfdXNlcl8qL2dldF91c2VyXyoKICBsaW51eC10ZXN0ICh0ZXN0cy90Y2cvbXVsdGlh
cmNoL2xpbnV4LXRlc3QuYykgYWRkIGNoZWNrCgogdGFyZ2V0L2hleGFnb24vb3BfaGVscGVyLmMg
ICAgICAgfCAzOSArKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0KIHRlc3Rz
L3RjZy9tdWx0aWFyY2gvbGludXgtdGVzdC5jIHwgIDggKysrKysrKysKIDIgZmlsZXMgY2hhbmdl
ZCwgMjYgaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pCgotLSAKMi43LjQKCg==

