Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 069BD2948B9
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Oct 2020 09:17:16 +0200 (CEST)
Received: from localhost ([::1]:52712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kV8My-0002nS-1U
	for lists+qemu-devel@lfdr.de; Wed, 21 Oct 2020 03:17:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kV8LL-0001ph-B6
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 03:15:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kV8LJ-0005ga-4R
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 03:15:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603264528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lXMAiTbPKNTx/ISsExmd+p3DvRtvU4nidBDV+40ePkY=;
 b=HSAZMQg8kgBuFLF2aeOGN8UATTihDvBGNauL2OHY1IY7mQkHmkv4Sj0UFaTXdcVq9i/h+2
 8odKfPn/eHuJa5vgIB+9+O9APN9mee/TzxSY5NwkkssVHahDCWZ8AZahRXcrndzcOnKTT3
 gSNy2kx/Rq4gKfWe81WUfw1OchcuBlU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-uX800p5PNcaoxqAgogqjtw-1; Wed, 21 Oct 2020 03:15:26 -0400
X-MC-Unique: uX800p5PNcaoxqAgogqjtw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F10DE18A8224;
 Wed, 21 Oct 2020 07:15:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CB2375D9EF;
 Wed, 21 Oct 2020 07:15:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1D34B1132A08; Wed, 21 Oct 2020 09:15:20 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] qga: Fix several guest-get-devices issues
Date: Wed, 21 Oct 2020 09:15:16 +0200
Message-Id: <20201021071520.2168877-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/21 02:16:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: marcandre.lureau@redhat.com, tgolembi@redhat.com, philmd@redhat.com,
 mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To be frank, I'm disappointed the code passed review in this state.
There are excuses for each of the issues addressed in this series
(PATCH 1 naming is hard, PATCH 2 recognizing non-local relations is
hard, PATCH 3 mistakes on error paths are easy to miss, PATCH 4 can't
expect all reviewers to know "no more simple unions, please").  Still,
having so many of them escape notice is disappointing.

Please review.

Markus Armbruster (4):
  qga: Rename guest-get-devices return member 'address' to 'id'
  qga: Use common time encoding for guest-get-devices 'driver-date'
  qga-win: Fix guest-get-devices error API violations
  qga: Flatten simple union GuestDeviceId

 qga/qapi-schema.json | 29 +++++++++++++++++++----------
 qga/commands-win32.c | 39 ++++++++++++++++++++-------------------
 2 files changed, 39 insertions(+), 29 deletions(-)

-- 
2.26.2


