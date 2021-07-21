Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1783D0F68
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 15:23:05 +0200 (CEST)
Received: from localhost ([::1]:51030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6CBk-00075a-2E
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 09:23:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sohu0106@126.com>) id 1m66rP-0005jr-4J
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 03:41:43 -0400
Received: from m1512.mail.126.com ([220.181.15.12]:4927)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <sohu0106@126.com>) id 1m66rI-0004RR-Pe
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 03:41:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=RfR+o
 BLjIL/9bsMjFERJqoEqO13ojY90JaSXUu1kGZw=; b=kFPvJw6peN+sh+P0UohUq
 h/dhumDfPPrW23DrU63SZwb1ibhMxNPEHejGca/zhJsMI5fUXby1VVCwyoWvm0sx
 6LKV7Kq1vQQTB5TuJsP67dEFrvD2OyFVjllFr7ZGLBJGem0VYmk4vfJzhs7NX7YZ
 SDet7qY9uzNVAYwEs3xEWg=
Received: from sohu0106$126.com ( [122.96.40.208] ) by ajax-webmail-wmsvr12
 (Coremail) ; Wed, 21 Jul 2021 15:09:17 +0800 (CST)
X-Originating-IP: [122.96.40.208]
Date: Wed, 21 Jul 2021 15:09:17 +0800 (CST)
From: sohu0106 <sohu0106@126.com>
To: jiri@resnulli.us
Subject: [PATCH RFC]Fix rocker device null-pointer crash.
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210104(ab8c30b6)
 Copyright (c) 2002-2021 www.mailtech.cn 126com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <2244a193.2c29.17ac7e5b4fe.Coremail.sohu0106@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: DMqowABnYMUdyPdg1Ro0AQ--.7248W
X-CM-SenderInfo: pvrk3iqrqwqiyswou0bp/1tbi5Q-VHlpD7qpG3wACsn
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
Received-SPF: pass client-ip=220.181.15.12; envelope-from=sohu0106@126.com;
 helo=m1512.mail.126.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 21 Jul 2021 09:19:24 -0400
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
Cc: jasowang@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CgpGcm9tIDUwM2IwOGQzYjhkOGZhYTkzYzNmNWQyYmM5ZWI4YjUyYTc3NzJiODUgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCkZyb206IHNvaHUwMTA2IDxzb2h1MDEwNkAxMjYuY29tPgpEYXRlOiBX
ZWQsIDIxIEp1bCAyMDIxIDEwOjA3OjA3ICswODAwClN1YmplY3Q6IFtSRkNdIEZpeCByb2NrZXIg
ZGV2aWNlIG51bGwgcG9pbnRlciBjcmFzaC4gcWVtdSBjb25maWcgci0+ZnBfcG9ydHMKIHdpdGgg
Ii1kZXZpY2Ugcm9ja2VyLGxlbi1wb3J0cz0xMCIgd2hlbiBndWVzdCBjb25maWcgcG9ydCBsYXJn
ZXQgdGhlbgogci0+ZnBfcG9ydHMoMTApIHItPmZwX3BvcnRbcG9ydF0gaXMgbnVsbC1wb2ludGVy
LHFlbXUgd2lsbCBjcmFzaCBudWxsLXBvaW50ZXIKIFJlcG9ydGVkLWJ5OiBjaGVuemhlIDxjaGVu
emhlQGh1YXdlaS5jb20+CgpTaWduZWQtb2ZmLWJ5OiBzb2h1MDEwNiA8c29odTAxMDZAMTI2LmNv
bT4KLS0tCiBody9uZXQvcm9ja2VyL3JvY2tlci5jICAgIHwgMTAgKysrKystLS0tLQogaHcvbmV0
L3JvY2tlci9yb2NrZXJfZnAuYyB8ICA1ICsrKy0tCiBody9uZXQvcm9ja2VyL3JvY2tlcl9mcC5o
IHwgIDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2h3L25ldC9yb2NrZXIvcm9ja2VyLmMgYi9ody9uZXQvcm9ja2VyL3Jv
Y2tlci5jCmluZGV4IDMxZjIzNDBmYjkuLjQzMWFmMzk4MmYgMTAwNjQ0Ci0tLSBhL2h3L25ldC9y
b2NrZXIvcm9ja2VyLmMKKysrIGIvaHcvbmV0L3JvY2tlci9yb2NrZXIuYwpAQCAtMTc0LDcgKzE3
NCw3IEBAIHN0YXRpYyBpbnQgdHhfY29uc3VtZShSb2NrZXIgKnIsIERlc2NJbmZvICppbmZvKQog
ICAgIH0KIAogICAgIHBwb3J0ID0gcm9ja2VyX2dldF9wcG9ydF9ieV90eF9yaW5nKHIsIGRlc2Nf
Z2V0X3JpbmcoaW5mbykpOwotICAgIGlmICghZnBfcG9ydF9mcm9tX3Bwb3J0KHBwb3J0LCAmcG9y
dCkpIHsKKyAgICBpZiAoIWZwX3BvcnRfZnJvbV9wcG9ydChyLCBwcG9ydCwgJnBvcnQpKSB7CiAg
ICAgICAgIHJldHVybiAtUk9DS0VSX0VJTlZBTDsKICAgICB9CiAKQEAgLTI4Nyw3ICsyODcsNyBA
QCBzdGF0aWMgaW50IGNtZF9nZXRfcG9ydF9zZXR0aW5ncyhSb2NrZXIgKnIsCiAgICAgfQogCiAg
ICAgcHBvcnQgPSByb2NrZXJfdGx2X2dldF9sZTMyKHRsdnNbUk9DS0VSX1RMVl9DTURfUE9SVF9T
RVRUSU5HU19QUE9SVF0pOwotICAgIGlmICghZnBfcG9ydF9mcm9tX3Bwb3J0KHBwb3J0LCAmcG9y
dCkpIHsKKyAgICBpZiAoIWZwX3BvcnRfZnJvbV9wcG9ydChyLCBwcG9ydCwgJnBvcnQpKSB7CiAg
ICAgICAgIHJldHVybiAtUk9DS0VSX0VJTlZBTDsKICAgICB9CiAgICAgZnBfcG9ydCA9IHItPmZw
X3BvcnRbcG9ydF07CkBAIC0zNTcsNyArMzU3LDcgQEAgc3RhdGljIGludCBjbWRfc2V0X3BvcnRf
c2V0dGluZ3MoUm9ja2VyICpyLAogICAgIH0KIAogICAgIHBwb3J0ID0gcm9ja2VyX3Rsdl9nZXRf
bGUzMih0bHZzW1JPQ0tFUl9UTFZfQ01EX1BPUlRfU0VUVElOR1NfUFBPUlRdKTsKLSAgICBpZiAo
IWZwX3BvcnRfZnJvbV9wcG9ydChwcG9ydCwgJnBvcnQpKSB7CisgICAgaWYgKCFmcF9wb3J0X2Zy
b21fcHBvcnQociwgcHBvcnQsICZwb3J0KSkgewogICAgICAgICByZXR1cm4gLVJPQ0tFUl9FSU5W
QUw7CiAgICAgfQogICAgIGZwX3BvcnQgPSByLT5mcF9wb3J0W3BvcnRdOwpAQCAtNTM4LDcgKzUz
OCw3IEBAIGludCByb2NrZXJfZXZlbnRfbWFjX3ZsYW5fc2VlbihSb2NrZXIgKnIsIHVpbnQzMl90
IHBwb3J0LCB1aW50OF90ICphZGRyLAogICAgIGludCBwb3M7CiAgICAgaW50IGVycjsKIAotICAg
IGlmICghZnBfcG9ydF9mcm9tX3Bwb3J0KHBwb3J0LCAmcG9ydCkpIHsKKyAgICBpZiAoIWZwX3Bv
cnRfZnJvbV9wcG9ydChyLCBwcG9ydCwgJnBvcnQpKSB7CiAgICAgICAgIHJldHVybiAtUk9DS0VS
X0VJTlZBTDsKICAgICB9CiAgICAgZnBfcG9ydCA9IHItPmZwX3BvcnRbcG9ydF07CkBAIC02OTAs
NyArNjkwLDcgQEAgaW50IHJvY2tlcl9wb3J0X2VnKFJvY2tlciAqciwgdWludDMyX3QgcHBvcnQs
CiAgICAgRnBQb3J0ICpmcF9wb3J0OwogICAgIHVpbnQzMl90IHBvcnQ7CiAKLSAgICBpZiAoIWZw
X3BvcnRfZnJvbV9wcG9ydChwcG9ydCwgJnBvcnQpKSB7CisgICAgaWYgKCFmcF9wb3J0X2Zyb21f
cHBvcnQociwgcHBvcnQsICZwb3J0KSkgewogICAgICAgICByZXR1cm4gLVJPQ0tFUl9FSU5WQUw7
CiAgICAgfQogCmRpZmYgLS1naXQgYS9ody9uZXQvcm9ja2VyL3JvY2tlcl9mcC5jIGIvaHcvbmV0
L3JvY2tlci9yb2NrZXJfZnAuYwppbmRleCBjYmVlZDY1YmQ1Li40NWI1MDIwMTA2IDEwMDY0NAot
LS0gYS9ody9uZXQvcm9ja2VyL3JvY2tlcl9mcC5jCisrKyBiL2h3L25ldC9yb2NrZXIvcm9ja2Vy
X2ZwLmMKQEAgLTEwOCw5ICsxMDgsMTAgQEAgaW50IGZwX3BvcnRfc2V0X3NldHRpbmdzKEZwUG9y
dCAqcG9ydCwgdWludDMyX3Qgc3BlZWQsCiAgICAgcmV0dXJuIFJPQ0tFUl9PSzsKIH0KIAotYm9v
bCBmcF9wb3J0X2Zyb21fcHBvcnQodWludDMyX3QgcHBvcnQsIHVpbnQzMl90ICpwb3J0KQorYm9v
bCBmcF9wb3J0X2Zyb21fcHBvcnQoUm9ja2VyICpyLCB1aW50MzJfdCBwcG9ydCwgdWludDMyX3Qg
KnBvcnQpCiB7Ci0gICAgaWYgKHBwb3J0IDwgMSB8fCBwcG9ydCA+IFJPQ0tFUl9GUF9QT1JUU19N
QVgpIHsKKyAgICBpZiAocHBvcnQgPCAxIHx8IHBwb3J0ID4gUk9DS0VSX0ZQX1BPUlRTX01BWCB8
fAorICAgICAgICBwcG9ydCA+PSByb2NrZXJfZnBfcG9ydHMocikpIHsKICAgICAgICAgcmV0dXJu
IGZhbHNlOwogICAgIH0KICAgICAqcG9ydCA9IHBwb3J0IC0gMTsKZGlmZiAtLWdpdCBhL2h3L25l
dC9yb2NrZXIvcm9ja2VyX2ZwLmggYi9ody9uZXQvcm9ja2VyL3JvY2tlcl9mcC5oCmluZGV4IDdm
ZjU3YWFjMDEuLmJkMWMyNTg4ZjYgMTAwNjQ0Ci0tLSBhL2h3L25ldC9yb2NrZXIvcm9ja2VyX2Zw
LmgKKysrIGIvaHcvbmV0L3JvY2tlci9yb2NrZXJfZnAuaApAQCAtMzcsNyArMzcsNyBAQCBpbnQg
ZnBfcG9ydF9nZXRfc2V0dGluZ3MoRnBQb3J0ICpwb3J0LCB1aW50MzJfdCAqc3BlZWQsCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgdWludDhfdCAqZHVwbGV4LCB1aW50OF90ICphdXRvbmVnKTsK
IGludCBmcF9wb3J0X3NldF9zZXR0aW5ncyhGcFBvcnQgKnBvcnQsIHVpbnQzMl90IHNwZWVkLAog
ICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQ4X3QgZHVwbGV4LCB1aW50OF90IGF1dG9uZWcp
OwotYm9vbCBmcF9wb3J0X2Zyb21fcHBvcnQodWludDMyX3QgcHBvcnQsIHVpbnQzMl90ICpwb3J0
KTsKK2Jvb2wgZnBfcG9ydF9mcm9tX3Bwb3J0KFJvY2tlciAqciwgdWludDMyX3QgcHBvcnQsIHVp
bnQzMl90ICpwb3J0KTsKIFdvcmxkICpmcF9wb3J0X2dldF93b3JsZChGcFBvcnQgKnBvcnQpOwog
dm9pZCBmcF9wb3J0X3NldF93b3JsZChGcFBvcnQgKnBvcnQsIFdvcmxkICp3b3JsZCk7CiBib29s
IGZwX3BvcnRfY2hlY2tfd29ybGQoRnBQb3J0ICpwb3J0LCBXb3JsZCAqd29ybGQpOwotLSAKMi4y
NS4xCgoK

