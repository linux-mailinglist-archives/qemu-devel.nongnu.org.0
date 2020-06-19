Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED7D200849
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jun 2020 14:03:06 +0200 (CEST)
Received: from localhost ([::1]:44490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmFjd-0006Fa-GC
	for lists+qemu-devel@lfdr.de; Fri, 19 Jun 2020 08:03:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jmFhv-0004gv-S9
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 08:01:19 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:37495
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jmFht-0006bl-VI
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 08:01:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592568075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q2og2OIyjHIRuCRdAmqyFENbqMqlgU8vgLl7XV+/RAo=;
 b=Lx4KVXW4FwsxiXVFJvYhl5K+J1hc3NOjnhN9uu+fSgB8YDIfnPUuyxGjJAkUJQwdRmKkWu
 NG8Ccrh4qrRguSj1xhrDqZi4hkR0Xl8BM54zLyJHLUuj2tZcFvjwtApd+efeujRfvfMBb0
 JiWGRjR1SeG2mKoC+ZTBw7DbTyyRkjg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-obAmtjI3PrCmhvNpkA8sSg-1; Fri, 19 Jun 2020 08:01:13 -0400
X-MC-Unique: obAmtjI3PrCmhvNpkA8sSg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24206464;
 Fri, 19 Jun 2020 12:01:12 +0000 (UTC)
Received: from localhost (ovpn-113-212.ams2.redhat.com [10.36.113.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A71E819D61;
 Fri, 19 Jun 2020 12:01:11 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Coiby Xu <coiby.xu@gmail.com>
Subject: [PATCH 3/6] vhost-user-server: adjust
 vhost_user_server_set_aio_context() arguments
Date: Fri, 19 Jun 2020 13:00:43 +0100
Message-Id: <20200619120046.2422205-3-stefanha@redhat.com>
In-Reply-To: <20200619120046.2422205-1-stefanha@redhat.com>
References: <20200614183907.514282-3-coiby.xu@gmail.com>
 <20200619120046.2422205-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=207.211.31.81; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/19 01:50:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: kwolf@redhat.com, bharatlkmlkvm@gmail.com, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

dmhvc3RfdXNlcl9zZXJ2ZXJfc2V0X2Fpb19jb250ZXh0KCkgb3BlcmF0ZXMgb24gYSBWdVNlcnZl
ciBvYmplY3QuIE1ha2UKdGhhdCB0aGUgZmlyc3QgYXJndW1lbnQgb2YgdGhlIGZ1bmN0aW9uIHNp
bmNlIGl0IGlzIGNvbnZlbnRpb25hbCB0bwpkZWZpbmUgZnVuY3Rpb25zIHdpdGggdGhlIG9iamVj
dCB0aGV5IGFjdCBvbiBhcyB0aGUgZmlyc3QgYXJndW1lbnQuIEluCm90aGVyIHdvcmRzLCBvYmpf
YWN0aW9uKG9iaiwgYXJncy4uLikgaXMgY29tbW9ubHkgdXNlZCBhbmQgbm90Cm9ial9hY3Rpb24o
YXJnMSwgLi4uLCBvYmosIC4uLikuCgpTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0
ZWZhbmhhQHJlZGhhdC5jb20+Ci0tLQogdXRpbC92aG9zdC11c2VyLXNlcnZlci5oIHwgMiArLQog
dXRpbC92aG9zdC11c2VyLXNlcnZlci5jIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdXRpbC92aG9zdC11c2VyLXNl
cnZlci5oIGIvdXRpbC92aG9zdC11c2VyLXNlcnZlci5oCmluZGV4IDViYWY1OGY5NmEuLjU4NGFh
YjNkYTUgMTAwNjQ0Ci0tLSBhL3V0aWwvdmhvc3QtdXNlci1zZXJ2ZXIuaAorKysgYi91dGlsL3Zo
b3N0LXVzZXItc2VydmVyLmgKQEAgLTU2LDYgKzU2LDYgQEAgYm9vbCB2aG9zdF91c2VyX3NlcnZl
cl9zdGFydChWdVNlcnZlciAqc2VydmVyLAogCiB2b2lkIHZob3N0X3VzZXJfc2VydmVyX3N0b3Ao
VnVTZXJ2ZXIgKnNlcnZlcik7CiAKLXZvaWQgdmhvc3RfdXNlcl9zZXJ2ZXJfc2V0X2Fpb19jb250
ZXh0KEFpb0NvbnRleHQgKmN0eCwgVnVTZXJ2ZXIgKnNlcnZlcik7Cit2b2lkIHZob3N0X3VzZXJf
c2VydmVyX3NldF9haW9fY29udGV4dChWdVNlcnZlciAqc2VydmVyLCBBaW9Db250ZXh0ICpjdHgp
OwogCiAjZW5kaWYgLyogVkhPU1RfVVNFUl9TRVJWRVJfSCAqLwpkaWZmIC0tZ2l0IGEvdXRpbC92
aG9zdC11c2VyLXNlcnZlci5jIGIvdXRpbC92aG9zdC11c2VyLXNlcnZlci5jCmluZGV4IDQ5YWRh
OGJjNzguLjUyMzBiYTM4ODMgMTAwNjQ0Ci0tLSBhL3V0aWwvdmhvc3QtdXNlci1zZXJ2ZXIuYwor
KysgYi91dGlsL3Zob3N0LXVzZXItc2VydmVyLmMKQEAgLTM1Niw3ICszNTYsNyBAQCBzdGF0aWMg
dm9pZCBhdHRhY2hfY29udGV4dChWdVNlcnZlciAqc2VydmVyLCBBaW9Db250ZXh0ICpjdHgpCiAg
ICAgfQogfQogCi12b2lkIHZob3N0X3VzZXJfc2VydmVyX3NldF9haW9fY29udGV4dChBaW9Db250
ZXh0ICpjdHgsIFZ1U2VydmVyICpzZXJ2ZXIpCit2b2lkIHZob3N0X3VzZXJfc2VydmVyX3NldF9h
aW9fY29udGV4dChWdVNlcnZlciAqc2VydmVyLCBBaW9Db250ZXh0ICpjdHgpCiB7CiAgICAgc2Vy
dmVyLT5jdHggPSBjdHggPyBjdHggOiBxZW11X2dldF9haW9fY29udGV4dCgpOwogICAgIGlmICgh
c2VydmVyLT5zaW9jKSB7Ci0tIAoyLjI2LjIKCg==


