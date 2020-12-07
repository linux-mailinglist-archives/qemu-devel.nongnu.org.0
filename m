Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B92F52D179E
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 18:33:42 +0100 (CET)
Received: from localhost ([::1]:41912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmKOL-0006UG-Hi
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 12:33:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kmKFS-0000IS-0H
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 12:24:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kmKFL-0006ss-JH
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 12:24:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607361862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gDRl+/6B0Wo8EkHXmtwjEYRM2pzBAX9HbpbNK3tNtwM=;
 b=SXgCL43Xk+PPH70wgJpGeha5ZhHsNLEaBi6atlSueUi31EoYqetvQmnNN50ZgtGGL58APY
 2CI2KTbDAoTe+ZkDjSl3a3/7Yivw1ejRmrJGzBIpXwL0/22O3mW8K9P8/+4yASqQD0hTpY
 DhYMe/bKBe1nZoq5TfXiDXZ/X3vARn8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-3MzuTHoTPuuq5LVeIW1aGg-1; Mon, 07 Dec 2020 12:24:21 -0500
X-MC-Unique: 3MzuTHoTPuuq5LVeIW1aGg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D50F11842142;
 Mon,  7 Dec 2020 17:24:19 +0000 (UTC)
Received: from localhost (ovpn-114-128.ams2.redhat.com [10.36.114.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 743525D6AD;
 Mon,  7 Dec 2020 17:24:19 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/12] vhost-user-blk: fix blkcfg->num_queues endianness
Date: Mon,  7 Dec 2020 17:20:19 +0000
Message-Id: <20201207172030.251905-2-stefanha@redhat.com>
In-Reply-To: <20201207172030.251905-1-stefanha@redhat.com>
References: <20201207172030.251905-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VHJlYXQgdGhlIG51bV9xdWV1ZXMgZmllbGQgYXMgdmlydGlvLWVuZGlhbi4gT24gYmlnLWVuZGlh
biBob3N0cyB0aGUKdmhvc3QtdXNlci1ibGsgbnVtX3F1ZXVlcyBmaWVsZCB3YXMgaW4gdGhlIHdy
b25nIGVuZGlhbm5lc3MuCgpNb3ZlIHRoZSBibGtjZmcubnVtX3F1ZXVlcyBzdG9yZSBvcGVyYXRp
b24gZnJvbSByZWFsaXplIHRvCnZob3N0X3VzZXJfYmxrX3VwZGF0ZV9jb25maWcoKSBzbyBmZWF0
dXJlIG5lZ290aWF0aW9uIGhhcyBmaW5pc2hlZCBhbmQKd2Uga25vdyB0aGUgZW5kaWFubmVzcyBv
ZiB0aGUgZGV2aWNlLiBWSVJUSU8gMS4wIGRldmljZXMgYXJlCmxpdHRsZS1lbmRpYW4sIGJ1dCBp
biBjYXNlIHNvbWVvbmUgd2FudHMgdG8gdXNlIGxlZ2FjeSBWSVJUSU8gd2Ugc3VwcG9ydAphbGwg
ZW5kaWFubmVzcyBjYXNlcy4KClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFu
aGFAcmVkaGF0LmNvbT4KLS0tCiBody9ibG9jay92aG9zdC11c2VyLWJsay5jIHwgNyArKystLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2h3L2Jsb2NrL3Zob3N0LXVzZXItYmxrLmMgYi9ody9ibG9jay92aG9zdC11c2VyLWJs
ay5jCmluZGV4IDJkZDNkOTNjYTAuLmQ5ZDlkYzhhODkgMTAwNjQ0Ci0tLSBhL2h3L2Jsb2NrL3Zo
b3N0LXVzZXItYmxrLmMKKysrIGIvaHcvYmxvY2svdmhvc3QtdXNlci1ibGsuYwpAQCAtNTMsNiAr
NTMsOSBAQCBzdGF0aWMgdm9pZCB2aG9zdF91c2VyX2Jsa191cGRhdGVfY29uZmlnKFZpcnRJT0Rl
dmljZSAqdmRldiwgdWludDhfdCAqY29uZmlnKQogewogICAgIFZIb3N0VXNlckJsayAqcyA9IFZI
T1NUX1VTRVJfQkxLKHZkZXYpOwogCisgICAgLyogT3VyIG51bV9xdWV1ZXMgb3ZlcnJpZGVzIHRo
ZSBkZXZpY2UgYmFja2VuZCAqLworICAgIHZpcnRpb19zdHdfcCh2ZGV2LCAmcy0+YmxrY2ZnLm51
bV9xdWV1ZXMsIHMtPm51bV9xdWV1ZXMpOworCiAgICAgbWVtY3B5KGNvbmZpZywgJnMtPmJsa2Nm
Zywgc2l6ZW9mKHN0cnVjdCB2aXJ0aW9fYmxrX2NvbmZpZykpOwogfQogCkBAIC00OTAsMTAgKzQ5
Myw2IEBAIHJlY29ubmVjdDoKICAgICAgICAgZ290byByZWNvbm5lY3Q7CiAgICAgfQogCi0gICAg
aWYgKHMtPmJsa2NmZy5udW1fcXVldWVzICE9IHMtPm51bV9xdWV1ZXMpIHsKLSAgICAgICAgcy0+
YmxrY2ZnLm51bV9xdWV1ZXMgPSBzLT5udW1fcXVldWVzOwotICAgIH0KLQogICAgIHJldHVybjsK
IAogdmlydGlvX2VycjoKLS0gCjIuMjguMAoK


