Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DB228BFFC
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Oct 2020 20:48:10 +0200 (CEST)
Received: from localhost ([::1]:36018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kS2rh-0008VX-Vi
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 14:48:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kS2ZM-0003yn-Iw
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 14:29:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kS2ZK-0004E8-MZ
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 14:29:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602527350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l8ny9QtzgUGgEYvuG+OIh0U68kHOCSKsdAU9hhp1erY=;
 b=F79Xx1Gq+hdQPkpC0OS4aWU+4gNyNl8Cop92+lhOtQikHdKutjCw4/s8+eqGnONu9dRRLR
 SbzYQdpXLiHv0mZBq3BjUJ3mmyJeA9sDClrMuZNnrOpN3l6mCRHP2KuXV1uXNJ0QeRRTRb
 jBr+NVhPV2Pnw7gG/NGWaBD9kaIv97M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-ZeUff_HwO5OYDTAlz2SV4A-1; Mon, 12 Oct 2020 14:29:08 -0400
X-MC-Unique: ZeUff_HwO5OYDTAlz2SV4A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C98A9879518;
 Mon, 12 Oct 2020 18:29:06 +0000 (UTC)
Received: from localhost (ovpn-115-4.ams2.redhat.com [10.36.115.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 75F595D9CD;
 Mon, 12 Oct 2020 18:29:03 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL v2 17/30] block/export: report flush errors
Date: Mon, 12 Oct 2020 19:27:47 +0100
Message-Id: <20201012182800.157697-18-stefanha@redhat.com>
In-Reply-To: <20201012182800.157697-1-stefanha@redhat.com>
References: <20201012182800.157697-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/11 23:52:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UHJvcGFnYXRlIHRoZSBmbHVzaCByZXR1cm4gdmFsdWUgc2luY2UgZXJyb3JzIGFyZSBwb3NzaWJs
ZS4KClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4K
TWVzc2FnZS1pZDogMjAyMDA5MjQxNTE1NDkuOTEzNzM3LTExLXN0ZWZhbmhhQHJlZGhhdC5jb20K
U2lnbmVkLW9mZi1ieTogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgotLS0K
IGJsb2NrL2V4cG9ydC92aG9zdC11c2VyLWJsay1zZXJ2ZXIuYyB8IDExICsrKysrKystLS0tCiAx
IGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2Jsb2NrL2V4cG9ydC92aG9zdC11c2VyLWJsay1zZXJ2ZXIuYyBiL2Jsb2NrL2V4cG9ydC92
aG9zdC11c2VyLWJsay1zZXJ2ZXIuYwppbmRleCBiNjA5YTNlNGQ2Li40NGQzYzQ1ZmEyIDEwMDY0
NAotLS0gYS9ibG9jay9leHBvcnQvdmhvc3QtdXNlci1ibGstc2VydmVyLmMKKysrIGIvYmxvY2sv
ZXhwb3J0L3Zob3N0LXVzZXItYmxrLXNlcnZlci5jCkBAIC03OCwxMSArNzgsMTEgQEAgdnVfYmxv
Y2tfZGlzY2FyZF93cml0ZV96ZXJvZXMoVnVCbG9ja1JlcSAqcmVxLCBzdHJ1Y3QgaW92ZWMgKmlv
diwKICAgICByZXR1cm4gLUVJTlZBTDsKIH0KIAotc3RhdGljIHZvaWQgY29yb3V0aW5lX2ZuIHZ1
X2Jsb2NrX2ZsdXNoKFZ1QmxvY2tSZXEgKnJlcSkKK3N0YXRpYyBpbnQgY29yb3V0aW5lX2ZuIHZ1
X2Jsb2NrX2ZsdXNoKFZ1QmxvY2tSZXEgKnJlcSkKIHsKICAgICBWdUJsb2NrRGV2ICp2ZGV2X2Js
ayA9IGdldF92dV9ibG9ja19kZXZpY2VfYnlfc2VydmVyKHJlcS0+c2VydmVyKTsKICAgICBCbG9j
a0JhY2tlbmQgKmJhY2tlbmQgPSB2ZGV2X2Jsay0+YmFja2VuZDsKLSAgICBibGtfY29fZmx1c2go
YmFja2VuZCk7CisgICAgcmV0dXJuIGJsa19jb19mbHVzaChiYWNrZW5kKTsKIH0KIAogc3RhdGlj
IHZvaWQgY29yb3V0aW5lX2ZuIHZ1X2Jsb2NrX3ZpcnRpb19wcm9jZXNzX3JlcSh2b2lkICpvcGFx
dWUpCkBAIC0xNTIsOCArMTUyLDExIEBAIHN0YXRpYyB2b2lkIGNvcm91dGluZV9mbiB2dV9ibG9j
a192aXJ0aW9fcHJvY2Vzc19yZXEodm9pZCAqb3BhcXVlKQogICAgICAgICBicmVhazsKICAgICB9
CiAgICAgY2FzZSBWSVJUSU9fQkxLX1RfRkxVU0g6Ci0gICAgICAgIHZ1X2Jsb2NrX2ZsdXNoKHJl
cSk7Ci0gICAgICAgIHJlcS0+aW4tPnN0YXR1cyA9IFZJUlRJT19CTEtfU19PSzsKKyAgICAgICAg
aWYgKHZ1X2Jsb2NrX2ZsdXNoKHJlcSkgPT0gMCkgeworICAgICAgICAgICAgcmVxLT5pbi0+c3Rh
dHVzID0gVklSVElPX0JMS19TX09LOworICAgICAgICB9IGVsc2UgeworICAgICAgICAgICAgcmVx
LT5pbi0+c3RhdHVzID0gVklSVElPX0JMS19TX0lPRVJSOworICAgICAgICB9CiAgICAgICAgIGJy
ZWFrOwogICAgIGNhc2UgVklSVElPX0JMS19UX0dFVF9JRDogewogICAgICAgICBzaXplX3Qgc2l6
ZSA9IE1JTihpb3Zfc2l6ZSgmZWxlbS0+aW5fc2dbMF0sIGluX251bSksCi0tIAoyLjI2LjIKCg==


