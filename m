Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4259329599
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 03:08:49 +0100 (CET)
Received: from localhost ([::1]:51528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGuSs-0004ut-Ao
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 21:08:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changlm@chinatelecom.cn>)
 id 1lGuR5-0003nU-2w; Mon, 01 Mar 2021 21:06:55 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.228]:38960
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <changlm@chinatelecom.cn>)
 id 1lGuR1-0003Px-2H; Mon, 01 Mar 2021 21:06:53 -0500
HMM_SOURCE_IP: 172.18.0.218:29801.1800995752
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-106.120.101.58?logid-9db7f54045604fc5a17714c25d21d57b
 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 29F1B2800FB;
 Tue,  2 Mar 2021 09:56:52 +0800 (CST)
X-189-SAVE-TO-SEND: 71112636@chinatelecom.cn
Received: from  ([172.18.0.218])
 by App0025 with ESMTP id 9db7f54045604fc5a17714c25d21d57b for
 qemu-block@nongnu.org; Tue Mar  2 09:56:58 2021
X-Transaction-ID: 9db7f54045604fc5a17714c25d21d57b
X-filter-score: filter<0>
X-Real-From: changlm@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
Date: Tue, 2 Mar 2021 09:56:42 +0800
From: ChangLimin <changlm@chinatelecom.cn>
To: qemu-block <qemu-block@nongnu.org>
Subject: [PATCH] file-posix: allow -EBUSY errors during write zeros on block
X-Priority: 3
X-GUID: 8E9EC420-F20E-414D-8611-F52628B71530
X-Has-Attach: no
X-Mailer: Foxmail 7.2.17.58[cn]
Mime-Version: 1.0
Message-ID: <2021030209564214018344@chinatelecom.cn>
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=42.123.76.228;
 envelope-from=changlm@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Cc: kwolf <kwolf@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 mreitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QWZ0ZXIgTGludXggNS4xMCwgd3JpdGUgemVyb3MgdG8gYSBtdWx0aXBhdGggZGV2aWNlIHVzaW5n
CmlvY3RsKGZkLCBCTEtaRVJPT1VULCByYW5nZSkgd2l0aCBjYWNoZSBub25lIG9yIGRpcmVjdHN5
bmMgd2lsbCByZXR1cm4gRUJVU1kuCgpTaW1pbGFyIHRvIGhhbmRsZV9haW9jYl93cml0ZV96ZXJv
ZXNfdW5tYXAsIGhhbmRsZV9haW9jYl93cml0ZV96ZXJvZXNfYmxvY2sKYWxsb3cgLUVCVVNZIGVy
cm9ycyBkdXJpbmcgaW9jdGwoZmQsIEJMS1pFUk9PVVQsIHJhbmdlKS4KClJlZmVyZW5jZSBjb21t
aXQgaW4gTGludXggNS4xMDoKaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQvc3RhYmxlL2xpbnV4LmdpdC9jb21taXQvP2lkPTM4NGQ4N2VmMmM5NTRmYzU4ZTZj
NWZkODI1M2U0YTE5ODRmNWZlMDIKClNpZ25lZC1vZmYtYnk6IENoYW5nTGltaW4gPGNoYW5nbG1A
Y2hpbmF0ZWxlY29tLmNuPgotLS0KwqBibG9jay9maWxlLXBvc2l4LmMgfCA3ICsrKysrKy0KwqAx
IGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvYmxvY2svZmlsZS1wb3NpeC5jIGIvYmxvY2svZmlsZS1wb3NpeC5jCmluZGV4IDA1MDc5YjQw
Y2EuLjNlNjBjOTYyMTQgMTAwNjQ0Ci0tLSBhL2Jsb2NrL2ZpbGUtcG9zaXguYworKysgYi9ibG9j
ay9maWxlLXBvc2l4LmMKQEAgLTE2MjksOCArMTYyOSwxMyBAQCBzdGF0aWMgc3NpemVfdCBoYW5k
bGVfYWlvY2Jfd3JpdGVfemVyb2VzX2Jsb2NrKFJhd1Bvc2l4QUlPRGF0YSAqYWlvY2IpCsKgIMKg
IMKgIMKgIMKgfSB3aGlsZSAoZXJybm8gPT0gRUlOVFIpOwoKwqAgwqAgwqAgwqAgwqByZXQgPSB0
cmFuc2xhdGVfZXJyKC1lcnJubyk7Ci0gwqAgwqAgwqAgwqBpZiAocmV0ID09IC1FTk9UU1VQKSB7
CisgwqAgwqAgwqAgwqBzd2l0Y2ggKHJldCkgeworIMKgIMKgIMKgIMKgY2FzZSAtRU5PVFNVUDoK
KyDCoCDCoCDCoCDCoGNhc2UgLUVJTlZBTDoKKyDCoCDCoCDCoCDCoGNhc2UgLUVCVVNZOgrCoCDC
oCDCoCDCoCDCoCDCoCDCoHMtPmhhc193cml0ZV96ZXJvZXMgPSBmYWxzZTsKKyDCoCDCoCDCoCDC
oCDCoCDCoHJldHVybiAtRU5PVFNVUDsKKyDCoCDCoCDCoCDCoCDCoCDCoGJyZWFrOwrCoCDCoCDC
oCDCoCDCoH0KwqAgwqAgwqB9CsKgI2VuZGlmCi0tCjIuMjcuMAoK


