Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B58D65AA86
	for <lists+qemu-devel@lfdr.de>; Sun,  1 Jan 2023 16:59:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pC0iS-0004d1-82; Sun, 01 Jan 2023 10:57:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanwj@mail.ustc.edu.cn>)
 id 1pC0iN-0004cL-Gz
 for qemu-devel@nongnu.org; Sun, 01 Jan 2023 10:57:35 -0500
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanwj@mail.ustc.edu.cn>) id 1pC0iI-00007e-5x
 for qemu-devel@nongnu.org; Sun, 01 Jan 2023 10:57:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Content-Type:MIME-Version:Message-ID; bh=DKXYvC04Gn+qByu8yrqALOo
 RTVKVH0lI3LlzWt8Qw/4=; b=AzGjzub/BhUEwUvTQX25rRRbmt3ShdcJaNxPfid
 yTmwAkY0I1PY+u3bsSca+AAqfmD+UjX0zQyqOedZUUrzJozvYqAJCYc14GmmxzDS
 JLz5njJ1YI2JhqTA9xB6lbwHbJnvDwlOUnrERKbpuG/kOGXsotkrPSvcPv4KqkwR
 vcZA=
Received: by ajax-webmail-newmailweb.ustc.edu.cn (Coremail) ; Sun, 1 Jan
 2023 23:57:06 +0800 (GMT+08:00)
X-Originating-IP: [120.204.77.150]
Date: Sun, 1 Jan 2023 23:57:06 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: fanwj@mail.ustc.edu.cn
To: qemu-devel@nongnu.org
Cc: qemu-devel@nongnu.org
Subject: [PATCH] linux-user: fix bug about incorrect base addresss of idt
 and  gdt on i386 and x86_64
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT3.0.8 dev build
 20210401(c5ff3689) Copyright (c) 2002-2023 www.mailtech.cn ustccn
X-SendMailWithSms: false
Content-Type: multipart/alternative; 
 boundary="----=_Part_455358_1492238213.1672588626158"
MIME-Version: 1.0
Message-ID: <75da8346.1fd34.1856e0d08ef.Coremail.fanwj@mail.ustc.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: LkAmygDXra5TrbFjZs6GAA--.0W
X-CM-SenderInfo: pidq4yo6pdxzwoxv3uoohg3hdfq/1tbiAQ4REFQhoPMeLgAis6
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
Received-SPF: pass client-ip=2001:da8:d800::8;
 envelope-from=fanwj@mail.ustc.edu.cn; helo=ustc.edu.cn
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HTML_MESSAGE=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

------=_Part_455358_1492238213.1672588626158
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

RnJvbSA0NjAxYTYyNGY0MGIyYzg5ZTdkZjJkZWMxYWRmZmI0ZjQzMDhiYTJkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBmYW53ZW5qaWUgPGZhbndqQG1haWwudXN0Yy5lZHUuY24+CkRh
dGU6IFN1biwgMSBKYW4gMjAyMyAyMzoxMzozNCArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIGxpbnV4
LXVzZXI6IGZpeCBidWcgYWJvdXQgaW5jb3JyZWN0IGJhc2UgYWRkcmVzc3Mgb2YgaWR0IGFuZAog
Z2R0IG9uIGkzODYgYW5kIHg4Nl82NAoKClJlc29sdmVzOiBodHRwczovL2dpdGxhYi5jb20vcWVt
dS1wcm9qZWN0L3FlbXUvLS9pc3N1ZXMvMTQwNQpTaWduZWQtb2ZmLWJ5OiBmYW53ZW5qaWUgPGZh
bndqQG1haWwudXN0Yy5lZHUuY24+Ci0tLQogbGludXgtdXNlci9tYWluLmMgfCAxMyArKysrKysr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQoKCmRpZmYgLS1naXQgYS9s
aW51eC11c2VyL21haW4uYyBiL2xpbnV4LXVzZXIvbWFpbi5jCmluZGV4IGExN2ZlZDA0NWIuLjVk
NjczYzk1YjMgMTAwNjQ0Ci0tLSBhL2xpbnV4LXVzZXIvbWFpbi5jCisrKyBiL2xpbnV4LXVzZXIv
bWFpbi5jCkBAIC0xNzEsNiArMTcxLDEyIEBAIHZvaWQgZm9ya19lbmQoaW50IGNoaWxkKQogCiBf
X3RocmVhZCBDUFVTdGF0ZSAqdGhyZWFkX2NwdTsKIAorI2lmIGRlZmluZWQoVEFSR0VUX0kzODYp
IHx8IGRlZmluZWQoVEFSR0VUX1g4Nl82NCkKKyNpbmNsdWRlIDxzdGRhbGlnbi5oPgorX190aHJl
YWQgYWxpZ25hcyhUQVJHRVRfUEFHRV9TSVpFKSBzdGF0aWMgdWludDY0X3QgZ2R0X2Jhc2VbVEFS
R0VUX0dEVF9FTlRSSUVTXTsKK19fdGhyZWFkIGFsaWduYXMoVEFSR0VUX1BBR0VfU0laRSkgc3Rh
dGljIHVpbnQ2NF90IGlkdF9iYXNlW1RBUkdFVF9QQUdFX1NJWkUgLyBzaXplb2YodWludDY0X3Qp
XTsKKyNlbmRpZgorCiBib29sIHFlbXVfY3B1X2lzX3NlbGYoQ1BVU3RhdGUgKmNwdSkKIHsKICAg
ICByZXR1cm4gdGhyZWFkX2NwdSA9PSBjcHU7CkBAIC0yMzUsNiArMjQxLDEzIEBAIENQVUFyY2hT
dGF0ZSAqY3B1X2NvcHkoQ1BVQXJjaFN0YXRlICplbnYpCiAgICAgbmV3X2NwdS0+dGNnX2NmbGFn
cyA9IGNwdS0+dGNnX2NmbGFnczsKICAgICBtZW1jcHkobmV3X2VudiwgZW52LCBzaXplb2YoQ1BV
QXJjaFN0YXRlKSk7CiAKKyNpZiBkZWZpbmVkKFRBUkdFVF9JMzg2KSB8fCBkZWZpbmVkKFRBUkdF
VF9YODZfNjQpCisgICAgbWVtY3B5KGlkdF9iYXNlLCAodm9pZCopbmV3X2Vudi0+aWR0LmJhc2Us
IHNpemVvZih1aW50NjRfdCkgKiAobmV3X2Vudi0+aWR0LmxpbWl0ICsgMSkpOworICAgIG1lbWNw
eShnZHRfYmFzZSwgKHZvaWQqKW5ld19lbnYtPmdkdC5iYXNlLCBzaXplb2YodWludDY0X3QpICog
VEFSR0VUX0dEVF9FTlRSSUVTKTsKKyAgICBuZXdfZW52LT5pZHQuYmFzZSA9ICh0YXJnZXRfdWxv
bmcpaWR0X2Jhc2U7CisgICAgbmV3X2Vudi0+Z2R0LmJhc2UgPSAodGFyZ2V0X3Vsb25nKWdkdF9i
YXNlOworI2VuZGlmCisKICAgICAvKiBDbG9uZSBhbGwgYnJlYWsvd2F0Y2hwb2ludHMuCiAgICAg
ICAgTm90ZTogT25jZSB3ZSBzdXBwb3J0IHB0cmFjZSB3aXRoIGh3LWRlYnVnIHJlZ2lzdGVyIGFj
Y2VzcywgbWFrZSBzdXJlCiAgICAgICAgQlBfQ1BVIGJyZWFrL3dhdGNocG9pbnRzIGFyZSBoYW5k
bGVkIGNvcnJlY3RseSBvbiBjbG9uZS4gKi8KLS0gCjIuMzQuMQoK
------=_Part_455358_1492238213.1672588626158
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdj5Gcm9tIDQ2MDFhNjI0ZjQwYjJjODllN2RmMmRlYzFhZGZmYjRmNDMwOGJhMmQgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxPC9kaXY+PGRpdj5Gcm9tOiBmYW53ZW5qaWUgJmx0O2ZhbndqQG1h
aWwudXN0Yy5lZHUuY24mZ3Q7PC9kaXY+PGRpdj5EYXRlOiBTdW4sIDEgSmFuIDIwMjMgMjM6MTM6
MzQgKzA4MDA8L2Rpdj48ZGl2PlN1YmplY3Q6IFtQQVRDSF0gbGludXgtdXNlcjogZml4IGJ1ZyBh
Ym91dCBpbmNvcnJlY3QgYmFzZSBhZGRyZXNzcyBvZiBpZHQgYW5kPC9kaXY+PGRpdj4mbmJzcDtn
ZHQgb24gaTM4NiBhbmQgeDg2XzY0PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5SZXNvbHZlczog
aHR0cHM6Ly9naXRsYWIuY29tL3FlbXUtcHJvamVjdC9xZW11Ly0vaXNzdWVzLzE0MDU8L2Rpdj48
ZGl2PlNpZ25lZC1vZmYtYnk6IGZhbndlbmppZSAmbHQ7ZmFud2pAbWFpbC51c3RjLmVkdS5jbiZn
dDs8L2Rpdj48ZGl2Pi0tLTwvZGl2PjxkaXY+Jm5ic3A7bGludXgtdXNlci9tYWluLmMgfCAxMyAr
KysrKysrKysrKysrPC9kaXY+PGRpdj4mbmJzcDsxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9u
cygrKTwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+ZGlmZiAtLWdpdCBhL2xpbnV4LXVzZXIvbWFp
bi5jIGIvbGludXgtdXNlci9tYWluLmM8L2Rpdj48ZGl2PmluZGV4IGExN2ZlZDA0NWIuLjVkNjcz
Yzk1YjMgMTAwNjQ0PC9kaXY+PGRpdj4tLS0gYS9saW51eC11c2VyL21haW4uYzwvZGl2PjxkaXY+
KysrIGIvbGludXgtdXNlci9tYWluLmM8L2Rpdj48ZGl2PkBAIC0xNzEsNiArMTcxLDEyIEBAIHZv
aWQgZm9ya19lbmQoaW50IGNoaWxkKTwvZGl2PjxkaXY+Jm5ic3A7PC9kaXY+PGRpdj4mbmJzcDtf
X3RocmVhZCBDUFVTdGF0ZSAqdGhyZWFkX2NwdTs8L2Rpdj48ZGl2PiZuYnNwOzwvZGl2PjxkaXY+
KyNpZiBkZWZpbmVkKFRBUkdFVF9JMzg2KSB8fCBkZWZpbmVkKFRBUkdFVF9YODZfNjQpPC9kaXY+
PGRpdj4rI2luY2x1ZGUgJmx0O3N0ZGFsaWduLmgmZ3Q7PC9kaXY+PGRpdj4rX190aHJlYWQgYWxp
Z25hcyhUQVJHRVRfUEFHRV9TSVpFKSBzdGF0aWMgdWludDY0X3QgZ2R0X2Jhc2VbVEFSR0VUX0dE
VF9FTlRSSUVTXTs8L2Rpdj48ZGl2PitfX3RocmVhZCBhbGlnbmFzKFRBUkdFVF9QQUdFX1NJWkUp
IHN0YXRpYyB1aW50NjRfdCBpZHRfYmFzZVtUQVJHRVRfUEFHRV9TSVpFIC8gc2l6ZW9mKHVpbnQ2
NF90KV07PC9kaXY+PGRpdj4rI2VuZGlmPC9kaXY+PGRpdj4rPC9kaXY+PGRpdj4mbmJzcDtib29s
IHFlbXVfY3B1X2lzX3NlbGYoQ1BVU3RhdGUgKmNwdSk8L2Rpdj48ZGl2PiZuYnNwO3s8L2Rpdj48
ZGl2PiZuYnNwOyAmbmJzcDsgJm5ic3A7cmV0dXJuIHRocmVhZF9jcHUgPT0gY3B1OzwvZGl2Pjxk
aXY+QEAgLTIzNSw2ICsyNDEsMTMgQEAgQ1BVQXJjaFN0YXRlICpjcHVfY29weShDUFVBcmNoU3Rh
dGUgKmVudik8L2Rpdj48ZGl2PiZuYnNwOyAmbmJzcDsgJm5ic3A7bmV3X2NwdS0mZ3Q7dGNnX2Nm
bGFncyA9IGNwdS0mZ3Q7dGNnX2NmbGFnczs8L2Rpdj48ZGl2PiZuYnNwOyAmbmJzcDsgJm5ic3A7
bWVtY3B5KG5ld19lbnYsIGVudiwgc2l6ZW9mKENQVUFyY2hTdGF0ZSkpOzwvZGl2PjxkaXY+Jm5i
c3A7PC9kaXY+PGRpdj4rI2lmIGRlZmluZWQoVEFSR0VUX0kzODYpIHx8IGRlZmluZWQoVEFSR0VU
X1g4Nl82NCk8L2Rpdj48ZGl2PismbmJzcDsgJm5ic3A7IG1lbWNweShpZHRfYmFzZSwgKHZvaWQq
KW5ld19lbnYtJmd0O2lkdC5iYXNlLCBzaXplb2YodWludDY0X3QpICogKG5ld19lbnYtJmd0O2lk
dC5saW1pdCArIDEpKTs8L2Rpdj48ZGl2PismbmJzcDsgJm5ic3A7IG1lbWNweShnZHRfYmFzZSwg
KHZvaWQqKW5ld19lbnYtJmd0O2dkdC5iYXNlLCBzaXplb2YodWludDY0X3QpICogVEFSR0VUX0dE
VF9FTlRSSUVTKTs8L2Rpdj48ZGl2PismbmJzcDsgJm5ic3A7IG5ld19lbnYtJmd0O2lkdC5iYXNl
ID0gKHRhcmdldF91bG9uZylpZHRfYmFzZTs8L2Rpdj48ZGl2PismbmJzcDsgJm5ic3A7IG5ld19l
bnYtJmd0O2dkdC5iYXNlID0gKHRhcmdldF91bG9uZylnZHRfYmFzZTs8L2Rpdj48ZGl2PisjZW5k
aWY8L2Rpdj48ZGl2Pis8L2Rpdj48ZGl2PiZuYnNwOyAmbmJzcDsgJm5ic3A7LyogQ2xvbmUgYWxs
IGJyZWFrL3dhdGNocG9pbnRzLjwvZGl2PjxkaXY+Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
IE5vdGU6IE9uY2Ugd2Ugc3VwcG9ydCBwdHJhY2Ugd2l0aCBody1kZWJ1ZyByZWdpc3RlciBhY2Nl
c3MsIG1ha2Ugc3VyZTwvZGl2PjxkaXY+Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IEJQX0NQ
VSBicmVhay93YXRjaHBvaW50cyBhcmUgaGFuZGxlZCBjb3JyZWN0bHkgb24gY2xvbmUuICovPC9k
aXY+PGRpdj4tLSZuYnNwOzwvZGl2PjxkaXY+Mi4zNC4xPC9kaXY+PGRpdj48YnI+PC9kaXY+
------=_Part_455358_1492238213.1672588626158--


