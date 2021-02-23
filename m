Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55479322CCC
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 15:51:06 +0100 (CET)
Received: from localhost ([::1]:56930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEZ1l-0007pf-AS
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 09:51:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEYzq-00065w-5t
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 09:49:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEYzn-0002r5-6H
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 09:49:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614091742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=epNbZK0R37t9TJfruEcwMWO3mwlxvKJUXYHn7CqV7Q8=;
 b=U3RTwlG30cxAI6UqfECbPfYoTdUb+BlNjM6W/j2uDi8ljdUpuElnhu2LLEa/x2IpmFJKP8
 Q6NDd4x6Vtaf16b3hcq7P0Eo0x7n8B9oz5o8rKVlO0QE5b3sYzvDVFakZn+V6FXpZ6wpbs
 u2AYntXcg8CiDqgP1fRuv62+PfYlGNo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-URm9yOB3MK2onVIM-jCAhQ-1; Tue, 23 Feb 2021 09:49:01 -0500
X-MC-Unique: URm9yOB3MK2onVIM-jCAhQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BF7FC7451;
 Tue, 23 Feb 2021 14:47:11 +0000 (UTC)
Received: from localhost (ovpn-114-203.ams2.redhat.com [10.36.114.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 30C2A5C8BE;
 Tue, 23 Feb 2021 14:47:02 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/12] vhost-user-blk: fix blkcfg->num_queues endianness
Date: Tue, 23 Feb 2021 14:46:42 +0000
Message-Id: <20210223144653.811468-2-stefanha@redhat.com>
In-Reply-To: <20210223144653.811468-1-stefanha@redhat.com>
References: <20210223144653.811468-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-stable@nongnu.org,
 Coiby Xu <coiby.xu@gmail.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
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
ZW5kaWFubmVzcyBjYXNlcy4KCkNjOiBxZW11LXN0YWJsZUBub25nbnUub3JnClNpZ25lZC1vZmYt
Ynk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KUmV2aWV3ZWQtYnk6IFJh
cGhhZWwgTm9yd2l0eiA8cmFwaGFlbC5ub3J3aXR6QG51dGFuaXguY29tPgpSZXZpZXdlZC1ieTog
TWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4KLS0tCiBody9ibG9jay92aG9zdC11
c2VyLWJsay5jIHwgNyArKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2h3L2Jsb2NrL3Zob3N0LXVzZXItYmxrLmMgYi9o
dy9ibG9jay92aG9zdC11c2VyLWJsay5jCmluZGV4IGRhNGZiZjkwODQuLmI4NzBhNTBlNmIgMTAw
NjQ0Ci0tLSBhL2h3L2Jsb2NrL3Zob3N0LXVzZXItYmxrLmMKKysrIGIvaHcvYmxvY2svdmhvc3Qt
dXNlci1ibGsuYwpAQCAtNTQsNiArNTQsOSBAQCBzdGF0aWMgdm9pZCB2aG9zdF91c2VyX2Jsa191
cGRhdGVfY29uZmlnKFZpcnRJT0RldmljZSAqdmRldiwgdWludDhfdCAqY29uZmlnKQogewogICAg
IFZIb3N0VXNlckJsayAqcyA9IFZIT1NUX1VTRVJfQkxLKHZkZXYpOwogCisgICAgLyogT3VyIG51
bV9xdWV1ZXMgb3ZlcnJpZGVzIHRoZSBkZXZpY2UgYmFja2VuZCAqLworICAgIHZpcnRpb19zdHdf
cCh2ZGV2LCAmcy0+YmxrY2ZnLm51bV9xdWV1ZXMsIHMtPm51bV9xdWV1ZXMpOworCiAgICAgbWVt
Y3B5KGNvbmZpZywgJnMtPmJsa2NmZywgc2l6ZW9mKHN0cnVjdCB2aXJ0aW9fYmxrX2NvbmZpZykp
OwogfQogCkBAIC00OTEsMTAgKzQ5NCw2IEBAIHJlY29ubmVjdDoKICAgICAgICAgZ290byByZWNv
bm5lY3Q7CiAgICAgfQogCi0gICAgaWYgKHMtPmJsa2NmZy5udW1fcXVldWVzICE9IHMtPm51bV9x
dWV1ZXMpIHsKLSAgICAgICAgcy0+YmxrY2ZnLm51bV9xdWV1ZXMgPSBzLT5udW1fcXVldWVzOwot
ICAgIH0KLQogICAgIHJldHVybjsKIAogdmlydGlvX2VycjoKLS0gCjIuMjkuMgoK


