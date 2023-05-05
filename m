Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 979326F7D87
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 09:12:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pupbJ-0004mt-Rn; Fri, 05 May 2023 03:11:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pupbD-0004lN-5h
 for qemu-devel@nongnu.org; Fri, 05 May 2023 03:11:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pupbA-0000eY-2n
 for qemu-devel@nongnu.org; Fri, 05 May 2023 03:11:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683270681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dHkl/2JM8WQl1iLLdG+EMlYIuFkMov7BR2Sp0E9Y2IU=;
 b=d2QFHLvYmlZVUhzLLGJnBZ7rYs+LwRRla786v8X0m9lgsyZpMwJklSK+OrAr86HJhuV07f
 lmvUmR0w8uuaYQqV3SB//7N/zG8edlEQyBAJPbsLA9K7gzUEQrI4iFn/hpF3g8c+dwj3O4
 u05mBvB5EWzZXLLfRRk1h6+DCnGbHvo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-CaGjjdNiPQCBBEJvg0fu0g-1; Fri, 05 May 2023 03:11:19 -0400
X-MC-Unique: CaGjjdNiPQCBBEJvg0fu0g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 328BC84AF34;
 Fri,  5 May 2023 07:11:19 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.60])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F242914152F6;
 Fri,  5 May 2023 07:11:18 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BA8DB18000A6; Fri,  5 May 2023 09:11:17 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: seabios@seabios.org
Cc: qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v3 0/6] misc tweaks for kvm and the 64bit pci window
Date: Fri,  5 May 2023 09:11:11 +0200
Message-Id: <20230505071117.369471-1-kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

v3 changes:
 - rename variables, use u8 for CPULongMode.
v2 changes:
 - e820 conflict fix

Gerd Hoffmann (6):
  better kvm detection
  detect physical address space size
  move 64bit pci window to end of address space
  be less conservative with the 64bit pci io window
  qemu: log reservations in fw_cfg e820 table
  check for e820 conflict

 src/e820map.h     |  1 +
 src/fw/paravirt.h |  2 ++
 src/e820map.c     | 15 +++++++++
 src/fw/paravirt.c | 86 ++++++++++++++++++++++++++++++++++++++++++-----
 src/fw/pciinit.c  | 20 ++++++++++-
 5 files changed, 114 insertions(+), 10 deletions(-)

-- 
2.40.1


