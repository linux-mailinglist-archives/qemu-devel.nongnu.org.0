Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD577200706
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jun 2020 12:44:04 +0200 (CEST)
Received: from localhost ([::1]:48574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmEV9-0004IY-PO
	for lists+qemu-devel@lfdr.de; Fri, 19 Jun 2020 06:44:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jmERe-0008GG-GD
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 06:40:26 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:47791
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jmERZ-0000vg-Mp
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 06:40:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592563220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vNJIJslwuBdOw5lnuy/oZWkG95NKn7PGIf3WsTPg6p4=;
 b=dSUp27PwXJyxB+8ix8RjOGugtIuv4GDp/ezxIdwY/C5QOVA/Ae8UKBuzO5KtO5bxUeuPFh
 NyB+UnxfTKlZetzcLw0d8DHKvoT5jQ0yRbdkz2vQr3C0sDDxOmWanFHF+sF3rSB60FBPTf
 ZyRpzNIzLaMDJ5mpTEZutZODgFtRXL4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-iaYQuNijPMa_32hNAwgdzQ-1; Fri, 19 Jun 2020 06:40:15 -0400
X-MC-Unique: iaYQuNijPMa_32hNAwgdzQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8882801503;
 Fri, 19 Jun 2020 10:40:14 +0000 (UTC)
Received: from localhost (ovpn-113-28.ams2.redhat.com [10.36.113.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CFC25D9CA;
 Fri, 19 Jun 2020 10:40:13 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/2] qcow2: Force preallocation with data-file-raw
Date: Fri, 19 Jun 2020 12:40:10 +0200
Message-Id: <20200619104012.235977-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=mreitz@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/19 05:19:18
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alberto Garcia <berto@igalia.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

As discussed here:

https://lists.nongnu.org/archive/html/qemu-block/2020-02/msg00644.html
https://lists.nongnu.org/archive/html/qemu-block/2020-04/msg00329.html
https://lists.nongnu.org/archive/html/qemu-block/2020-06/msg00240.html

I think that qcow2 images with data-file-raw should always have
preallocated 1:1 L1/L2 tables, so that the image always looks the same
whether you respect or ignore the qcow2 metadata.  The easiest way to
achieve that is to enforce at least metadata preallocation whenever
data-file-raw is given.


Max Reitz (2):
  qcow2: Force preallocation with data-file-raw
  iotests/244: Test preallocation for data-file-raw

 block/qcow2.c              | 22 +++++++++++++
 tests/qemu-iotests/244     | 65 ++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/244.out | 32 ++++++++++++++++---
 3 files changed, 114 insertions(+), 5 deletions(-)

-- 
2.26.2


