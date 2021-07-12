Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 509483C60EF
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 18:56:21 +0200 (CEST)
Received: from localhost ([::1]:36608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2zEC-0001fT-9Y
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 12:56:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m2z9t-0003UI-4b
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 12:51:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m2z9r-0003N4-EW
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 12:51:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626108710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hB5P6/oAnK+q53q4/eCPG38OXfvr8W/dpT8E0EIyxnU=;
 b=ERSVCCzS48gz7w/k95HTnouxFglcnauIljWb0imeZob1HQSZ7RA9vmYgvN8g5z7kj5UzQh
 j1okdPy+ulSdpTJNQDxm+nDN8WMXw+/wHAAg+m7Qt7iDWdui03ZtichbHlBqxMku5OxqtH
 vB/LVOXuJzhvrHFBIablTk2N+cjNyMA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-c5ulItoWOS-_WY14fKm0Lw-1; Mon, 12 Jul 2021 12:51:49 -0400
X-MC-Unique: c5ulItoWOS-_WY14fKm0Lw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D76910BB647;
 Mon, 12 Jul 2021 16:51:25 +0000 (UTC)
Received: from localhost (ovpn-112-230.ams2.redhat.com [10.36.112.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 808B8784C9;
 Mon, 12 Jul 2021 16:51:24 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 6/6] trace, lttng: require .pc files
Date: Mon, 12 Jul 2021 17:50:01 +0100
Message-Id: <20210712165001.429113-7-stefanha@redhat.com>
In-Reply-To: <20210712165001.429113-1-stefanha@redhat.com>
References: <20210712165001.429113-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogUGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT4KClRoZSBuZXh0IHZlcnNp
b24gb2YgbHR0bmctbGlicyB3aWxsIG5vdCByZXF1aXJlIGxpYnVyY3UgYXQgcnVuIHRpbWUgYW55
bW9yZS4KVGhlcmVmb3JlLCBpdCBpcyBleHBlY3RlZCB0aGF0IGRpc3Ryb3Mgd2lsbCBub3QgaW5j
bHVkZSB0aGUgdXJjdWJwIGxpYnJhcmllcwphbnltb3JlIHdoZW4gaW5zdGFsbGluZyBsdHRuZy11
c3QtZGV2ZWwuCgpUbyBhdm9pZCBmdXR1cmUgcHJvYmxlbXMsIGp1c3QgcmVxdWlyZSBwa2ctY29u
ZmlnIHRvIGRldGVjdCBsdHRuZy11c3QuClRoZSAucGMgZmlsZXMgZm9yIGx0dG5nLXVzdCBjb3Jy
ZWN0bHkgaW5jbHVkZSBsaWJ1cmN1YnAuYSBmb3Igc3RhdGljCmJ1aWxkcywgYW5kIGhhdmUgYWx3
YXlzIGRvbmUgc2luY2UgcGtnLWNvbmZpZyBmaWxlcyB3ZXJlIGFkZGVkIGluIDIwMTEuCgpTaWdu
ZWQtb2ZmLWJ5OiBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPgpNZXNzYWdlLWlk
OiAyMDIxMDcxMjE1NTcxMC41MjA4ODktMS1wYm9uemluaUByZWRoYXQuY29tClNpZ25lZC1vZmYt
Ynk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KLS0tCiBjb25maWd1cmUg
ICAgICAgICB8IDE4ICsrLS0tLS0tLS0tLS0tLS0tLQogbWVzb24uYnVpbGQgICAgICAgfCAgNCAt
LS0tCiB0cmFjZS9tZXNvbi5idWlsZCB8ICAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvY29uZmlndXJlIGIvY29uZmln
dXJlCmluZGV4IDg1ZGIyNDhhYzEuLjRkMGEyYmZkZDggMTAwNzU1Ci0tLSBhL2NvbmZpZ3VyZQor
KysgYi9jb25maWd1cmUKQEAgLTM2MDYsMjEgKzM2MDYsOCBAQCBmaQogIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAjIEZvciAndXN0JyBiYWNrZW5kLCB0ZXN0IGlm
IHVzdCBoZWFkZXJzIGFyZSBwcmVzZW50CiBpZiBoYXZlX2JhY2tlbmQgInVzdCI7IHRoZW4KLSAg
Y2F0ID4gJFRNUEMgPDwgRU9GCi0jaW5jbHVkZSA8bHR0bmcvdHJhY2Vwb2ludC5oPgotaW50IG1h
aW4odm9pZCkgeyByZXR1cm4gMDsgfQotRU9GCi0gIGlmIGNvbXBpbGVfcHJvZyAiIiAiLVdsLC0t
bm8tYXMtbmVlZGVkIC1sZGwiIDsgdGhlbgotICAgIGlmICRwa2dfY29uZmlnIGx0dG5nLXVzdCAt
LWV4aXN0czsgdGhlbgotICAgICAgbHR0bmdfdXN0X2xpYnM9JCgkcGtnX2NvbmZpZyAtLWxpYnMg
bHR0bmctdXN0KQotICAgIGVsc2UKLSAgICAgIGx0dG5nX3VzdF9saWJzPSItbGx0dG5nLXVzdCAt
bGRsIgotICAgIGZpCi0gICAgaWYgJHBrZ19jb25maWcgbGlidXJjdS1icCAtLWV4aXN0czsgdGhl
bgotICAgICAgdXJjdV9icF9saWJzPSQoJHBrZ19jb25maWcgLS1saWJzIGxpYnVyY3UtYnApCi0g
ICAgZWxzZQotICAgICAgdXJjdV9icF9saWJzPSItbHVyY3UtYnAiCi0gICAgZmkKKyAgaWYgJHBr
Z19jb25maWcgbHR0bmctdXN0IC0tZXhpc3RzOyB0aGVuCisgICAgbHR0bmdfdXN0X2xpYnM9JCgk
cGtnX2NvbmZpZyAtLWxpYnMgbHR0bmctdXN0KQogICBlbHNlCiAgICAgZXJyb3JfZXhpdCAiVHJh
Y2UgYmFja2VuZCAndXN0JyBtaXNzaW5nIGx0dG5nLXVzdCBoZWFkZXIgZmlsZXMiCiAgIGZpCkBA
IC00NzczLDcgKzQ3NjAsNiBAQCBmaQogaWYgaGF2ZV9iYWNrZW5kICJ1c3QiOyB0aGVuCiAgIGVj
aG8gIkNPTkZJR19UUkFDRV9VU1Q9eSIgPj4gJGNvbmZpZ19ob3N0X21hawogICBlY2hvICJMVFRO
R19VU1RfTElCUz0kbHR0bmdfdXN0X2xpYnMiID4+ICRjb25maWdfaG9zdF9tYWsKLSAgZWNobyAi
VVJDVV9CUF9MSUJTPSR1cmN1X2JwX2xpYnMiID4+ICRjb25maWdfaG9zdF9tYWsKIGZpCiBpZiBo
YXZlX2JhY2tlbmQgImR0cmFjZSI7IHRoZW4KICAgZWNobyAiQ09ORklHX1RSQUNFX0RUUkFDRT15
IiA+PiAkY29uZmlnX2hvc3RfbWFrCmRpZmYgLS1naXQgYS9tZXNvbi5idWlsZCBiL21lc29uLmJ1
aWxkCmluZGV4IGRkN2Y5ZWQ2YTguLjRkZWEyZDlkZDMgMTAwNjQ0Ci0tLSBhL21lc29uLmJ1aWxk
CisrKyBiL21lc29uLmJ1aWxkCkBAIC0zMTksMTAgKzMxOSw2IEBAIGx0dG5nID0gbm90X2ZvdW5k
CiBpZiAnQ09ORklHX1RSQUNFX1VTVCcgaW4gY29uZmlnX2hvc3QKICAgbHR0bmcgPSBkZWNsYXJl
X2RlcGVuZGVuY3kobGlua19hcmdzOiBjb25maWdfaG9zdFsnTFRUTkdfVVNUX0xJQlMnXS5zcGxp
dCgpKQogZW5kaWYKLXVyY3VicCA9IG5vdF9mb3VuZAotaWYgJ0NPTkZJR19UUkFDRV9VU1QnIGlu
IGNvbmZpZ19ob3N0Ci0gIHVyY3VicCA9IGRlY2xhcmVfZGVwZW5kZW5jeShsaW5rX2FyZ3M6IGNv
bmZpZ19ob3N0WydVUkNVX0JQX0xJQlMnXS5zcGxpdCgpKQotZW5kaWYKIHBpeG1hbiA9IG5vdF9m
b3VuZAogaWYgaGF2ZV9zeXN0ZW0gb3IgaGF2ZV90b29scwogICBwaXhtYW4gPSBkZXBlbmRlbmN5
KCdwaXhtYW4tMScsIHJlcXVpcmVkOiBoYXZlX3N5c3RlbSwgdmVyc2lvbjonPj0wLjIxLjgnLApk
aWZmIC0tZ2l0IGEvdHJhY2UvbWVzb24uYnVpbGQgYi90cmFjZS9tZXNvbi5idWlsZAppbmRleCAw
OGY4M2ExNWMzLi5lZjE4ZjExZDY0IDEwMDY0NAotLS0gYS90cmFjZS9tZXNvbi5idWlsZAorKysg
Yi90cmFjZS9tZXNvbi5idWlsZApAQCAtMjYsNyArMjYsNyBAQCBmb3JlYWNoIGRpciA6IFsgJy4n
IF0gKyB0cmFjZV9ldmVudHNfc3ViZGlycwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBpbnB1dDogdHJhY2VfZXZlbnRzX2ZpbGUsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGNvbW1hbmQ6IFsgdHJhY2V0b29sLCBncm91cCwgJy0tZm9ybWF0PXVzdC1ldmVudHMtaCcs
ICdASU5QVVRAJywgJ0BPVVRQVVRAJyBdLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBkZXBlbmRfZmlsZXM6IHRyYWNldG9vbF9kZXBlbmRzKQotICAgIHRyYWNlX3NzLmFkZCh0cmFj
ZV91c3RfaCwgbHR0bmcsIHVyY3VicCkKKyAgICB0cmFjZV9zcy5hZGQodHJhY2VfdXN0X2gsIGx0
dG5nKQogICAgIGdlbmggKz0gdHJhY2VfdXN0X2gKICAgZW5kaWYKICAgdHJhY2Vfc3MuYWRkKHRy
YWNlX2gsIHRyYWNlX2MpCi0tIAoyLjMxLjEKCg==


