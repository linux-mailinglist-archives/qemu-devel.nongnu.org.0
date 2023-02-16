Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B87FE699296
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 12:01:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSc0q-0000ca-Ht; Thu, 16 Feb 2023 06:01:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pSc0k-0000Vc-QE
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 06:01:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pSc0j-0005yF-9o
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 06:01:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676545268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UZj421a4563Z52uIrPkj1oqeDQmTA3Wji++5scDrC5s=;
 b=AojQGO75PCI4N1JMGurhnFv1R4xYqEsAJ8mKF8I4WkXgNpAhEFp/npIzkO8nGNwBhI8lWM
 eIadnUzB7xlm+k43Fh1ftP32YGRakY84R2eGjJyhx3Ot7AGgcJtUXcNLuHDPmWlX96PNB6
 iZXxv9LQNbYC599Bzt6tSzMW4ZgrOZE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-8QJwbJerOKy-bZpqH2Pg2Q-1; Thu, 16 Feb 2023 06:01:04 -0500
X-MC-Unique: 8QJwbJerOKy-bZpqH2Pg2Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 448DE2999B41;
 Thu, 16 Feb 2023 11:01:04 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E7F4C15BAD;
 Thu, 16 Feb 2023 11:01:03 +0000 (UTC)
Date: Thu, 16 Feb 2023 12:01:02 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Andrey Zhadchenko <andrey.zhadchenko@virtuozzo.com>
Cc: vsementsov@yandex-team.ru, hreitz@redhat.com, eblake@redhat.com,
 jsnow@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH] hbitmap: fix hbitmap_status() return value for first
 dirty bit case
Message-ID: <Y+4M7mpqUed0luQx@redhat.com>
References: <20230202181523.423131-1-andrey.zhadchenko@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230202181523.423131-1-andrey.zhadchenko@virtuozzo.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Am 02.02.2023 um 19:15 hat Andrey Zhadchenko via geschrieben:
> The last return statement should return true, as we already evaluated that
> start == next_dirty
> 
> Also, fix hbitmap_status() description in header
> 
> Cc: qemu-stable@nongnu.org
> Fixes: a6426475a75 ("block/dirty-bitmap: introduce bdrv_dirty_bitmap_status()")
> Signed-off-by: Andrey Zhadchenko <andrey.zhadchenko@virtuozzo.com>

Thanks, applied to the block branch.

Kevin


