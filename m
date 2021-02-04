Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DD030F79B
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 17:24:10 +0100 (CET)
Received: from localhost ([::1]:53416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7hQO-0007sK-P7
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 11:24:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7gqj-0001DZ-IF
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:47:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7gqa-0005e4-0t
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:47:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612453627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uaMrZiuyXUE9EdSexDaoGgYCSkQKzwc3SQMVeVItEoY=;
 b=dpJeWqTX3+xioTtpDYCzp5lxVFWYhGy29all7usiOkd4VQtPbTDkBE9QmlAWi7+vHCMbiy
 qnaY16F6GeJo/pS+jsG7EjRZ29kqraDyy2rNwqTU6zDaMqxNt4rBbNk2ptoXujUtyKhpc/
 5WBtm+jp6qxLmiepjGuoXNlbJIH/R50=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-yG1D8TKAMbW-6_cq99geFw-1; Thu, 04 Feb 2021 10:47:03 -0500
X-MC-Unique: yG1D8TKAMbW-6_cq99geFw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7FCF9E75F;
 Thu,  4 Feb 2021 15:47:01 +0000 (UTC)
Received: from localhost (ovpn-115-89.ams2.redhat.com [10.36.115.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C528819708;
 Thu,  4 Feb 2021 15:46:52 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL v2 19/27] multi-process: introduce proxy object
Date: Thu,  4 Feb 2021 15:43:19 +0000
Message-Id: <20210204154327.386529-20-stefanha@redhat.com>
In-Reply-To: <20210204154327.386529-1-stefanha@redhat.com>
References: <20210204154327.386529-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>, Thomas Huth <thuth@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogRWxlbmEgVWZpbXRzZXZhIDxlbGVuYS51ZmltdHNldmFAb3JhY2xlLmNvbT4KCkRlZmlu
ZXMgYSBQQ0kgRGV2aWNlIHByb3h5IG9iamVjdCBhcyBhIGNoaWxkIG9mIFRZUEVfUENJX0RFVklD
RS4KClNpZ25lZC1vZmYtYnk6IEVsZW5hIFVmaW10c2V2YSA8ZWxlbmEudWZpbXRzZXZhQG9yYWNs
ZS5jb20+ClNpZ25lZC1vZmYtYnk6IEphZ2FubmF0aGFuIFJhbWFuIDxqYWcucmFtYW5Ab3JhY2xl
LmNvbT4KU2lnbmVkLW9mZi1ieTogSm9obiBHIEpvaG5zb24gPGpvaG4uZy5qb2huc29uQG9yYWNs
ZS5jb20+ClJldmlld2VkLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+
Ck1lc3NhZ2UtaWQ6IGI1MTg2ZWJmZWRmOGU1NTcwNDRkMDlhNzY4ODQ2YzU5MjMwYWQzYTcuMTYx
MTkzODMxOS5naXQuamFnLnJhbWFuQG9yYWNsZS5jb20KU2lnbmVkLW9mZi1ieTogU3RlZmFuIEhh
am5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgotLS0KIE1BSU5UQUlORVJTICAgICAgICAgICAg
ICAgfCAgMiArCiBpbmNsdWRlL2h3L3JlbW90ZS9wcm94eS5oIHwgMzMgKysrKysrKysrKysrKwog
aHcvcmVtb3RlL3Byb3h5LmMgICAgICAgICB8IDk5ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwogaHcvcmVtb3RlL21lc29uLmJ1aWxkICAgICB8ICAxICsKIDQgZmlsZXMg
Y2hhbmdlZCwgMTM1IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2h3
L3JlbW90ZS9wcm94eS5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgaHcvcmVtb3RlL3Byb3h5LmMKCmRp
ZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCmluZGV4IDg4NzMyZTUxYTIuLjUx
YTg4NTkzNTcgMTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01BSU5UQUlORVJTCkBAIC0z
MjExLDYgKzMyMTEsOCBAQCBGOiBody9yZW1vdGUvbWVzc2FnZS5jCiBGOiBody9yZW1vdGUvcmVt
b3RlLW9iai5jCiBGOiBpbmNsdWRlL2h3L3JlbW90ZS9tZW1vcnkuaAogRjogaHcvcmVtb3RlL21l
bW9yeS5jCitGOiBody9yZW1vdGUvcHJveHkuYworRjogaW5jbHVkZS9ody9yZW1vdGUvcHJveHku
aAogCiBCdWlsZCBhbmQgdGVzdCBhdXRvbWF0aW9uCiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CmRpZmYgLS1naXQgYS9pbmNsdWRlL2h3L3JlbW90ZS9wcm94eS5oIGIvaW5jbHVkZS9ody9yZW1v
dGUvcHJveHkuaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5mYWE5YzRk
NTgwCi0tLSAvZGV2L251bGwKKysrIGIvaW5jbHVkZS9ody9yZW1vdGUvcHJveHkuaApAQCAtMCww
ICsxLDMzIEBACisvKgorICogQ29weXJpZ2h0IMKpIDIwMTgsIDIwMjEgT3JhY2xlIGFuZC9vciBp
dHMgYWZmaWxpYXRlcy4KKyAqCisgKiBUaGlzIHdvcmsgaXMgbGljZW5zZWQgdW5kZXIgdGhlIHRl
cm1zIG9mIHRoZSBHTlUgR1BMLCB2ZXJzaW9uIDIgb3IgbGF0ZXIuCisgKiBTZWUgdGhlIENPUFlJ
TkcgZmlsZSBpbiB0aGUgdG9wLWxldmVsIGRpcmVjdG9yeS4KKyAqCisgKi8KKworI2lmbmRlZiBQ
Uk9YWV9ICisjZGVmaW5lIFBST1hZX0gKKworI2luY2x1ZGUgImh3L3BjaS9wY2kuaCIKKyNpbmNs
dWRlICJpby9jaGFubmVsLmgiCisKKyNkZWZpbmUgVFlQRV9QQ0lfUFJPWFlfREVWICJ4LXBjaS1w
cm94eS1kZXYiCitPQkpFQ1RfREVDTEFSRV9TSU1QTEVfVFlQRShQQ0lQcm94eURldiwgUENJX1BS
T1hZX0RFVikKKworc3RydWN0IFBDSVByb3h5RGV2IHsKKyAgICBQQ0lEZXZpY2UgcGFyZW50X2Rl
djsKKyAgICBjaGFyICpmZDsKKworICAgIC8qCisgICAgICogTXV0ZXggdXNlZCB0byBwcm90ZWN0
IHRoZSBRSU9DaGFubmVsIGZkIGZyb20KKyAgICAgKiB0aGUgY29uY3VycmVudCBhY2Nlc3MgYnkg
dGhlIFZDUFVzIHNpbmNlIHByb3h5CisgICAgICogYmxvY2tzIHdoaWxlIGF3YWl0aW5nIGZvciB0
aGUgcmVwbGllcyBmcm9tIHRoZQorICAgICAqIHByb2Nlc3MgcmVtb3RlLgorICAgICAqLworICAg
IFFlbXVNdXRleCBpb19tdXRleDsKKyAgICBRSU9DaGFubmVsICppb2M7CisgICAgRXJyb3IgKm1p
Z3JhdGlvbl9ibG9ja2VyOworfTsKKworI2VuZGlmIC8qIFBST1hZX0ggKi8KZGlmZiAtLWdpdCBh
L2h3L3JlbW90ZS9wcm94eS5jIGIvaHcvcmVtb3RlL3Byb3h5LmMKbmV3IGZpbGUgbW9kZSAxMDA2
NDQKaW5kZXggMDAwMDAwMDAwMC4uY2Q1YjA3MWFiNAotLS0gL2Rldi9udWxsCisrKyBiL2h3L3Jl
bW90ZS9wcm94eS5jCkBAIC0wLDAgKzEsOTkgQEAKKy8qCisgKiBDb3B5cmlnaHQgwqkgMjAxOCwg
MjAyMSBPcmFjbGUgYW5kL29yIGl0cyBhZmZpbGlhdGVzLgorICoKKyAqIFRoaXMgd29yayBpcyBs
aWNlbnNlZCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHUEwsIHZlcnNpb24gMiBvciBsYXRl
ci4KKyAqIFNlZSB0aGUgQ09QWUlORyBmaWxlIGluIHRoZSB0b3AtbGV2ZWwgZGlyZWN0b3J5Lgor
ICoKKyAqLworCisjaW5jbHVkZSAicWVtdS9vc2RlcC5oIgorI2luY2x1ZGUgInFlbXUtY29tbW9u
LmgiCisKKyNpbmNsdWRlICJody9yZW1vdGUvcHJveHkuaCIKKyNpbmNsdWRlICJody9wY2kvcGNp
LmgiCisjaW5jbHVkZSAicWFwaS9lcnJvci5oIgorI2luY2x1ZGUgImlvL2NoYW5uZWwtdXRpbC5o
IgorI2luY2x1ZGUgImh3L3FkZXYtcHJvcGVydGllcy5oIgorI2luY2x1ZGUgIm1vbml0b3IvbW9u
aXRvci5oIgorI2luY2x1ZGUgIm1pZ3JhdGlvbi9ibG9ja2VyLmgiCisjaW5jbHVkZSAicWVtdS9z
b2NrZXRzLmgiCisKK3N0YXRpYyB2b2lkIHBjaV9wcm94eV9kZXZfcmVhbGl6ZShQQ0lEZXZpY2Ug
KmRldmljZSwgRXJyb3IgKiplcnJwKQoreworICAgIEVSUlBfR1VBUkQoKTsKKyAgICBQQ0lQcm94
eURldiAqZGV2ID0gUENJX1BST1hZX0RFVihkZXZpY2UpOworICAgIGludCBmZDsKKworICAgIGlm
ICghZGV2LT5mZCkgeworICAgICAgICBlcnJvcl9zZXRnKGVycnAsICJmZCBwYXJhbWV0ZXIgbm90
IHNwZWNpZmllZCBmb3IgJXMiLAorICAgICAgICAgICAgICAgICAgIERFVklDRShkZXZpY2UpLT5p
ZCk7CisgICAgICAgIHJldHVybjsKKyAgICB9CisKKyAgICBmZCA9IG1vbml0b3JfZmRfcGFyYW0o
bW9uaXRvcl9jdXIoKSwgZGV2LT5mZCwgZXJycCk7CisgICAgaWYgKGZkID09IC0xKSB7CisgICAg
ICAgIGVycm9yX3ByZXBlbmQoZXJycCwgInByb3h5OiB1bmFibGUgdG8gcGFyc2UgZmQgJXM6ICIs
IGRldi0+ZmQpOworICAgICAgICByZXR1cm47CisgICAgfQorCisgICAgaWYgKCFmZF9pc19zb2Nr
ZXQoZmQpKSB7CisgICAgICAgIGVycm9yX3NldGcoZXJycCwgInByb3h5OiBmZCAlZCBpcyBub3Qg
YSBzb2NrZXQiLCBmZCk7CisgICAgICAgIGNsb3NlKGZkKTsKKyAgICAgICAgcmV0dXJuOworICAg
IH0KKworICAgIGRldi0+aW9jID0gcWlvX2NoYW5uZWxfbmV3X2ZkKGZkLCBlcnJwKTsKKworICAg
IGVycm9yX3NldGcoJmRldi0+bWlncmF0aW9uX2Jsb2NrZXIsICIlcyBkb2VzIG5vdCBzdXBwb3J0
IG1pZ3JhdGlvbiIsCisgICAgICAgICAgICAgICBUWVBFX1BDSV9QUk9YWV9ERVYpOworICAgIG1p
Z3JhdGVfYWRkX2Jsb2NrZXIoZGV2LT5taWdyYXRpb25fYmxvY2tlciwgZXJycCk7CisKKyAgICBx
ZW11X211dGV4X2luaXQoJmRldi0+aW9fbXV0ZXgpOworICAgIHFpb19jaGFubmVsX3NldF9ibG9j
a2luZyhkZXYtPmlvYywgdHJ1ZSwgTlVMTCk7Cit9CisKK3N0YXRpYyB2b2lkIHBjaV9wcm94eV9k
ZXZfZXhpdChQQ0lEZXZpY2UgKnBkZXYpCit7CisgICAgUENJUHJveHlEZXYgKmRldiA9IFBDSV9Q
Uk9YWV9ERVYocGRldik7CisKKyAgICBpZiAoZGV2LT5pb2MpIHsKKyAgICAgICAgcWlvX2NoYW5u
ZWxfY2xvc2UoZGV2LT5pb2MsIE5VTEwpOworICAgIH0KKworICAgIG1pZ3JhdGVfZGVsX2Jsb2Nr
ZXIoZGV2LT5taWdyYXRpb25fYmxvY2tlcik7CisKKyAgICBlcnJvcl9mcmVlKGRldi0+bWlncmF0
aW9uX2Jsb2NrZXIpOworfQorCitzdGF0aWMgUHJvcGVydHkgcHJveHlfcHJvcGVydGllc1tdID0g
eworICAgIERFRklORV9QUk9QX1NUUklORygiZmQiLCBQQ0lQcm94eURldiwgZmQpLAorICAgIERF
RklORV9QUk9QX0VORF9PRl9MSVNUKCksCit9OworCitzdGF0aWMgdm9pZCBwY2lfcHJveHlfZGV2
X2NsYXNzX2luaXQoT2JqZWN0Q2xhc3MgKmtsYXNzLCB2b2lkICpkYXRhKQoreworICAgIERldmlj
ZUNsYXNzICpkYyA9IERFVklDRV9DTEFTUyhrbGFzcyk7CisgICAgUENJRGV2aWNlQ2xhc3MgKmsg
PSBQQ0lfREVWSUNFX0NMQVNTKGtsYXNzKTsKKworICAgIGstPnJlYWxpemUgPSBwY2lfcHJveHlf
ZGV2X3JlYWxpemU7CisgICAgay0+ZXhpdCA9IHBjaV9wcm94eV9kZXZfZXhpdDsKKyAgICBkZXZp
Y2VfY2xhc3Nfc2V0X3Byb3BzKGRjLCBwcm94eV9wcm9wZXJ0aWVzKTsKK30KKworc3RhdGljIGNv
bnN0IFR5cGVJbmZvIHBjaV9wcm94eV9kZXZfdHlwZV9pbmZvID0geworICAgIC5uYW1lICAgICAg
ICAgID0gVFlQRV9QQ0lfUFJPWFlfREVWLAorICAgIC5wYXJlbnQgICAgICAgID0gVFlQRV9QQ0lf
REVWSUNFLAorICAgIC5pbnN0YW5jZV9zaXplID0gc2l6ZW9mKFBDSVByb3h5RGV2KSwKKyAgICAu
Y2xhc3NfaW5pdCAgICA9IHBjaV9wcm94eV9kZXZfY2xhc3NfaW5pdCwKKyAgICAuaW50ZXJmYWNl
cyA9IChJbnRlcmZhY2VJbmZvW10pIHsKKyAgICAgICAgeyBJTlRFUkZBQ0VfQ09OVkVOVElPTkFM
X1BDSV9ERVZJQ0UgfSwKKyAgICAgICAgeyB9LAorICAgIH0sCit9OworCitzdGF0aWMgdm9pZCBw
Y2lfcHJveHlfZGV2X3JlZ2lzdGVyX3R5cGVzKHZvaWQpCit7CisgICAgdHlwZV9yZWdpc3Rlcl9z
dGF0aWMoJnBjaV9wcm94eV9kZXZfdHlwZV9pbmZvKTsKK30KKwordHlwZV9pbml0KHBjaV9wcm94
eV9kZXZfcmVnaXN0ZXJfdHlwZXMpCmRpZmYgLS1naXQgYS9ody9yZW1vdGUvbWVzb24uYnVpbGQg
Yi9ody9yZW1vdGUvbWVzb24uYnVpbGQKaW5kZXggNjRkYTE2YzFkZS4uNTY5Y2QyMGVkZiAxMDA2
NDQKLS0tIGEvaHcvcmVtb3RlL21lc29uLmJ1aWxkCisrKyBiL2h3L3JlbW90ZS9tZXNvbi5idWls
ZApAQCAtNCw2ICs0LDcgQEAgcmVtb3RlX3NzLmFkZCh3aGVuOiAnQ09ORklHX01VTFRJUFJPQ0VT
UycsIGlmX3RydWU6IGZpbGVzKCdtYWNoaW5lLmMnKSkKIHJlbW90ZV9zcy5hZGQod2hlbjogJ0NP
TkZJR19NVUxUSVBST0NFU1MnLCBpZl90cnVlOiBmaWxlcygnbXBxZW11LWxpbmsuYycpKQogcmVt
b3RlX3NzLmFkZCh3aGVuOiAnQ09ORklHX01VTFRJUFJPQ0VTUycsIGlmX3RydWU6IGZpbGVzKCdt
ZXNzYWdlLmMnKSkKIHJlbW90ZV9zcy5hZGQod2hlbjogJ0NPTkZJR19NVUxUSVBST0NFU1MnLCBp
Zl90cnVlOiBmaWxlcygncmVtb3RlLW9iai5jJykpCityZW1vdGVfc3MuYWRkKHdoZW46ICdDT05G
SUdfTVVMVElQUk9DRVNTJywgaWZfdHJ1ZTogZmlsZXMoJ3Byb3h5LmMnKSkKIAogc3BlY2lmaWNf
c3MuYWRkKHdoZW46ICdDT05GSUdfTVVMVElQUk9DRVNTJywgaWZfdHJ1ZTogZmlsZXMoJ21lbW9y
eS5jJykpCiAKLS0gCjIuMjkuMgoK


