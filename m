Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC786731E0
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 07:42:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIOar-0003Vr-Jd; Thu, 19 Jan 2023 01:40:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIOak-0003V7-TI
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 01:40:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIOaj-0005I2-3R
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 01:40:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674110403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=nrrOHdK4M2+Mn5/5ZkBUCKzEwmuJ39sQyGfLyoNWELM=;
 b=S3WwrWeStvUxgbEN8KfS5ZeT3cBhFZMaxy4d8PnbBYe4XxYbIlGt2t4ET2cXEVOc51PH3O
 3AUshwy0b3iD2i8eJKcgLEye9CpX1JA7bI0ioq249jOpagCB7lCPdTeF2mh8axtXOKewGl
 FGMruBoNaIspgyxCk3scP7b5YtAv92k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-189-HWq_BYniPMWZh8UorSXVVg-1; Thu, 19 Jan 2023 01:40:01 -0500
X-MC-Unique: HWq_BYniPMWZh8UorSXVVg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8052438123BB;
 Thu, 19 Jan 2023 06:40:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 48B8D51EF;
 Thu, 19 Jan 2023 06:40:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1EB9921E6A28; Thu, 19 Jan 2023 07:40:00 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>, Juan Quintela
 <quintela@redhat.com>, Dr. David Alan Gilbert <dgilbert@redhat.com>, Peter
 Xu <peterx@redhat.com>
Subject: Who maintains util/userfaultfd.c?
Date: Thu, 19 Jan 2023 07:40:00 +0100
Message-ID: <873587yqm7.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

commit 0e9b5cd6b238b7ca9a3a50d957f50c37082705a0
Author: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Date:   Fri Jan 29 13:14:04 2021 +0300

    migration: introduce UFFD-WP low-level interface helpers
    
    Glue code to the userfaultfd kernel implementation.
    Querying feature support, createing file descriptor, feature control,
    memory region registration, IOCTLs on registered registered regions.
    
    Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
    Reviewed-by: Peter Xu <peterx@redhat.com>
    Message-Id: <20210129101407.103458-3-andrey.gruzdev@virtuozzo.com>
    Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
      Fixed up range.start casting for 32bit

added util/userfaultfd.c without covering it in MAINTAINERS.  Only user
is migration/ram.c, as far as I can tell.  Should it be added to
MAINTAINERS section "Migration"?


