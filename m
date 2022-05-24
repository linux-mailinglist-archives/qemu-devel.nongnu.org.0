Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F5E532D29
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 17:17:28 +0200 (CEST)
Received: from localhost ([::1]:39728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntWHm-0006Qm-Pz
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 11:17:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ntWFd-0005VA-Q7
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:15:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ntWBz-0008A2-Kv
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:15:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653405085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=inVPxSaW16keMm37k0MyUOfNy9AT91LtzmrnYKe8EUc=;
 b=b9cdrMCl7EWHYDeQkAqlDw87vaX2w80QF5aQn4AgZNlCCl98E4tewNpXTovG8ZRBHPPXIc
 oSzKHBdgQqlLt9x0ma2xfXVEg57W1jn8cd7xg+IQVHauR7i4/rYwQfGRDsTLnoQCDkrSN3
 UruXdoOLQQyWr+/T2Dsbxrq5q5nAu6o=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-253-PMEZOS3EMoyVjtBlr5bvVg-1; Tue, 24 May 2022 11:10:23 -0400
X-MC-Unique: PMEZOS3EMoyVjtBlr5bvVg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4EC11C00145;
 Tue, 24 May 2022 15:10:22 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E9A252166B29;
 Tue, 24 May 2022 15:10:21 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, f4bug@amsat.org,
 yang.zhong@intel.com
Subject: [PATCH 0/2] i386: fixup number of logical CPUs when host-cache-info=on
Date: Tue, 24 May 2022 11:10:18 -0400
Message-Id: <20220524151020.2541698-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Igor Mammedov (2):
  x86: cpu: make sure number of addressable IDs for processor cores
    meets the spec
  x86: cpu: fixup number of addressable IDs for logical processors
    sharing cache

 target/i386/cpu.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

-- 
2.31.1


