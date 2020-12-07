Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C472D17D5
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 18:49:18 +0100 (CET)
Received: from localhost ([::1]:40226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmKdQ-0001i1-Q2
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 12:49:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kmKGu-0001jM-3h
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 12:26:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kmKGs-0007DT-2j
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 12:25:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607361954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0K1Qk4N5GEI2GUSLErwiF7yUlHllkygwjXmYMoY0FZE=;
 b=Gx7cvFEXenzYCAdPgYR5jUEaJ2C4I37/I+f9ki2GVIZHoz7dvbn6LLirjuU6ocEuM7JbOc
 tGTRP2vpAxse4gw3buTOSDAuJ31RwhZsQRMQUhjTqLNm7rm77p6yvhopQssy2lQE00a139
 G2w13T/dPpqi+ypOKnc6bursBxeqSiM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-vAvtMyyHNz-KbE8AXQc7_w-1; Mon, 07 Dec 2020 12:25:51 -0500
X-MC-Unique: vAvtMyyHNz-KbE8AXQc7_w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26EB8100C610;
 Mon,  7 Dec 2020 17:25:50 +0000 (UTC)
Received: from localhost (ovpn-114-128.ams2.redhat.com [10.36.114.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A6B8E2BCDA;
 Mon,  7 Dec 2020 17:25:42 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/12] block/export: fix vhost-user-blk export sector
 number calculation
Date: Mon,  7 Dec 2020 17:20:27 +0000
Message-Id: <20201207172030.251905-10-stefanha@redhat.com>
In-Reply-To: <20201207172030.251905-1-stefanha@redhat.com>
References: <20201207172030.251905-1-stefanha@redhat.com>
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
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
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
L2V4cG9ydC92aG9zdC11c2VyLWJsay1zZXJ2ZXIuYwppbmRleCBmZWIxMzllMDY3Li5iYjA3ZjQ5
OWM4IDEwMDY0NAotLS0gYS9ibG9jay9leHBvcnQvdmhvc3QtdXNlci1ibGstc2VydmVyLmMKKysr
IGIvYmxvY2svZXhwb3J0L3Zob3N0LXVzZXItYmxrLXNlcnZlci5jCkBAIC0xNDQsNyArMTQ0LDcg
QEAgc3RhdGljIHZvaWQgY29yb3V0aW5lX2ZuIHZ1X2Jsa192aXJ0aW9fcHJvY2Vzc19yZXEodm9p
ZCAqb3BhcXVlKQogICAgICAgICAgICAgYnJlYWs7CiAgICAgICAgIH0KIAotICAgICAgICBpbnQ2
NF90IG9mZnNldCA9IHJlcS0+c2VjdG9yX251bSAqIHZleHAtPmJsa19zaXplOworICAgICAgICBp
bnQ2NF90IG9mZnNldCA9IHJlcS0+c2VjdG9yX251bSA8PCBWSVJUSU9fQkxLX1NFQ1RPUl9CSVRT
OwogICAgICAgICBRRU1VSU9WZWN0b3IgcWlvdjsKICAgICAgICAgaWYgKGlzX3dyaXRlKSB7CiAg
ICAgICAgICAgICBxZW11X2lvdmVjX2luaXRfZXh0ZXJuYWwoJnFpb3YsIG91dF9pb3YsIG91dF9u
dW0pOwotLSAKMi4yOC4wCgo=


