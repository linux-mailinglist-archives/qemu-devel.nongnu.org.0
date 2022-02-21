Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D364BDB1D
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 18:13:55 +0100 (CET)
Received: from localhost ([::1]:51822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMCG2-0007fZ-5E
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 12:13:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nMCBF-0001xt-FP
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 12:08:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nMCBB-0005C0-74
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 12:08:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645463330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zkPHvUfRHDEHlpJR7DJprHd10B09INTvZHEYWbQ+lQQ=;
 b=evTWlrj0OL0VfnrhnnYOEaNf7VmdDK3VDnJBzGfaPbO/CEt/JXNycLWc7vHzQiRbgaRL+7
 mbyipOKFFJdOHxo9RqEnPc5vO8TZRi/wHSmdhywCxamWr929DfRib3O+tXgEeCFG6X4Nrv
 8FPLGqhco5qnsL8/AnNqWc94iHPdQTU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-100-DErkr3H-Noy5WVjlYYA2_w-1; Mon, 21 Feb 2022 12:08:49 -0500
X-MC-Unique: DErkr3H-Noy5WVjlYYA2_w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6058A81424E;
 Mon, 21 Feb 2022 17:08:48 +0000 (UTC)
Received: from localhost (unknown [10.39.193.15])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 08FF484A2F;
 Mon, 21 Feb 2022 17:08:46 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/2] iotests: Check for zstd support
Date: Mon, 21 Feb 2022 18:08:43 +0100
Message-Id: <20220221170845.628429-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

We have two tests (as far as I know) that use compression_type=zstd for
qcow2 but do not check whether that is actually supported.  Thomas
reported this for 065, but it’s also the case for 303.

This series makes these tests be skipped when qemu-img reports this
compression type to not be supported.


Hanna Reitz (2):
  iotests/065: Check for zstd support
  iotests/303: Check for zstd support

 tests/qemu-iotests/065 | 11 ++++++++---
 tests/qemu-iotests/303 | 15 +++++++++++----
 2 files changed, 19 insertions(+), 7 deletions(-)

-- 
2.34.1


