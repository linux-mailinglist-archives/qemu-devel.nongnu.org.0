Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E9821704C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jul 2020 17:23:10 +0200 (CEST)
Received: from localhost ([::1]:59302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jspR7-0004SQ-Qn
	for lists+qemu-devel@lfdr.de; Tue, 07 Jul 2020 11:23:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jspP7-0003N1-Hr
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 11:21:05 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:58489
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jspP5-0006Qr-Po
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 11:21:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594135263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aN2o0JeIo4DWwC05o9kT+usXOBNN7lWy57m7xTQJyus=;
 b=UAwSWw8gASfSqaTdu79XNRvLjOn43OmIHkTvDulVB7LPkT17vS+hBOk/lbq+JA5G4C+oFU
 lC2exqk/fWarlue/Pf/gnoyeHu06wgx2rVWlRxMWyEIyGIk6ef6HjZ+KPL9d2fZFbWMAiC
 ADFekPXT1+OWBuGGxJjbVqlS2V+NMOQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-VbuKqC-BOVi-ZJHH28W2Yw-1; Tue, 07 Jul 2020 11:20:58 -0400
X-MC-Unique: VbuKqC-BOVi-ZJHH28W2Yw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B97B7193F597;
 Tue,  7 Jul 2020 15:20:45 +0000 (UTC)
Received: from localhost (ovpn-113-68.ams2.redhat.com [10.36.113.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0DB4C100164D;
 Tue,  7 Jul 2020 15:20:37 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/1] tracetool: work around ust <sys/sdt.h> include conflict
Date: Tue,  7 Jul 2020 16:20:24 +0100
Message-Id: <20200707152024.459718-2-stefanha@redhat.com>
In-Reply-To: <20200707152024.459718-1-stefanha@redhat.com>
References: <20200707152024.459718-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=207.211.31.81; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 00:20:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
 Eduardo Habkost <ehabkost@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Qm90aCB0aGUgZHRyYWNlIGFuZCB1c3QgYmFja2VuZHMgbWF5IGluY2x1ZGUgPHN5cy9zZHQuaD4g
YnV0IExUVG5nClVzZXJzcGFjZSBUcmFjZXIgMi4xMSBhbmQgbGF0ZXIgcmVxdWlyZXMgU0RUX1VT
RV9WQVJJQURJQyB0byBiZSBkZWZpbmVkCmJlZm9yZSBpbmNsdWRpbmcgdGhlIGhlYWRlciBmaWxl
LgoKVGhpcyBpcyBhIGNsYXNzaWMgcHJvYmxlbSB3aXRoIEMgaGVhZGVyIGZpbGVzIGluY2x1ZGVk
IGZyb20gZGlmZmVyZW50CnBhcnRzIG9mIGEgcHJvZ3JhbS4gSWYgdGhlIHNhbWUgaGVhZGVyIGlz
IGluY2x1ZGVkIHR3aWNlIHdpdGhpbiB0aGUgc2FtZQpjb21waWxhdGlvbiB1bml0IHRoZW4gdGhl
IGZpcnN0IGluY2x1c2lvbiBkZXRlcm1pbmVzIHRoZSBtYWNybwplbnZpcm9ubWVudC4KCldvcmsg
YXJvdW5kIHRoaXMgYnkgZGVmaW5pbmcgU0RUX1VTRV9WQVJJQURJQyBpbiB0aGUgZHRyYWNlIGJh
Y2tlbmQgdG9vLgpJdCBkb2Vzbid0IGh1cnQgYW5kIGZpeGVzIGEgbWlzc2luZyBTVEFQX1BST0JF
VigpIGNvbXBpbGVyIGVycm9yIHdoZW4KdGhlIHVzdCBiYWNrZW5kIGlzIGVuYWJsZWQgdG9nZXRo
ZXIgd2l0aCB0aGUgZHRyYWNlIGJhY2tlbmQuCgpTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gSGFqbm9j
emkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+Ck1lc3NhZ2UtaWQ6IDIwMjAwNjI1MTQwNzU3LjIzNzAx
Mi0xLXN0ZWZhbmhhQHJlZGhhdC5jb20KU2lnbmVkLW9mZi1ieTogU3RlZmFuIEhham5vY3ppIDxz
dGVmYW5oYUByZWRoYXQuY29tPgotLS0KIHNjcmlwdHMvdHJhY2V0b29sL2JhY2tlbmQvZHRyYWNl
LnB5IHwgNiArKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9zY3JpcHRzL3RyYWNldG9vbC9iYWNrZW5kL2R0cmFjZS5weSBiL3NjcmlwdHMvdHJhY2V0
b29sL2JhY2tlbmQvZHRyYWNlLnB5CmluZGV4IDU3MTE4OTJiYTAuLmI3ZmU0YzFiNTAgMTAwNjQ0
Ci0tLSBhL3NjcmlwdHMvdHJhY2V0b29sL2JhY2tlbmQvZHRyYWNlLnB5CisrKyBiL3NjcmlwdHMv
dHJhY2V0b29sL2JhY2tlbmQvZHRyYWNlLnB5CkBAIC00MCw2ICs0MCwxMiBAQCBkZWYgZ2VuZXJh
dGVfaF9iZWdpbihldmVudHMsIGdyb3VwKToKICAgICBlbHNlOgogICAgICAgICBoZWFkZXIgPSAi
dHJhY2UtZHRyYWNlLmgiCiAKKyAgICAjIFdvcmthcm91bmQgZm9yIHVzdCBiYWNrZW5kLCB3aGlj
aCBhbHNvIGluY2x1ZGVzIDxzeXMvc2R0Lmg+IGFuZCBtYXkKKyAgICAjIHJlcXVpcmUgU0RUX1VT
RV9WQVJJQURJQyB0byBiZSBkZWZpbmVkLiBJZiBkdHJhY2UgaW5jbHVkZXMgPHN5cy9zZHQuaD4K
KyAgICAjIGZpcnN0IHdpdGhvdXQgZGVmaW5pbmcgU0RUX1VTRV9WQVJJQURJQyB0aGVuIHVzdCBi
cmVha3MgYmVjYXVzZSB0aGUKKyAgICAjIFNUQVBfUFJPQkVWKCkgbWFjcm8gaXMgbm90IGRlZmlu
ZWQuCisgICAgb3V0KCcjZGVmaW5lIFNEVF9VU0VfVkFSSUFESUMgMScpCisKICAgICBvdXQoJyNp
bmNsdWRlICIlcyInICUgaGVhZGVyLAogICAgICAgICAnJykKIAotLSAKMi4yNi4yCgo=


