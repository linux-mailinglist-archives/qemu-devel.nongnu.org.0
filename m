Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F86454539D
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 20:03:49 +0200 (CEST)
Received: from localhost ([::1]:59684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzMVY-0007SA-5q
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 14:03:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nzLJX-0000UM-2Y
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:47:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nzLJV-0006UN-Ij
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:47:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654793237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7jWnR4+sNH/cRLOLERSr+eTjxamfHsT6gaSDrzvukIU=;
 b=d8kOI7VR4yhBngTjPx+/dCaEtYUQLvf7MMeJZq1sJmXIV1rga8RnfRD/FuXqZcu0wJjkMT
 QxD0tS2eJjLHeLQMFCEObDyw50wiA5L5AxBuiTw6eRjVT0mcnCpsP+yk6TVVqfMfJZjmXw
 OBLulSwuRgBdYITTYaZKg+psbXEj3q8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-TeyWiz1LOfijCpiRFPEW9Q-1; Thu, 09 Jun 2022 12:47:13 -0400
X-MC-Unique: TeyWiz1LOfijCpiRFPEW9Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 709E6294EDDF;
 Thu,  9 Jun 2022 16:47:13 +0000 (UTC)
Received: from localhost (unknown [10.39.193.205])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 096CF40466A4;
 Thu,  9 Jun 2022 16:47:12 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, qemu-stable@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH 0/2] linux-aio: fix unbalanced plugged counter in
 laio_io_unplug()
Date: Thu,  9 Jun 2022 17:47:10 +0100
Message-Id: <20220609164712.1539045-1-stefanha@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

An unlucky I/O pattern can result in stalled Linux AIO requests when the
plugged counter becomes unbalanced. See Patch 1 for details.

Patch 2 adds a comment to explain why the laio_io_unplug() even checks max
batch in the first place.

Stefan Hajnoczi (2):
  linux-aio: fix unbalanced plugged counter in laio_io_unplug()
  linux-aio: explain why max batch is checked in laio_io_unplug()

 block/linux-aio.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

-- 
2.36.1


