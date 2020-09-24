Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 883A027758A
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Sep 2020 17:36:37 +0200 (CEST)
Received: from localhost ([::1]:48620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLTIS-0005RM-9C
	for lists+qemu-devel@lfdr.de; Thu, 24 Sep 2020 11:36:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kLSyw-0006G2-0V
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 11:16:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kLSyt-0003vj-Hc
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 11:16:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600960582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fppLXmQv9qPvl0QxtXe3MG+Wd3tEhVkjsRPWoeaRRSE=;
 b=f8HlPPpKCUaRuvuwOrHVur6mO1I8qVysmisojBVQd8Nd+E5dYzTG0HxnBN7rUsJPu2arsW
 7P1RNRsshwZsDyEEuhKqV+I8F69Xd7zU/Vt8sWYUYwE+0O58u2EefqWAe6/0VsMqgx9i8q
 VDFth+4/KII1q5TALHJNsN1eaWVvEKg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-PkSHbGnROLCQMTj8lOiisg-1; Thu, 24 Sep 2020 11:16:20 -0400
X-MC-Unique: PkSHbGnROLCQMTj8lOiisg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B094064146;
 Thu, 24 Sep 2020 15:16:19 +0000 (UTC)
Received: from localhost (ovpn-114-5.ams2.redhat.com [10.36.114.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D5A460CCC;
 Thu, 24 Sep 2020 15:16:16 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/13] util/vhost-user-server: check EOF when reading
 payload
Date: Thu, 24 Sep 2020 16:15:44 +0100
Message-Id: <20200924151549.913737-9-stefanha@redhat.com>
In-Reply-To: <20200924151549.913737-1-stefanha@redhat.com>
References: <20200924151549.913737-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/24 01:10:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.199,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Coiby Xu <coiby.xu@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VW5leHBlY3RlZCBFT0YgaXMgYW4gZXJyb3IgdGhhdCBtdXN0IGJlIHJlcG9ydGVkLgoKU2lnbmVk
LW9mZi1ieTogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgotLS0KIHV0aWwv
dmhvc3QtdXNlci1zZXJ2ZXIuYyB8IDYgKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3V0aWwvdmhvc3QtdXNlci1zZXJ2
ZXIuYyBiL3V0aWwvdmhvc3QtdXNlci1zZXJ2ZXIuYwppbmRleCA1YTYwZTJjYTJhLi5lYzU1NWFi
Y2IyIDEwMDY0NAotLS0gYS91dGlsL3Zob3N0LXVzZXItc2VydmVyLmMKKysrIGIvdXRpbC92aG9z
dC11c2VyLXNlcnZlci5jCkBAIC0xNjksOCArMTY5LDEwIEBAIHZ1X21lc3NhZ2VfcmVhZChWdURl
diAqdnVfZGV2LCBpbnQgY29ubl9mZCwgVmhvc3RVc2VyTXNnICp2bXNnKQogICAgIH07CiAgICAg
aWYgKHZtc2ctPnNpemUpIHsKICAgICAgICAgcmMgPSBxaW9fY2hhbm5lbF9yZWFkdl9hbGxfZW9m
KGlvYywgJmlvdl9wYXlsb2FkLCAxLCAmbG9jYWxfZXJyKTsKLSAgICAgICAgaWYgKHJjID09IC0x
KSB7Ci0gICAgICAgICAgICBlcnJvcl9yZXBvcnRfZXJyKGxvY2FsX2Vycik7CisgICAgICAgIGlm
IChyYyAhPSAxKSB7CisgICAgICAgICAgICBpZiAobG9jYWxfZXJyKSB7CisgICAgICAgICAgICAg
ICAgZXJyb3JfcmVwb3J0X2Vycihsb2NhbF9lcnIpOworICAgICAgICAgICAgfQogICAgICAgICAg
ICAgZ290byBmYWlsOwogICAgICAgICB9CiAgICAgfQotLSAKMi4yNi4yCgo=


