Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BA95A11FC
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 15:24:38 +0200 (CEST)
Received: from localhost ([::1]:59166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRCqb-0005tY-TJ
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 09:24:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oRCnl-0002LQ-7t
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 09:21:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oRCnQ-0000qv-Am
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 09:21:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661433677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sYVhepTbK8iVPilyyVDp9bzbzNUkA839olLrsr4GPFs=;
 b=EFRR1OXGWUKtZn1o+hoNMu6Nc8aXg4qsvKviGNtqcD4Sg4SXL2DtWBZv8GCrGAJBvJQZK3
 Hqog9Ftt+WiYvuS+9tKBylYPgbJIY8P20axRkwK7YaQxs6zKf1NUlNtJKSRXqipqnF85Av
 zV4eriKUYm8g1Mz3y4iEC71fdBeQCjY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-458-QecFCzTFOsakpHSEL4uEfg-1; Thu, 25 Aug 2022 09:21:16 -0400
X-MC-Unique: QecFCzTFOsakpHSEL4uEfg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C9464185A7BA;
 Thu, 25 Aug 2022 13:21:15 +0000 (UTC)
Received: from localhost (unknown [10.39.208.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C997840D2833;
 Thu, 25 Aug 2022 13:21:13 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qiaonuohan@cn.fujitsu.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Subject: [PATCH 0/2] Fix dumping in kdump format with non-aligned memory
Date: Thu, 25 Aug 2022 17:21:08 +0400
Message-Id: <20220825132110.1500330-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Hi,

dump.c:get_next_page expects GuestPhysBlock to be page-aligned, and crashes over
memory regions such as "tpm-crb-cmd". Teach it to handle non-aligned regions
too, by returning allocated and filled up pages as necessary.

Fixes:
https://bugzilla.redhat.com/show_bug.cgi?id=2120480

Marc-André Lureau (2):
  dump: simplify a bit kdump get_next_page()
  dump: fix kdump to work over non-aligned blocks

 dump/dump.c | 103 ++++++++++++++++++++++++++++++++++------------------
 1 file changed, 68 insertions(+), 35 deletions(-)

-- 
2.37.2


