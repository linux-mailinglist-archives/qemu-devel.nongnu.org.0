Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E85B3C1437
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 15:23:20 +0200 (CEST)
Received: from localhost ([::1]:38352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Tzr-0003g5-MO
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 09:23:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m1Tp0-00021D-TU
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 09:12:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m1Top-0000eF-5A
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 09:12:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625749912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AGunXnsX5X5a10cUZ0ZbGtgp64NwMRmKUHHSFbi3aEM=;
 b=fIvp2urPSwaEJKs1YbByRveSChoSFOHY0yuD61sVLfeUfg/GORiiZq0tdxOAxb90klFoNy
 WzZvFL+CYCSBzi1kA7+HRj/mqjZI8ZJve2JSGeuE9PAof7G6kO6i5iU3W9DUgYnQk7JjD3
 RuuDqUtjTRBI8SGiDHRa+On8QEU8g+k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-Gz-ByVt5NwS-9TGxoS95Tg-1; Thu, 08 Jul 2021 09:11:51 -0400
X-MC-Unique: Gz-ByVt5NwS-9TGxoS95Tg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB9D9804148;
 Thu,  8 Jul 2021 13:11:49 +0000 (UTC)
Received: from localhost (ovpn-114-141.ams2.redhat.com [10.36.114.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 904FA5C1C2;
 Thu,  8 Jul 2021 13:11:49 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 2/5] util/async: print leaked BH name when AioContext finalizes
Date: Thu,  8 Jul 2021 14:11:40 +0100
Message-Id: <20210708131143.240647-3-stefanha@redhat.com>
In-Reply-To: <20210708131143.240647-1-stefanha@redhat.com>
References: <20210708131143.240647-1-stefanha@redhat.com>
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
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Ernst <eric.g.ernst@gmail.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QkhzIG11c3QgYmUgZGVsZXRlZCBiZWZvcmUgdGhlIEFpb0NvbnRleHQgaXMgZmluYWxpemVkLiBJ
ZiBub3QsIGl0J3MgYQpidWcgYW5kIHByb2JhYmx5IGluZGljYXRlcyB0aGF0IHNvbWUgcGFydCBv
ZiB0aGUgcHJvZ3JhbSBzdGlsbCBleHBlY3RzCnRoZSBCSCB0byBydW4gaW4gdGhlIGZ1dHVyZS4g
VGhhdCBjYW4gbGVhZCB0byBtZW1vcnkgbGVha3MsIGluY29uc2lzdGVudApzdGF0ZSwgb3IganVz
dCBoYW5ncy4KClVuZm9ydHVuYXRlbHkgdGhlIGFzc2VydChmbGFncyAmIEJIX0RFTEVURUQpIGNh
bGwgaW4gYWlvX2N0eF9maW5hbGl6ZSgpCmlzIGRpZmZpY3VsdCB0byBkZWJ1ZyBiZWNhdXNlIHRo
ZSBhc3NlcnRpb24gZmFpbHVyZSBjb250YWlucyBubwppbmZvcm1hdGlvbiBhYm91dCB0aGUgQkgh
CgpVc2UgdGhlIFFFTVVCSCBuYW1lIGZpZWxkIGFkZGVkIGluIHRoZSBwcmV2aW91cyBwYXRjaCB0
byBzaG93IGEgdXNlZnVsCmVycm9yIHdoZW4gYSBsZWFrZWQgQkggaXMgZGV0ZWN0ZWQuCgpTdWdn
ZXN0ZWQtYnk6IEVyaWMgRXJuc3QgPGVyaWMuZy5lcm5zdEBnbWFpbC5jb20+ClNpZ25lZC1vZmYt
Ynk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KTWVzc2FnZS1JZDogPDIw
MjEwNDE0MjAwMjQ3LjkxNzQ5Ni0zLXN0ZWZhbmhhQHJlZGhhdC5jb20+Ci0tLQogdXRpbC9hc3lu
Yy5jIHwgMTYgKysrKysrKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdXRpbC9hc3luYy5jIGIvdXRpbC9hc3lu
Yy5jCmluZGV4IDlhNjY4OTk2YjguLjlhNDE1OTEzMTkgMTAwNjQ0Ci0tLSBhL3V0aWwvYXN5bmMu
YworKysgYi91dGlsL2FzeW5jLmMKQEAgLTM0NCw4ICszNDQsMjAgQEAgYWlvX2N0eF9maW5hbGl6
ZShHU291cmNlICAgICAqc291cmNlKQogICAgIGFzc2VydChRU0lNUExFUV9FTVBUWSgmY3R4LT5i
aF9zbGljZV9saXN0KSk7CiAKICAgICB3aGlsZSAoKGJoID0gYWlvX2JoX2RlcXVldWUoJmN0eC0+
YmhfbGlzdCwgJmZsYWdzKSkpIHsKLSAgICAgICAgLyogcWVtdV9iaF9kZWxldGUoKSBtdXN0IGhh
dmUgYmVlbiBjYWxsZWQgb24gQkhzIGluIHRoaXMgQWlvQ29udGV4dCAqLwotICAgICAgICBhc3Nl
cnQoZmxhZ3MgJiBCSF9ERUxFVEVEKTsKKyAgICAgICAgLyoKKyAgICAgICAgICogcWVtdV9iaF9k
ZWxldGUoKSBtdXN0IGhhdmUgYmVlbiBjYWxsZWQgb24gQkhzIGluIHRoaXMgQWlvQ29udGV4dC4g
SW4KKyAgICAgICAgICogbWFueSBjYXNlcyBtZW1vcnkgbGVha3MsIGhhbmdzLCBvciBpbmNvbnNp
c3RlbnQgc3RhdGUgb2NjdXIgd2hlbiBhCisgICAgICAgICAqIEJIIGlzIGxlYWtlZCBiZWNhdXNl
IHNvbWV0aGluZyBzdGlsbCBleHBlY3RzIGl0IHRvIHJ1bi4KKyAgICAgICAgICoKKyAgICAgICAg
ICogSWYgeW91IGhpdCB0aGlzLCBmaXggdGhlIGxpZmVjeWNsZSBvZiB0aGUgQkggc28gdGhhdAor
ICAgICAgICAgKiBxZW11X2JoX2RlbGV0ZSgpIGFuZCBhbnkgYXNzb2NpYXRlZCBjbGVhbnVwIGlz
IGNhbGxlZCBiZWZvcmUgdGhlCisgICAgICAgICAqIEFpb0NvbnRleHQgaXMgZmluYWxpemVkLgor
ICAgICAgICAgKi8KKyAgICAgICAgaWYgKHVubGlrZWx5KCEoZmxhZ3MgJiBCSF9ERUxFVEVEKSkp
IHsKKyAgICAgICAgICAgIGZwcmludGYoc3RkZXJyLCAiJXM6IEJIICclcycgbGVha2VkLCBhYm9y
dGluZy4uLlxuIiwKKyAgICAgICAgICAgICAgICAgICAgX19mdW5jX18sIGJoLT5uYW1lKTsKKyAg
ICAgICAgICAgIGFib3J0KCk7CisgICAgICAgIH0KIAogICAgICAgICBnX2ZyZWUoYmgpOwogICAg
IH0KLS0gCjIuMzEuMQoK


