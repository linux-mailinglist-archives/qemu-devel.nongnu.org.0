Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2B22D1785
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 18:28:40 +0100 (CET)
Received: from localhost ([::1]:33590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmKJT-0002lt-IC
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 12:28:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kmKFf-0000O5-5e
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 12:24:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kmKFd-0006uE-CU
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 12:24:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607361880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=brdJqXUv8yd/aZvFP8DTs5hYQMZjkSacTtDHmtnq2AY=;
 b=ExC4FTnPOqxeHWA8T+zRoVX4WpRlqv6YDm57Ci+QjLW+uxVM2Grj+dMEFzYt5ktzrlrH3a
 b2t9FIeAfX5W/2TdgOD/4Hbu+eewMnJEI5x5Hd+iaazux40iylHNvNSlnS2epwyHZT5aJP
 aSQ/g/RID447KMwMnvz878fl7EuHYg0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-5rMxIoFqP56QTNKTkfNb5Q-1; Mon, 07 Dec 2020 12:24:37 -0500
X-MC-Unique: 5rMxIoFqP56QTNKTkfNb5Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C62F8107ACE6;
 Mon,  7 Dec 2020 17:24:35 +0000 (UTC)
Received: from localhost (ovpn-114-128.ams2.redhat.com [10.36.114.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4790760BE2;
 Mon,  7 Dec 2020 17:24:29 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/12] block/export: port virtio-blk read/write range check
Date: Mon,  7 Dec 2020 17:20:30 +0000
Message-Id: <20201207172030.251905-13-stefanha@redhat.com>
In-Reply-To: <20201207172030.251905-1-stefanha@redhat.com>
References: <20201207172030.251905-1-stefanha@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Q2hlY2sgdGhhdCB0aGUgc2VjdG9yIG51bWJlciBhbmQgYnl0ZSBjb3VudCBhcmUgdmFsaWQuCgpT
aWduZWQtb2ZmLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+Ci0tLQog
YmxvY2svZXhwb3J0L3Zob3N0LXVzZXItYmxrLXNlcnZlci5jIHwgMTkgKysrKysrKysrKysrKysr
Ky0tLQogMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvYmxvY2svZXhwb3J0L3Zob3N0LXVzZXItYmxrLXNlcnZlci5jIGIvYmxvY2sv
ZXhwb3J0L3Zob3N0LXVzZXItYmxrLXNlcnZlci5jCmluZGV4IDkzN2JiNWU5YjQuLmRiZTNjZmI5
ZTggMTAwNjQ0Ci0tLSBhL2Jsb2NrL2V4cG9ydC92aG9zdC11c2VyLWJsay1zZXJ2ZXIuYworKysg
Yi9ibG9jay9leHBvcnQvdmhvc3QtdXNlci1ibGstc2VydmVyLmMKQEAgLTIwOSw2ICsyMDksOCBA
QCBzdGF0aWMgdm9pZCBjb3JvdXRpbmVfZm4gdnVfYmxrX3ZpcnRpb19wcm9jZXNzX3JlcSh2b2lk
ICpvcGFxdWUpCiAgICAgc3dpdGNoICh0eXBlICYgflZJUlRJT19CTEtfVF9CQVJSSUVSKSB7CiAg
ICAgY2FzZSBWSVJUSU9fQkxLX1RfSU46CiAgICAgY2FzZSBWSVJUSU9fQkxLX1RfT1VUOiB7Cisg
ICAgICAgIFFFTVVJT1ZlY3RvciBxaW92OworICAgICAgICBpbnQ2NF90IG9mZnNldDsKICAgICAg
ICAgc3NpemVfdCByZXQgPSAwOwogICAgICAgICBib29sIGlzX3dyaXRlID0gdHlwZSAmIFZJUlRJ
T19CTEtfVF9PVVQ7CiAgICAgICAgIHJlcS0+c2VjdG9yX251bSA9IGxlNjRfdG9fY3B1KHJlcS0+
b3V0LnNlY3Rvcik7CkBAIC0yMTgsMTMgKzIyMCwyNCBAQCBzdGF0aWMgdm9pZCBjb3JvdXRpbmVf
Zm4gdnVfYmxrX3ZpcnRpb19wcm9jZXNzX3JlcSh2b2lkICpvcGFxdWUpCiAgICAgICAgICAgICBi
cmVhazsKICAgICAgICAgfQogCi0gICAgICAgIGludDY0X3Qgb2Zmc2V0ID0gcmVxLT5zZWN0b3Jf
bnVtIDw8IFZJUlRJT19CTEtfU0VDVE9SX0JJVFM7Ci0gICAgICAgIFFFTVVJT1ZlY3RvciBxaW92
OwogICAgICAgICBpZiAoaXNfd3JpdGUpIHsKICAgICAgICAgICAgIHFlbXVfaW92ZWNfaW5pdF9l
eHRlcm5hbCgmcWlvdiwgb3V0X2lvdiwgb3V0X251bSk7Ci0gICAgICAgICAgICByZXQgPSBibGtf
Y29fcHdyaXRldihibGssIG9mZnNldCwgcWlvdi5zaXplLCAmcWlvdiwgMCk7CiAgICAgICAgIH0g
ZWxzZSB7CiAgICAgICAgICAgICBxZW11X2lvdmVjX2luaXRfZXh0ZXJuYWwoJnFpb3YsIGluX2lv
diwgaW5fbnVtKTsKKyAgICAgICAgfQorCisgICAgICAgIGlmICh1bmxpa2VseSghdnVfYmxrX3Nl
Y3RfcmFuZ2Vfb2sodmV4cCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICByZXEtPnNlY3Rvcl9udW0sCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcWlvdi5zaXplKSkpIHsKKyAgICAgICAgICAgIHJlcS0+aW4tPnN0YXR1cyA9IFZJ
UlRJT19CTEtfU19JT0VSUjsKKyAgICAgICAgICAgIGJyZWFrOworICAgICAgICB9CisKKyAgICAg
ICAgb2Zmc2V0ID0gcmVxLT5zZWN0b3JfbnVtIDw8IFZJUlRJT19CTEtfU0VDVE9SX0JJVFM7CisK
KyAgICAgICAgaWYgKGlzX3dyaXRlKSB7CisgICAgICAgICAgICByZXQgPSBibGtfY29fcHdyaXRl
dihibGssIG9mZnNldCwgcWlvdi5zaXplLCAmcWlvdiwgMCk7CisgICAgICAgIH0gZWxzZSB7CiAg
ICAgICAgICAgICByZXQgPSBibGtfY29fcHJlYWR2KGJsaywgb2Zmc2V0LCBxaW92LnNpemUsICZx
aW92LCAwKTsKICAgICAgICAgfQogICAgICAgICBpZiAocmV0ID49IDApIHsKLS0gCjIuMjguMAoK


