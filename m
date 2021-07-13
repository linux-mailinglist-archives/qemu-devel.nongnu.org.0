Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E20E3C777F
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 21:49:24 +0200 (CEST)
Received: from localhost ([::1]:38876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3OPD-0006Zv-MB
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 15:49:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1m3ON3-0003tv-GL
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 15:47:09 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:9796)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1m3ON1-0002Kl-8g
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 15:47:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1626205627; x=1657741627;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=K/0i3T5241pHjWGrBnVxuhM/S3ngFjEM6A6RLc5p+Uk=;
 b=ts1caNJZUyNUTg9VO30mGMoxXmNDbqT6cqvxHYTEcja0hEnMCHBG6Phz
 XszUi67isL3jOGZaCVjK2ZXwy0ZN0cE4Sc+YBVpEpc/2GqE3g5qLTISQd
 u+iND/ji90caQ3i7cMsgxtkmbj29ozT2zVVsc/HU5L/EFS139XgXZWNXB c=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 13 Jul 2021 12:47:04 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg03-sd.qualcomm.com with ESMTP; 13 Jul 2021 12:47:03 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id EFCD3DB0; Tue, 13 Jul 2021 14:47:02 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] SIGSEGV fixes
Date: Tue, 13 Jul 2021 14:46:27 -0500
Message-Id: <1626205589-19208-1-git-send-email-tsimpson@quicinc.com>
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
bmFsIGhhbmRsZXIgaXMgY2FsbGVkCgpUYXlsb3IgU2ltcHNvbiAoMik6CiAgSGV4YWdvbiAodGFy
Z2V0L2hleGFnb24pIGRvIHByb2JlX3dyaXRlIGluIEhFTFBFUihjb21taXRfc3RvcmUpCiAgbGlu
dXgtdGVzdCAodGVzdHMvdGNnL211bHRpYXJjaC9saW51eC10ZXN0LmMpIGFkZCBjaGVjawoKIHRh
cmdldC9oZXhhZ29uL29wX2hlbHBlci5jICAgICAgIHwgMjMgKysrKysrKysrKysrKystLS0tLS0t
LS0KIHRlc3RzL3RjZy9tdWx0aWFyY2gvbGludXgtdGVzdC5jIHwgIDcgKysrKysrKwogMiBmaWxl
cyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKLS0gCjIuNy40Cgo=

