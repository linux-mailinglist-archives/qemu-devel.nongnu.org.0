Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 136FE587671
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 06:49:42 +0200 (CEST)
Received: from localhost ([::1]:34906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIjqe-0004m8-O3
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 00:49:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oIjo9-0008C3-QM
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 00:47:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oIjo5-0004WA-LV
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 00:47:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659415620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gI+BUH9sThLsdeqg2RCNVPoYlJkkDTGoe4ll1CR0F6g=;
 b=Co9/oYhSfZQmhY6X2NwFuegm2YpxN8GhoBP2/t2eTGRLk2YCp/BizE/vFE1yVkTEUcn+HG
 Y106aFSLPX9RRJHsra706jALASk91tRpSGUf7E2fNI7H0Clvz/P0cz0kTt5/Ue7NJQnJkf
 6bD8L66dc27cYIN2lZ23we6huTnQE/k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-8-6z85BxbhPr679YZziNP0YA-1; Tue, 02 Aug 2022 00:45:38 -0400
X-MC-Unique: 6z85BxbhPr679YZziNP0YA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E343101A58E;
 Tue,  2 Aug 2022 04:45:38 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-18.bne.redhat.com [10.64.54.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 411F9492C3B;
 Tue,  2 Aug 2022 04:45:34 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, eric.auger@redhat.com, cohuck@redhat.com,
 zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: [PATCH 0/2] hw/arm/virt: Improve address assignment for highmem IO
 regions
Date: Tue,  2 Aug 2022 14:45:27 +0800
Message-Id: <20220802064529.547361-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

There are 3 highmem IO regions on arm/virt machine. Their base addresses
are determined dynamically. However, there are several issues I can see
in current implementation:

(1) The memory region's base address and highest_gpa are always updated
    no matter even if the memory region has been disabled. It's incorrectly
    incurring waste in the PA space.

(2) One particular memory region can be silently disabled due to the PA
    limit. We need warn users in this case. The warning messages are
    helpful to identify the cause of potential issues in future.

The issue (1) and (2) are fixed by PATCH[1] and PATCH[2] separately.

Gavin Shan (2):
  hw/arm/virt: Improve address assignment for highmem IO regions
  hw/arm/virt: Warn when high memory region is disabled

 hw/arm/virt.c | 72 +++++++++++++++++++++++++++++++++++----------------
 1 file changed, 49 insertions(+), 23 deletions(-)

-- 
2.23.0


