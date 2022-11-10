Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A58866241EA
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 13:06:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot6IZ-0002HP-9s; Thu, 10 Nov 2022 07:04:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ot6IC-0002Gk-7n
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 07:04:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ot6I7-0004xe-1v
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 07:04:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668081857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h7LDJGgH+YxPFQxg2v6qobEvt+nM4w57fzUEAAlfxAo=;
 b=NdgCrDqTpkudGmL38m0D0SVgz6BvdzFbNIac+w9Ol6rqPQNIwckIwlDqcEf2kjnrPtYmYB
 RCrRN+vFJlvtkXDBxrUB8tI7HXZRMUzSWk6cKxAJFfHB56+ZAyuMc78iJjdrATfwGQ/VKB
 ZXibmd7HRKmMY0XE7HJ4jCEZltrnrHk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-101-Eteapp4nOf6j2XU80ijcvA-1; Thu, 10 Nov 2022 07:04:13 -0500
X-MC-Unique: Eteapp4nOf6j2XU80ijcvA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB003886461;
 Thu, 10 Nov 2022 12:04:12 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.15])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 92E2340C94AA;
 Thu, 10 Nov 2022 12:04:11 +0000 (UTC)
Date: Thu, 10 Nov 2022 13:04:10 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: Re: [PATCH for-7.2 1/5] block/mirror: Do not wait for active writes
Message-ID: <Y2zouho34jS+MRBM@redhat.com>
References: <20221109165452.67927-1-hreitz@redhat.com>
 <20221109165452.67927-2-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221109165452.67927-2-hreitz@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Am 09.11.2022 um 17:54 hat Hanna Reitz geschrieben:
> Waiting for all active writes to settle before daring to create a
> background copying operation means that we will never do background
> operations while the guest does anything (in write-blocking mode), and
> therefore cannot converge.  Yes, we also will not diverge, but actually
> converging would be even nicer.
> 
> It is unclear why we did decide to wait for all active writes to settle
> before creating a background operation, but it just does not seem
> necessary.  Active writes will put themselves into the in_flight bitmap
> and thus properly block actually conflicting background requests.
> 
> It is important for active requests to wait on overlapping background
> requests, which we do in active_write_prepare().  However, so far it was
> not documented why it is important.  Add such documentation now, and
> also to the other call of mirror_wait_on_conflicts(), so that it becomes
> more clear why and when requests need to actively wait for other
> requests to settle.
> 
> Another thing to note is that of course we need to ensure that there are
> no active requests when the job completes, but that is done by virtue of
> the BDS being drained anyway, so there cannot be any active requests at
> that point.
> 
> With this change, we will need to explicitly keep track of how many
> bytes are in flight in active requests so that
> job_progress_set_remaining() in mirror_run() can set the correct number
> of remaining bytes.
> 
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2123297
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>

Reviewed-by: Kevin Wolf <kwolf@redhat.com>

> @@ -1327,6 +1336,7 @@ do_sync_target_write(MirrorBlockJob *job, MirrorMethod method,
>          abort();
>      }
>  
> +    job->active_write_bytes_in_flight -= bytes;
>      if (ret >= 0) {
>          job_progress_update(&job->common.job, bytes);
>      } else {

Preexisting, but it happens to be in the context: Don't we need to call
job_progress_update() unconditionally? Otherwise, the total length will
go backwards in the case of an error.

Kevin


