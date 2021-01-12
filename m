Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9A02F392E
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 19:50:06 +0100 (CET)
Received: from localhost ([::1]:54082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzOk2-0006Rm-12
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 13:50:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1kzOTs-0007pQ-Qn
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 13:33:24 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:31885)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1kzOTq-0006PG-5m
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 13:33:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1610476402; x=1642012402;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BjA628x1E9gw2CI/Ie6r3h8ZsmM5RzRDJbzgR2vxyNg=;
 b=ATf72xnEf9l9JEa0hcWZBrMVroUYaRybz7YQgddCXPN8c9HRiwwqDGqL
 YmBJ8huSY6kLrmKaqNXYeVHom7M+FUMKm6gIwBoNBrnz2p0U9JGn8gwmh
 WDcqKfbP3eNpzXcc/uqR4bRxX5A6+EUqDmwRkvRK8G1YsEiXxD1fqTwkV M=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 12 Jan 2021 10:33:18 -0800
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg03-sd.qualcomm.com with ESMTP; 12 Jan 2021 10:33:18 -0800
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 33FE7AA3; Tue, 12 Jan 2021 12:33:18 -0600 (CST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/tcg/multiarch/testthread.c: Add pthread_cancel test
Date: Tue, 12 Jan 2021 12:33:04 -0600
Message-Id: <1610476384-13760-1-git-send-email-tsimpson@quicinc.com>
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

LS0tCiB0ZXN0cy90Y2cvbXVsdGlhcmNoL3Rlc3R0aHJlYWQuYyB8IDIxICsrKysrKysrKysrKysr
KysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90
ZXN0cy90Y2cvbXVsdGlhcmNoL3Rlc3R0aHJlYWQuYyBiL3Rlc3RzL3RjZy9tdWx0aWFyY2gvdGVz
dHRocmVhZC5jCmluZGV4IDgxMGJhNWQuLmIzMGI0YjUgMTAwNjQ0Ci0tLSBhL3Rlc3RzL3RjZy9t
dWx0aWFyY2gvdGVzdHRocmVhZC5jCisrKyBiL3Rlc3RzL3RjZy9tdWx0aWFyY2gvdGVzdHRocmVh
ZC5jCkBAIC01MCw4ICs1MCwyOSBAQCB2b2lkIHRlc3RfcHRocmVhZCh2b2lkKQogICAgIHByaW50
ZigiRW5kIG9mIHB0aHJlYWQgdGVzdC5cbiIpOwogfQogCit2b2lkICp0aHJlYWQzX2Z1bmModm9p
ZCAqYXJnKQoreworICAgIHVzbGVlcCgzICogMTAwMCk7CisgICAgcmV0dXJuIDA7Cit9CisKK3Zv
aWQgdGVzdF9jYW5jZWwodm9pZCkKK3sKKyAgICBwdGhyZWFkX3QgdGhyZWFkOworICAgIHZvaWQg
KnJlczsKKworICAgIHB0aHJlYWRfY3JlYXRlKCZ0aHJlYWQsIDAsIHRocmVhZDNfZnVuYywgTlVM
TCk7CisgICAgcHRocmVhZF9jYW5jZWwodGhyZWFkKTsKKyAgICBwdGhyZWFkX2pvaW4odGhyZWFk
LCAmcmVzKTsKKyAgICBpZiAocmVzICE9IFBUSFJFQURfQ0FOQ0VMRUQpIHsKKyAgICAgICAgcHV0
cygiRVJST1I6IHRocmVhZCBub3QgY2FuY2VsbGVkIik7CisgICAgICAgIGV4aXQoRVhJVF9GQUlM
VVJFKTsKKyAgICB9Cit9CisKIGludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndikKIHsKICAg
ICB0ZXN0X3B0aHJlYWQoKTsKKyAgICB0ZXN0X2NhbmNlbCgpOwogICAgIHJldHVybiAwOwogfQot
LSAKMi43LjQKCg==

