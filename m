Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3992F3BD2
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 22:27:17 +0100 (CET)
Received: from localhost ([::1]:34518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzRC8-0002z9-Is
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 16:27:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1kzRAb-0002Ko-Re
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 16:25:41 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:60312)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1kzRAV-0007rC-JR
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 16:25:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1610486735; x=1642022735;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=83lcVtk6j7HXCmMZRYKRlKxTmXh3qTIU79l9oifzeZw=;
 b=wMfkRTroCQDzFMTyNMFtivcowYNnzg2WfVNF4Hgm0P1sudyj07oZ6T6w
 jS2nO1MW0vu2N/QkHqFV+VQK/FVxECNQLbWCXkfMZhzLviTqGRgRE6TTC
 ZHSoC9AiAIq9Hd5HTr8UaV4A2Ja1fp/aAxC2vumyr5q6zYet7MCtD6n9D Q=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 12 Jan 2021 13:25:33 -0800
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg03-sd.qualcomm.com with ESMTP; 12 Jan 2021 13:25:33 -0800
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id B92C74F7; Tue, 12 Jan 2021 15:25:32 -0600 (CST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] tests/tcg/multiarch/testthread.c: Add pthread_cancel test
Date: Tue, 12 Jan 2021 15:25:30 -0600
Message-Id: <1610486730-4970-1-git-send-email-tsimpson@quicinc.com>
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
Cc: tsimpson@quicinc.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

U2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgotLS0K
IHRlc3RzL3RjZy9tdWx0aWFyY2gvdGVzdHRocmVhZC5jIHwgMjIgKysrKysrKysrKysrKysrKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90ZXN0
cy90Y2cvbXVsdGlhcmNoL3Rlc3R0aHJlYWQuYyBiL3Rlc3RzL3RjZy9tdWx0aWFyY2gvdGVzdHRo
cmVhZC5jCmluZGV4IDgxMGJhNWQuLjBkYTFmNjEgMTAwNjQ0Ci0tLSBhL3Rlc3RzL3RjZy9tdWx0
aWFyY2gvdGVzdHRocmVhZC5jCisrKyBiL3Rlc3RzL3RjZy9tdWx0aWFyY2gvdGVzdHRocmVhZC5j
CkBAIC01MCw4ICs1MCwzMCBAQCB2b2lkIHRlc3RfcHRocmVhZCh2b2lkKQogICAgIHByaW50Zigi
RW5kIG9mIHB0aHJlYWQgdGVzdC5cbiIpOwogfQogCit2b2lkICp0aHJlYWQzX2Z1bmModm9pZCAq
YXJnKQoreworICAgIHVzbGVlcCgzICogMTAwMCk7CisgICAgcmV0dXJuIDA7Cit9CisKK3ZvaWQg
dGVzdF9jYW5jZWwodm9pZCkKK3sKKyAgICBwdGhyZWFkX3QgdGhyZWFkOworICAgIHZvaWQgKnJl
czsKKworICAgIHB0aHJlYWRfY3JlYXRlKCZ0aHJlYWQsIDAsIHRocmVhZDNfZnVuYywgTlVMTCk7
CisgICAgcHRocmVhZF9jYW5jZWwodGhyZWFkKTsKKyAgICBwdGhyZWFkX2pvaW4odGhyZWFkLCAm
cmVzKTsKKyAgICBpZiAocmVzICE9IFBUSFJFQURfQ0FOQ0VMRUQpIHsKKyAgICAgICAgcHV0cygi
RVJST1I6IHRocmVhZCBub3QgY2FuY2VsbGVkIik7CisgICAgICAgIGV4aXQoRVhJVF9GQUlMVVJF
KTsKKyAgICB9CisgICAgcHJpbnRmKCJFbmQgb2YgcHRocmVhZF9jYW5jZWwgdGVzdC5cbiIpOwor
fQorCiBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCiB7CiAgICAgdGVzdF9wdGhyZWFk
KCk7CisgICAgdGVzdF9jYW5jZWwoKTsKICAgICByZXR1cm4gMDsKIH0KLS0gCjIuNy40Cgo=

