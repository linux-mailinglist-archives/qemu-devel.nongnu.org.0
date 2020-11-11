Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2B82AF13F
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 13:51:21 +0100 (CET)
Received: from localhost ([::1]:57916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcpaq-0007BC-NN
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 07:51:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kcpV1-00008K-6m
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 07:45:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kcpUz-0001U4-Gt
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 07:45:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605098716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vwXeLUznTOiYPMPcYakmBy5x42g5DBzBMpq8XXGDF/8=;
 b=ECVjAEtdt0ig41gnCd50lPkRycvlyoNcMUfZhhFzT2nFFKkSIII4PyKeZVMOnHsneyNk/y
 gbUOZUFW9k5MH6x8QalgorrcltA2Layr6PTBYRTdJVIJ/QOsI5+PDqSdrKah3tJl8QSpMO
 6Q3W/8yl9g8QmOMI9IWZDp7lNx1tvT8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-i5aUXRxxP_W7prkxr19cAw-1; Wed, 11 Nov 2020 07:45:13 -0500
X-MC-Unique: i5aUXRxxP_W7prkxr19cAw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D34B31017DCA;
 Wed, 11 Nov 2020 12:45:11 +0000 (UTC)
Received: from localhost (ovpn-112-222.ams2.redhat.com [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E01F85C62B;
 Wed, 11 Nov 2020 12:44:58 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-5.2 10/10] block/export: port virtio-blk read/write range
 check
Date: Wed, 11 Nov 2020 12:43:31 +0000
Message-Id: <20201111124331.1393747-11-stefanha@redhat.com>
In-Reply-To: <20201111124331.1393747-1-stefanha@redhat.com>
References: <20201111124331.1393747-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:49:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Q2hlY2sgdGhhdCB0aGUgc2VjdG9yIG51bWJlciBhbmQgYnl0ZSBjb3VudCBhcmUgdmFsaWQuCgpT
aWduZWQtb2ZmLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+Ci0tLQog
YmxvY2svZXhwb3J0L3Zob3N0LXVzZXItYmxrLXNlcnZlci5jIHwgMTQgKysrKysrKysrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYmxvY2svZXhw
b3J0L3Zob3N0LXVzZXItYmxrLXNlcnZlci5jIGIvYmxvY2svZXhwb3J0L3Zob3N0LXVzZXItYmxr
LXNlcnZlci5jCmluZGV4IGQ4OGU0MTcxNGQuLjZkN2ZkMGZlYzMgMTAwNjQ0Ci0tLSBhL2Jsb2Nr
L2V4cG9ydC92aG9zdC11c2VyLWJsay1zZXJ2ZXIuYworKysgYi9ibG9jay9leHBvcnQvdmhvc3Qt
dXNlci1ibGstc2VydmVyLmMKQEAgLTIxNCw5ICsyMTQsMjMgQEAgc3RhdGljIHZvaWQgY29yb3V0
aW5lX2ZuIHZ1X2Jsa192aXJ0aW9fcHJvY2Vzc19yZXEodm9pZCAqb3BhcXVlKQogICAgICAgICBR
RU1VSU9WZWN0b3IgcWlvdjsKICAgICAgICAgaWYgKGlzX3dyaXRlKSB7CiAgICAgICAgICAgICBx
ZW11X2lvdmVjX2luaXRfZXh0ZXJuYWwoJnFpb3YsIG91dF9pb3YsIG91dF9udW0pOworCisgICAg
ICAgICAgICBpZiAodW5saWtlbHkoIXZ1X2Jsa19zZWN0X3JhbmdlX29rKHZleHAsIHJlcS0+c2Vj
dG9yX251bSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cWlvdi5zaXplKSkpIHsKKyAgICAgICAgICAgICAgICByZXEtPmluLT5zdGF0dXMgPSBWSVJUSU9f
QkxLX1NfSU9FUlI7CisgICAgICAgICAgICAgICAgYnJlYWs7CisgICAgICAgICAgICB9CisKICAg
ICAgICAgICAgIHJldCA9IGJsa19jb19wd3JpdGV2KGJsaywgb2Zmc2V0LCBxaW92LnNpemUsICZx
aW92LCAwKTsKICAgICAgICAgfSBlbHNlIHsKICAgICAgICAgICAgIHFlbXVfaW92ZWNfaW5pdF9l
eHRlcm5hbCgmcWlvdiwgaW5faW92LCBpbl9udW0pOworCisgICAgICAgICAgICBpZiAodW5saWtl
bHkoIXZ1X2Jsa19zZWN0X3JhbmdlX29rKHZleHAsIHJlcS0+c2VjdG9yX251bSwKKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcWlvdi5zaXplKSkpIHsKKyAg
ICAgICAgICAgICAgICByZXEtPmluLT5zdGF0dXMgPSBWSVJUSU9fQkxLX1NfSU9FUlI7CisgICAg
ICAgICAgICAgICAgYnJlYWs7CisgICAgICAgICAgICB9CisKICAgICAgICAgICAgIHJldCA9IGJs
a19jb19wcmVhZHYoYmxrLCBvZmZzZXQsIHFpb3Yuc2l6ZSwgJnFpb3YsIDApOwogICAgICAgICB9
CiAgICAgICAgIGlmIChyZXQgPj0gMCkgewotLSAKMi4yOC4wCgo=


