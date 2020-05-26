Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 527121D9DA4
	for <lists+qemu-devel@lfdr.de>; Tue, 19 May 2020 19:14:01 +0200 (CEST)
Received: from localhost ([::1]:46468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jb5oW-0005hU-Du
	for lists+qemu-devel@lfdr.de; Tue, 19 May 2020 13:14:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jb5me-00038L-99
 for qemu-devel@nongnu.org; Tue, 19 May 2020 13:12:04 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:59305
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jb5md-0002bO-8o
 for qemu-devel@nongnu.org; Tue, 19 May 2020 13:12:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589908322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B1PloHl0i3aFCkds3d4WJY2dkXuAFWinlvjBOBk+wNM=;
 b=FLzcrY5QwelJsMB1pximflBfzijMleAr6Q7T5/XvGcgYRL4kRfbj+JXbuJ47UjqfcYCRNu
 8iYUdHxlD/1bJkhgz3rTQ1rZPP1dEs5Sawyg7vp4LLCRgu078ernDWeSh2lwPJinXm7Wqv
 fTV6giqxStbie6mCT9Jc4uqHG6RrGIM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-qSOmlgPBNoub0-F7z0-JIg-1; Tue, 19 May 2020 13:12:00 -0400
X-MC-Unique: qSOmlgPBNoub0-F7z0-JIg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 869F8464;
 Tue, 19 May 2020 17:11:59 +0000 (UTC)
Received: from localhost (ovpn-114-215.ams2.redhat.com [10.36.114.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E2A35D9C5;
 Tue, 19 May 2020 17:11:58 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/7] block/nvme: clarify that free_req_queue is protected by
 q->lock
Date: Tue, 19 May 2020 18:11:36 +0100
Message-Id: <20200519171138.201667-6-stefanha@redhat.com>
In-Reply-To: <20200519171138.201667-1-stefanha@redhat.com>
References: <20200519171138.201667-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=205.139.110.120; envelope-from=stefanha@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/18 23:56:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RXhpc3RpbmcgdXNlcnMgYWNjZXNzIGZyZWVfcmVxX3F1ZXVlIHVuZGVyIHEtPmxvY2suIERvY3Vt
ZW50IHRoaXMuCgpTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhh
dC5jb20+Ci0tLQogYmxvY2svbnZtZS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYmxvY2svbnZtZS5jIGIvYmxvY2sv
bnZtZS5jCmluZGV4IDNhZDRmMjdlMWMuLmUzMmJmZjI2ZmYgMTAwNjQ0Ci0tLSBhL2Jsb2NrL252
bWUuYworKysgYi9ibG9jay9udm1lLmMKQEAgLTU3LDcgKzU3LDYgQEAgdHlwZWRlZiBzdHJ1Y3Qg
ewogfSBOVk1lUmVxdWVzdDsKIAogdHlwZWRlZiBzdHJ1Y3QgewotICAgIENvUXVldWUgICAgIGZy
ZWVfcmVxX3F1ZXVlOwogICAgIFFlbXVNdXRleCAgIGxvY2s7CiAKICAgICAvKiBGaWVsZHMgcHJv
dGVjdGVkIGJ5IEJRTCAqLwpAQCAtNjUsNiArNjQsNyBAQCB0eXBlZGVmIHN0cnVjdCB7CiAgICAg
dWludDhfdCAgICAgKnBycF9saXN0X3BhZ2VzOwogCiAgICAgLyogRmllbGRzIHByb3RlY3RlZCBi
eSBAbG9jayAqLworICAgIENvUXVldWUgICAgIGZyZWVfcmVxX3F1ZXVlOwogICAgIE5WTWVRdWV1
ZSAgIHNxLCBjcTsKICAgICBpbnQgICAgICAgICBjcV9waGFzZTsKICAgICBpbnQgICAgICAgICBm
cmVlX3JlcV9oZWFkOwotLSAKMi4yNS4zCgo=


