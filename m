Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E37D558510A
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 15:44:21 +0200 (CEST)
Received: from localhost ([::1]:56118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHQHs-0007fe-N6
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 09:44:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oHQ7T-0003z7-Tz
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 09:33:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oHQ7P-00085F-E5
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 09:33:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659101610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dSq9OoBzQA7mygE2anW8qfGxnTguRKETJgVG0KTrzZY=;
 b=dvgBRfjzuJgmdt1ewR9aQNXFSAw6KZnP/RnhDrdUvBwAnOLUwvIKXTCWqeZizF+yZL6bIO
 K7x/BUSbHIBsLYaIrLTSJ7yw/FYEU68zIo8d4SqObYdeco8tk40QGe2482zTF5DAhxQZUB
 ORFBupoYnTb9+h8el8XRR1BgkyJM9Ng=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-cf-LVDdAPf-FboYMkUyjpg-1; Fri, 29 Jul 2022 09:33:26 -0400
X-MC-Unique: cf-LVDdAPf-FboYMkUyjpg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D030B1C06911;
 Fri, 29 Jul 2022 13:33:25 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.195])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CFBF4492C3B;
 Fri, 29 Jul 2022 13:33:21 +0000 (UTC)
Date: Fri, 29 Jul 2022 15:33:20 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: Re: [PATCH v10 05/21] job.c: add job_lock/unlock while keeping job.h
 intact
Message-ID: <YuPhoADDYMgccXBk@redhat.com>
References: <20220725073855.76049-1-eesposit@redhat.com>
 <20220725073855.76049-6-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220725073855.76049-6-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Am 25.07.2022 um 09:38 hat Emanuele Giuseppe Esposito geschrieben:
> With "intact" we mean that all job.h functions implicitly
> take the lock. Therefore API callers are unmodified.
> 
> This means that:
> - many static functions that will be always called with job lock held
>   become _locked, and call _locked functions
> - all public functions take the lock internally if needed, and call _locked
>   functions
> - all public functions called internally by other functions in job.c will have a
>   _locked counterpart (sometimes public), to avoid deadlocks (job lock already taken).
>   These functions are not used for now.
> - some public functions called only from exernal files (not job.c) do not
>   have _locked() counterpart and take the lock inside. Others won't need
>   the lock at all because use fields only set at initialization and
>   never modified.
> 
> job_{lock/unlock} is independent from real_job_{lock/unlock}.
> 
> Note: at this stage, job_{lock/unlock} and job lock guard macros
> are *nop*
> 
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Would be nice to fix the access Vladimir found, but I think it's not
actually a bug because we know that nobody else is going to write to
job->ret. So with or without that fix:

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


