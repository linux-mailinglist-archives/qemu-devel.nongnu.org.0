Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DED275A5C02
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 08:44:53 +0200 (CEST)
Received: from localhost ([::1]:56092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSuzU-0004Ai-HN
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 02:44:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oSutQ-000886-3p
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 02:38:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oSutM-0003Sj-IA
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 02:38:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661841511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=plqTo85vHXd0I2pmyxNKoqda3ZY0Fpxu7V3ilRktao0=;
 b=Y5dnm52oc3NzKmWuh0Swnoz2WVEuuLJrw4X2Im9TjekFO/nRZ5XDfcny2CvxBx4Fi8T7Fd
 XU0O+kYdqibDuBe0WwhY+Nxcz40lz6blaaqipIr1Hig+ra/7rbE/ijPu4JrZwCvMoc64GE
 cK7cm4VGSrvMrRg+vjFzFKZxauYzle0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-269-Hf5gtGeXOq2hX1NNBcsGcw-1; Tue, 30 Aug 2022 02:38:29 -0400
X-MC-Unique: Hf5gtGeXOq2hX1NNBcsGcw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 21D99185A79C
 for <qemu-devel@nongnu.org>; Tue, 30 Aug 2022 06:38:29 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EAA03C15BB3;
 Tue, 30 Aug 2022 06:38:28 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6C71A18000A3; Tue, 30 Aug 2022 08:38:27 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 0/2] usb/msd: fix guest-triggerable assert
Date: Tue, 30 Aug 2022 08:38:25 +0200
Message-Id: <20220830063827.813053-1-kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Gerd Hoffmann (2):
  usb/msd: move usb_msd_packet_complete()
  usb/msd: add usb_msd_fatal_error() and fix guest-triggerable assert

 include/hw/usb/msd.h |  1 +
 hw/usb/dev-storage.c | 56 ++++++++++++++++++++++++++++++++++----------
 hw/usb/trace-events  |  1 +
 3 files changed, 45 insertions(+), 13 deletions(-)

-- 
2.37.2


