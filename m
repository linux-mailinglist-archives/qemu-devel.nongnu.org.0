Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BD7297285
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Oct 2020 17:39:13 +0200 (CEST)
Received: from localhost ([::1]:46280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVz9s-0001qE-JT
	for lists+qemu-devel@lfdr.de; Fri, 23 Oct 2020 11:39:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kVytT-0005Bs-7h
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 11:22:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kVytP-0000bA-GF
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 11:22:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603466530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4EZdYt16YWuJFdVFl2nWGZ6CRGtlctxL0AjPsJnvegM=;
 b=QmH/yhFrxCitc0WwVm5WY/pmRSIgDJtY+nvDNkw1qO/pGGt1WjSomphZHPX+NzLdEJ+KlQ
 2N5MN+fiGZVHCwr/oKR4iiIWC0kWNBU/L7D57Sx59KiIToMKmltNap+VD9vMo8eMDvxA/z
 eTmR1GGu3sZ4Gc1SLiKPfBF0e1/gTxo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-sfnFVYuOP9mJ1peZuLtcWA-1; Fri, 23 Oct 2020 11:22:08 -0400
X-MC-Unique: sfnFVYuOP9mJ1peZuLtcWA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2EF18186DD23;
 Fri, 23 Oct 2020 15:22:07 +0000 (UTC)
Received: from localhost (ovpn-114-178.ams2.redhat.com [10.36.114.178])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B7EB61A925;
 Fri, 23 Oct 2020 15:22:06 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v3 03/28] libvhost-user: remove watch for kick_fd when
 de-initialize vu-dev
Date: Fri, 23 Oct 2020 16:21:22 +0100
Message-Id: <20201023152147.1016281-4-stefanha@redhat.com>
In-Reply-To: <20201023152147.1016281-1-stefanha@redhat.com>
References: <20201023152147.1016281-1-stefanha@redhat.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/23 01:44:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Coiby Xu <coiby.xu@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogQ29pYnkgWHUgPGNvaWJ5Lnh1QGdtYWlsLmNvbT4KCldoZW4gdGhlIGNsaWVudCBpcyBy
dW5uaW5nIGluIGdkYiBhbmQgcXVpdCBjb21tYW5kIGlzIHJ1biBpbiBnZGIsClFFTVUgd2lsbCBz
dGlsbCBkaXNwYXRjaCB0aGUgZXZlbnQgd2hpY2ggd2lsbCBjYXVzZSBzZWdtZW50IGZhdWx0IGlu
CnRoZSBjYWxsYmFjayBmdW5jdGlvbi4KClNpZ25lZC1vZmYtYnk6IENvaWJ5IFh1IDxjb2lieS54
dUBnbWFpbC5jb20+ClJldmlld2VkLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhh
dC5jb20+ClJldmlld2VkLWJ5OiBNYXJjLUFuZHLDqSBMdXJlYXUgPG1hcmNhbmRyZS5sdXJlYXVA
cmVkaGF0LmNvbT4KTWVzc2FnZS1pZDogMjAyMDA5MTgwODA5MTIuMzIxMjk5LTMtY29pYnkueHVA
Z21haWwuY29tClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0
LmNvbT4KLS0tCiBjb250cmliL2xpYnZob3N0LXVzZXIvbGlidmhvc3QtdXNlci5jIHwgMSArCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9jb250cmliL2xpYnZo
b3N0LXVzZXIvbGlidmhvc3QtdXNlci5jIGIvY29udHJpYi9saWJ2aG9zdC11c2VyL2xpYnZob3N0
LXVzZXIuYwppbmRleCAwOWJkZmYxOGYzLi5iZmVjOGE4ODFhIDEwMDY0NAotLS0gYS9jb250cmli
L2xpYnZob3N0LXVzZXIvbGlidmhvc3QtdXNlci5jCisrKyBiL2NvbnRyaWIvbGlidmhvc3QtdXNl
ci9saWJ2aG9zdC11c2VyLmMKQEAgLTE5MTgsNiArMTkxOCw3IEBAIHZ1X2RlaW5pdChWdURldiAq
ZGV2KQogICAgICAgICB9CiAKICAgICAgICAgaWYgKHZxLT5raWNrX2ZkICE9IC0xKSB7CisgICAg
ICAgICAgICBkZXYtPnJlbW92ZV93YXRjaChkZXYsIHZxLT5raWNrX2ZkKTsKICAgICAgICAgICAg
IGNsb3NlKHZxLT5raWNrX2ZkKTsKICAgICAgICAgICAgIHZxLT5raWNrX2ZkID0gLTE7CiAgICAg
ICAgIH0KLS0gCjIuMjYuMgoK


