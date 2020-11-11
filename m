Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 069392AF59D
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 16:59:13 +0100 (CET)
Received: from localhost ([::1]:36962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcsWe-0001pO-2M
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 10:59:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kcsUz-0000Cj-CF
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 10:57:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kcsUv-0000fU-M9
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 10:57:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605110244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6g+prrUVPWRDYJKtBXLISLhf9YGJ419I1yi0MSVF4OA=;
 b=h0pTn6DebUy5kf5cubZf7KHtDiksetz6uRHGjZaSyO/35OrukjZVSgnRpzeUSOYQHMZ7xC
 cHZ3k/tVzGQkOrnfgbc+BpyhEOZyQW1Ey6hjxnmMrZgM6NzSf4JAt61CSKOBm1ZQCE37CM
 H9h91+0Idqme/GxWVR8/mXmA1yXwgJw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-0TFz7lfOPxWGdJeJgbGXkw-1; Wed, 11 Nov 2020 10:57:10 -0500
X-MC-Unique: 0TFz7lfOPxWGdJeJgbGXkw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2542B188C12A;
 Wed, 11 Nov 2020 15:57:09 +0000 (UTC)
Received: from localhost (ovpn-112-222.ams2.redhat.com [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3EFF5B4A8;
 Wed, 11 Nov 2020 15:57:05 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL for-5.2 2/2] scripts/tracetool: silence SystemTap dtrace(1)
 long long warnings
Date: Wed, 11 Nov 2020 15:56:54 +0000
Message-Id: <20201111155654.1430860-3-stefanha@redhat.com>
In-Reply-To: <20201111155654.1430860-1-stefanha@redhat.com>
References: <20201111155654.1430860-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

U3lzdGVtVGFwJ3MgZHRyYWNlKDEpIHByaW50cyB0aGUgZm9sbG93aW5nIHdhcm5pbmcgd2hlbiBp
dCBlbmNvdW50ZXJzCmxvbmcgbG9uZyBhcmd1bWVudHM6CgogIFdhcm5pbmc6IC91c3IvYmluL2R0
cmFjZTp0cmFjZS90cmFjZS1kdHJhY2UtaHdfdmlydGlvLmR0cmFjZTo3Njogc3ludGF4IGVycm9y
IG5lYXI6CiAgcHJvYmUgdmhvc3RfdmRwYV9kZXZfc3RhcnQKCiAgV2FybmluZzogUHJvY2VlZGlu
ZyBhcyBpZiAtLW5vLXB5cGFyc2luZyB3YXMgZ2l2ZW4uCgpVc2UgdGhlIHVpbnQ2NF90IGFuZCBp
bnQ2NF90IHR5cGVzLCByZXNwZWN0aXZlbHkuIFRoaXMgd29ya3Mgd2l0aCBhbGwKaG9zdCBDUFUg
MzItIGFuZCA2NC1iaXQgZGF0YSBtb2RlbHMgKElMUDMyLCBMUDY0LCBhbmQgTExQNjQpIHRoYXQg
UUVNVQpzdXBwb3J0cy4KClJlcG9ydGVkLWJ5OiBNYXJrdXMgQXJtYnJ1c3RlciA8YXJtYnJ1QHJl
ZGhhdC5jb20+ClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0
LmNvbT4KUmV2aWV3ZWQtYnk6IERhbmllbCBQLiBCZXJyYW5nw6kgPGJlcnJhbmdlQHJlZGhhdC5j
b20+ClJldmlld2VkLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5j
b20+Ck1lc3NhZ2UtaWQ6IDIwMjAxMDIwMDk0MDQzLjE1OTkzNS0xLXN0ZWZhbmhhQHJlZGhhdC5j
b20KU3VnZ2VzdGVkLWJ5OiBEYW5pZWwgUC4gQmVycmFuZ8OpIDxiZXJyYW5nZUByZWRoYXQuY29t
PgpTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+Ci0t
LQogc2NyaXB0cy90cmFjZXRvb2wvZm9ybWF0L2QucHkgfCA2ICsrKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3NjcmlwdHMvdHJhY2V0b29sL2Zvcm1h
dC9kLnB5IGIvc2NyaXB0cy90cmFjZXRvb2wvZm9ybWF0L2QucHkKaW5kZXggMzUzNzIyZjg5Yy4u
ZWJmYjcxNDIwMCAxMDA2NDQKLS0tIGEvc2NyaXB0cy90cmFjZXRvb2wvZm9ybWF0L2QucHkKKysr
IGIvc2NyaXB0cy90cmFjZXRvb2wvZm9ybWF0L2QucHkKQEAgLTU3LDYgKzU3LDEyIEBAIGRlZiBn
ZW5lcmF0ZShldmVudHMsIGJhY2tlbmQsIGdyb3VwKToKICAgICAgICAgICAgICAgICAjIEF2b2lk
IGl0IGJ5IGNoYW5naW5nIHByb2JlIHR5cGUgdG8gc2lnbmVkIGNoYXIgKiBiZWZvcmVoYW5kLgog
ICAgICAgICAgICAgICAgIGlmIHR5cGVfID09ICdpbnQ4X3QgKic6CiAgICAgICAgICAgICAgICAg
ICAgIHR5cGVfID0gJ3NpZ25lZCBjaGFyIConCisKKyAgICAgICAgICAgICMgU3lzdGVtVGFwIGR0
cmFjZSgxKSBlbWl0cyBhIHdhcm5pbmcgd2hlbiBsb25nIGxvbmcgaXMgdXNlZAorICAgICAgICAg
ICAgdHlwZV8gPSB0eXBlXy5yZXBsYWNlKCd1bnNpZ25lZCBsb25nIGxvbmcnLCAndWludDY0X3Qn
KQorICAgICAgICAgICAgdHlwZV8gPSB0eXBlXy5yZXBsYWNlKCdzaWduZWQgbG9uZyBsb25nJywg
J2ludDY0X3QnKQorICAgICAgICAgICAgdHlwZV8gPSB0eXBlXy5yZXBsYWNlKCdsb25nIGxvbmcn
LCAnaW50NjRfdCcpCisKICAgICAgICAgICAgIGlmIG5hbWUgaW4gUkVTRVJWRURfV09SRFM6CiAg
ICAgICAgICAgICAgICAgbmFtZSArPSAnXycKICAgICAgICAgICAgIGFyZ3MuYXBwZW5kKHR5cGVf
ICsgJyAnICsgbmFtZSkKLS0gCjIuMjguMAoK


