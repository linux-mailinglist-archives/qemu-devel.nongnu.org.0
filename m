Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C835F2801A2
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Oct 2020 16:49:42 +0200 (CEST)
Received: from localhost ([::1]:58632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNztt-0005kQ-R0
	for lists+qemu-devel@lfdr.de; Thu, 01 Oct 2020 10:49:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kNzqf-0003cr-CS
 for qemu-devel@nongnu.org; Thu, 01 Oct 2020 10:46:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kNzqb-0002nm-Lu
 for qemu-devel@nongnu.org; Thu, 01 Oct 2020 10:46:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601563576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zf46ssp/FeEQ9/F3Aur3LyIoeIDtfpU++V5tl1ieOCU=;
 b=Prpt26FLhhEJuRSBqEo3LJ3meipJSnDJ0GsNDg1bTN0cHQwLn+LXKQ/UdNUQdi6PnJlzOt
 VH6ca81J76qY40hRDzh5DRRlndPRYe75NULj/ExRGuAppf6IS8FNu0nBTZ7S5blxq6ee70
 4YVYZJVa3zV7tO1Pz4CJ9Ku4WCS3hcs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-IErnMtZJM5SgND7LjmgT1w-1; Thu, 01 Oct 2020 10:46:14 -0400
X-MC-Unique: IErnMtZJM5SgND7LjmgT1w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7E4E195D590;
 Thu,  1 Oct 2020 14:46:05 +0000 (UTC)
Received: from localhost (ovpn-115-144.ams2.redhat.com [10.36.115.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C0C97367C;
 Thu,  1 Oct 2020 14:46:05 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] block/export: add vhost-user-blk multi-queue support
Date: Thu,  1 Oct 2020 15:46:02 +0100
Message-Id: <20201001144604.559733-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/01 02:15:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Markus Armbruster <armbru@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlIHZob3N0LXVzZXItYmxrIHNlcnZlciBjdXJyZW50bHkgb25seSBzdXBwb3J0cyAxIHZpcnRx
dWV1ZS4gQWRkIGENCidudW0tcXVldWVzJyBvcHRpb24gZm9yIG11bHRpLXF1ZXVlLiBCb3RoIC0t
ZGV2aWNlDQp2aG9zdC11c2VyLWJsay1wY2ksbnVtLXF1ZXVlcz0gYW5kIC0tZXhwb3J0IHZob3N0
LXVzZXItYmxrLG51bS1xdWV1ZXM9IG5lZWQgdG8NCmJlIHNldCBpbiBvcmRlciBmb3IgbXVsdGkt
cXVldWUgdG8gd29yayAob3RoZXJ3aXNlIGl0IHdpbGwgZmFsbCBiYWNrIHRvIDENCnZpcnRxdWV1
ZSkuDQoNCkJhc2VkLW9uOiAyMDIwMDkyNDE1MTU0OS45MTM3MzctMS1zdGVmYW5oYUByZWRoYXQu
Y29tICgiW1BBVENIIHYyIDAwLzEzXSBibG9jay9leHBvcnQ6IGNvbnZlcnQgdmhvc3QtdXNlci1i
bGstc2VydmVyIHRvIGJsb2NrIGV4cG9ydHMgQVBJIikNCg0KU3RlZmFuIEhham5vY3ppICgyKToN
CiAgYmxvY2svZXhwb3J0OiBhZGQgdmhvc3QtdXNlci1ibGsgbXVsdGktcXVldWUgc3VwcG9ydA0K
ICB0ZXN0cy9xdGVzdDogYWRkIG11bHRpLXF1ZXVlIHRlc3QgY2FzZSB0byB2aG9zdC11c2VyLWJs
ay10ZXN0DQoNCiBxYXBpL2Jsb2NrLWV4cG9ydC5qc29uICAgICAgICAgICAgICAgfCAgNiArKy0N
CiBibG9jay9leHBvcnQvdmhvc3QtdXNlci1ibGstc2VydmVyLmMgfCAyNCArKysrKystLS0NCiB0
ZXN0cy9xdGVzdC92aG9zdC11c2VyLWJsay10ZXN0LmMgICAgfCA4MSArKysrKysrKysrKysrKysr
KysrKysrKysrKy0tDQogMyBmaWxlcyBjaGFuZ2VkLCA5OSBpbnNlcnRpb25zKCspLCAxMiBkZWxl
dGlvbnMoLSkNCg0KLS0gDQoyLjI2LjINCg0K


