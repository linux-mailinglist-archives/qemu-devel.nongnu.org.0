Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBED3AD287
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 21:08:41 +0200 (CEST)
Received: from localhost ([::1]:38854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luJr6-00061h-0y
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 15:08:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1luJpb-00044c-ON
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:07:07 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:15800)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1luJpY-0004DC-SK
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:07:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1624043224; x=1655579224;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Mrn/bM/8PwLukZM76bubNzt1d8P0O9m6pgzj+8v3gSw=;
 b=jqKeW8/PfJgslSsoLl//asQjBSMoRzxLK5FM0hC3+ha0YVBEgBhsxQ2F
 Wjjo5o6rm05dgoz3xromw4oWrx1rF/720N/z4em3pSINNILmJ7GCrHpEe
 rYslCiuQeIn+uGlfkb0CvqYZT33eR7yByVSDuJsrdjRtdJNNnHRlez0Ij o=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 18 Jun 2021 12:07:02 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg02-sd.qualcomm.com with ESMTP; 18 Jun 2021 12:07:02 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 0B0CD173E; Fri, 18 Jun 2021 14:07:02 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/4] Hexagon (target/hexagon) cleanup gen_store_conditional[48]
 functions
Date: Fri, 18 Jun 2021 14:06:41 -0500
Message-Id: <1624043202-20124-4-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1624043202-20124-1-git-send-email-tsimpson@quicinc.com>
References: <1624043202-20124-1-git-send-email-tsimpson@quicinc.com>
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
Cc: ale@rev.ng, philmd@redhat.com, tsimpson@quicinc.com,
 richard.henderson@linaro.org, bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UHJldmlvdXNseSB0aGUgc3RvcmUtY29uZGl0aW9uYWwgY29kZSB3YXMgd3JpdGluZyB0byBoZXhf
cHJlZFtwcmVkbnVtXS4KVGhlbiwgdGhlIGZHRU5fVENHIG92ZXJyaWRlIHdhcyByZWFkaW5nIGZy
b20gdGhlcmUgdG8gdGhlIGRlc3RpbmF0aW9uCnZhcmlhYmxlIHNvIHRoYXQgdGhlIHBhY2tldCBj
b21taXQgbG9naWMgd291bGQgaGFuZGxlIGl0IHByb3Blcmx5LgoKVGhlIGNvcnJlY3QgaW1wbGVt
ZW50YXRpb24gaXMgdG8gd3JpdGUgdG8gdGhlIGRlc3RpbmF0aW9uIHZhcmlhYmxlCmFuZCBkb24n
dCBoYXZlIHRoZSBleHRyYSByZWFkIGluIHRoZSBvdmVycmlkZS4KClJlbW92ZSB0aGUgdW51c2Vk
IGFyZ3VtZW50cyBmcm9tIGdlbl9zdG9yZV9jb25kaXRpb25hbFs0OF0KClNpZ25lZC1vZmYtYnk6
IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IFJpY2hh
cmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPgpNZXNzYWdlLUlkOiA8
MTYyMjU4OTU4NC0yMjU3MS00LWdpdC1zZW5kLWVtYWlsLXRzaW1wc29uQHF1aWNpbmMuY29tPgot
LS0KIHRhcmdldC9oZXhhZ29uL2dlbl90Y2cuaCB8ICA0ICsrLS0KIHRhcmdldC9oZXhhZ29uL21h
Y3Jvcy5oICB8ICAyICstCiB0YXJnZXQvaGV4YWdvbi9nZW5wdHIuYyAgfCAxMCArKysrLS0tLS0t
CiAzIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS90YXJnZXQvaGV4YWdvbi9nZW5fdGNnLmggYi90YXJnZXQvaGV4YWdvbi9nZW5fdGNn
LmgKaW5kZXggYTM3NWQ2YS4uZWU5NGM5MCAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFnb24vZ2Vu
X3RjZy5oCisrKyBiL3RhcmdldC9oZXhhZ29uL2dlbl90Y2cuaApAQCAtNDI0LDkgKzQyNCw5IEBA
CiAjZGVmaW5lIGZHRU5fVENHX0w0X2xvYWRkX2xvY2tlZChTSE9SVENPREUpIFwKICAgICBTSE9S
VENPREUKICNkZWZpbmUgZkdFTl9UQ0dfUzJfc3RvcmV3X2xvY2tlZChTSE9SVENPREUpIFwKLSAg
ICBkbyB7IFNIT1JUQ09ERTsgUkVBRF9QUkVHKFBkViwgUGROKTsgfSB3aGlsZSAoMCkKKyAgICBT
SE9SVENPREUKICNkZWZpbmUgZkdFTl9UQ0dfUzRfc3RvcmVkX2xvY2tlZChTSE9SVENPREUpIFwK
LSAgICBkbyB7IFNIT1JUQ09ERTsgUkVBRF9QUkVHKFBkViwgUGROKTsgfSB3aGlsZSAoMCkKKyAg
ICBTSE9SVENPREUKIAogI2RlZmluZSBmR0VOX1RDR19TVE9SRShTSE9SVENPREUpIFwKICAgICBk
byB7IFwKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL21hY3Jvcy5oIGIvdGFyZ2V0L2hleGFn
b24vbWFjcm9zLmgKaW5kZXggMmIyMDhmMy4uODRmYTY4NyAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hl
eGFnb24vbWFjcm9zLmgKKysrIGIvdGFyZ2V0L2hleGFnb24vbWFjcm9zLmgKQEAgLTU5MSw3ICs1
OTEsNyBAQCBzdGF0aWMgaW5saW5lIFRDR3YgZ2VuX3JlYWRfaXJlZyhUQ0d2IHJlc3VsdCwgVENH
diB2YWwsIGludCBzaGlmdCkKIAogI2lmZGVmIFFFTVVfR0VORVJBVEUKICNkZWZpbmUgZlNUT1JF
X0xPQ0tFRChOVU0sIFNJWkUsIEVBLCBTUkMsIFBSRUQpIFwKLSAgICBnZW5fc3RvcmVfY29uZGl0
aW9uYWwjI1NJWkUoZW52LCBjdHgsIFBkTiwgUFJFRCwgRUEsIFNSQyk7CisgICAgZ2VuX3N0b3Jl
X2NvbmRpdGlvbmFsIyNTSVpFKGN0eCwgUFJFRCwgRUEsIFNSQyk7CiAjZW5kaWYKIAogI2lmZGVm
IFFFTVVfR0VORVJBVEUKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jIGIvdGFy
Z2V0L2hleGFnb24vZ2VucHRyLmMKaW5kZXggNzk3YTZjMC4uYmQxOGNiMSAxMDA2NDQKLS0tIGEv
dGFyZ2V0L2hleGFnb24vZ2VucHRyLmMKKysrIGIvdGFyZ2V0L2hleGFnb24vZ2VucHRyLmMKQEAg
LTMzNCw4ICszMzQsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgZ2VuX2xvYWRfbG9ja2VkOHUoVENH
dl9pNjQgZGVzdCwgVENHdiB2YWRkciwgaW50IG1lbV9pbmRleCkKICAgICB0Y2dfZ2VuX21vdl9p
NjQoaGV4X2xsc2NfdmFsX2k2NCwgZGVzdCk7CiB9CiAKLXN0YXRpYyBpbmxpbmUgdm9pZCBnZW5f
c3RvcmVfY29uZGl0aW9uYWw0KENQVUhleGFnb25TdGF0ZSAqZW52LAotICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgRGlzYXNDb250ZXh0ICpjdHgsIGludCBwcmVkbnVt
LAorc3RhdGljIGlubGluZSB2b2lkIGdlbl9zdG9yZV9jb25kaXRpb25hbDQoRGlzYXNDb250ZXh0
ICpjdHgsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBUQ0d2IHBy
ZWQsIFRDR3YgdmFkZHIsIFRDR3Ygc3JjKQogewogICAgIFRDR0xhYmVsICpmYWlsID0gZ2VuX25l
d19sYWJlbCgpOwpAQCAtMzQ5LDcgKzM0OCw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBnZW5fc3Rv
cmVfY29uZGl0aW9uYWw0KENQVUhleGFnb25TdGF0ZSAqZW52LAogICAgIHRtcCA9IHRjZ190ZW1w
X25ldygpOwogICAgIHRjZ19nZW5fYXRvbWljX2NtcHhjaGdfdGwodG1wLCBoZXhfbGxzY19hZGRy
LCBoZXhfbGxzY192YWwsIHNyYywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGN0eC0+
bWVtX2lkeCwgTU9fMzIpOwotICAgIHRjZ19nZW5fbW92Y29uZF90bChUQ0dfQ09ORF9FUSwgaGV4
X3ByZWRbcHJlZG51bV0sIHRtcCwgaGV4X2xsc2NfdmFsLAorICAgIHRjZ19nZW5fbW92Y29uZF90
bChUQ0dfQ09ORF9FUSwgcHJlZCwgdG1wLCBoZXhfbGxzY192YWwsCiAgICAgICAgICAgICAgICAg
ICAgICAgIG9uZSwgemVybyk7CiAgICAgdGNnX3RlbXBfZnJlZShvbmUpOwogICAgIHRjZ190ZW1w
X2ZyZWUoemVybyk7CkBAIC0zNjMsOCArMzYyLDcgQEAgc3RhdGljIGlubGluZSB2b2lkIGdlbl9z
dG9yZV9jb25kaXRpb25hbDQoQ1BVSGV4YWdvblN0YXRlICplbnYsCiAgICAgdGNnX2dlbl9tb3Zp
X3RsKGhleF9sbHNjX2FkZHIsIH4wKTsKIH0KIAotc3RhdGljIGlubGluZSB2b2lkIGdlbl9zdG9y
ZV9jb25kaXRpb25hbDgoQ1BVSGV4YWdvblN0YXRlICplbnYsCi0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBEaXNhc0NvbnRleHQgKmN0eCwgaW50IHByZWRudW0sCitz
dGF0aWMgaW5saW5lIHZvaWQgZ2VuX3N0b3JlX2NvbmRpdGlvbmFsOChEaXNhc0NvbnRleHQgKmN0
eCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFRDR3YgcHJlZCwg
VENHdiB2YWRkciwgVENHdl9pNjQgc3JjKQogewogICAgIFRDR0xhYmVsICpmYWlsID0gZ2VuX25l
d19sYWJlbCgpOwpAQCAtMzgwLDcgKzM3OCw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBnZW5fc3Rv
cmVfY29uZGl0aW9uYWw4KENQVUhleGFnb25TdGF0ZSAqZW52LAogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGN0eC0+bWVtX2lkeCwgTU9fNjQpOwogICAgIHRjZ19nZW5fbW92Y29uZF9p
NjQoVENHX0NPTkRfRVEsIHRtcCwgdG1wLCBoZXhfbGxzY192YWxfaTY0LAogICAgICAgICAgICAg
ICAgICAgICAgICAgb25lLCB6ZXJvKTsKLSAgICB0Y2dfZ2VuX2V4dHJsX2k2NF9pMzIoaGV4X3By
ZWRbcHJlZG51bV0sIHRtcCk7CisgICAgdGNnX2dlbl9leHRybF9pNjRfaTMyKHByZWQsIHRtcCk7
CiAgICAgdGNnX3RlbXBfZnJlZV9pNjQob25lKTsKICAgICB0Y2dfdGVtcF9mcmVlX2k2NCh6ZXJv
KTsKICAgICB0Y2dfdGVtcF9mcmVlX2k2NCh0bXApOwotLSAKMi43LjQKCg==

