Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4445AD40A
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 15:36:04 +0200 (CEST)
Received: from localhost ([::1]:40278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVCGh-00045v-1P
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 09:36:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oVBfp-0002Y5-Dq
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 08:57:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oVBfi-0001m7-Eg
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 08:57:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662382668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cy1PxnuMvxjQ/SxIrM9nRH1ZwgAoGScfuqrYBw7zXos=;
 b=ZqBBpbNOswT2+3SasNZ6U00SlgJXHAN0qhdHQnDy7H/676ohjPJsFRbhrufd5msqBh/Vug
 8GcQr9nntukXvo1OYqOQmZGMcARl7DbKduBRihmHiiXsqtKuOCcuh5lY5Qh3m0pMPmbTYm
 P0Uud9xm0SuHwCLgCHqg/CjKR/B5Gtw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-7bjVAsJzPvux5Im-EaVHoQ-1; Mon, 05 Sep 2022 08:57:45 -0400
X-MC-Unique: 7bjVAsJzPvux5Im-EaVHoQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F774801755;
 Mon,  5 Sep 2022 12:57:45 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5442340D296C;
 Mon,  5 Sep 2022 12:57:44 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qiaonuohan@cn.fujitsu.com,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 0/2] Fix dumping in kdump format with non-aligned memory
Date: Mon,  5 Sep 2022 16:57:39 +0400
Message-Id: <20220905125741.95516-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Hi,

dump.c:get_next_page expects GuestPhysBlock to be page-aligned, and crashes over
memory regions such as "tpm-crb-cmd". Teach it to handle non-aligned regions
too, by using a caller pre-allocated filled up page as necessary.

Fixes:
https://bugzilla.redhat.com/show_bug.cgi?id=2120480

v2:
 - drop some unnecessary changes in the first patch
 - use pre-allocated caller memory, instead of allocating in get_next_page()
 - fix some comment

Marc-André Lureau (2):
  dump: simplify a bit kdump get_next_page()
  dump: fix kdump to work over non-aligned blocks

 dump/dump.c | 88 +++++++++++++++++++++++++++++++++++------------------
 roms/SLOF   |  2 +-
 2 files changed, 59 insertions(+), 31 deletions(-)

-- 
2.37.2


