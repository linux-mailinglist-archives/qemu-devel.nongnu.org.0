Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 573153D0F52
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 15:16:05 +0200 (CEST)
Received: from localhost ([::1]:35906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6C4x-000566-Va
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 09:16:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m6C2J-00032M-Uf
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 09:13:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m6C2H-0006bd-Ui
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 09:13:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626873197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vz7lx2AiiHqH5Tv48FsNe5KZNz5jccOI3N/u4WKSIXo=;
 b=Ay8oWP6kKXTPT/NF5u6lXO2ukxL4R7s9g6LWSmDD0ylZuU8JD1gcNiJxTfywLwRxW26Zk7
 XGyvzv6gLA2uWa8mTOOJ/nOhBCSPO24liXAtiE8pXNc36szQiaiZpSmumAvssd9Tcakz/p
 L96ynpMvPbfFS7FPhAB7YujFkEhuEo8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-LtTvcxDfOjei40KsUoQIKA-1; Wed, 21 Jul 2021 09:13:15 -0400
X-MC-Unique: LtTvcxDfOjei40KsUoQIKA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5978835E26;
 Wed, 21 Jul 2021 13:13:01 +0000 (UTC)
Received: from localhost (ovpn-114-233.ams2.redhat.com [10.36.114.233])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 514225DA2D;
 Wed, 21 Jul 2021 13:13:01 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL for-6.1 1/3] iothread: generalize
 iothread_set_param/iothread_get_param
Date: Wed, 21 Jul 2021 14:12:51 +0100
Message-Id: <20210721131253.275821-2-stefanha@redhat.com>
In-Reply-To: <20210721131253.275821-1-stefanha@redhat.com>
References: <20210721131253.275821-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogU3RlZmFubyBHYXJ6YXJlbGxhIDxzZ2FyemFyZUByZWRoYXQuY29tPgoKQ2hhbmdlcyBp
biBwcmVwYXJhdGlvbiBmb3IgbmV4dCBwYXRjaGVzIHdoZXJlIHdlIGFkZCBhIG5ldwpwYXJhbWV0
ZXIgbm90IHJlbGF0ZWQgdG8gdGhlIHBvbGwgbWVjaGFuaXNtLgoKTGV0J3MgYWRkIHR3byBuZXcg
Z2VuZXJpYyBmdW5jdGlvbnMgKGlvdGhyZWFkX3NldF9wYXJhbSBhbmQKaW90aHJlYWRfZ2V0X3Bh
cmFtKSB0aGF0IHdlIHVzZSB0byBzZXQgYW5kIGdldCBJT1RocmVhZApwYXJhbWV0ZXJzLgoKU2ln
bmVkLW9mZi1ieTogU3RlZmFubyBHYXJ6YXJlbGxhIDxzZ2FyemFyZUByZWRoYXQuY29tPgpNZXNz
YWdlLWlkOiAyMDIxMDcyMTA5NDIxMS42OTg1My0yLXNnYXJ6YXJlQHJlZGhhdC5jb20KU2lnbmVk
LW9mZi1ieTogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgotLS0KIGlvdGhy
ZWFkLmMgfCAyNyArKysrKysrKysrKysrKysrKysrKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
MyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2lvdGhyZWFkLmMg
Yi9pb3RocmVhZC5jCmluZGV4IDJjNWNjZDczNjcuLjEwMzY3OWExNmIgMTAwNjQ0Ci0tLSBhL2lv
dGhyZWFkLmMKKysrIGIvaW90aHJlYWQuYwpAQCAtMjEzLDcgKzIxMyw3IEBAIHN0YXRpYyBQb2xs
UGFyYW1JbmZvIHBvbGxfc2hyaW5rX2luZm8gPSB7CiAgICAgInBvbGwtc2hyaW5rIiwgb2Zmc2V0
b2YoSU9UaHJlYWQsIHBvbGxfc2hyaW5rKSwKIH07CiAKLXN0YXRpYyB2b2lkIGlvdGhyZWFkX2dl
dF9wb2xsX3BhcmFtKE9iamVjdCAqb2JqLCBWaXNpdG9yICp2LAorc3RhdGljIHZvaWQgaW90aHJl
YWRfZ2V0X3BhcmFtKE9iamVjdCAqb2JqLCBWaXNpdG9yICp2LAogICAgICAgICBjb25zdCBjaGFy
ICpuYW1lLCB2b2lkICpvcGFxdWUsIEVycm9yICoqZXJycCkKIHsKICAgICBJT1RocmVhZCAqaW90
aHJlYWQgPSBJT1RIUkVBRChvYmopOwpAQCAtMjIzLDcgKzIyMyw3IEBAIHN0YXRpYyB2b2lkIGlv
dGhyZWFkX2dldF9wb2xsX3BhcmFtKE9iamVjdCAqb2JqLCBWaXNpdG9yICp2LAogICAgIHZpc2l0
X3R5cGVfaW50NjQodiwgbmFtZSwgZmllbGQsIGVycnApOwogfQogCi1zdGF0aWMgdm9pZCBpb3Ro
cmVhZF9zZXRfcG9sbF9wYXJhbShPYmplY3QgKm9iaiwgVmlzaXRvciAqdiwKK3N0YXRpYyBib29s
IGlvdGhyZWFkX3NldF9wYXJhbShPYmplY3QgKm9iaiwgVmlzaXRvciAqdiwKICAgICAgICAgY29u
c3QgY2hhciAqbmFtZSwgdm9pZCAqb3BhcXVlLCBFcnJvciAqKmVycnApCiB7CiAgICAgSU9UaHJl
YWQgKmlvdGhyZWFkID0gSU9USFJFQUQob2JqKTsKQEAgLTIzMiwxNyArMjMyLDM2IEBAIHN0YXRp
YyB2b2lkIGlvdGhyZWFkX3NldF9wb2xsX3BhcmFtKE9iamVjdCAqb2JqLCBWaXNpdG9yICp2LAog
ICAgIGludDY0X3QgdmFsdWU7CiAKICAgICBpZiAoIXZpc2l0X3R5cGVfaW50NjQodiwgbmFtZSwg
JnZhbHVlLCBlcnJwKSkgewotICAgICAgICByZXR1cm47CisgICAgICAgIHJldHVybiBmYWxzZTsK
ICAgICB9CiAKICAgICBpZiAodmFsdWUgPCAwKSB7CiAgICAgICAgIGVycm9yX3NldGcoZXJycCwg
IiVzIHZhbHVlIG11c3QgYmUgaW4gcmFuZ2UgWzAsICUiIFBSSWQ2NCAiXSIsCiAgICAgICAgICAg
ICAgICAgICAgaW5mby0+bmFtZSwgSU5UNjRfTUFYKTsKLSAgICAgICAgcmV0dXJuOworICAgICAg
ICByZXR1cm4gZmFsc2U7CiAgICAgfQogCiAgICAgKmZpZWxkID0gdmFsdWU7CiAKKyAgICByZXR1
cm4gdHJ1ZTsKK30KKworc3RhdGljIHZvaWQgaW90aHJlYWRfZ2V0X3BvbGxfcGFyYW0oT2JqZWN0
ICpvYmosIFZpc2l0b3IgKnYsCisgICAgICAgIGNvbnN0IGNoYXIgKm5hbWUsIHZvaWQgKm9wYXF1
ZSwgRXJyb3IgKiplcnJwKQoreworCisgICAgaW90aHJlYWRfZ2V0X3BhcmFtKG9iaiwgdiwgbmFt
ZSwgb3BhcXVlLCBlcnJwKTsKK30KKworc3RhdGljIHZvaWQgaW90aHJlYWRfc2V0X3BvbGxfcGFy
YW0oT2JqZWN0ICpvYmosIFZpc2l0b3IgKnYsCisgICAgICAgIGNvbnN0IGNoYXIgKm5hbWUsIHZv
aWQgKm9wYXF1ZSwgRXJyb3IgKiplcnJwKQoreworICAgIElPVGhyZWFkICppb3RocmVhZCA9IElP
VEhSRUFEKG9iaik7CisKKyAgICBpZiAoIWlvdGhyZWFkX3NldF9wYXJhbShvYmosIHYsIG5hbWUs
IG9wYXF1ZSwgZXJycCkpIHsKKyAgICAgICAgcmV0dXJuOworICAgIH0KKwogICAgIGlmIChpb3Ro
cmVhZC0+Y3R4KSB7CiAgICAgICAgIGFpb19jb250ZXh0X3NldF9wb2xsX3BhcmFtcyhpb3RocmVh
ZC0+Y3R4LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW90aHJlYWQtPnBv
bGxfbWF4X25zLAotLSAKMi4zMS4xCgo=


