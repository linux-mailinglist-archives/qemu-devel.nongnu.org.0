Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 903A52CC0E0
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 16:33:14 +0100 (CET)
Received: from localhost ([::1]:58162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkU81-00024H-KK
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 10:33:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kkU2P-0006FX-MW
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 10:27:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kkU2I-00046w-00
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 10:27:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606922837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0utENm6x05s6LlV+yETgvJfBM19cBadB8y673FhcQ5I=;
 b=SkIPE+XSa9bJM7/Hk8FsXyDp4xMwZvZwWdwj44ZYfpq67ZsK2v+EFTY1NAwR/hAhbgkCbK
 qQaYC9qj/JBZywThUhWU1xjPBKQ+KdrMhSnKBfyPGl68tBQ2wYg8up90DiqXoIemfZcbHY
 HLqJFM2z6xB3p2Nt8TRdzAO3A3ZakUc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-zL02Zw54MgWnunoTiugUHw-1; Wed, 02 Dec 2020 10:27:13 -0500
X-MC-Unique: zL02Zw54MgWnunoTiugUHw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 931A3427C9;
 Wed,  2 Dec 2020 15:27:12 +0000 (UTC)
Received: from localhost (ovpn-114-255.ams2.redhat.com [10.36.114.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 39A715D9DB;
 Wed,  2 Dec 2020 15:26:59 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/4] contrib/vhost-user-input: avoid g_return_val_if()
 input validation
Date: Wed,  2 Dec 2020 15:26:10 +0000
Message-Id: <20201202152611.677753-4-stefanha@redhat.com>
In-Reply-To: <20201202152611.677753-1-stefanha@redhat.com>
References: <20201202152611.677753-1-stefanha@redhat.com>
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
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RG8gbm90IHZhbGlkYXRlIGlucHV0IHdpdGggZ19yZXR1cm5fdmFsX2lmKCkuIFRoaXMgQVBJIGlz
IGludGVuZGVkIGZvcgpjaGVja2luZyBwcm9ncmFtbWluZyBlcnJvcnMgYW5kIGlzIGNvbXBpbGVk
IG91dCB3aXRoIC1ER19ESVNBQkxFX0NIRUNLUy4KClVzZSBhbiBleHBsaWNpdCBpZiBzdGF0ZW1l
bnQgZm9yIGlucHV0IHZhbGlkYXRpb24gc28gaXQgY2Fubm90CmFjY2lkZW50YWxseSBiZSBjb21w
aWxlZCBvdXQuCgpTdWdnZXN0ZWQtYnk6IE1hcmt1cyBBcm1icnVzdGVyIDxhcm1icnVAcmVkaGF0
LmNvbT4KU2lnbmVkLW9mZi1ieTogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29t
PgotLS0KIGNvbnRyaWIvdmhvc3QtdXNlci1pbnB1dC9tYWluLmMgfCA2ICsrKysrLQogMSBmaWxl
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Nv
bnRyaWIvdmhvc3QtdXNlci1pbnB1dC9tYWluLmMgYi9jb250cmliL3Zob3N0LXVzZXItaW5wdXQv
bWFpbi5jCmluZGV4IDYwMjBjNmYzM2EuLjFkNzljNjEyMDAgMTAwNjQ0Ci0tLSBhL2NvbnRyaWIv
dmhvc3QtdXNlci1pbnB1dC9tYWluLmMKKysrIGIvY29udHJpYi92aG9zdC11c2VyLWlucHV0L21h
aW4uYwpAQCAtMjEyLDcgKzIxMiwxMSBAQCBzdGF0aWMgaW50IHZpX2dldF9jb25maWcoVnVEZXYg
KmRldiwgdWludDhfdCAqY29uZmlnLCB1aW50MzJfdCBsZW4pCiB7CiAgICAgVnVJbnB1dCAqdmkg
PSBjb250YWluZXJfb2YoZGV2LCBWdUlucHV0LCBkZXYucGFyZW50KTsKIAotICAgIGdfcmV0dXJu
X3ZhbF9pZl9mYWlsKGxlbiA8PSBzaXplb2YoKnZpLT5zZWxfY29uZmlnKSwgLTEpOworICAgIGlm
IChsZW4gPiBzaXplb2YoKnZpLT5zZWxfY29uZmlnKSkgeworICAgICAgICBnX2NyaXRpY2FsKCIl
czogbGVuICV1IGlzIGxhcmdlciB0aGFuICV6dSIsCisgICAgICAgICAgICAgICAgICAgX19mdW5j
X18sIGxlbiwgc2l6ZW9mKCp2aS0+c2VsX2NvbmZpZykpOworICAgICAgICByZXR1cm4gLTE7Cisg
ICAgfQogCiAgICAgaWYgKHZpLT5zZWxfY29uZmlnKSB7CiAgICAgICAgIG1lbWNweShjb25maWcs
IHZpLT5zZWxfY29uZmlnLCBsZW4pOwotLSAKMi4yOC4wCgo=


