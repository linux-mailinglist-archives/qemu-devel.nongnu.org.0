Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73577283BFA
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Oct 2020 18:05:17 +0200 (CEST)
Received: from localhost ([::1]:60396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPSzE-0006EC-Bo
	for lists+qemu-devel@lfdr.de; Mon, 05 Oct 2020 12:05:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kPSew-0005mu-B8
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 11:44:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kPSet-0008Fu-8f
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 11:44:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601912654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uVToW14prikmTBTqtQW06DlnWPzOorHLiU0ihmtRaSU=;
 b=iq1k+cYTjsbaaAeCcgP2nWofXUAdVlxlxFmeHVMbWqwGhegzf4AQSV+gWm6Ntqnm/gZNPy
 GEZl32tcbun1qebLlo0Z69vVOFYX1znI4ddoKldxpOT9EBaxdEEYAxlJNS4Up/aIij7YQi
 C/skWgUtjArdfEERvrhOEdg5AI0UuE4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-NtTpP4hxPwSj1fXLp6e_5w-1; Mon, 05 Oct 2020 11:44:12 -0400
X-MC-Unique: NtTpP4hxPwSj1fXLp6e_5w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BAF06101962E;
 Mon,  5 Oct 2020 15:44:10 +0000 (UTC)
Received: from localhost (ovpn-112-117.ams2.redhat.com [10.36.112.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4DAF0277DC;
 Mon,  5 Oct 2020 15:44:07 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 13/17] block/io: refactor save/load vmstate
Date: Mon,  5 Oct 2020 16:43:19 +0100
Message-Id: <20201005154323.31347-14-stefanha@redhat.com>
In-Reply-To: <20201005154323.31347-1-stefanha@redhat.com>
References: <20201005154323.31347-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/05 02:11:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogVmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB2aXJ0dW96em8u
Y29tPgoKTGlrZSBmb3IgcmVhZC93cml0ZSBpbiBhIHByZXZpb3VzIGNvbW1pdCwgZHJvcCBleHRy
YSBpbmRpcmVjdGlvbiBsYXllciwKZ2VuZXJhdGUgZGlyZWN0bHkgYmRydl9yZWFkdl92bXN0YXRl
KCkgYW5kIGJkcnZfd3JpdGV2X3Ztc3RhdGUoKS4KClNpZ25lZC1vZmYtYnk6IFZsYWRpbWlyIFNl
bWVudHNvdi1PZ2lldnNraXkgPHZzZW1lbnRzb3ZAdmlydHVvenpvLmNvbT4KU2lnbmVkLW9mZi1i
eTogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgpSZXZpZXdlZC1ieTogRXJp
YyBCbGFrZSA8ZWJsYWtlQHJlZGhhdC5jb20+ClJldmlld2VkLWJ5OiBTdGVmYW4gSGFqbm9jemkg
PHN0ZWZhbmhhQHJlZGhhdC5jb20+Ck1lc3NhZ2UtSWQ6IDwyMDIwMDkyNDE4NTQxNC4yODY0Mi04
LXZzZW1lbnRzb3ZAdmlydHVvenpvLmNvbT4KLS0tCiBibG9jay9jb3JvdXRpbmVzLmggICAgfCAx
MCArKystLS0tCiBpbmNsdWRlL2Jsb2NrL2Jsb2NrLmggfCAgNiArKy0tCiBibG9jay9pby5jICAg
ICAgICAgICAgfCA3MCArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CiAzIGZpbGVzIGNoYW5nZWQsIDQ0IGluc2VydGlvbnMoKyksIDQyIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2Jsb2NrL2Nvcm91dGluZXMuaCBiL2Jsb2NrL2Nvcm91dGluZXMuaAppbmRleCA2
YzYzYTgxOWM5Li5mNjkxNzlmNWVmIDEwMDY0NAotLS0gYS9ibG9jay9jb3JvdXRpbmVzLmgKKysr
IGIvYmxvY2svY29yb3V0aW5lcy5oCkBAIC01NywxMSArNTcsOSBAQCBiZHJ2X2NvbW1vbl9ibG9j
a19zdGF0dXNfYWJvdmUoQmxvY2tEcml2ZXJTdGF0ZSAqYnMsCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgaW50NjRfdCAqbWFwLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IEJsb2NrRHJpdmVyU3RhdGUgKipmaWxlKTsKIAotaW50IGNvcm91dGluZV9mbgotYmRydl9jb19y
d192bXN0YXRlKEJsb2NrRHJpdmVyU3RhdGUgKmJzLCBRRU1VSU9WZWN0b3IgKnFpb3YsIGludDY0
X3QgcG9zLAotICAgICAgICAgICAgICAgICAgIGJvb2wgaXNfcmVhZCk7Ci1pbnQgZ2VuZXJhdGVk
X2NvX3dyYXBwZXIKLWJkcnZfcndfdm1zdGF0ZShCbG9ja0RyaXZlclN0YXRlICpicywgUUVNVUlP
VmVjdG9yICpxaW92LCBpbnQ2NF90IHBvcywKLSAgICAgICAgICAgICAgICBib29sIGlzX3JlYWQp
OworaW50IGNvcm91dGluZV9mbiBiZHJ2X2NvX3JlYWR2X3Ztc3RhdGUoQmxvY2tEcml2ZXJTdGF0
ZSAqYnMsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBRRU1VSU9WZWN0
b3IgKnFpb3YsIGludDY0X3QgcG9zKTsKK2ludCBjb3JvdXRpbmVfZm4gYmRydl9jb193cml0ZXZf
dm1zdGF0ZShCbG9ja0RyaXZlclN0YXRlICpicywKKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBRRU1VSU9WZWN0b3IgKnFpb3YsIGludDY0X3QgcG9zKTsKIAogI2VuZGlm
IC8qIEJMT0NLX0NPUk9VVElORVNfSU5UX0ggKi8KZGlmZiAtLWdpdCBhL2luY2x1ZGUvYmxvY2sv
YmxvY2suaCBiL2luY2x1ZGUvYmxvY2svYmxvY2suaAppbmRleCBlZWY0Y2NlYWYwLi44Yjg3ZGY2
OWExIDEwMDY0NAotLS0gYS9pbmNsdWRlL2Jsb2NrL2Jsb2NrLmgKKysrIGIvaW5jbHVkZS9ibG9j
ay9ibG9jay5oCkBAIC01NzIsOCArNTcyLDEwIEBAIGludCBwYXRoX2hhc19wcm90b2NvbChjb25z
dCBjaGFyICpwYXRoKTsKIGludCBwYXRoX2lzX2Fic29sdXRlKGNvbnN0IGNoYXIgKnBhdGgpOwog
Y2hhciAqcGF0aF9jb21iaW5lKGNvbnN0IGNoYXIgKmJhc2VfcGF0aCwgY29uc3QgY2hhciAqZmls
ZW5hbWUpOwogCi1pbnQgYmRydl9yZWFkdl92bXN0YXRlKEJsb2NrRHJpdmVyU3RhdGUgKmJzLCBR
RU1VSU9WZWN0b3IgKnFpb3YsIGludDY0X3QgcG9zKTsKLWludCBiZHJ2X3dyaXRldl92bXN0YXRl
KEJsb2NrRHJpdmVyU3RhdGUgKmJzLCBRRU1VSU9WZWN0b3IgKnFpb3YsIGludDY0X3QgcG9zKTsK
K2ludCBnZW5lcmF0ZWRfY29fd3JhcHBlcgorYmRydl9yZWFkdl92bXN0YXRlKEJsb2NrRHJpdmVy
U3RhdGUgKmJzLCBRRU1VSU9WZWN0b3IgKnFpb3YsIGludDY0X3QgcG9zKTsKK2ludCBnZW5lcmF0
ZWRfY29fd3JhcHBlcgorYmRydl93cml0ZXZfdm1zdGF0ZShCbG9ja0RyaXZlclN0YXRlICpicywg
UUVNVUlPVmVjdG9yICpxaW92LCBpbnQ2NF90IHBvcyk7CiBpbnQgYmRydl9zYXZlX3Ztc3RhdGUo
QmxvY2tEcml2ZXJTdGF0ZSAqYnMsIGNvbnN0IHVpbnQ4X3QgKmJ1ZiwKICAgICAgICAgICAgICAg
ICAgICAgICBpbnQ2NF90IHBvcywgaW50IHNpemUpOwogCmRpZmYgLS1naXQgYS9ibG9jay9pby5j
IGIvYmxvY2svaW8uYwppbmRleCBjM2RjMWRiMDM2Li41NGYwOTY4YWVlIDEwMDY0NAotLS0gYS9i
bG9jay9pby5jCisrKyBiL2Jsb2NrL2lvLmMKQEAgLTI0NzUsMjggKzI0NzUsNTAgQEAgaW50IGJk
cnZfaXNfYWxsb2NhdGVkX2Fib3ZlKEJsb2NrRHJpdmVyU3RhdGUgKnRvcCwKIH0KIAogaW50IGNv
cm91dGluZV9mbgotYmRydl9jb19yd192bXN0YXRlKEJsb2NrRHJpdmVyU3RhdGUgKmJzLCBRRU1V
SU9WZWN0b3IgKnFpb3YsIGludDY0X3QgcG9zLAotICAgICAgICAgICAgICAgICAgIGJvb2wgaXNf
cmVhZCkKK2JkcnZfY29fcmVhZHZfdm1zdGF0ZShCbG9ja0RyaXZlclN0YXRlICpicywgUUVNVUlP
VmVjdG9yICpxaW92LCBpbnQ2NF90IHBvcykKIHsKICAgICBCbG9ja0RyaXZlciAqZHJ2ID0gYnMt
PmRydjsKICAgICBCbG9ja0RyaXZlclN0YXRlICpjaGlsZF9icyA9IGJkcnZfcHJpbWFyeV9icyhi
cyk7CiAgICAgaW50IHJldCA9IC1FTk9UU1VQOwogCisgICAgaWYgKCFkcnYpIHsKKyAgICAgICAg
cmV0dXJuIC1FTk9NRURJVU07CisgICAgfQorCiAgICAgYmRydl9pbmNfaW5fZmxpZ2h0KGJzKTsK
IAorICAgIGlmIChkcnYtPmJkcnZfbG9hZF92bXN0YXRlKSB7CisgICAgICAgIHJldCA9IGRydi0+
YmRydl9sb2FkX3Ztc3RhdGUoYnMsIHFpb3YsIHBvcyk7CisgICAgfSBlbHNlIGlmIChjaGlsZF9i
cykgeworICAgICAgICByZXQgPSBiZHJ2X2NvX3JlYWR2X3Ztc3RhdGUoY2hpbGRfYnMsIHFpb3Ys
IHBvcyk7CisgICAgfQorCisgICAgYmRydl9kZWNfaW5fZmxpZ2h0KGJzKTsKKworICAgIHJldHVy
biByZXQ7Cit9CisKK2ludCBjb3JvdXRpbmVfZm4KK2JkcnZfY29fd3JpdGV2X3Ztc3RhdGUoQmxv
Y2tEcml2ZXJTdGF0ZSAqYnMsIFFFTVVJT1ZlY3RvciAqcWlvdiwgaW50NjRfdCBwb3MpCit7Cisg
ICAgQmxvY2tEcml2ZXIgKmRydiA9IGJzLT5kcnY7CisgICAgQmxvY2tEcml2ZXJTdGF0ZSAqY2hp
bGRfYnMgPSBiZHJ2X3ByaW1hcnlfYnMoYnMpOworICAgIGludCByZXQgPSAtRU5PVFNVUDsKKwog
ICAgIGlmICghZHJ2KSB7Ci0gICAgICAgIHJldCA9IC1FTk9NRURJVU07Ci0gICAgfSBlbHNlIGlm
IChkcnYtPmJkcnZfbG9hZF92bXN0YXRlKSB7Ci0gICAgICAgIGlmIChpc19yZWFkKSB7Ci0gICAg
ICAgICAgICByZXQgPSBkcnYtPmJkcnZfbG9hZF92bXN0YXRlKGJzLCBxaW92LCBwb3MpOwotICAg
ICAgICB9IGVsc2UgewotICAgICAgICAgICAgcmV0ID0gZHJ2LT5iZHJ2X3NhdmVfdm1zdGF0ZShi
cywgcWlvdiwgcG9zKTsKLSAgICAgICAgfQorICAgICAgICByZXR1cm4gLUVOT01FRElVTTsKKyAg
ICB9CisKKyAgICBiZHJ2X2luY19pbl9mbGlnaHQoYnMpOworCisgICAgaWYgKGRydi0+YmRydl9z
YXZlX3Ztc3RhdGUpIHsKKyAgICAgICAgcmV0ID0gZHJ2LT5iZHJ2X3NhdmVfdm1zdGF0ZShicywg
cWlvdiwgcG9zKTsKICAgICB9IGVsc2UgaWYgKGNoaWxkX2JzKSB7Ci0gICAgICAgIHJldCA9IGJk
cnZfY29fcndfdm1zdGF0ZShjaGlsZF9icywgcWlvdiwgcG9zLCBpc19yZWFkKTsKKyAgICAgICAg
cmV0ID0gYmRydl9jb193cml0ZXZfdm1zdGF0ZShjaGlsZF9icywgcWlvdiwgcG9zKTsKICAgICB9
CiAKICAgICBiZHJ2X2RlY19pbl9mbGlnaHQoYnMpOworCiAgICAgcmV0dXJuIHJldDsKIH0KIApA
QCAtMjUwNCwzOCArMjUyNiwxOCBAQCBpbnQgYmRydl9zYXZlX3Ztc3RhdGUoQmxvY2tEcml2ZXJT
dGF0ZSAqYnMsIGNvbnN0IHVpbnQ4X3QgKmJ1ZiwKICAgICAgICAgICAgICAgICAgICAgICBpbnQ2
NF90IHBvcywgaW50IHNpemUpCiB7CiAgICAgUUVNVUlPVmVjdG9yIHFpb3YgPSBRRU1VX0lPVkVD
X0lOSVRfQlVGKHFpb3YsIGJ1Ziwgc2l6ZSk7Ci0gICAgaW50IHJldDsKKyAgICBpbnQgcmV0ID0g
YmRydl93cml0ZXZfdm1zdGF0ZShicywgJnFpb3YsIHBvcyk7CiAKLSAgICByZXQgPSBiZHJ2X3dy
aXRldl92bXN0YXRlKGJzLCAmcWlvdiwgcG9zKTsKLSAgICBpZiAocmV0IDwgMCkgewotICAgICAg
ICByZXR1cm4gcmV0OwotICAgIH0KLQotICAgIHJldHVybiBzaXplOwotfQotCi1pbnQgYmRydl93
cml0ZXZfdm1zdGF0ZShCbG9ja0RyaXZlclN0YXRlICpicywgUUVNVUlPVmVjdG9yICpxaW92LCBp
bnQ2NF90IHBvcykKLXsKLSAgICByZXR1cm4gYmRydl9yd192bXN0YXRlKGJzLCBxaW92LCBwb3Ms
IGZhbHNlKTsKKyAgICByZXR1cm4gcmV0IDwgMCA/IHJldCA6IHNpemU7CiB9CiAKIGludCBiZHJ2
X2xvYWRfdm1zdGF0ZShCbG9ja0RyaXZlclN0YXRlICpicywgdWludDhfdCAqYnVmLAogICAgICAg
ICAgICAgICAgICAgICAgIGludDY0X3QgcG9zLCBpbnQgc2l6ZSkKIHsKICAgICBRRU1VSU9WZWN0
b3IgcWlvdiA9IFFFTVVfSU9WRUNfSU5JVF9CVUYocWlvdiwgYnVmLCBzaXplKTsKLSAgICBpbnQg
cmV0OworICAgIGludCByZXQgPSBiZHJ2X3JlYWR2X3Ztc3RhdGUoYnMsICZxaW92LCBwb3MpOwog
Ci0gICAgcmV0ID0gYmRydl9yZWFkdl92bXN0YXRlKGJzLCAmcWlvdiwgcG9zKTsKLSAgICBpZiAo
cmV0IDwgMCkgewotICAgICAgICByZXR1cm4gcmV0OwotICAgIH0KLQotICAgIHJldHVybiBzaXpl
OwotfQotCi1pbnQgYmRydl9yZWFkdl92bXN0YXRlKEJsb2NrRHJpdmVyU3RhdGUgKmJzLCBRRU1V
SU9WZWN0b3IgKnFpb3YsIGludDY0X3QgcG9zKQotewotICAgIHJldHVybiBiZHJ2X3J3X3Ztc3Rh
dGUoYnMsIHFpb3YsIHBvcywgdHJ1ZSk7CisgICAgcmV0dXJuIHJldCA8IDAgPyByZXQgOiBzaXpl
OwogfQogCiAvKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKiovCi0tIAoyLjI2LjIKCg==


