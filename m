Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F69322CEA
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 15:55:08 +0100 (CET)
Received: from localhost ([::1]:43124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEZ5f-0005RY-Ck
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 09:55:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEYzq-00066q-Ip
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 09:49:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEYzn-0002rG-GJ
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 09:49:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614091742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jYzwwFmbc9Ca0Ffjo2EmeanXIdgQj5ck1iF4xrYFOlQ=;
 b=D8y6eOwSMOe1VA8SartD0pD9HdwX5W6ySjomcCB4tTV4b8jfLeOYMcra09/oGo6Gv362YR
 guslZg3rMaM5X7atp4a2dRkCgLNcwft3se3VLcjIG+EsFatZCT70Ypu5NITinb56/rzylE
 GHUlNMQjwn9GSTQuXL2obiaziQOIAJ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-CKMxS4WKMEq3H5CNwjFvLQ-1; Tue, 23 Feb 2021 09:49:01 -0500
X-MC-Unique: CKMxS4WKMEq3H5CNwjFvLQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8875F83DCD3;
 Tue, 23 Feb 2021 14:48:12 +0000 (UTC)
Received: from localhost (ovpn-114-203.ams2.redhat.com [10.36.114.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3976319C46;
 Tue, 23 Feb 2021 14:48:02 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/12] block/export: fix blk_size double byteswap
Date: Tue, 23 Feb 2021 14:46:48 +0000
Message-Id: <20210223144653.811468-8-stefanha@redhat.com>
In-Reply-To: <20210223144653.811468-1-stefanha@redhat.com>
References: <20210223144653.811468-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
 Peter Maydell <peter.maydell@linaro.org>, Coiby Xu <coiby.xu@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlIGNvbmZpZy0+YmxrX3NpemUgZmllbGQgaXMgbGl0dGxlLWVuZGlhbi4gVXNlIHRoZSBuYXRp
dmUtZW5kaWFuCmJsa19zaXplIHZhcmlhYmxlIHRvIGF2b2lkIGRvdWJsZSBieXRlc3dhcHBpbmcu
CgpGaXhlczogMTFmNjBmN2VhZWUyNjMwZGQ2ZmEwYzNhOGM0OWY3OTJlNDZjNGNmMSAoImJsb2Nr
L2V4cG9ydDogbWFrZSB2aG9zdC11c2VyLWJsayBjb25maWcgc3BhY2UgbGl0dGxlLWVuZGlhbiIp
ClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KLS0t
CiBibG9jay9leHBvcnQvdmhvc3QtdXNlci1ibGstc2VydmVyLmMgfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9ibG9jay9l
eHBvcnQvdmhvc3QtdXNlci1ibGstc2VydmVyLmMgYi9ibG9jay9leHBvcnQvdmhvc3QtdXNlci1i
bGstc2VydmVyLmMKaW5kZXggYWIyYzRkNDRjNC4uN2FlYTEzMmY2OSAxMDA2NDQKLS0tIGEvYmxv
Y2svZXhwb3J0L3Zob3N0LXVzZXItYmxrLXNlcnZlci5jCisrKyBiL2Jsb2NrL2V4cG9ydC92aG9z
dC11c2VyLWJsay1zZXJ2ZXIuYwpAQCAtMzU2LDcgKzM1Niw3IEBAIHZ1X2Jsa19pbml0aWFsaXpl
X2NvbmZpZyhCbG9ja0RyaXZlclN0YXRlICpicywKICAgICBjb25maWctPm51bV9xdWV1ZXMgPSBj
cHVfdG9fbGUxNihudW1fcXVldWVzKTsKICAgICBjb25maWctPm1heF9kaXNjYXJkX3NlY3RvcnMg
PSBjcHVfdG9fbGUzMigzMjc2OCk7CiAgICAgY29uZmlnLT5tYXhfZGlzY2FyZF9zZWcgPSBjcHVf
dG9fbGUzMigxKTsKLSAgICBjb25maWctPmRpc2NhcmRfc2VjdG9yX2FsaWdubWVudCA9IGNwdV90
b19sZTMyKGNvbmZpZy0+YmxrX3NpemUgPj4gOSk7CisgICAgY29uZmlnLT5kaXNjYXJkX3NlY3Rv
cl9hbGlnbm1lbnQgPSBjcHVfdG9fbGUzMihibGtfc2l6ZSA+PiA5KTsKICAgICBjb25maWctPm1h
eF93cml0ZV96ZXJvZXNfc2VjdG9ycyA9IGNwdV90b19sZTMyKDMyNzY4KTsKICAgICBjb25maWct
Pm1heF93cml0ZV96ZXJvZXNfc2VnID0gY3B1X3RvX2xlMzIoMSk7CiB9Ci0tIAoyLjI5LjIKCg==


