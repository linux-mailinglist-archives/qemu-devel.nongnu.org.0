Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 329143BF397
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 03:32:11 +0200 (CEST)
Received: from localhost ([::1]:42592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Ite-00060e-8e
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 21:32:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m1Irg-0003zg-W3
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 21:30:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m1Irf-0003OP-FK
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 21:30:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625707807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=V1vXyB7WljGMMBgSVrvGY8jhvYYCWMU5WsUo7KZr4jA=;
 b=WacQ+swlK8PQ1e+y7MJjz2mMIgvOsVzPPZ2wiXZOmBJ9BRtqm3W6Z760WQ4YpwkNef2fuk
 0FIdGBLLWIlurrdBscRoNj0IcrYSgyT3U/bXrM2jk/JsTicUr0rcwbbOR96DbsIBSSH4Y7
 +/9jKk3eVi+cIJDR+zSPZnhVrlgnxnw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-53--mfp_p-aMoyPPxLY3s1nAg-1; Wed, 07 Jul 2021 21:30:03 -0400
X-MC-Unique: -mfp_p-aMoyPPxLY3s1nAg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73F91106B7D7;
 Thu,  8 Jul 2021 01:30:02 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D8E0660854;
 Thu,  8 Jul 2021 01:30:01 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] Let 'qemu-img convert --bitmaps' skip inconsistent bitmaps
Date: Wed,  7 Jul 2021 20:29:59 -0500
Message-Id: <20210708013001.2576991-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
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
Cc: nsoffer@redhat.com, vsementsov@virtuozzo.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is mostly a convenience factor as one could already use 'qemu-img
info' to learn which bitmaps are broken and then 'qemu-img bitmap
--remove' to nuke them before calling 'qemu-img convert --bitmaps',
but it does have the advantage that the copied file is usable without
extra efforts and the broken bitmap is not deleted from the source
file.

Eric Blake (2):
  iotests: Improve and rename test 291 to qemu-img-bitmap
  qemu-img: Add --skip-broken for 'convert --bitmaps'

 docs/tools/qemu-img.rst                       |  8 +++-
 block/dirty-bitmap.c                          |  2 +-
 qemu-img.c                                    | 20 +++++++-
 .../{291 => tests/qemu-img-bitmaps}           | 17 ++++++-
 .../{291.out => tests/qemu-img-bitmaps.out}   | 46 ++++++++++++++++++-
 5 files changed, 87 insertions(+), 6 deletions(-)
 rename tests/qemu-iotests/{291 => tests/qemu-img-bitmaps} (88%)
 rename tests/qemu-iotests/{291.out => tests/qemu-img-bitmaps.out} (76%)

-- 
2.31.1


