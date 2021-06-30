Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3B73B807D
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 11:56:33 +0200 (CEST)
Received: from localhost ([::1]:51968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyWxL-0007UV-PG
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 05:56:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wang.yi59@zte.com.cn>)
 id 1lyWwJ-0006bM-35
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 05:55:27 -0400
Received: from mxhk.zte.com.cn ([63.217.80.70]:37886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wang.yi59@zte.com.cn>)
 id 1lyWwF-0001pM-VP
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 05:55:26 -0400
Received: from mse-fl1.zte.com.cn (unknown [10.30.14.238])
 by Forcepoint Email with ESMTPS id 6E014B8EC0EF8AE3A312;
 Wed, 30 Jun 2021 17:55:17 +0800 (CST)
Received: from kjyxapp02.zte.com.cn ([10.30.12.201])
 by mse-fl1.zte.com.cn with SMTP id 15U9t34Z073556;
 Wed, 30 Jun 2021 17:55:03 +0800 (GMT-8)
 (envelope-from wang.yi59@zte.com.cn)
Received: from fox-cloudhost8.localdomain (unknown [10.234.72.110])
 by smtp (Zmail) with SMTP; Wed, 30 Jun 2021 17:52:28 +0800
X-Zmail-TransId: 3e8860dc3edc009-fa0cc
From: Yi Wang <wang.yi59@zte.com.cn>
To: qemu-devel@nongnu.org, marcandre.lureau@gmail.com
Subject: [PATCH v2] qga: fix a memory leak in qmp_guest_exec_status()
Date: Thu,  1 Jul 2021 01:44:41 +0800
Message-Id: <1625075081-2292-1-git-send-email-wang.yi59@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="=====_001_next====="
X-MAIL: mse-fl1.zte.com.cn 15U9t34Z073556
Received-SPF: pass client-ip=63.217.80.70; envelope-from=wang.yi59@zte.com.cn;
 helo=mxhk.zte.com.cn
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_FUTURE_06_12=1.947,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: wang.yi59@zte.com.cn, Wang Yechao <wang.yechao255@zte.com.cn>,
 wang.liang82@zte.com.cn, xue.zhihong@zte.com.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



--=====_001_next=====
Content-Type: multipart/related;
	boundary="=====_002_next====="


--=====_002_next=====
Content-Type: multipart/alternative;
	boundary="=====_003_next====="


--=====_003_next=====
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64 

RnJvbTogV2FuZyBZZWNoYW8gPHdhbmcueWVjaGFvMjU1QHp0ZS5jb20uY24+DQoNCkluIHNvbWUg
Y2FzZSwgJEd1ZXN0RXhlY0luZm8ub3V0Lmxlbmd0aCBtYXliZSB6ZXJvIGFuZCB0aGUgbWVtb3J5
DQppcyBsZWFrZWQgaW4gcW1wX2d1ZXN0X2V4ZWNfc3RhdHVzKCkuIENhbGwgZ19mcmVlKCkgb24g
dGhlIGZpbGVkcw0KZGlyZWN0bHkgdG8gZml4IG1lbW9yeSBsZWFrIChOVUxMIGlzIGlnbm9yZWQp
Lg0KDQokR3Vlc3RFeGVjSW5mby5lcnIuZGF0YSBoYXMgdGhlIHNhbWUgcHJvYmxlbS4NCg0KU2ln
bmVkLW9mZi1ieTogWWVjaGFvIFdhbmcgPHdhbmcueWVjaGFvMjU1QHp0ZS5jb20uY24+DQpTaWdu
ZWQtb2ZmLWJ5OiBZaSBXYW5nIDx3YW5nLnlpNTlAenRlLmNvbS5jbj4NCg0KLS0tDQpDaGFuZ2Vz
IGluIHYyOg0KIC0gZG8gbm90IGNoZWNrIHRoZSBzaXplID4gMCB3aGVuIGNhbGwgZ19mcmVlLiBU
aGFua3MgdG8gTWFyYy4NCi0tLQ0KIHFnYS9jb21tYW5kcy5jIHwgNSArKystLQ0KIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9x
Z2EvY29tbWFuZHMuYyBiL3FnYS9jb21tYW5kcy5jDQppbmRleCBkM2ZlYzgwLi4yNmU5MzU4IDEw
MDY0NA0KLS0tIGEvcWdhL2NvbW1hbmRzLmMNCisrKyBiL3FnYS9jb21tYW5kcy5jDQpAQCAtMjE0
LDE3ICsyMTQsMTggQEAgR3Vlc3RFeGVjU3RhdHVzICpxbXBfZ3Vlc3RfZXhlY19zdGF0dXMoaW50
NjRfdCBwaWQsIEVycm9yICoqZXJycCkNCiAgICAgICAgIGlmIChnZWktPm91dC5sZW5ndGggPiAw
KSB7DQogICAgICAgICAgICAgZ2VzLT5oYXNfb3V0X2RhdGEgPSB0cnVlOw0KICAgICAgICAgICAg
IGdlcy0+b3V0X2RhdGEgPSBnX2Jhc2U2NF9lbmNvZGUoZ2VpLT5vdXQuZGF0YSwgZ2VpLT5vdXQu
bGVuZ3RoKTsNCi0gICAgICAgICAgICBnX2ZyZWUoZ2VpLT5vdXQuZGF0YSk7DQogICAgICAgICAg
ICAgZ2VzLT5oYXNfb3V0X3RydW5jYXRlZCA9IGdlaS0+b3V0LnRydW5jYXRlZDsNCiAgICAgICAg
IH0NCiANCiAgICAgICAgIGlmIChnZWktPmVyci5sZW5ndGggPiAwKSB7DQogICAgICAgICAgICAg
Z2VzLT5oYXNfZXJyX2RhdGEgPSB0cnVlOw0KICAgICAgICAgICAgIGdlcy0+ZXJyX2RhdGEgPSBn
X2Jhc2U2NF9lbmNvZGUoZ2VpLT5lcnIuZGF0YSwgZ2VpLT5lcnIubGVuZ3RoKTsNCi0gICAgICAg
ICAgICBnX2ZyZWUoZ2VpLT5lcnIuZGF0YSk7DQogICAgICAgICAgICAgZ2VzLT5oYXNfZXJyX3Ry
dW5jYXRlZCA9IGdlaS0+ZXJyLnRydW5jYXRlZDsNCiAgICAgICAgIH0NCiANCisgICAgICAgIGdf
ZnJlZShnZWktPm91dC5kYXRhKTsNCisgICAgICAgIGdfZnJlZShnZWktPmVyci5kYXRhKTsNCisN
CiAgICAgICAgIFFUQUlMUV9SRU1PVkUoJmd1ZXN0X2V4ZWNfc3RhdGUucHJvY2Vzc2VzLCBnZWks
IG5leHQpOw0KICAgICAgICAgZ19mcmVlKGdlaSk7DQogICAgIH0NCi0tIA0KMS44LjMuMQ==


--=====_003_next=====
Content-Type: text/html ;
	charset="UTF-8"
Content-Transfer-Encoding: base64

RnJvbTombmJzcDtXYW5nJm5ic3A7WWVjaGFvJm5ic3A7Jmx0O3dhbmcueWVjaGFvMjU1QHp0ZS5j
b20uY24mZ3Q7DTxiciAvPg08YnIgLz5JbiZuYnNwO3NvbWUmbmJzcDtjYXNlLCZuYnNwOyRHdWVz
dEV4ZWNJbmZvLm91dC5sZW5ndGgmbmJzcDttYXliZSZuYnNwO3plcm8mbmJzcDthbmQmbmJzcDt0
aGUmbmJzcDttZW1vcnk8YnIgLz5pcyZuYnNwO2xlYWtlZCZuYnNwO2luJm5ic3A7cW1wX2d1ZXN0
X2V4ZWNfc3RhdHVzKCkuJm5ic3A7Q2FsbCZuYnNwO2dfZnJlZSgpJm5ic3A7b24mbmJzcDt0aGUm
bmJzcDtmaWxlZHM8YnIgLz5kaXJlY3RseSZuYnNwO3RvJm5ic3A7Zml4Jm5ic3A7bWVtb3J5Jm5i
c3A7bGVhayZuYnNwOyhOVUxMJm5ic3A7aXMmbmJzcDtpZ25vcmVkKS48YnIgLz4NPGJyIC8+JEd1
ZXN0RXhlY0luZm8uZXJyLmRhdGEmbmJzcDtoYXMmbmJzcDt0aGUmbmJzcDtzYW1lJm5ic3A7cHJv
YmxlbS48YnIgLz4NPGJyIC8+U2lnbmVkLW9mZi1ieTombmJzcDtZZWNoYW8mbmJzcDtXYW5nJm5i
c3A7Jmx0O3dhbmcueWVjaGFvMjU1QHp0ZS5jb20uY24mZ3Q7DTxiciAvPlNpZ25lZC1vZmYtYnk6
Jm5ic3A7WWkmbmJzcDtXYW5nJm5ic3A7Jmx0O3dhbmcueWk1OUB6dGUuY29tLmNuJmd0Ow08YnIg
Lz4NPGJyIC8+LS0tPGJyIC8+Q2hhbmdlcyZuYnNwO2luJm5ic3A7djI6PGJyIC8+Jm5ic3A7LSZu
YnNwO2RvJm5ic3A7bm90Jm5ic3A7Y2hlY2smbmJzcDt0aGUmbmJzcDtzaXplJm5ic3A7Jmd0OyZu
YnNwOzAmbmJzcDt3aGVuJm5ic3A7Y2FsbCZuYnNwO2dfZnJlZS4mbmJzcDtUaGFua3MmbmJzcDt0
byZuYnNwO01hcmMuPGJyIC8+LS0tPGJyIC8+Jm5ic3A7cWdhL2NvbW1hbmRzLmMmbmJzcDt8Jm5i
c3A7NSZuYnNwOysrKy0tPGJyIC8+Jm5ic3A7MSZuYnNwO2ZpbGUmbmJzcDtjaGFuZ2VkLCZuYnNw
OzMmbmJzcDtpbnNlcnRpb25zKCspLCZuYnNwOzImbmJzcDtkZWxldGlvbnMoLSk8YnIgLz4NPGJy
IC8+ZGlmZiZuYnNwOy0tZ2l0Jm5ic3A7YS9xZ2EvY29tbWFuZHMuYyZuYnNwO2IvcWdhL2NvbW1h
bmRzLmM8YnIgLz5pbmRleCZuYnNwO2QzZmVjODAuLjI2ZTkzNTgmbmJzcDsxMDA2NDQ8YnIgLz4t
LS0mbmJzcDthL3FnYS9jb21tYW5kcy5jPGJyIC8+KysrJm5ic3A7Yi9xZ2EvY29tbWFuZHMuYzxi
ciAvPkBAJm5ic3A7LTIxNCwxNyZuYnNwOysyMTQsMTgmbmJzcDtAQCZuYnNwO0d1ZXN0RXhlY1N0
YXR1cyZuYnNwOypxbXBfZ3Vlc3RfZXhlY19zdGF0dXMoaW50NjRfdCZuYnNwO3BpZCwmbmJzcDtF
cnJvciZuYnNwOyoqZXJycCk8YnIgLz4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDtpZiZuYnNwOyhnZWktJmd0O291dC5sZW5ndGgmbmJzcDsmZ3Q7
Jm5ic3A7MCkmbmJzcDt7PGJyIC8+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Z2VzLSZndDtoYXNfb3V0
X2RhdGEmbmJzcDs9Jm5ic3A7dHJ1ZTs8YnIgLz4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDtnZXMtJmd0
O291dF9kYXRhJm5ic3A7PSZuYnNwO2dfYmFzZTY0X2VuY29kZShnZWktJmd0O291dC5kYXRhLCZu
YnNwO2dlaS0mZ3Q7b3V0Lmxlbmd0aCk7PGJyIC8+LSZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwO2dfZnJlZShnZWkt
Jmd0O291dC5kYXRhKTs8YnIgLz4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDtnZXMtJmd0O2hhc19vdXRf
dHJ1bmNhdGVkJm5ic3A7PSZuYnNwO2dlaS0mZ3Q7b3V0LnRydW5jYXRlZDs8YnIgLz4mbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDt9PGJyIC8+Jm5i
c3A7DTxiciAvPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwO2lmJm5ic3A7KGdlaS0mZ3Q7ZXJyLmxlbmd0aCZuYnNwOyZndDsmbmJzcDswKSZuYnNw
O3s8YnIgLz4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDtnZXMtJmd0O2hhc19lcnJfZGF0YSZuYnNwOz0m
bmJzcDt0cnVlOzxiciAvPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwO2dlcy0mZ3Q7ZXJyX2RhdGEmbmJz
cDs9Jm5ic3A7Z19iYXNlNjRfZW5jb2RlKGdlaS0mZ3Q7ZXJyLmRhdGEsJm5ic3A7Z2VpLSZndDtl
cnIubGVuZ3RoKTs8YnIgLz4tJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Z19mcmVlKGdlaS0mZ3Q7ZXJyLmRhdGEp
OzxiciAvPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwO2dlcy0mZ3Q7aGFzX2Vycl90cnVuY2F0ZWQmbmJz
cDs9Jm5ic3A7Z2VpLSZndDtlcnIudHJ1bmNhdGVkOzxiciAvPiZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwO308YnIgLz4mbmJzcDsNPGJyIC8+KyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwO2dfZnJlZShnZWkt
Jmd0O291dC5kYXRhKTs8YnIgLz4rJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Z19mcmVlKGdlaS0mZ3Q7ZXJyLmRhdGEpOzxiciAvPis8YnIgLz4mbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDtRVEFJTFFfUkVN
T1ZFKCZhbXA7Z3Vlc3RfZXhlY19zdGF0ZS5wcm9jZXNzZXMsJm5ic3A7Z2VpLCZuYnNwO25leHQp
OzxiciAvPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwO2dfZnJlZShnZWkpOzxiciAvPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwO308YnIg
Lz4tLSZuYnNwOw08YnIgLz4xLjguMy4xPGJyIC8+


--=====_003_next=====--

--=====_002_next=====--

--=====_001_next=====--


