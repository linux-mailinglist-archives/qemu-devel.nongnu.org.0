Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B59D32E976A
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 15:37:56 +0100 (CET)
Received: from localhost ([::1]:50752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwQzb-0002o5-Q0
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 09:37:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kwQuE-0006S9-1a
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 09:32:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kwQuB-00012G-Ue
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 09:32:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609770739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6BSbfoYZQUCUaGY/gemcWXuxJ/ui53Ca+rS+uU1wPRs=;
 b=Sby93aluLCgFtvUna3RzVkQfzwCf4kLlDoa3C39WtbKCcEVZ40JgfnW4WeXRS06WBKHVQa
 b32grzMKUwqXzH4zr1pfVivtxDte1Jo7tUqwbmpxRUgafGttISYy8q5kBac6bpwg7UxLWu
 ja7+lrfovYdVJSgr0LFIvEUphot7cOo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-0L6NDBQSPL2gejYWkrGmjw-1; Mon, 04 Jan 2021 09:32:16 -0500
X-MC-Unique: 0L6NDBQSPL2gejYWkrGmjw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1899100E420;
 Mon,  4 Jan 2021 14:32:14 +0000 (UTC)
Received: from localhost (ovpn-113-37.ams2.redhat.com [10.36.113.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 938575D9D5;
 Mon,  4 Jan 2021 14:32:14 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/5] tracetool: add input filename and line number to Event
Date: Mon,  4 Jan 2021 14:31:53 +0000
Message-Id: <20210104143154.462212-5-stefanha@redhat.com>
In-Reply-To: <20210104143154.462212-1-stefanha@redhat.com>
References: <20210104143154.462212-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

U3RvcmUgdGhlIGlucHV0IGZpbGVuYW1lIGFuZCBsaW5lIG51bWJlciBpbiBFdmVudC4KCkEgbGF0
ZXIgcGF0Y2ggd2lsbCB1c2UgdGhpcyB0byBpbXByb3ZlIGVycm9yIG1lc3NhZ2VzLgoKU2lnbmVk
LW9mZi1ieTogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgpSZXZpZXdlZC1i
eTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFtc2F0Lm9yZz4KUmV2aWV3ZWQtYnk6
IFBldGVyIE1heWRlbGwgPHBldGVyLm1heWRlbGxAbGluYXJvLm9yZz4KTWVzc2FnZS1JZDogPDIw
MjAwODI3MTQyOTE1LjEwODczMC00LXN0ZWZhbmhhQHJlZGhhdC5jb20+Ci0tLQogc2NyaXB0cy90
cmFjZXRvb2wvX19pbml0X18ucHkgfCAyNyArKysrKysrKysrKysrKysrKysrKysrLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL3NjcmlwdHMvdHJhY2V0b29sL19faW5pdF9fLnB5IGIvc2NyaXB0cy90cmFjZXRvb2wvX19p
bml0X18ucHkKaW5kZXggZGE1MDA0ZWE0NS4uOTZiMWNkNjlhNSAxMDA2NDQKLS0tIGEvc2NyaXB0
cy90cmFjZXRvb2wvX19pbml0X18ucHkKKysrIGIvc2NyaXB0cy90cmFjZXRvb2wvX19pbml0X18u
cHkKQEAgLTIxOCw2ICsyMTgsMTAgQEAgY2xhc3MgRXZlbnQob2JqZWN0KToKICAgICAgICAgUHJv
cGVydGllcyBvZiB0aGUgZXZlbnQuCiAgICAgYXJncyA6IEFyZ3VtZW50cwogICAgICAgICBUaGUg
ZXZlbnQgYXJndW1lbnRzLgorICAgIGxpbmVubyA6IGludAorICAgICAgICBUaGUgbGluZSBudW1i
ZXIgaW4gdGhlIGlucHV0IGZpbGUuCisgICAgZmlsZW5hbWUgOiBzdHIKKyAgICAgICAgVGhlIHBh
dGggdG8gdGhlIGlucHV0IGZpbGUuCiAKICAgICAiIiIKIApAQCAtMjMwLDcgKzIzNCw3IEBAIGNs
YXNzIEV2ZW50KG9iamVjdCk6CiAKICAgICBfVkFMSURfUFJPUFMgPSBzZXQoWyJkaXNhYmxlIiwg
InRjZyIsICJ0Y2ctdHJhbnMiLCAidGNnLWV4ZWMiLCAidmNwdSJdKQogCi0gICAgZGVmIF9faW5p
dF9fKHNlbGYsIG5hbWUsIHByb3BzLCBmbXQsIGFyZ3MsIG9yaWc9Tm9uZSwKKyAgICBkZWYgX19p
bml0X18oc2VsZiwgbmFtZSwgcHJvcHMsIGZtdCwgYXJncywgbGluZW5vLCBmaWxlbmFtZSwgb3Jp
Zz1Ob25lLAogICAgICAgICAgICAgICAgICBldmVudF90cmFucz1Ob25lLCBldmVudF9leGVjPU5v
bmUpOgogICAgICAgICAiIiIKICAgICAgICAgUGFyYW1ldGVycwpAQCAtMjQzLDYgKzI0NywxMCBA
QCBjbGFzcyBFdmVudChvYmplY3QpOgogICAgICAgICAgICAgRXZlbnQgcHJpbnRpbmcgZm9ybWF0
IHN0cmluZyhzKS4KICAgICAgICAgYXJncyA6IEFyZ3VtZW50cwogICAgICAgICAgICAgRXZlbnQg
YXJndW1lbnRzLgorICAgICAgICBsaW5lbm8gOiBpbnQKKyAgICAgICAgICAgIFRoZSBsaW5lIG51
bWJlciBpbiB0aGUgaW5wdXQgZmlsZS4KKyAgICAgICAgZmlsZW5hbWUgOiBzdHIKKyAgICAgICAg
ICAgIFRoZSBwYXRoIHRvIHRoZSBpbnB1dCBmaWxlLgogICAgICAgICBvcmlnIDogRXZlbnQgb3Ig
Tm9uZQogICAgICAgICAgICAgT3JpZ2luYWwgRXZlbnQgYmVmb3JlIHRyYW5zZm9ybWF0aW9uL2dl
bmVyYXRpb24uCiAgICAgICAgIGV2ZW50X3RyYW5zIDogRXZlbnQgb3IgTm9uZQpAQCAtMjU1LDYg
KzI2Myw4IEBAIGNsYXNzIEV2ZW50KG9iamVjdCk6CiAgICAgICAgIHNlbGYucHJvcGVydGllcyA9
IHByb3BzCiAgICAgICAgIHNlbGYuZm10ID0gZm10CiAgICAgICAgIHNlbGYuYXJncyA9IGFyZ3MK
KyAgICAgICAgc2VsZi5saW5lbm8gPSBpbnQobGluZW5vKQorICAgICAgICBzZWxmLmZpbGVuYW1l
ID0gc3RyKGZpbGVuYW1lKQogICAgICAgICBzZWxmLmV2ZW50X3RyYW5zID0gZXZlbnRfdHJhbnMK
ICAgICAgICAgc2VsZi5ldmVudF9leGVjID0gZXZlbnRfZXhlYwogCkBAIC0yNzYsMTYgKzI4Niwy
MSBAQCBjbGFzcyBFdmVudChvYmplY3QpOgogICAgIGRlZiBjb3B5KHNlbGYpOgogICAgICAgICAi
IiJDcmVhdGUgYSBuZXcgY29weS4iIiIKICAgICAgICAgcmV0dXJuIEV2ZW50KHNlbGYubmFtZSwg
bGlzdChzZWxmLnByb3BlcnRpZXMpLCBzZWxmLmZtdCwKLSAgICAgICAgICAgICAgICAgICAgIHNl
bGYuYXJncy5jb3B5KCksIHNlbGYsIHNlbGYuZXZlbnRfdHJhbnMsIHNlbGYuZXZlbnRfZXhlYykK
KyAgICAgICAgICAgICAgICAgICAgIHNlbGYuYXJncy5jb3B5KCksIHNlbGYubGluZW5vLCBzZWxm
LmZpbGVuYW1lLAorICAgICAgICAgICAgICAgICAgICAgc2VsZiwgc2VsZi5ldmVudF90cmFucywg
c2VsZi5ldmVudF9leGVjKQogCiAgICAgQHN0YXRpY21ldGhvZAotICAgIGRlZiBidWlsZChsaW5l
X3N0cik6CisgICAgZGVmIGJ1aWxkKGxpbmVfc3RyLCBsaW5lbm8sIGZpbGVuYW1lKToKICAgICAg
ICAgIiIiQnVpbGQgYW4gRXZlbnQgaW5zdGFuY2UgZnJvbSBhIHN0cmluZy4KIAogICAgICAgICBQ
YXJhbWV0ZXJzCiAgICAgICAgIC0tLS0tLS0tLS0KICAgICAgICAgbGluZV9zdHIgOiBzdHIKICAg
ICAgICAgICAgIExpbmUgZGVzY3JpYmluZyB0aGUgZXZlbnQuCisgICAgICAgIGxpbmVubyA6IGlu
dAorICAgICAgICAgICAgTGluZSBudW1iZXIgaW4gaW5wdXQgZmlsZS4KKyAgICAgICAgZmlsZW5h
bWUgOiBzdHIKKyAgICAgICAgICAgIFBhdGggdG8gaW5wdXQgZmlsZS4KICAgICAgICAgIiIiCiAg
ICAgICAgIG0gPSBFdmVudC5fQ1JFLm1hdGNoKGxpbmVfc3RyKQogICAgICAgICBhc3NlcnQgbSBp
cyBub3QgTm9uZQpAQCAtMzE1LDcgKzMzMCw3IEBAIGNsYXNzIEV2ZW50KG9iamVjdCk6CiAgICAg
ICAgIGlmICJ0Y2ciIGluIHByb3BzIGFuZCBpc2luc3RhbmNlKGZtdCwgc3RyKToKICAgICAgICAg
ICAgIHJhaXNlIFZhbHVlRXJyb3IoIkV2ZW50cyB3aXRoICd0Y2cnIHByb3BlcnR5IG11c3QgaGF2
ZSB0d28gZm9ybWF0IHN0cmluZ3MiKQogCi0gICAgICAgIGV2ZW50ID0gRXZlbnQobmFtZSwgcHJv
cHMsIGZtdCwgYXJncykKKyAgICAgICAgZXZlbnQgPSBFdmVudChuYW1lLCBwcm9wcywgZm10LCBh
cmdzLCBsaW5lbm8sIGZpbGVuYW1lKQogCiAgICAgICAgICMgYWRkIGltcGxpY2l0IGFyZ3VtZW50
cyB3aGVuIHVzaW5nIHRoZSAndmNwdScgcHJvcGVydHkKICAgICAgICAgaW1wb3J0IHRyYWNldG9v
bC52Y3B1CkBAIC0zNjAsNiArMzc1LDggQEAgY2xhc3MgRXZlbnQob2JqZWN0KToKICAgICAgICAg
ICAgICAgICAgICAgIGxpc3Qoc2VsZi5wcm9wZXJ0aWVzKSwKICAgICAgICAgICAgICAgICAgICAg
IHNlbGYuZm10LAogICAgICAgICAgICAgICAgICAgICAgc2VsZi5hcmdzLnRyYW5zZm9ybSgqdHJh
bnMpLAorICAgICAgICAgICAgICAgICAgICAgc2VsZi5saW5lbm8sCisgICAgICAgICAgICAgICAg
ICAgICBzZWxmLmZpbGVuYW1lLAogICAgICAgICAgICAgICAgICAgICAgc2VsZikKIAogCkBAIC0z
ODYsNyArNDAzLDcgQEAgZGVmIHJlYWRfZXZlbnRzKGZvYmosIGZuYW1lKToKICAgICAgICAgICAg
IGNvbnRpbnVlCiAKICAgICAgICAgdHJ5OgotICAgICAgICAgICAgZXZlbnQgPSBFdmVudC5idWls
ZChsaW5lKQorICAgICAgICAgICAgZXZlbnQgPSBFdmVudC5idWlsZChsaW5lLCBsaW5lbm8sIGZu
YW1lKQogICAgICAgICBleGNlcHQgVmFsdWVFcnJvciBhcyBlOgogICAgICAgICAgICAgYXJnMCA9
ICdFcnJvciBhdCAlczolZDogJXMnICUgKGZuYW1lLCBsaW5lbm8sIGUuYXJnc1swXSkKICAgICAg
ICAgICAgIGUuYXJncyA9IChhcmcwLCkgKyBlLmFyZ3NbMTpdCi0tIAoyLjI5LjIKCg==


