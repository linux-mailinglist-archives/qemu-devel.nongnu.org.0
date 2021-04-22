Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D52C3682E1
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 17:00:25 +0200 (CEST)
Received: from localhost ([::1]:34078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZaoa-0002wE-7K
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 11:00:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lZajn-0007rf-C2
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 10:55:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lZajl-0000b2-VS
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 10:55:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619103325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0gJiwFSYlYMShATpeWF7l+NE4/o8lz6VkGas6GIhBBA=;
 b=LPn3p+bbHvXPjGPf32KPex+mFpdL/DEG/YalGIe1jHKOh0sB9X6uzqeUz+awYTvEHOyLbt
 Rpz2CGIfluEfDB4cW/aJmyufVid+ZvNfYgAr4BkTFdkYf6+XD0p8q6teNilCEEhYiutfTH
 8CxZHrZ9WPgkwC0hcHAgmpB/oQifxB0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-GhzYBFxbOPev6wexO_dViw-1; Thu, 22 Apr 2021 10:55:23 -0400
X-MC-Unique: GhzYBFxbOPev6wexO_dViw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29E761084430;
 Thu, 22 Apr 2021 14:53:41 +0000 (UTC)
Received: from localhost (ovpn-113-187.ams2.redhat.com [10.36.113.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E36610023AE;
 Thu, 22 Apr 2021 14:53:37 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/2] block/export: Fix crash on error after iothread conflict
Date: Thu, 22 Apr 2021 16:53:33 +0200
Message-Id: <20210422145335.65814-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

By passing the @iothread option to block-export-add, the new export can
be moved to the given iothread.  This may conflict with an existing
parent of the node in question.  How this conflict is resolved, depends
on @fixed-iothread: If that option is true, the error is fatal and
block-export-add fails.  If it is false, the error is ignored and the
node stays in its original iothread.

However, in the implementation, the ignored error is still in *errp, and
so if a second error occurs afterwards and tries to put something into
*errp, that will fail an assertion.

To really ignore the error, we have to free it and clear *errp (with an
ERRP_GUARD()).

Patch 1 is the fix, patch 2 a regression test.


Max Reitz (2):
  block/export: Free ignored Error
  iotests/307: Test iothread conflict for exports

 block/export/export.c      |  4 ++++
 tests/qemu-iotests/307     | 15 +++++++++++++++
 tests/qemu-iotests/307.out |  8 ++++++++
 3 files changed, 27 insertions(+)

-- 
2.30.2


