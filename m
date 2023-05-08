Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFD56FA895
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 12:43:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvyKL-000822-AG; Mon, 08 May 2023 06:42:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pvyKJ-0007xd-1r
 for qemu-devel@nongnu.org; Mon, 08 May 2023 06:42:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pvyKH-00075N-Lv
 for qemu-devel@nongnu.org; Mon, 08 May 2023 06:42:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683542560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qr4q9brpo2py4ETPWJWnANaNSxMb/qfXs/mou7LrCIQ=;
 b=HEc6GXM6FnckfSkVXi+rjjhuf5N9qZi9YiKHkjm6o3WqZviD6qAZ344ghzbhsplQd8Hnt8
 KAAv/7MFFZXFX52xqgftzl2njRnYmYSTqk405lZaK9yHELknCygMDAfMzIWLH8pfx9/Uis
 1hm/o21uUgOka1ayj6L58KvgbFsZlVw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-126-9s-75S9ZNWmHND629oRkCA-1; Mon, 08 May 2023 06:42:39 -0400
X-MC-Unique: 9s-75S9ZNWmHND629oRkCA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E3B3480080E
 for <qemu-devel@nongnu.org>; Mon,  8 May 2023 10:42:38 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.102])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 078AD492C13;
 Mon,  8 May 2023 10:42:37 +0000 (UTC)
Date: Mon, 8 May 2023 12:42:36 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Peter Xu <peterx@redhat.com>, Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH] migration: Attempt disk reactivation in more failure
 scenarios
Message-ID: <ZFjSHEZE7DPQhW+3@redhat.com>
References: <20230502205212.134680-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230502205212.134680-1-eblake@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Am 02.05.2023 um 22:52 hat Eric Blake geschrieben:
> Commit fe904ea824 added a fail_inactivate label, which tries to
> reactivate disks on the source after a failure while s->state ==
> MIGRATION_STATUS_ACTIVE, but didn't actually use the label if
> qemu_savevm_state_complete_precopy() failed.  This failure to
> reactivate is also present in commit 6039dd5b1c (also covering the new
> s->state == MIGRATION_STATUS_DEVICE state) and 403d18ae (ensuring
> s->block_inactive is set more reliably).
> 
> Consolidate the two labels back into one - no matter HOW migration is
> failed, if there is any chance we can reach vm_start() after having
> attempted inactivation, it is essential that we have tried to restart
> disks before then.  This also makes the cleanup more like
> migrate_fd_cancel().
> 
> Suggested-by: Kevin Wolf <kwolf@redhat.com>
> Signed-off-by: Eric Blake <eblake@redhat.com>

Thanks, applied to the block branch.

Kevin


