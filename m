Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1E53B7E4B
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 09:42:38 +0200 (CEST)
Received: from localhost ([::1]:53134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyUrl-00084x-Hb
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 03:42:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wang.yi59@zte.com.cn>)
 id 1lyUqu-0007Ez-6N
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 03:41:44 -0400
Received: from mxhk.zte.com.cn ([63.217.80.70]:32944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wang.yi59@zte.com.cn>)
 id 1lyUqo-0005ng-Nv
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 03:41:43 -0400
Received: from mse-fl2.zte.com.cn (unknown [10.30.14.239])
 by Forcepoint Email with ESMTPS id E22781591AAD9E8EE1DC
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 15:41:28 +0800 (CST)
Received: from kjyxapp01.zte.com.cn ([10.30.12.200])
 by mse-fl2.zte.com.cn with SMTP id 15U7erDo071511
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 15:41:07 +0800 (GMT-8)
 (envelope-from wang.yi59@zte.com.cn)
Received: from fox-cloudhost8.localdomain (unknown [10.234.72.110])
 by smtp (Zmail) with SMTP; Wed, 30 Jun 2021 15:41:07 +0800
X-Zmail-TransId: 3e8860dc2012009-e11ad
From: Yi Wang <wang.yi59@zte.com.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH] qga: fix a memory leak in qmp_guest_exec_status()
Date: Wed, 30 Jun 2021 23:33:19 +0800
Message-Id: <1625067199-64288-1-git-send-email-wang.yi59@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="=====_001_next====="
X-MAIL: mse-fl2.zte.com.cn 15U7erDo071511
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

RnJvbTogV2FuZyBZZWNoYW8gPHdhbmcueWVjaGFvMjU1QHp0ZS5jb20uY24+DQoNClRoZSAkR3Vl
c3RFeGVjSW5mby5vdXQuZGF0YSBpcyBhbGxvY2VkIGluIGd1ZXN0X2V4ZWNfb3V0cHV0X3dhdGNo
KCksDQphbmQgdGhlIGJ1ZmZlciBzaXplIGlzICRHdWVzdEV4ZWNJbmZvLm91dC5zaXplLiBXZSBz
aG91bGQgZnJlZSB0aGUNCiRHdWVzdEV4ZWNJbmZvLm91dC5kYXRhIGp1ZGdlIGJ5IHRoZSBzaXpl
LCBub3QgbGVuZ3RoLiBCZWNhdXNlIHRoZQ0KJEd1ZXN0RXhlY0luZm8ub3V0Lmxlbmd0aCBtYXli
ZSB6ZXJvIGluIHNvbWUgY2FzZS4NCg0KJEd1ZXN0RXhlY0luZm8uZXJyLmRhdGEgaGFzIHRoZSBz
YW1lIHByb2JsZW0uDQoNClNpZ25lZC1vZmYtYnk6IFllY2hhbyBXYW5nIDx3YW5nLnllY2hhbzI1
NUB6dGUuY29tLmNuPg0KU2lnbmVkLW9mZi1ieTogWWkgV2FuZyA8d2FuZy55aTU5QHp0ZS5jb20u
Y24+DQotLS0NCiBxZ2EvY29tbWFuZHMuYyB8IDggKysrKysrLS0NCiAxIGZpbGUgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvcWdhL2NvbW1h
bmRzLmMgYi9xZ2EvY29tbWFuZHMuYw0KaW5kZXggZDNmZWM4MC4uNThkNGRhOSAxMDA2NDQNCi0t
LSBhL3FnYS9jb21tYW5kcy5jDQorKysgYi9xZ2EvY29tbWFuZHMuYw0KQEAgLTIxNCwxNyArMjE0
LDIxIEBAIEd1ZXN0RXhlY1N0YXR1cyAqcW1wX2d1ZXN0X2V4ZWNfc3RhdHVzKGludDY0X3QgcGlk
LCBFcnJvciAqKmVycnApDQogICAgICAgICBpZiAoZ2VpLT5vdXQubGVuZ3RoID4gMCkgew0KICAg
ICAgICAgICAgIGdlcy0+aGFzX291dF9kYXRhID0gdHJ1ZTsNCiAgICAgICAgICAgICBnZXMtPm91
dF9kYXRhID0gZ19iYXNlNjRfZW5jb2RlKGdlaS0+b3V0LmRhdGEsIGdlaS0+b3V0Lmxlbmd0aCk7
DQotICAgICAgICAgICAgZ19mcmVlKGdlaS0+b3V0LmRhdGEpOw0KICAgICAgICAgICAgIGdlcy0+
aGFzX291dF90cnVuY2F0ZWQgPSBnZWktPm91dC50cnVuY2F0ZWQ7DQogICAgICAgICB9DQogDQog
ICAgICAgICBpZiAoZ2VpLT5lcnIubGVuZ3RoID4gMCkgew0KICAgICAgICAgICAgIGdlcy0+aGFz
X2Vycl9kYXRhID0gdHJ1ZTsNCiAgICAgICAgICAgICBnZXMtPmVycl9kYXRhID0gZ19iYXNlNjRf
ZW5jb2RlKGdlaS0+ZXJyLmRhdGEsIGdlaS0+ZXJyLmxlbmd0aCk7DQotICAgICAgICAgICAgZ19m
cmVlKGdlaS0+ZXJyLmRhdGEpOw0KICAgICAgICAgICAgIGdlcy0+aGFzX2Vycl90cnVuY2F0ZWQg
PSBnZWktPmVyci50cnVuY2F0ZWQ7DQogICAgICAgICB9DQogDQorICAgICAgICBpZiAoZ2VpLT5v
dXQuc2l6ZSA+IDApDQorICAgICAgICAgICAgZ19mcmVlKGdlaS0+b3V0LmRhdGEpOw0KKw0KKyAg
ICAgICAgaWYgKGdlaS0+ZXJyLnNpemUgPiAwKQ0KKyAgICAgICAgICAgICBnX2ZyZWUoZ2VpLT5l
cnIuZGF0YSk7DQorDQogICAgICAgICBRVEFJTFFfUkVNT1ZFKCZndWVzdF9leGVjX3N0YXRlLnBy
b2Nlc3NlcywgZ2VpLCBuZXh0KTsNCiAgICAgICAgIGdfZnJlZShnZWkpOw0KICAgICB9DQotLSAN
CjEuOC4zLjE=


--=====_003_next=====
Content-Type: text/html ;
	charset="UTF-8"
Content-Transfer-Encoding: base64

RnJvbTombmJzcDtXYW5nJm5ic3A7WWVjaGFvJm5ic3A7Jmx0O3dhbmcueWVjaGFvMjU1QHp0ZS5j
b20uY24mZ3Q7DTxiciAvPg08YnIgLz5UaGUmbmJzcDskR3Vlc3RFeGVjSW5mby5vdXQuZGF0YSZu
YnNwO2lzJm5ic3A7YWxsb2NlZCZuYnNwO2luJm5ic3A7Z3Vlc3RfZXhlY19vdXRwdXRfd2F0Y2go
KSw8YnIgLz5hbmQmbmJzcDt0aGUmbmJzcDtidWZmZXImbmJzcDtzaXplJm5ic3A7aXMmbmJzcDsk
R3Vlc3RFeGVjSW5mby5vdXQuc2l6ZS4mbmJzcDtXZSZuYnNwO3Nob3VsZCZuYnNwO2ZyZWUmbmJz
cDt0aGU8YnIgLz4kR3Vlc3RFeGVjSW5mby5vdXQuZGF0YSZuYnNwO2p1ZGdlJm5ic3A7YnkmbmJz
cDt0aGUmbmJzcDtzaXplLCZuYnNwO25vdCZuYnNwO2xlbmd0aC4mbmJzcDtCZWNhdXNlJm5ic3A7
dGhlPGJyIC8+JEd1ZXN0RXhlY0luZm8ub3V0Lmxlbmd0aCZuYnNwO21heWJlJm5ic3A7emVybyZu
YnNwO2luJm5ic3A7c29tZSZuYnNwO2Nhc2UuPGJyIC8+DTxiciAvPiRHdWVzdEV4ZWNJbmZvLmVy
ci5kYXRhJm5ic3A7aGFzJm5ic3A7dGhlJm5ic3A7c2FtZSZuYnNwO3Byb2JsZW0uPGJyIC8+DTxi
ciAvPlNpZ25lZC1vZmYtYnk6Jm5ic3A7WWVjaGFvJm5ic3A7V2FuZyZuYnNwOyZsdDt3YW5nLnll
Y2hhbzI1NUB6dGUuY29tLmNuJmd0Ow08YnIgLz5TaWduZWQtb2ZmLWJ5OiZuYnNwO1lpJm5ic3A7
V2FuZyZuYnNwOyZsdDt3YW5nLnlpNTlAenRlLmNvbS5jbiZndDsNPGJyIC8+LS0tPGJyIC8+Jm5i
c3A7cWdhL2NvbW1hbmRzLmMmbmJzcDt8Jm5ic3A7OCZuYnNwOysrKysrKy0tPGJyIC8+Jm5ic3A7
MSZuYnNwO2ZpbGUmbmJzcDtjaGFuZ2VkLCZuYnNwOzYmbmJzcDtpbnNlcnRpb25zKCspLCZuYnNw
OzImbmJzcDtkZWxldGlvbnMoLSk8YnIgLz4NPGJyIC8+ZGlmZiZuYnNwOy0tZ2l0Jm5ic3A7YS9x
Z2EvY29tbWFuZHMuYyZuYnNwO2IvcWdhL2NvbW1hbmRzLmM8YnIgLz5pbmRleCZuYnNwO2QzZmVj
ODAuLjU4ZDRkYTkmbmJzcDsxMDA2NDQ8YnIgLz4tLS0mbmJzcDthL3FnYS9jb21tYW5kcy5jPGJy
IC8+KysrJm5ic3A7Yi9xZ2EvY29tbWFuZHMuYzxiciAvPkBAJm5ic3A7LTIxNCwxNyZuYnNwOysy
MTQsMjEmbmJzcDtAQCZuYnNwO0d1ZXN0RXhlY1N0YXR1cyZuYnNwOypxbXBfZ3Vlc3RfZXhlY19z
dGF0dXMoaW50NjRfdCZuYnNwO3BpZCwmbmJzcDtFcnJvciZuYnNwOyoqZXJycCk8YnIgLz4mbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDtpZiZuYnNw
OyhnZWktJmd0O291dC5sZW5ndGgmbmJzcDsmZ3Q7Jm5ic3A7MCkmbmJzcDt7PGJyIC8+Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Z2VzLSZndDtoYXNfb3V0X2RhdGEmbmJzcDs9Jm5ic3A7dHJ1ZTs8YnIg
Lz4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDtnZXMtJmd0O291dF9kYXRhJm5ic3A7PSZuYnNwO2dfYmFz
ZTY0X2VuY29kZShnZWktJmd0O291dC5kYXRhLCZuYnNwO2dlaS0mZ3Q7b3V0Lmxlbmd0aCk7PGJy
IC8+LSZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwO2dfZnJlZShnZWktJmd0O291dC5kYXRhKTs8YnIgLz4mbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDtnZXMtJmd0O2hhc19vdXRfdHJ1bmNhdGVkJm5ic3A7PSZuYnNwO2dlaS0m
Z3Q7b3V0LnRydW5jYXRlZDs8YnIgLz4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDt9PGJyIC8+Jm5ic3A7DTxiciAvPiZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwO2lmJm5ic3A7KGdlaS0mZ3Q7ZXJy
Lmxlbmd0aCZuYnNwOyZndDsmbmJzcDswKSZuYnNwO3s8YnIgLz4mbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDtnZXMtJmd0O2hhc19lcnJfZGF0YSZuYnNwOz0mbmJzcDt0cnVlOzxiciAvPiZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwO2dlcy0mZ3Q7ZXJyX2RhdGEmbmJzcDs9Jm5ic3A7Z19iYXNlNjRfZW5jb2RlKGdl
aS0mZ3Q7ZXJyLmRhdGEsJm5ic3A7Z2VpLSZndDtlcnIubGVuZ3RoKTs8YnIgLz4tJm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Z19mcmVlKGdlaS0mZ3Q7ZXJyLmRhdGEpOzxiciAvPiZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
O2dlcy0mZ3Q7aGFzX2Vycl90cnVuY2F0ZWQmbmJzcDs9Jm5ic3A7Z2VpLSZndDtlcnIudHJ1bmNh
dGVkOzxiciAvPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwO308YnIgLz4mbmJzcDsNPGJyIC8+KyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwO2lmJm5ic3A7KGdlaS0mZ3Q7b3V0LnNpemUmbmJzcDsmZ3Q7Jm5i
c3A7MCk8YnIgLz4rJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Z19mcmVlKGdlaS0mZ3Q7b3V0LmRhdGEpOzxiciAv
Pis8YnIgLz4rJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
aWYmbmJzcDsoZ2VpLSZndDtlcnIuc2l6ZSZuYnNwOyZndDsmbmJzcDswKTxiciAvPismbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDtnX2ZyZWUoZ2VpLSZndDtlcnIuZGF0YSk7PGJyIC8+KzxiciAvPiZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwO1FUQUlMUV9S
RU1PVkUoJmFtcDtndWVzdF9leGVjX3N0YXRlLnByb2Nlc3NlcywmbmJzcDtnZWksJm5ic3A7bmV4
dCk7PGJyIC8+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Z19mcmVlKGdlaSk7PGJyIC8+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7fTxi
ciAvPi0tJm5ic3A7DTxiciAvPjEuOC4zLjE8YnIgLz4=


--=====_003_next=====--

--=====_002_next=====--

--=====_001_next=====--


