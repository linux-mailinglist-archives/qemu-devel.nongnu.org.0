Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0CE30AC22
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 16:58:21 +0100 (CET)
Received: from localhost ([::1]:39504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6bam-0002aw-Ka
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 10:58:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l6bT3-0001jZ-Gw
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:50:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l6bSw-00084W-NK
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:50:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612194614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NQHaTCkQDP+xwXqg+nL4mOQ4xIvI8bOte7o/g+t1dxI=;
 b=NGbXb654KKNDw3p870cnBUkPYqGuaHvmaiihtF6D+GioT9eeG/KZbYJf6WjhSrf0Vq+rqV
 czVFMW770YOMBQdde7HTtQESr9dVdCDoqliZrlqWwVaVnXgRbrCJfRjqVJzVDR+fKS+eYR
 aoMgdxW4hW3ZDvfZlV5adxrf1g/I8hs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-ydaCpOqeMsaVxr2p-NYmCA-1; Mon, 01 Feb 2021 10:50:10 -0500
X-MC-Unique: ydaCpOqeMsaVxr2p-NYmCA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D000116282C;
 Mon,  1 Feb 2021 15:47:58 +0000 (UTC)
Received: from localhost (ovpn-115-140.ams2.redhat.com [10.36.115.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 413045C1A1;
 Mon,  1 Feb 2021 15:47:58 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/11] tracetool: also strip %l and %ll from systemtap format
 strings
Date: Mon,  1 Feb 2021 15:46:57 +0000
Message-Id: <20210201154703.180022-6-stefanha@redhat.com>
In-Reply-To: <20210201154703.180022-1-stefanha@redhat.com>
References: <20210201154703.180022-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogRGFuaWVsIFAuIEJlcnJhbmfDqSA8YmVycmFuZ2VAcmVkaGF0LmNvbT4KCkFsbCB2YXJp
YWJsZXMgYXJlIDY0LWJpdCBhbmQgc28gJWwgLyAlbGwgYXJlIG5vdCByZXF1aXJlZCwgYW5kIHRo
ZQpsYXR0ZXIgaXMgYWN0dWFsbHkgaW52YWxpZDoKCiAgJCBzdWRvIHN0YXAgLWUgJ3Byb2JlIGJl
Z2lue3ByaW50ZiAoIkJFR0lOIil9JyAgLUkgLgogIHBhcnNlIGVycm9yOiBpbnZhbGlkIG9yIG1p
c3NpbmcgY29udmVyc2lvbiBzcGVjaWZpZXIKICAgICAgICAgIHNhdzogb3BlcmF0b3IgJywnIGF0
IC4vcWVtdS1zeXN0ZW0teDg2XzY0LWxvZy5zdHA6MTUxMTg6MTAxCiAgICAgICBzb3VyY2U6ICAg
ICBwcmludGYoIiVkQCVkIHZob3N0X3ZkcGFfc2V0X2xvZ19iYXNlIGRldjogJXAgYmFzZTogMHgl
eCBzaXplOiAlbGx1CnJlZmNudDogJWQgZmQ6ICVkIGxvZzogJXBcbiIsIHBpZCgpLCBnZXR0aW1l
b2ZkYXlfbnMoKSwgZGV2LCBiYXNlLCBzaXplLCByZWZjbnQsIGZkLCBsb2cpCgogICAgICAgICAg
ICAgICAgICAgICAgIF4KClNpZ25lZC1vZmYtYnk6IERhbmllbCBQLiBCZXJyYW5nw6kgPGJlcnJh
bmdlQHJlZGhhdC5jb20+ClJldmlld2VkLWJ5OiBMYXVyZW50IFZpdmllciA8bHZpdmllckByZWRo
YXQuY29tPgpSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRo
YXQuY29tPgpUZXN0ZWQtYnk6IExhdXJlbnQgVml2aWVyIDxsdml2aWVyQHJlZGhhdC5jb20+Ck1l
c3NhZ2UtaWQ6IDIwMjEwMTA2MTMwMjM5LjEwMDQ3MjktMS1iZXJyYW5nZUByZWRoYXQuY29tCgpb
Rml4ZWQgInNpbWlhcmx5IiB0eXBvIGZvdW5kIGJ5IExhdXJlbnQgVml2aWVyIDxsdml2aWVyQHJl
ZGhhdC5jb20+Ci0tU3RlZmFuXQoKU2lnbmVkLW9mZi1ieTogU3RlZmFuIEhham5vY3ppIDxzdGVm
YW5oYUByZWRoYXQuY29tPgotLS0KIHNjcmlwdHMvdHJhY2V0b29sL2Zvcm1hdC9sb2dfc3RhcC5w
eSB8IDcgKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL3NjcmlwdHMvdHJhY2V0b29sL2Zvcm1hdC9sb2dfc3RhcC5weSBi
L3NjcmlwdHMvdHJhY2V0b29sL2Zvcm1hdC9sb2dfc3RhcC5weQppbmRleCAzZTExODZhZTljLi4w
YjY1NDlkNTM0IDEwMDY0NAotLS0gYS9zY3JpcHRzL3RyYWNldG9vbC9mb3JtYXQvbG9nX3N0YXAu
cHkKKysrIGIvc2NyaXB0cy90cmFjZXRvb2wvZm9ybWF0L2xvZ19zdGFwLnB5CkBAIC03OCw3ICs3
OCwxMiBAQCBkZWYgY19mbXRfdG9fc3RhcChmbXQpOgogICAgIGVsaWYgc3RhdGUgPT0gU1RBVEVf
TElURVJBTDoKICAgICAgICAgYml0cy5hcHBlbmQobGl0ZXJhbCkKIAotICAgIGZtdCA9IHJlLnN1
YigiJShcZCopeih4fHV8ZCkiLCAiJVxcMVxcMiIsICIiLmpvaW4oYml0cykpCisgICAgIyBBbGwg
dmFyaWFibGVzIGluIHN5c3RlbXRhcCBhcmUgNjQtYml0IGluIHNpemUKKyAgICAjIFRoZSAiJWwi
IGludGVnZXIgc2l6ZSBxdWFsaWZpZXIgaXMgdGh1cyByZWR1bmRhbnQKKyAgICAjIGFuZCAiJWxs
IiBpcyBub3QgdmFsaWQgYXQgYWxsLiBTaW1pbGFybHkgdGhlIHNpemVfdAorICAgICMgYmFzZWQg
IiV6IiBzaXplIHF1YWxpZmllciBpcyBub3QgdmFsaWQuIFdlIGp1c3QKKyAgICAjIHN0cmlwIGFs
bCBzaXplIHF1YWxpZmllcnMgZm9yIHNhbml0eS4KKyAgICBmbXQgPSByZS5zdWIoIiUoXGQqKShs
K3x6KSh4fHV8ZCkiLCAiJVxcMVxcMyIsICIiLmpvaW4oYml0cykpCiAgICAgcmV0dXJuIGZtdAog
CiBkZWYgZ2VuZXJhdGUoZXZlbnRzLCBiYWNrZW5kLCBncm91cCk6Ci0tIAoyLjI5LjIKCg==


