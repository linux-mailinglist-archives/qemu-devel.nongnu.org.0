Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 001DA2895AE
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Oct 2020 21:58:06 +0200 (CEST)
Received: from localhost ([::1]:43900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQyWk-0008NB-2a
	for lists+qemu-devel@lfdr.de; Fri, 09 Oct 2020 15:58:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kQyCL-0001yX-Oc
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 15:37:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kQyCJ-0002zu-Vy
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 15:37:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602272219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rL2Yc6BuwMTYcKzaE86cfjwOGuNJuMAwkh3aHOUH+kQ=;
 b=iG/JY7/Ha99STlFFwP+RZgs4d7l4rqFfOPAyc0JAIqPOrsN0/QKbHj9lqDTV7dJ6YeDx40
 oUBMIJP1zNGE3ULnfVkTxbomPyhIUnrke+2w5ivFoN1wQ6klHgkjw/xgbqF4Tf+YgO5y0b
 SVaIVuMyywaYVYPpQES5io7xt8//+Ew=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-fH0I4PVnNwae3crrbN-a3Q-1; Fri, 09 Oct 2020 15:36:57 -0400
X-MC-Unique: fH0I4PVnNwae3crrbN-a3Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1B385703A;
 Fri,  9 Oct 2020 19:36:55 +0000 (UTC)
Received: from localhost (ovpn-112-20.ams2.redhat.com [10.36.112.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B9975C22D;
 Fri,  9 Oct 2020 19:36:55 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 15/30] util/vhost-user-server: check EOF when reading payload
Date: Fri,  9 Oct 2020 20:35:14 +0100
Message-Id: <20201009193529.322822-16-stefanha@redhat.com>
In-Reply-To: <20201009193529.322822-1-stefanha@redhat.com>
References: <20201009193529.322822-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/09 02:34:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VW5leHBlY3RlZCBFT0YgaXMgYW4gZXJyb3IgdGhhdCBtdXN0IGJlIHJlcG9ydGVkLgoKU2lnbmVk
LW9mZi1ieTogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgpNZXNzYWdlLWlk
OiAyMDIwMDkyNDE1MTU0OS45MTM3MzctOS1zdGVmYW5oYUByZWRoYXQuY29tClNpZ25lZC1vZmYt
Ynk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KLS0tCiB1dGlsL3Zob3N0
LXVzZXItc2VydmVyLmMgfCA2ICsrKystLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS91dGlsL3Zob3N0LXVzZXItc2VydmVyLmMg
Yi91dGlsL3Zob3N0LXVzZXItc2VydmVyLmMKaW5kZXggNWE2MGUyY2EyYS4uZWM1NTVhYmNiMiAx
MDA2NDQKLS0tIGEvdXRpbC92aG9zdC11c2VyLXNlcnZlci5jCisrKyBiL3V0aWwvdmhvc3QtdXNl
ci1zZXJ2ZXIuYwpAQCAtMTY5LDggKzE2OSwxMCBAQCB2dV9tZXNzYWdlX3JlYWQoVnVEZXYgKnZ1
X2RldiwgaW50IGNvbm5fZmQsIFZob3N0VXNlck1zZyAqdm1zZykKICAgICB9OwogICAgIGlmICh2
bXNnLT5zaXplKSB7CiAgICAgICAgIHJjID0gcWlvX2NoYW5uZWxfcmVhZHZfYWxsX2VvZihpb2Ms
ICZpb3ZfcGF5bG9hZCwgMSwgJmxvY2FsX2Vycik7Ci0gICAgICAgIGlmIChyYyA9PSAtMSkgewot
ICAgICAgICAgICAgZXJyb3JfcmVwb3J0X2Vycihsb2NhbF9lcnIpOworICAgICAgICBpZiAocmMg
IT0gMSkgeworICAgICAgICAgICAgaWYgKGxvY2FsX2VycikgeworICAgICAgICAgICAgICAgIGVy
cm9yX3JlcG9ydF9lcnIobG9jYWxfZXJyKTsKKyAgICAgICAgICAgIH0KICAgICAgICAgICAgIGdv
dG8gZmFpbDsKICAgICAgICAgfQogICAgIH0KLS0gCjIuMjYuMgoK


