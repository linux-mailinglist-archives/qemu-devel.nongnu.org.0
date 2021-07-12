Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A82083C60D8
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 18:52:20 +0200 (CEST)
Received: from localhost ([::1]:54268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2zAJ-00031d-Nd
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 12:52:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m2z8Q-0000BC-UU
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 12:50:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m2z8O-0002IJ-7V
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 12:50:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626108619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+xGIERkQiJT7pnXYXCFfaq29QTay27sqA942CNOp8C0=;
 b=Pl/kmdWs3G+Htn9UIzgW2x5E1da5cP8XzjW8AU5SwTh/rogsEsCzkgRA2vkvkWLZKWnbde
 C5KrVY3ERyo/vILc9iva+BuALxXA2QBr0RXhthJlrE691dopa4jExGwrOVVxLhFvSg1QL3
 NZTiO+8EE57wpEN9Tsw2KXxmPCYRjnA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-4Le6lDoPOyqrbpEvv4wu_w-1; Mon, 12 Jul 2021 12:50:16 -0400
X-MC-Unique: 4Le6lDoPOyqrbpEvv4wu_w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAAC919200CA;
 Mon, 12 Jul 2021 16:50:15 +0000 (UTC)
Received: from localhost (ovpn-112-230.ams2.redhat.com [10.36.112.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C481560916;
 Mon, 12 Jul 2021 16:50:11 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/6] qemu-trace-stap: changing SYSTEMTAP_TAPSET considered
 harmful.
Date: Mon, 12 Jul 2021 17:49:56 +0100
Message-Id: <20210712165001.429113-2-stefanha@redhat.com>
In-Reply-To: <20210712165001.429113-1-stefanha@redhat.com>
References: <20210712165001.429113-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+CgpTZXR0aW5nIFNZU1RFTVRB
UF9UQVBTRVQgdG8gc29tZSB2YWx1ZSBvdGhlciB0aGFuCi91c3Ivc2hhcmUvc3lzdGVtdGFwL3Rh
cHNldHMgcmVzdWx0cyBpbiBzeXN0ZW10YXAgbm90IGZpbmRpbmcgdGhlCnN0YW5kYXJkIHRhcHNl
dCBsaWJyYXJ5IGFueSBtb3JlLCB3aGljaCBpbiB0dXJuIGJyZWFrcyB0cmFjaW5nIGJlY2F1c2UK
cGlkKCkgYW5kIG90aGVyIHN0YW5kYXJkIHN5c3RlbXRhcCBmdW5jdGlvbnMgYXJlIG5vdCBhdmFp
bGFibGUgYW55IG1vcmUuCgpTbyB1c2luZyBTWVNURU1UQVBfVEFQU0VUIHRvIHBvaW50IHN5c3Rl
bXRhcCB0byB0aGUgcWVtdSBwcm9iZXMgd2lsbApvbmx5IHdvcmsgZm9yIHRoZSBwcmVmaXg9L3Vz
ciBpbnN0YWxscyBiZWNhdXNlIGJvdGggcWVtdSBhbmQgc3lzdGVtCnRhcHNldHMgaW4gdGhlIHNh
bWUgZGlyZWN0b3J5IHRoZW4uICBBbGwgb3RoZXIgcHJlZml4ZXMgYXJlIGJyb2tlbi4KCkZpeCB0
aGF0IGJ5IHVzaW5nIHRoZSAiLUkgJHRhcHNldGRpciIgY29tbWFuZCBsaW5lIHN3aXRjaCBpbnN0
ZWFkLgoKU2lnbmVkLW9mZi1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+ClJl
dmlld2VkLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+ClJldmlld2Vk
LWJ5OiBEYW5pZWwgUC4gQmVycmFuZ8OpIDxiZXJyYW5nZUByZWRoYXQuY29tPgpNZXNzYWdlLWlk
OiAyMDIxMDYwMTEzMjQxNC40MzI0MzAtMi1rcmF4ZWxAcmVkaGF0LmNvbQpTaWduZWQtb2ZmLWJ5
OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+Ci0tLQogc2NyaXB0cy9xZW11
LXRyYWNlLXN0YXAgfCAxNCArKysrLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvc2NyaXB0cy9xZW11LXRyYWNl
LXN0YXAgYi9zY3JpcHRzL3FlbXUtdHJhY2Utc3RhcAppbmRleCA5MDUyN2ViOTc0Li5lYjZlOTUx
ZmYyIDEwMDc1NQotLS0gYS9zY3JpcHRzL3FlbXUtdHJhY2Utc3RhcAorKysgYi9zY3JpcHRzL3Fl
bXUtdHJhY2Utc3RhcApAQCAtNTUsMTEgKzU1LDYgQEAgZGVmIHRhcHNldF9kaXIoYmluYXJ5KToK
ICAgICByZXR1cm4gb3MucGF0aC5yZWFscGF0aCh0YXBzZXQpCiAKIAotZGVmIHRhcHNldF9lbnYo
dGFwc2V0X2Rpcik6Ci0gICAgdGVudiA9IGNvcHkuY29weShvcy5lbnZpcm9uKQotICAgIHRlbnZb
IlNZU1RFTVRBUF9UQVBTRVQiXSA9IHRhcHNldF9kaXIKLSAgICByZXR1cm4gdGVudgotCiBkZWYg
Y21kX3J1bihhcmdzKToKICAgICBwcmVmaXggPSBwcm9iZV9wcmVmaXgoYXJncy5iaW5hcnkpCiAg
ICAgdGFwc2V0cyA9IHRhcHNldF9kaXIoYXJncy5iaW5hcnkpCkBAIC04MSwxMSArNzYsMTEgQEAg
ZGVmIGNtZF9ydW4oYXJncyk6CiAKICAgICAjIFdlIHJlcXVlc3QgYW4gOE1CIGJ1ZmZlciwgc2lu
Y2UgdGhlIHN0YXAgZGVmYXVsdCAxTUIgYnVmZmVyCiAgICAgIyBjYW4gYmUgZWFzaWx5IG92ZXJm
bG93ZWQgYnkgZnJlcXVlbnRseSBmaXJpbmcgUUVNVSB0cmFjZXMKLSAgICBzdGFwYXJncyA9IFsi
c3RhcCIsICItcyIsICI4Il0KKyAgICBzdGFwYXJncyA9IFsic3RhcCIsICItcyIsICI4IiwgIi1J
IiwgdGFwc2V0cyBdCiAgICAgaWYgYXJncy5waWQgaXMgbm90IE5vbmU6CiAgICAgICAgIHN0YXBh
cmdzLmV4dGVuZChbIi14IiwgYXJncy5waWRdKQogICAgIHN0YXBhcmdzLmV4dGVuZChbIi1lIiwg
c2NyaXB0XSkKLSAgICBzdWJwcm9jZXNzLmNhbGwoc3RhcGFyZ3MsIGVudj10YXBzZXRfZW52KHRh
cHNldHMpKQorICAgIHN1YnByb2Nlc3MuY2FsbChzdGFwYXJncykKIAogCiBkZWYgY21kX2xpc3Qo
YXJncyk6CkBAIC0xMDEsMTAgKzk2LDkgQEAgZGVmIGNtZF9saXN0KGFyZ3MpOgogCiAgICAgICAg
IGlmIHZlcmJvc2U6CiAgICAgICAgICAgICBwcmludCgiTGlzdGluZyBwcm9iZXMgd2l0aCBuYW1l
ICclcyciICUgc2NyaXB0KQotICAgICAgICBwcm9jID0gc3VicHJvY2Vzcy5Qb3BlbihbInN0YXAi
LCAiLWwiLCBzY3JpcHRdLAorICAgICAgICBwcm9jID0gc3VicHJvY2Vzcy5Qb3BlbihbInN0YXAi
LCAiLUkiLCB0YXBzZXRzLCAiLWwiLCBzY3JpcHRdLAogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBzdGRvdXQ9c3VicHJvY2Vzcy5QSVBFLAotICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB1bml2ZXJzYWxfbmV3bGluZXM9VHJ1ZSwKLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgZW52PXRhcHNldF9lbnYodGFwc2V0cykpCisgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHVuaXZlcnNhbF9uZXdsaW5lcz1UcnVlKQogICAgICAgICBvdXQsIGVyciA9IHBy
b2MuY29tbXVuaWNhdGUoKQogICAgICAgICBpZiBwcm9jLnJldHVybmNvZGUgIT0gMDoKICAgICAg
ICAgICAgIHByaW50KCJObyBwcm9iZXMgZm91bmQsIGFyZSB0aGUgdGFwc2V0cyBpbnN0YWxsZWQg
aW4gJXMiICUgdGFwc2V0X2RpcihhcmdzLmJpbmFyeSkpCi0tIAoyLjMxLjEKCg==


