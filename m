Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2418322CCA
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 15:50:32 +0100 (CET)
Received: from localhost ([::1]:55520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEZ1D-0007EX-OM
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 09:50:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEYzQ-0005a1-5o
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 09:48:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEYzM-0002fD-N2
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 09:48:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614091716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NSYjsB/pGxlEpzlJCJ6wq+mHOZNNGLTmoAPEm1ZXduU=;
 b=LBe1O0TyvVAjQlRH3YWPg4jpjZxzdf+Ygb2fJq7tqzeQ4UbGVD8khwb4G3nq+ZQkc0BaOi
 GpMNGNy6bMsgggbiVFqlWQzA0p7TyhkzbDhxM2dBM+igdNCSQQAQ9OpvLKe2NKkdqHJHAP
 QYDNi3kmkjBoX08kTC4YdaO7JwFlt/0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-1M711JoxMPKY_KIU5wS1YA-1; Tue, 23 Feb 2021 09:48:34 -0500
X-MC-Unique: 1M711JoxMPKY_KIU5wS1YA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0269110CE782;
 Tue, 23 Feb 2021 14:48:33 +0000 (UTC)
Received: from localhost (ovpn-114-203.ams2.redhat.com [10.36.114.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B60F45D6AB;
 Tue, 23 Feb 2021 14:48:22 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/12] block/export: fix vhost-user-blk export sector
 number calculation
Date: Tue, 23 Feb 2021 14:46:50 +0000
Message-Id: <20210223144653.811468-10-stefanha@redhat.com>
In-Reply-To: <20210223144653.811468-1-stefanha@redhat.com>
References: <20210223144653.811468-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Coiby Xu <coiby.xu@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlIGRyaXZlciBpcyBzdXBwb3NlZCB0byBob25vciB0aGUgYmxrX3NpemUgZmllbGQgYnV0IHRo
ZSBwcm90b2NvbApzdGlsbCB1c2VzIDUxMi1ieXRlIHNlY3RvciBudW1iZXJzLiBJdCBpcyBpbmNv
cnJlY3QgdG8gbXVsdGlwbHkKcmVxLT5zZWN0b3JfbnVtIGJ5IGJsa19zaXplLgoKVklSVElPIDEu
MSA1LjIuNSBEZXZpY2UgSW5pdGlhbGl6YXRpb24gc2F5czoKCiAgYmxrX3NpemUgY2FuIGJlIHJl
YWQgdG8gZGV0ZXJtaW5lIHRoZSBvcHRpbWFsIHNlY3RvciBzaXplIGZvciB0aGUKICBkcml2ZXIg
dG8gdXNlLiBUaGlzIGRvZXMgbm90IGFmZmVjdCB0aGUgdW5pdHMgdXNlZCBpbiB0aGUgcHJvdG9j
b2wKICAoYWx3YXlzIDUxMiBieXRlcyksIGJ1dCBhd2FyZW5lc3Mgb2YgdGhlIGNvcnJlY3QgdmFs
dWUgY2FuIGFmZmVjdAogIHBlcmZvcm1hbmNlLgoKRml4ZXM6IDM1NzgzODliY2Y3NmM4MjRhNWQ4
MmU2NTg2YTZmMGM3MWU1NmYyYWEgKCJibG9jay9leHBvcnQ6IHZob3N0LXVzZXIgYmxvY2sgZGV2
aWNlIGJhY2tlbmQgc2VydmVyIikKU2lnbmVkLW9mZi1ieTogU3RlZmFuIEhham5vY3ppIDxzdGVm
YW5oYUByZWRoYXQuY29tPgotLS0KIGJsb2NrL2V4cG9ydC92aG9zdC11c2VyLWJsay1zZXJ2ZXIu
YyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL2Jsb2NrL2V4cG9ydC92aG9zdC11c2VyLWJsay1zZXJ2ZXIuYyBiL2Jsb2Nr
L2V4cG9ydC92aG9zdC11c2VyLWJsay1zZXJ2ZXIuYwppbmRleCAyNjE0YTYzNzkxLi5mNzQ3OTYy
NDFjIDEwMDY0NAotLS0gYS9ibG9jay9leHBvcnQvdmhvc3QtdXNlci1ibGstc2VydmVyLmMKKysr
IGIvYmxvY2svZXhwb3J0L3Zob3N0LXVzZXItYmxrLXNlcnZlci5jCkBAIC0xNDQsNyArMTQ0LDcg
QEAgc3RhdGljIHZvaWQgY29yb3V0aW5lX2ZuIHZ1X2Jsa192aXJ0aW9fcHJvY2Vzc19yZXEodm9p
ZCAqb3BhcXVlKQogICAgICAgICAgICAgYnJlYWs7CiAgICAgICAgIH0KIAotICAgICAgICBpbnQ2
NF90IG9mZnNldCA9IHJlcS0+c2VjdG9yX251bSAqIHZleHAtPmJsa19zaXplOworICAgICAgICBp
bnQ2NF90IG9mZnNldCA9IHJlcS0+c2VjdG9yX251bSA8PCBWSVJUSU9fQkxLX1NFQ1RPUl9CSVRT
OwogICAgICAgICBRRU1VSU9WZWN0b3IgcWlvdjsKICAgICAgICAgaWYgKGlzX3dyaXRlKSB7CiAg
ICAgICAgICAgICBxZW11X2lvdmVjX2luaXRfZXh0ZXJuYWwoJnFpb3YsIG91dF9pb3YsIG91dF9u
dW0pOwotLSAKMi4yOS4yCgo=


