Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5582E9769
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 15:37:49 +0100 (CET)
Received: from localhost ([::1]:50286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwQzU-0002bS-8F
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 09:37:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kwQuL-0006U4-A0
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 09:32:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kwQuI-00013y-6d
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 09:32:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609770743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9vee9K26BvrmT5nT/Jr7ylwdherUzohr7+W+KBGF2G4=;
 b=Xq0AddVTW3INT7gKBSSOoOwoDpTPUgCVPFPeJIGOzASNpcQvH0AkU74v0PV0K0NtYKlCYb
 fBdTozoUR7d4bM4sA9MYO5YoyYxsg2nZaGk/SplnSPFqzLAqdWvewk78kcsTjeOlKZo5xp
 K1t++sAamh9y9EZ1YL8EMwSidDgDf5k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-e_c4o7ryO4G7PC-Y2Yv-kg-1; Mon, 04 Jan 2021 09:32:17 -0500
X-MC-Unique: e_c4o7ryO4G7PC-Y2Yv-kg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A942C1842140;
 Mon,  4 Jan 2021 14:32:16 +0000 (UTC)
Received: from localhost (ovpn-113-37.ams2.redhat.com [10.36.113.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 456D06F818;
 Mon,  4 Jan 2021 14:32:16 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/5] tracetool: show trace-events filename/lineno in fmt string
 errors
Date: Mon,  4 Jan 2021 14:31:54 +0000
Message-Id: <20210104143154.462212-6-stefanha@redhat.com>
In-Reply-To: <20210104143154.462212-1-stefanha@redhat.com>
References: <20210104143154.462212-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlIGNvbXBpbGVyIGVuY291bnRlcnMgdHJhY2UgZXZlbnQgZm9ybWF0IHN0cmluZ3MgaW4gZ2Vu
ZXJhdGVkIGNvZGUuCkZvcm1hdCBzdHJpbmdzIGFyZSBlcnJvci1wcm9uZSBhbmQgdGhlcmVmb3Jl
IGNsZWFyIGNvbXBpbGVyIGVycm9ycyBhcmUKaW1wb3J0YW50LgoKVXNlIHRoZSAjbGluZSBkaXJl
Y3RpdmUgdG8gc2hvdyB0aGUgdHJhY2UtZXZlbnRzIGZpbGVuYW1lIGFuZCBsaW5lCm51bWJlciBp
biBmb3JtYXQgc3RyaW5nIGVycm9yczoKaHR0cHM6Ly9nY2MuZ251Lm9yZy9vbmxpbmVkb2NzL2dj
Yy0xMC4yLjAvY3BwL0xpbmUtQ29udHJvbC5odG1sCgpGb3IgZXhhbXBsZSwgaWYgdGhlIGNwdV9p
biB0cmFjZSBldmVudCdzICV1IGlzIGNoYW5nZWQgdG8gJXAgdGhlCmZvbGxvd2luZyBlcnJvciBp
cyByZXBvcnRlZDoKCiAgdHJhY2UtZXZlbnRzOjI5OjE4OiBlcnJvcjogZm9ybWF0IOKAmCVw4oCZ
IGV4cGVjdHMgYXJndW1lbnQgb2YgdHlwZSDigJh2b2lkICrigJksIGJ1dCBhcmd1bWVudCA3IGhh
cyB0eXBlIOKAmHVuc2lnbmVkIGludOKAmSBbLVdlcnJvcj1mb3JtYXQ9XQoKTGluZSAyOSBpbiB0
cmFjZS1ldmVudHMgaXMgd2hlcmUgY3B1X2luIGlzIGRlZmluZWQuIFRoaXMgd29ya3MgZm9yIGFu
eQp0cmFjZS1ldmVudHMgZmlsZSBpbiB0aGUgUUVNVSBzb3VyY2UgdHJlZSBhbmQgdGhlIGNvcnJl
Y3QgcGF0aCBpcwpkaXNwbGF5ZWQuCgpVbmZvcnR1bmF0ZWx5IHRoZXJlIGRvZXMgbm90IHNlZW0g
dG8gYmUgYSB3YXkgdG8gc2V0IHRoZSBjb2x1bW4sIHNvICIxOCIKaXMgbm90IHRoZSByaWdodCBj
aGFyYWN0ZXIgb24gdGhhdCBsaW5lLgoKU3VnZ2VzdGVkLWJ5OiBQZXRlciBNYXlkZWxsIDxwZXRl
ci5tYXlkZWxsQGxpbmFyby5vcmc+ClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3Rl
ZmFuaGFAcmVkaGF0LmNvbT4KUmV2aWV3ZWQtYnk6IFBldGVyIE1heWRlbGwgPHBldGVyLm1heWRl
bGxAbGluYXJvLm9yZz4KTWVzc2FnZS1JZDogPDIwMjAwODI3MTQyOTE1LjEwODczMC01LXN0ZWZh
bmhhQHJlZGhhdC5jb20+Ci0tLQogc2NyaXB0cy90cmFjZXRvb2wvYmFja2VuZC9mdHJhY2UucHkg
fCA0ICsrKysKIHNjcmlwdHMvdHJhY2V0b29sL2JhY2tlbmQvbG9nLnB5ICAgIHwgNCArKysrCiBz
Y3JpcHRzL3RyYWNldG9vbC9iYWNrZW5kL3N5c2xvZy5weSB8IDQgKysrKwogMyBmaWxlcyBjaGFu
Z2VkLCAxMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvc2NyaXB0cy90cmFjZXRvb2wvYmFj
a2VuZC9mdHJhY2UucHkgYi9zY3JpcHRzL3RyYWNldG9vbC9iYWNrZW5kL2Z0cmFjZS5weQppbmRl
eCBlOTg0NGRkMzM1Li41ZmEzMGNjYzA4IDEwMDY0NAotLS0gYS9zY3JpcHRzL3RyYWNldG9vbC9i
YWNrZW5kL2Z0cmFjZS5weQorKysgYi9zY3JpcHRzL3RyYWNldG9vbC9iYWNrZW5kL2Z0cmFjZS5w
eQpAQCAtMzMsOCArMzMsMTAgQEAgZGVmIGdlbmVyYXRlX2goZXZlbnQsIGdyb3VwKToKICAgICAg
ICAgJyAgICAgICAgaW50IHVudXNlZCBfX2F0dHJpYnV0ZV9fICgodW51c2VkKSk7JywKICAgICAg
ICAgJyAgICAgICAgaW50IHRybGVuOycsCiAgICAgICAgICcgICAgICAgIGlmICh0cmFjZV9ldmVu
dF9nZXRfc3RhdGUoJShldmVudF9pZClzKSkgeycsCisgICAgICAgICcjbGluZSAlKGV2ZW50X2xp
bmVubylkICIlKGV2ZW50X2ZpbGVuYW1lKXMiJywKICAgICAgICAgJyAgICAgICAgICAgIHRybGVu
ID0gc25wcmludGYoZnRyYWNlX2J1ZiwgTUFYX1RSQUNFX1NUUkxFTiwnLAogICAgICAgICAnICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAiJShuYW1lKXMgIiAlKGZtdClzICJcXG4iICUoYXJn
bmFtZXMpcyk7JywKKyAgICAgICAgJyNsaW5lICUob3V0X25leHRfbGluZW5vKWQgIiUob3V0X2Zp
bGVuYW1lKXMiJywKICAgICAgICAgJyAgICAgICAgICAgIHRybGVuID0gTUlOKHRybGVuLCBNQVhf
VFJBQ0VfU1RSTEVOIC0gMSk7JywKICAgICAgICAgJyAgICAgICAgICAgIHVudXNlZCA9IHdyaXRl
KHRyYWNlX21hcmtlcl9mZCwgZnRyYWNlX2J1ZiwgdHJsZW4pOycsCiAgICAgICAgICcgICAgICAg
IH0nLApAQCAtNDIsNiArNDQsOCBAQCBkZWYgZ2VuZXJhdGVfaChldmVudCwgZ3JvdXApOgogICAg
ICAgICBuYW1lPWV2ZW50Lm5hbWUsCiAgICAgICAgIGFyZ3M9ZXZlbnQuYXJncywKICAgICAgICAg
ZXZlbnRfaWQ9IlRSQUNFXyIgKyBldmVudC5uYW1lLnVwcGVyKCksCisgICAgICAgIGV2ZW50X2xp
bmVubz1ldmVudC5saW5lbm8sCisgICAgICAgIGV2ZW50X2ZpbGVuYW1lPWV2ZW50LmZpbGVuYW1l
LAogICAgICAgICBmbXQ9ZXZlbnQuZm10LnJzdHJpcCgiXG4iKSwKICAgICAgICAgYXJnbmFtZXM9
YXJnbmFtZXMpCiAKZGlmZiAtLWdpdCBhL3NjcmlwdHMvdHJhY2V0b29sL2JhY2tlbmQvbG9nLnB5
IGIvc2NyaXB0cy90cmFjZXRvb2wvYmFja2VuZC9sb2cucHkKaW5kZXggODc3MjIyYmJlOS4uYmM0
M2RiYjRmNCAxMDA2NDQKLS0tIGEvc2NyaXB0cy90cmFjZXRvb2wvYmFja2VuZC9sb2cucHkKKysr
IGIvc2NyaXB0cy90cmFjZXRvb2wvYmFja2VuZC9sb2cucHkKQEAgLTM3LDEyICszNywxNiBAQCBk
ZWYgZ2VuZXJhdGVfaChldmVudCwgZ3JvdXApOgogICAgIG91dCgnICAgIGlmICglKGNvbmQpcyAm
JiBxZW11X2xvZ2xldmVsX21hc2soTE9HX1RSQUNFKSkgeycsCiAgICAgICAgICcgICAgICAgIHN0
cnVjdCB0aW1ldmFsIF9ub3c7JywKICAgICAgICAgJyAgICAgICAgZ2V0dGltZW9mZGF5KCZfbm93
LCBOVUxMKTsnLAorICAgICAgICAnI2xpbmUgJShldmVudF9saW5lbm8pZCAiJShldmVudF9maWxl
bmFtZSlzIicsCiAgICAgICAgICcgICAgICAgIHFlbXVfbG9nKCIlJWRAJSV6dS4lJTA2enU6JShu
YW1lKXMgIiAlKGZtdClzICJcXG4iLCcsCiAgICAgICAgICcgICAgICAgICAgICAgICAgIHFlbXVf
Z2V0X3RocmVhZF9pZCgpLCcsCiAgICAgICAgICcgICAgICAgICAgICAgICAgIChzaXplX3QpX25v
dy50dl9zZWMsIChzaXplX3QpX25vdy50dl91c2VjJywKICAgICAgICAgJyAgICAgICAgICAgICAg
ICAgJShhcmduYW1lcylzKTsnLAorICAgICAgICAnI2xpbmUgJShvdXRfbmV4dF9saW5lbm8pZCAi
JShvdXRfZmlsZW5hbWUpcyInLAogICAgICAgICAnICAgIH0nLAogICAgICAgICBjb25kPWNvbmQs
CisgICAgICAgIGV2ZW50X2xpbmVubz1ldmVudC5saW5lbm8sCisgICAgICAgIGV2ZW50X2ZpbGVu
YW1lPWV2ZW50LmZpbGVuYW1lLAogICAgICAgICBuYW1lPWV2ZW50Lm5hbWUsCiAgICAgICAgIGZt
dD1ldmVudC5mbXQucnN0cmlwKCJcbiIpLAogICAgICAgICBhcmduYW1lcz1hcmduYW1lcykKZGlm
ZiAtLWdpdCBhL3NjcmlwdHMvdHJhY2V0b29sL2JhY2tlbmQvc3lzbG9nLnB5IGIvc2NyaXB0cy90
cmFjZXRvb2wvYmFja2VuZC9zeXNsb2cucHkKaW5kZXggMTM3M2E5MDE5Mi4uNWEzYTAwZmUzMSAx
MDA2NDQKLS0tIGEvc2NyaXB0cy90cmFjZXRvb2wvYmFja2VuZC9zeXNsb2cucHkKKysrIGIvc2Ny
aXB0cy90cmFjZXRvb2wvYmFja2VuZC9zeXNsb2cucHkKQEAgLTM1LDkgKzM1LDEzIEBAIGRlZiBn
ZW5lcmF0ZV9oKGV2ZW50LCBncm91cCk6CiAgICAgICAgIGNvbmQgPSAidHJhY2VfZXZlbnRfZ2V0
X3N0YXRlKCVzKSIgJSAoIlRSQUNFXyIgKyBldmVudC5uYW1lLnVwcGVyKCkpCiAKICAgICBvdXQo
JyAgICBpZiAoJShjb25kKXMpIHsnLAorICAgICAgICAnI2xpbmUgJShldmVudF9saW5lbm8pZCAi
JShldmVudF9maWxlbmFtZSlzIicsCiAgICAgICAgICcgICAgICAgIHN5c2xvZyhMT0dfSU5GTywg
IiUobmFtZSlzICIgJShmbXQpcyAlKGFyZ25hbWVzKXMpOycsCisgICAgICAgICcjbGluZSAlKG91
dF9uZXh0X2xpbmVubylkICIlKG91dF9maWxlbmFtZSlzIicsCiAgICAgICAgICcgICAgfScsCiAg
ICAgICAgIGNvbmQ9Y29uZCwKKyAgICAgICAgZXZlbnRfbGluZW5vPWV2ZW50LmxpbmVubywKKyAg
ICAgICAgZXZlbnRfZmlsZW5hbWU9ZXZlbnQuZmlsZW5hbWUsCiAgICAgICAgIG5hbWU9ZXZlbnQu
bmFtZSwKICAgICAgICAgZm10PWV2ZW50LmZtdC5yc3RyaXAoIlxuIiksCiAgICAgICAgIGFyZ25h
bWVzPWFyZ25hbWVzKQotLSAKMi4yOS4yCgo=


