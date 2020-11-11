Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9332F2AF13D
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 13:51:18 +0100 (CET)
Received: from localhost ([::1]:57716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcpan-00074J-KE
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 07:51:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kcpUD-0007Lu-Pc
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 07:44:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kcpU9-0001C5-HZ
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 07:44:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605098664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y5rizlocYzRSPtHp487J2+vhRbJRs+JoFsgey+Ylx24=;
 b=YbdRUu4bV8shQ0wEk3HxlMdz28rcFC/OcXfGbVsWCFBMqpiFkDhIEirAD/VkH+bPpoWhlh
 gw25+64EOvvwELgqO0KJhupUDmDNJP8ZegOp76faLQ6oh81YXCn4ZMmyk6fkX7I4GDKSnf
 qNVXqT6hmiz246z3lx2IMqt+8PxaRks=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-MX04sOLUPJKkZ0ySkcEi0A-1; Wed, 11 Nov 2020 07:44:22 -0500
X-MC-Unique: MX04sOLUPJKkZ0ySkcEi0A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82F89186DD29;
 Wed, 11 Nov 2020 12:44:21 +0000 (UTC)
Received: from localhost (ovpn-112-222.ams2.redhat.com [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0514060C05;
 Wed, 11 Nov 2020 12:44:10 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-5.2 05/10] vhost-user-blk-test: close fork child file
 descriptors
Date: Wed, 11 Nov 2020 12:43:26 +0000
Message-Id: <20201111124331.1393747-6-stefanha@redhat.com>
In-Reply-To: <20201111124331.1393747-1-stefanha@redhat.com>
References: <20201111124331.1393747-1-stefanha@redhat.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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

RG8gbm90IGxlYXZlIHN0ZGluIGFuZCBzdGRvdXQgb3BlbiBhZnRlciBmb3JrLiBzdGRvdXQgaXMg
dGhlCnRhcC1kcml2ZXIucGwgcGlwZS4gSWYgd2Uga2VlcCB0aGUgcGlwZSBvcGVuIHRoZW4gdGFw
LWRyaXZlci5wbCB3aWxsIG5vdApkZXRlY3QgdGhhdCBxb3MtdGVzdCBoYXMgdGVybWluYXRlZCBh
bmQgaXQgd2lsbCBoYW5nLgoKU2lnbmVkLW9mZi1ieTogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5o
YUByZWRoYXQuY29tPgotLS0KIHRlc3RzL3F0ZXN0L3Zob3N0LXVzZXItYmxrLXRlc3QuYyB8IDkg
KysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
dGVzdHMvcXRlc3Qvdmhvc3QtdXNlci1ibGstdGVzdC5jIGIvdGVzdHMvcXRlc3Qvdmhvc3QtdXNl
ci1ibGstdGVzdC5jCmluZGV4IGYwNWYxNGMxOTIuLjQwMTlhNzJhYzAgMTAwNjQ0Ci0tLSBhL3Rl
c3RzL3F0ZXN0L3Zob3N0LXVzZXItYmxrLXRlc3QuYworKysgYi90ZXN0cy9xdGVzdC92aG9zdC11
c2VyLWJsay10ZXN0LmMKQEAgLTc0OSw2ICs3NDksMTUgQEAgc3RhdGljIGNoYXIgKnN0YXJ0X3Zo
b3N0X3VzZXJfYmxrKEdTdHJpbmcgKmNtZF9saW5lLCBpbnQgdnVzX2luc3RhbmNlcywKICAgICAg
ICAgICAgICAgICAgICBzdG9yYWdlX2RhZW1vbl9jb21tYW5kLT5zdHIpOwogICAgIHBpZF90IHBp
ZCA9IGZvcmsoKTsKICAgICBpZiAocGlkID09IDApIHsKKyAgICAgICAgLyoKKyAgICAgICAgICog
Q2xvc2Ugc3RhbmRhcmQgZmlsZSBkZXNjcmlwdG9ycyBzbyB0YXAtZHJpdmVyLnBsIHBpcGUgZGV0
ZWN0cyB3aGVuCisgICAgICAgICAqIG91ciBwYXJlbnQgdGVybWluYXRlcy4KKyAgICAgICAgICov
CisgICAgICAgIGNsb3NlKDApOworICAgICAgICBjbG9zZSgxKTsKKyAgICAgICAgb3BlbigiL2Rl
di9udWxsIiwgT19SRE9OTFkpOworICAgICAgICBvcGVuKCIvZGV2L251bGwiLCBPX1dST05MWSk7
CisKICAgICAgICAgZXhlY2xwKCIvYmluL3NoIiwgInNoIiwgIi1jIiwgc3RvcmFnZV9kYWVtb25f
Y29tbWFuZC0+c3RyLCBOVUxMKTsKICAgICAgICAgZXhpdCgxKTsKICAgICB9Ci0tIAoyLjI4LjAK
Cg==


