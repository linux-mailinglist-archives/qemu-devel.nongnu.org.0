Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0D630AC12
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 16:55:55 +0100 (CET)
Received: from localhost ([::1]:32868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6bYQ-00081r-Hx
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 10:55:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l6bSJ-0000gX-GO
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:49:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l6bSG-0007jh-Qy
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:49:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612194572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i8xowd5alt2PfqYt1DWcrDTG7LsgZ+d+cXQyu+4+Rgo=;
 b=VXJGzGXMVq838K9mYzw1BHKnhyhljjh7QYDly//9e5GEJAhHphsMBLgJzGUJSiOBYdRUc9
 fZM05cDqyJrn/IKXgGmSmgyHSWMQmVptqEu6d85fP3Eh4SrMLIRM5WRa42VOmndW0YwEZ6
 lTqy3IGxYItvidhMtOOwPy7WbOlckd4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-4Y-7mmqFO9OTeplZaxNd5A-1; Mon, 01 Feb 2021 10:49:29 -0500
X-MC-Unique: 4Y-7mmqFO9OTeplZaxNd5A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B62DD8FB84C;
 Mon,  1 Feb 2021 15:47:57 +0000 (UTC)
Received: from localhost (ovpn-115-140.ams2.redhat.com [10.36.115.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6CA4D84175;
 Mon,  1 Feb 2021 15:47:56 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/11] tracetool: fix "PRI" macro decoding
Date: Mon,  1 Feb 2021 15:46:56 +0000
Message-Id: <20210201154703.180022-5-stefanha@redhat.com>
In-Reply-To: <20210201154703.180022-1-stefanha@redhat.com>
References: <20210201154703.180022-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogTGF1cmVudCBWaXZpZXIgPGx2aXZpZXJAcmVkaGF0LmNvbT4KCm1hY3JvIGlzIG5vdCBy
ZXNldCBhZnRlciB1c2UsIHNvIHRoZSBmb3JtYXQgZGVjb2RlZCBpcyBhbHdheXMgdGhlCm9uZSBv
ZiB0aGUgZmlyc3QgIlBSSSIgaW4gdGhlIGZvcm1hdCBzdHJpbmcuCgpGb3IgaW5zdGFuY2U6Cgog
IHZob3N0X3ZkcGFfc2V0X2NvbmZpZyh2b2lkICpkZXYsIHVpbnQzMl90IG9mZnNldCwgdWludDMy
X3Qgc2l6ZSwgXAogICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCBmbGFncykgImRldjog
JXAgb2Zmc2V0OiAlIlBSSXUzMiIgXAogICAgICAgICAgICAgICAgICAgICAgICBzaXplOiAlIlBS
SXUzMiIgZmxhZ3M6IDB4JSJQUkl4MzIKCmdlbmVyYXRlczoKCiAgcHJpbnRmKCIlZEAlZCB2aG9z
dF92ZHBhX3NldF9jb25maWcgZGV2OiAlcCBvZmZzZXQ6ICV1IHNpemU6ICV1IFwKICAgICAgICAg
IGZsYWdzOiAweCV1XG4iLCBwaWQoKSwgZ2V0dGltZW9mZGF5X25zKCksIGRldiwgb2Zmc2V0LCBc
CiAgICAgICAgICBzaXplLCBmbGFncykKCmZvciB0aGUgImZsYWdzIiBwYXJhbWV0ZXIsIHdlIGNh
biBzZWUgYSAiMHgldSIgcmF0aGVyIHRoYW4gYSAiMHgleCIKYmVjYXVzZSB0aGUgZmlyc3QgbWFj
cm8gd2FzICJQUkl1MzIiIChmb3Igb2Zmc2V0KS4KCkluIHRoZSBsb29wLCBtYWNybyBiZWNvbWVz
ICJQUkl1MzJQUkl1MzJQUkl4MzIiLCBhbmQgY19tYWNyb190b19mb3JtYXQoKQpyZXR1cm5zIGFs
d2F5cyBtYWNyb1szXSAoJ3UnIGluIHRoaXMgY2FzZSkuIFRoaXMgcGF0Y2ggcmVzZXRzIG1hY3Jv
IGFmdGVyCnRoZSBmb3JtYXQgaGFzIGJlZW4gZGVjb2RlZC4KClNpZ25lZC1vZmYtYnk6IExhdXJl
bnQgVml2aWVyIDxsdml2aWVyQHJlZGhhdC5jb20+ClJldmlld2VkLWJ5OiBQaGlsaXBwZSBNYXRo
aWV1LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5jb20+ClJldmlld2VkLWJ5OiBEYW5pZWwgUC4gQmVy
cmFuZ8OpIDxiZXJyYW5nZUByZWRoYXQuY29tPgpNZXNzYWdlLWlkOiAyMDIxMDEwNTE5MTcyMS4x
MjA0NjMtMy1sdml2aWVyQHJlZGhhdC5jb20KU2lnbmVkLW9mZi1ieTogU3RlZmFuIEhham5vY3pp
IDxzdGVmYW5oYUByZWRoYXQuY29tPgotLS0KIHNjcmlwdHMvdHJhY2V0b29sL2Zvcm1hdC9sb2df
c3RhcC5weSB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0
IGEvc2NyaXB0cy90cmFjZXRvb2wvZm9ybWF0L2xvZ19zdGFwLnB5IGIvc2NyaXB0cy90cmFjZXRv
b2wvZm9ybWF0L2xvZ19zdGFwLnB5CmluZGV4IGI0ODZiZWI2NzIuLjNlMTE4NmFlOWMgMTAwNjQ0
Ci0tLSBhL3NjcmlwdHMvdHJhY2V0b29sL2Zvcm1hdC9sb2dfc3RhcC5weQorKysgYi9zY3JpcHRz
L3RyYWNldG9vbC9mb3JtYXQvbG9nX3N0YXAucHkKQEAgLTU0LDYgKzU0LDcgQEAgZGVmIGNfZm10
X3RvX3N0YXAoZm10KToKICAgICAgICAgICAgIGVsc2U6CiAgICAgICAgICAgICAgICAgaWYgc3Rh
dGUgPT0gU1RBVEVfTUFDUk86CiAgICAgICAgICAgICAgICAgICAgIGJpdHMuYXBwZW5kKGNfbWFj
cm9fdG9fZm9ybWF0KG1hY3JvKSkKKyAgICAgICAgICAgICAgICAgICAgbWFjcm8gPSAiIgogICAg
ICAgICAgICAgICAgIHN0YXRlID0gU1RBVEVfTElURVJBTAogICAgICAgICBlbGlmIGZtdFtpXSA9
PSAnICcgb3IgZm10W2ldID09ICdcdCc6CiAgICAgICAgICAgICBpZiBzdGF0ZSA9PSBTVEFURV9N
QUNSTzoKLS0gCjIuMjkuMgoK


