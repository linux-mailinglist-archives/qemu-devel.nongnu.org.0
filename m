Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB703AD293
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 21:10:54 +0200 (CEST)
Received: from localhost ([::1]:44194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luJtF-0001H1-68
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 15:10:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1luJpe-00046X-91
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:07:10 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:21177)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1luJpc-0004DA-Eg
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:07:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1624043228; x=1655579228;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xM3m5AnfCb0VrEZ+JUr5xPZv6rH7cbpQy+mPEgBTR+k=;
 b=Zj/b/Q9M1u2Yj8zJDxeI+304I7hJ68d546CXzYQm9335PjVBn6YDot1j
 iWEiuy9CIUDZZVXOVo0TWdGLG3d5lp7EfF4s35TeA89Y65I4qUXNdu9cw
 1NwNYdeZ40HM3AFpgJEK9YxKNcbf/CiD02Xx6+EgZMeokgeKzyjcduuj4 U=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 18 Jun 2021 12:07:03 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg04-sd.qualcomm.com with ESMTP; 18 Jun 2021 12:07:02 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 087391712; Fri, 18 Jun 2021 14:07:02 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/4] Hexagon (target/hexagon) fix l2fetch instructions
Date: Fri, 18 Jun 2021 14:06:40 -0500
Message-Id: <1624043202-20124-3-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1624043202-20124-1-git-send-email-tsimpson@quicinc.com>
References: <1624043202-20124-1-git-send-email-tsimpson@quicinc.com>
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

WTRfbDJmZXRjaCA9PSBsMmZldGNoKFJzMzIsIFJ0MzIpClk1X2wyZmV0Y2ggPT0gbDJmZXRjaChS
czMyLCBSdHQzMikKClRoZSBzZW1hbnRpY3MgZm9yIHRoZXNlIGluc3RydWN0aW9ucyBhcmUgcHJl
c2VudCwgYnV0IHRoZSBlbmNvZGluZ3MKYXJlIG1pc3NpbmcuCgpOb3RlIHRoYXQgdGhlc2UgYXJl
IHRyZWF0ZWQgYXMgbm9wcyBpbiBxZW11LCBzbyB3ZSBhZGQgb3ZlcnJpZGVzLgoKVGVzdCBjYXNl
IGFkZGVkIHRvIHRlc3RzL3RjZy9oZXhhZ29uL21pc2MuYwoKU2lnbmVkLW9mZi1ieTogVGF5bG9y
IFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgpSZXZpZXdlZC1ieTogUmljaGFyZCBIZW5k
ZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+Ck1lc3NhZ2UtSWQ6IDwxNjIyNTg5
NTg0LTIyNTcxLTMtZ2l0LXNlbmQtZW1haWwtdHNpbXBzb25AcXVpY2luYy5jb20+Ci0tLQogdGFy
Z2V0L2hleGFnb24vZ2VuX3RjZy5oICAgICAgICAgICAgICB8IDExICsrKysrKysrKysrCiB0ZXN0
cy90Y2cvaGV4YWdvbi9taXNjLmMgICAgICAgICAgICAgIHwgIDkgKysrKysrKysrCiB0YXJnZXQv
aGV4YWdvbi9pbXBvcnRlZC9lbmNvZGVfcHAuZGVmIHwgIDMgKysrCiAzIGZpbGVzIGNoYW5nZWQs
IDIzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9nZW5fdGNnLmgg
Yi90YXJnZXQvaGV4YWdvbi9nZW5fdGNnLmgKaW5kZXggMThmY2RiYy4uYTM3NWQ2YSAxMDA2NDQK
LS0tIGEvdGFyZ2V0L2hleGFnb24vZ2VuX3RjZy5oCisrKyBiL3RhcmdldC9oZXhhZ29uL2dlbl90
Y2cuaApAQCAtNzM0LDQgKzczNCwxNSBAQAogI2RlZmluZSBmR0VOX1RDR19GMl9kZm1weWhoKFNI
T1JUQ09ERSkgXAogICAgIGdlbl9oZWxwZXJfZGZtcHloaChSeHhWLCBjcHVfZW52LCBSeHhWLCBS
c3NWLCBSdHRWKQogCisvKiBOb3RoaW5nIHRvIGRvIGZvciB0aGVzZSBpbiBxZW11LCBuZWVkIHRv
IHN1cHByZXNzIGNvbXBpbGVyIHdhcm5pbmdzICovCisjZGVmaW5lIGZHRU5fVENHX1k0X2wyZmV0
Y2goU0hPUlRDT0RFKSBcCisgICAgZG8geyBcCisgICAgICAgIFJzViA9IFJzVjsgXAorICAgICAg
ICBSdFYgPSBSdFY7IFwKKyAgICB9IHdoaWxlICgwKQorI2RlZmluZSBmR0VOX1RDR19ZNV9sMmZl
dGNoKFNIT1JUQ09ERSkgXAorICAgIGRvIHsgXAorICAgICAgICBSc1YgPSBSc1Y7IFwKKyAgICB9
IHdoaWxlICgwKQorCiAjZW5kaWYKZGlmZiAtLWdpdCBhL3Rlc3RzL3RjZy9oZXhhZ29uL21pc2Mu
YyBiL3Rlc3RzL3RjZy9oZXhhZ29uL21pc2MuYwppbmRleCA5ZTEzOWYzLi5mMGIxOTQ3IDEwMDY0
NAotLS0gYS90ZXN0cy90Y2cvaGV4YWdvbi9taXNjLmMKKysrIGIvdGVzdHMvdGNnL2hleGFnb24v
bWlzYy5jCkBAIC0zMjYsNiArMzI2LDEzIEBAIHZvaWQgdGVzdF9sc2JuZXcodm9pZCkKICAgICBj
aGVjayhyZXN1bHQsIDUpOwogfQogCit2b2lkIHRlc3RfbDJmZXRjaCh2b2lkKQoreworICAgIC8q
IFRoZXNlIGRvbid0IGRvIGFueXRoaW5nIGluIHFlbXUsIGp1c3QgbWFrZSBzdXJlIHRoZXkgZG9u
J3QgYXNzZXJ0ICovCisgICAgYXNtIHZvbGF0aWxlICgibDJmZXRjaChyMCwgcjEpXG5cdCIKKyAg
ICAgICAgICAgICAgICAgICJsMmZldGNoKHIwLCByMzoyKVxuXHQiKTsKK30KKwogaW50IG1haW4o
KQogewogICAgIGludCByZXM7CkBAIC00NTksNiArNDY2LDggQEAgaW50IG1haW4oKQogCiAgICAg
dGVzdF9sc2JuZXcoKTsKIAorICAgIHRlc3RfbDJmZXRjaCgpOworCiAgICAgcHV0cyhlcnIgPyAi
RkFJTCIgOiAiUEFTUyIpOwogICAgIHJldHVybiBlcnI7CiB9CmRpZmYgLS1naXQgYS90YXJnZXQv
aGV4YWdvbi9pbXBvcnRlZC9lbmNvZGVfcHAuZGVmIGIvdGFyZ2V0L2hleGFnb24vaW1wb3J0ZWQv
ZW5jb2RlX3BwLmRlZgppbmRleCAzNWFlM2QyLi45MzljNmZjIDEwMDY0NAotLS0gYS90YXJnZXQv
aGV4YWdvbi9pbXBvcnRlZC9lbmNvZGVfcHAuZGVmCisrKyBiL3RhcmdldC9oZXhhZ29uL2ltcG9y
dGVkL2VuY29kZV9wcC5kZWYKQEAgLTQ5Myw2ICs0OTMsOSBAQCBERUZfRU5DMzIoWTJfZGNjbGVh
bmEsICAgICBJQ0xBU1NfU1QiIDAwMCAwMCAwMHNzc3NzIFBQLS0tLS0tIC0tLS0tLS0tIikKIERF
Rl9FTkMzMihZMl9kY2ludmEsICAgICAgIElDTEFTU19TVCIgMDAwIDAwIDAxc3Nzc3MgUFAtLS0t
LS0gLS0tLS0tLS0iKQogREVGX0VOQzMyKFkyX2RjY2xlYW5pbnZhLCAgSUNMQVNTX1NUIiAwMDAg
MDAgMTBzc3NzcyBQUC0tLS0tLSAtLS0tLS0tLSIpCiAKK0RFRl9FTkMzMihZNF9sMmZldGNoLCAg
ICAgIElDTEFTU19TVCIgMDExIDAwIDAwc3Nzc3MgUFAtdHR0dHQgMDAwLS0tLS0iKQorREVGX0VO
QzMyKFk1X2wyZmV0Y2gsICAgICAgSUNMQVNTX1NUIiAwMTEgMDEgMDBzc3NzcyBQUC10dHR0dCAt
LS0tLS0tLSIpCisKIC8qKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqLwogLyogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICovCiAvKiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Ki8KLS0gCjIuNy40Cgo=

