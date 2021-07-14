Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EE43C81AD
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 11:34:32 +0200 (CEST)
Received: from localhost ([::1]:42112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3bHj-0007Cy-CK
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 05:34:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m3bEA-0002b3-GF
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:30:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m3bE8-0000NS-LT
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:30:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626255048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rnDWv663jkS5ErYisfrxZYRrGQTSxT0robFBkPw9a28=;
 b=UrThMkkUsC7cXxQ0tgjaf7nUg/UwHUqbzbSgNT6Ftdvo2hGXHCGWe9T+NjqkUG4PjpCUgB
 GU1gJxydG9DazpnHFJIuk+tvjLfu6wn/lLhTNBzaFr1h+D1+WhAG9cnyyAExeHOjPlcM/f
 gMx6/gpgn2Sf84Fqn3qducuKop/yoOY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-2NaE4WmrPYSfRkO0jNusiA-1; Wed, 14 Jul 2021 05:30:46 -0400
X-MC-Unique: 2NaE4WmrPYSfRkO0jNusiA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7143C1B18BC0
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 09:30:45 +0000 (UTC)
Received: from localhost (ovpn-112-200.ams2.redhat.com [10.36.112.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B91ED60871;
 Wed, 14 Jul 2021 09:30:34 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/3] vhost-user: warn when guest RAM is not shared
Date: Wed, 14 Jul 2021 10:29:46 +0100
Message-Id: <20210714092946.569516-4-stefanha@redhat.com>
In-Reply-To: <20210714092946.569516-1-stefanha@redhat.com>
References: <20210714092946.569516-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Laurent Vivier <lvivier@redhat.com>, kwolf@redhat.com,
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TWVtb3J5IHJlZ2lvbnMgbXVzdCBiZSBtbWFwKE1BUF9TSEFSRUQpIHNvIHRoYXQgbW9kaWZpY2F0
aW9ucyBtYWRlIGJ5CnRoZSB2aG9zdCBkZXZpY2UgYmFja2VuZCBwcm9jZXNzIGFyZSB2aXNpYmxl
IHRvIFFFTVUgYW5kIHZpY2UgdmVyc2EuIFVzZQp0aGUgbmV3IG1lbW9yeV9yZWdpb25faXNfbWFw
cGVkX3NoYXJlZCgpIGZ1bmN0aW9uIHRvIGNoZWNrIHRoaXMgYW5kCnByaW50IGEgd2FybmluZyBp
ZiBndWVzdCBSQU0gaXMgbm90IHNoYXJlZDoKCiAgcWVtdS1zeXN0ZW0teDg2XzY0OiAtZGV2aWNl
IHZob3N0LXVzZXItZnMtcGNpLGNoYXJkZXY9Y2hhcjAsdGFnPW15ZnM6IHdhcm5pbmc6IEZvdW5k
IHZob3N0LXVzZXIgbWVtb3J5IHJlZ2lvbiB3aXRob3V0IE1BUF9TSEFSRUQgKGRpZCB5b3UgZm9y
Z2V0IC1vYmplY3QgbWVtb3J5LSosc2hhcmU9b24/KQogIHFlbXUtc3lzdGVtLXg4Nl82NDogRmFp
bGVkIHRvIHJlYWQgZnJvbSBzbGF2ZS4KClRoaXMgd2FybmluZyBtYWtlcyBpdCBjbGVhciB0aGF0
IG1lbW9yeSBuZWVkcyB0byBiZSBjb25maWd1cmVkIHdpdGgKc2hhcmU9b24uIFdpdGhvdXQgdGhp
cyBwYXRjaCB0aGUgdmhvc3QgZGV2aWNlIGlzIGluaXRpYWxpemVkIGFuZCB0aGUKZGV2aWNlIGZh
aWxzIHdpdGggdmFndWUgZXJyb3IgbWVzc2FnZXMgY2F1c2VkIGJ5IGluY29uc2lzdGVudCBtZW1v
cnkKdmlld3MuIFRoZSB3YXJuaW5nIHNob3VsZCBtYWtlIGl0IGVhc2llciB0byB0cm91Ymxlc2hv
b3QgUUVNVQpjb21tYW5kLWxpbmVzIHRoYXQgbGFjayBzaGFyZT1vbiBtZW1vcnkuCgpJIGNvdWxk
bid0IGZpZ3VyZSBvdXQgaG93IHRvIG1ha2UgdGhpcyBhIHZob3N0X2Rldl9pbml0KCkgZXJyb3Is
IGJlY2F1c2UKbWVtb3J5IHJlZ2lvbnMgYXJlbid0IG5lY2Vzc2FyaWx5IGZpbmFsIHdoZW4gaXQg
aXMgY2FsbGVkLiBBbHNvLCBob3RwbHVnCmNhbiBhZGQgbWVtb3J5IHJlZ2lvbnMgd2l0aG91dCBN
QVBfU0hBUkVEIGluIHRoZSBmdXR1cmUsIHNvIHdlIHN0aWxsCm5lZWQgdG8gd2FybiBhYm91dCB0
aGF0LgoKUmVwb3J0ZWQtYnk6IEtldmluIFdvbGYgPGt3b2xmQHJlZGhhdC5jb20+ClJldmlld2Vk
LWJ5OiBNYXJjLUFuZHLDqSBMdXJlYXUgPG1hcmNhbmRyZS5sdXJlYXVAcmVkaGF0LmNvbT4KU2ln
bmVkLW9mZi1ieTogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgotLS0KIGh3
L3ZpcnRpby92aG9zdC11c2VyLmMgfCAyMCArKysrKysrKysrKysrKysrLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaHcv
dmlydGlvL3Zob3N0LXVzZXIuYyBiL2h3L3ZpcnRpby92aG9zdC11c2VyLmMKaW5kZXggMjllYTJi
NGZjZS4uMzk3ODI5MjUxNCAxMDA2NDQKLS0tIGEvaHcvdmlydGlvL3Zob3N0LXVzZXIuYworKysg
Yi9ody92aXJ0aW8vdmhvc3QtdXNlci5jCkBAIC0yMjk1LDExICsyMjk1LDIzIEBAIHZob3N0X3Vz
ZXJfY3J5cHRvX2Nsb3NlX3Nlc3Npb24oc3RydWN0IHZob3N0X2RldiAqZGV2LCB1aW50NjRfdCBz
ZXNzaW9uX2lkKQogc3RhdGljIGJvb2wgdmhvc3RfdXNlcl9tZW1fc2VjdGlvbl9maWx0ZXIoc3Ry
dWN0IHZob3N0X2RldiAqZGV2LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgTWVtb3J5UmVnaW9uU2VjdGlvbiAqc2VjdGlvbikKIHsKLSAgICBib29sIHJlc3VsdDsK
KyAgICAvKiBBbiBmZCBpcyByZXF1aXJlZCBzbyB3ZSBjYW4gcGFzcyBpdCB0byB0aGUgZGV2aWNl
IGJhY2tlbmQgcHJvY2VzcyAqLworICAgIGlmIChtZW1vcnlfcmVnaW9uX2dldF9mZChzZWN0aW9u
LT5tcikgPCAwKSB7CisgICAgICAgIHJldHVybiBmYWxzZTsKKyAgICB9CiAKLSAgICByZXN1bHQg
PSBtZW1vcnlfcmVnaW9uX2dldF9mZChzZWN0aW9uLT5tcikgPj0gMDsKLQotICAgIHJldHVybiBy
ZXN1bHQ7CisgICAgLyoKKyAgICAgKiBJdCBtdXN0IGJlIG1tYXAoTUFQX1NIQVJFRCkgc28gbWVt
b3J5IHN0b3JlcyBmcm9tIHRoZSBkZXZpY2UgYmFja2VuZAorICAgICAqIHByb2Nlc3MgYXJlIHZp
c2libGUgdG8gdXMgYW5kIHZpY2UgdmVyc2EuCisgICAgICovCisgICAgaWYgKCFtZW1vcnlfcmVn
aW9uX2lzX21hcHBlZF9zaGFyZWQoc2VjdGlvbi0+bXIpKSB7CisgICAgICAgIHN0YXRpYyBib29s
IHdhcm5lZDsKKyAgICAgICAgd2Fybl9yZXBvcnRfb25jZV9jb25kKCZ3YXJuZWQsICJGb3VuZCB2
aG9zdC11c2VyIG1lbW9yeSByZWdpb24gIgorICAgICAgICAgICAgICAgICJ3aXRob3V0IE1BUF9T
SEFSRUQgKGRpZCB5b3UgZm9yZ2V0IC1vYmplY3QgIgorICAgICAgICAgICAgICAgICJtZW1vcnkt
KixzaGFyZT1vbj8pIik7CisgICAgICAgIHJldHVybiBmYWxzZTsKKyAgICB9CisgICAgcmV0dXJu
IHRydWU7CiB9CiAKIHN0YXRpYyBpbnQgdmhvc3RfdXNlcl9nZXRfaW5mbGlnaHRfZmQoc3RydWN0
IHZob3N0X2RldiAqZGV2LAotLSAKMi4zMS4xCgo=


