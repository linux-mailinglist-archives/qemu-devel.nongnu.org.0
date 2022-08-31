Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 967585A74B6
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 06:12:25 +0200 (CEST)
Received: from localhost ([::1]:38008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTF5R-0007lL-Ib
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 00:12:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanwj@mail.ustc.edu.cn>)
 id 1oTF3a-0006Kj-KR
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 00:10:26 -0400
Received: from email6.ustc.edu.cn ([2001:da8:d800::8]:53462 helo=ustc.edu.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanwj@mail.ustc.edu.cn>) id 1oTF3V-00034G-DG
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 00:10:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Content-Type:MIME-Version:Message-ID; bh=iGC7w709Myv5ZZgt4ZNaFmx
 sdlW8rP6O6qIiphSzdTQ=; b=ySduoC3QvpR+n0VVFODh0KAem6gK094UAgCedGh
 p2dLZQcP/rVtE6UkhDLFBhBV7jq3u5Owk2xLlAu57YdJJTgDeuiYUhSVayp66FCj
 GSvVaOMxTOZcpbY+/7s4Cq4ucZPm9xBvxzhcTSoqhd7frNk893KjJcG5Okyn+lsu
 tOoc=
Received: by ajax-webmail-newmailweb.ustc.edu.cn (Coremail) ; Wed, 31 Aug
 2022 12:10:03 +0800 (GMT+08:00)
X-Originating-IP: [120.204.79.75]
Date: Wed, 31 Aug 2022 12:10:03 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: fanwj@mail.ustc.edu.cn
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH] linux-user: fix bug about missing signum convert of sigqueue
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT3.0.8 dev build
 20210401(c5ff3689) Copyright (c) 2002-2022 www.mailtech.cn ustccn
X-SendMailWithSms: false
Content-Type: multipart/alternative; 
 boundary="----=_Part_1156652_2103501274.1661919003076"
MIME-Version: 1.0
Message-ID: <7819f62a.51d7c.182f21781c5.Coremail.fanwj@mail.ustc.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: LkAmygDHzq4b3w5jyVimAQ--.2W
X-CM-SenderInfo: pidq4yo6pdxzwoxv3uoohg3hdfq/1tbiAQ4PEFQhoKfxWQADsJ
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWUJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
Received-SPF: pass client-ip=2001:da8:d800::8;
 envelope-from=fanwj@mail.ustc.edu.cn; helo=ustc.edu.cn
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HTML_MESSAGE=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

------=_Part_1156652_2103501274.1661919003076
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

RnJvbSA0ZWJlOGE2N2VkN2M0YjEyMjA5NTdiMmI2N2E2MmJhNjBlMGU4MGVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBmYW53ZW5qaWUgPGZhbndqQG1haWwudXN0Yy5lZHUuY24+CkRh
dGU6IFdlZCwgMzEgQXVnIDIwMjIgMTE6NTU6MjUgKzA4MDAKU3ViamVjdDogW1BBVENIXSBsaW51
eC11c2VyOiBmaXggYnVnIGFib3V0IG1pc3Npbmcgc2lnbnVtIGNvbnZlcnQgb2Ygc2lncXVldWUK
CgpTaWduZWQtb2ZmLWJ5OiBmYW53ZW5qaWUgPGZhbndqQG1haWwudXN0Yy5lZHUuY24+Ci0tLQog
bGludXgtdXNlci9zeXNjYWxsLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCgoKZGlmZiAtLWdpdCBhL2xpbnV4LXVzZXIvc3lzY2FsbC5j
IGIvbGludXgtdXNlci9zeXNjYWxsLmMKaW5kZXggZjQwOTEyMTIwMi4uM2U1YWI0ZjBiMiAxMDA2
NDQKLS0tIGEvbGludXgtdXNlci9zeXNjYWxsLmMKKysrIGIvbGludXgtdXNlci9zeXNjYWxsLmMK
QEAgLTk2OTAsNyArOTY5MCw3IEBAIHN0YXRpYyBhYmlfbG9uZyBkb19zeXNjYWxsMShDUFVBcmNo
U3RhdGUgKmNwdV9lbnYsIGludCBudW0sIGFiaV9sb25nIGFyZzEsCiAgICAgICAgICAgICB9CiAg
ICAgICAgICAgICB0YXJnZXRfdG9faG9zdF9zaWdpbmZvKCZ1aW5mbywgcCk7CiAgICAgICAgICAg
ICB1bmxvY2tfdXNlcihwLCBhcmczLCAwKTsKLSAgICAgICAgICAgIHJldCA9IGdldF9lcnJubyhz
eXNfcnRfc2lncXVldWVpbmZvKGFyZzEsIGFyZzIsICZ1aW5mbykpOworICAgICAgICAgICAgcmV0
ID0gZ2V0X2Vycm5vKHN5c19ydF9zaWdxdWV1ZWluZm8oYXJnMSwgdGFyZ2V0X3RvX2hvc3Rfc2ln
bmFsKGFyZzIpLCAmdWluZm8pKTsKICAgICAgICAgfQogICAgICAgICByZXR1cm4gcmV0OwogICAg
IGNhc2UgVEFSR0VUX05SX3J0X3Rnc2lncXVldWVpbmZvOgpAQCAtOTcwMyw3ICs5NzAzLDcgQEAg
c3RhdGljIGFiaV9sb25nIGRvX3N5c2NhbGwxKENQVUFyY2hTdGF0ZSAqY3B1X2VudiwgaW50IG51
bSwgYWJpX2xvbmcgYXJnMSwKICAgICAgICAgICAgIH0KICAgICAgICAgICAgIHRhcmdldF90b19o
b3N0X3NpZ2luZm8oJnVpbmZvLCBwKTsKICAgICAgICAgICAgIHVubG9ja191c2VyKHAsIGFyZzQs
IDApOwotICAgICAgICAgICAgcmV0ID0gZ2V0X2Vycm5vKHN5c19ydF90Z3NpZ3F1ZXVlaW5mbyhh
cmcxLCBhcmcyLCBhcmczLCAmdWluZm8pKTsKKyAgICAgICAgICAgIHJldCA9IGdldF9lcnJubyhz
eXNfcnRfdGdzaWdxdWV1ZWluZm8oYXJnMSwgYXJnMiwgdGFyZ2V0X3RvX2hvc3Rfc2lnbmFsKGFy
ZzMpLCAmdWluZm8pKTsKICAgICAgICAgfQogICAgICAgICByZXR1cm4gcmV0OwogI2lmZGVmIFRB
UkdFVF9OUl9zaWdyZXR1cm4KLS0gCgo=
------=_Part_1156652_2103501274.1661919003076
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdj5Gcm9tIDRlYmU4YTY3ZWQ3YzRiMTIyMDk1N2IyYjY3YTYyYmE2MGUwZTgwZWMgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxPC9kaXY+PGRpdj5Gcm9tOiBmYW53ZW5qaWUgJmx0O2ZhbndqQG1h
aWwudXN0Yy5lZHUuY24mZ3Q7PC9kaXY+PGRpdj5EYXRlOiBXZWQsIDMxIEF1ZyAyMDIyIDExOjU1
OjI1ICswODAwPC9kaXY+PGRpdj5TdWJqZWN0OiBbUEFUQ0hdIGxpbnV4LXVzZXI6IGZpeCBidWcg
YWJvdXQgbWlzc2luZyBzaWdudW0gY29udmVydCBvZiBzaWdxdWV1ZTwvZGl2PjxkaXY+PGJyPjwv
ZGl2PjxkaXY+U2lnbmVkLW9mZi1ieTogZmFud2VuamllICZsdDtmYW53akBtYWlsLnVzdGMuZWR1
LmNuJmd0OzwvZGl2PjxkaXY+LS0tPC9kaXY+PGRpdj4mbmJzcDtsaW51eC11c2VyL3N5c2NhbGwu
YyB8IDQgKystLTwvZGl2PjxkaXY+Jm5ic3A7MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSk8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PmRpZmYgLS1naXQgYS9s
aW51eC11c2VyL3N5c2NhbGwuYyBiL2xpbnV4LXVzZXIvc3lzY2FsbC5jPC9kaXY+PGRpdj5pbmRl
eCBmNDA5MTIxMjAyLi4zZTVhYjRmMGIyIDEwMDY0NDwvZGl2PjxkaXY+LS0tIGEvbGludXgtdXNl
ci9zeXNjYWxsLmM8L2Rpdj48ZGl2PisrKyBiL2xpbnV4LXVzZXIvc3lzY2FsbC5jPC9kaXY+PGRp
dj5AQCAtOTY5MCw3ICs5NjkwLDcgQEAgc3RhdGljIGFiaV9sb25nIGRvX3N5c2NhbGwxKENQVUFy
Y2hTdGF0ZSAqY3B1X2VudiwgaW50IG51bSwgYWJpX2xvbmcgYXJnMSw8L2Rpdj48ZGl2PiZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwO308L2Rpdj48ZGl2PiZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwO3RhcmdldF90b19o
b3N0X3NpZ2luZm8oJmFtcDt1aW5mbywgcCk7PC9kaXY+PGRpdj4mbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDt1bmxvY2tfdXNlcihwLCBhcmczLCAwKTs8L2Rp
dj48ZGl2Pi0mbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyByZXQgPSBn
ZXRfZXJybm8oc3lzX3J0X3NpZ3F1ZXVlaW5mbyhhcmcxLCBhcmcyLCAmYW1wO3VpbmZvKSk7PC9k
aXY+PGRpdj4rJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgcmV0ID0g
Z2V0X2Vycm5vKHN5c19ydF9zaWdxdWV1ZWluZm8oYXJnMSwgdGFyZ2V0X3RvX2hvc3Rfc2lnbmFs
KGFyZzIpLCAmYW1wO3VpbmZvKSk7PC9kaXY+PGRpdj4mbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7fTwvZGl2PjxkaXY+Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwO3Jl
dHVybiByZXQ7PC9kaXY+PGRpdj4mbmJzcDsgJm5ic3A7ICZuYnNwO2Nhc2UgVEFSR0VUX05SX3J0
X3Rnc2lncXVldWVpbmZvOjwvZGl2PjxkaXY+QEAgLTk3MDMsNyArOTcwMyw3IEBAIHN0YXRpYyBh
YmlfbG9uZyBkb19zeXNjYWxsMShDUFVBcmNoU3RhdGUgKmNwdV9lbnYsIGludCBudW0sIGFiaV9s
b25nIGFyZzEsPC9kaXY+PGRpdj4mbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDt9PC9kaXY+PGRpdj4mbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDt0YXJnZXRfdG9faG9zdF9zaWdpbmZvKCZhbXA7dWluZm8sIHApOzwvZGl2
PjxkaXY+Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7dW5s
b2NrX3VzZXIocCwgYXJnNCwgMCk7PC9kaXY+PGRpdj4tJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDsgcmV0ID0gZ2V0X2Vycm5vKHN5c19ydF90Z3NpZ3F1ZXVlaW5mbyhh
cmcxLCBhcmcyLCBhcmczLCAmYW1wO3VpbmZvKSk7PC9kaXY+PGRpdj4rJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgcmV0ID0gZ2V0X2Vycm5vKHN5c19ydF90Z3NpZ3F1
ZXVlaW5mbyhhcmcxLCBhcmcyLCB0YXJnZXRfdG9faG9zdF9zaWduYWwoYXJnMyksICZhbXA7dWlu
Zm8pKTs8L2Rpdj48ZGl2PiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDt9PC9kaXY+
PGRpdj4mbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7cmV0dXJuIHJldDs8L2Rpdj48
ZGl2PiZuYnNwOyNpZmRlZiBUQVJHRVRfTlJfc2lncmV0dXJuPC9kaXY+PGRpdj4tLSZuYnNwOzwv
ZGl2PjxkaXY+PGJyPjwvZGl2Pg==
------=_Part_1156652_2103501274.1661919003076--


