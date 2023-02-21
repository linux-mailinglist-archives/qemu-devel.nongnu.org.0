Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8989269DED5
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 12:28:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUQof-00016z-II; Tue, 21 Feb 2023 06:28:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pUQoa-0000xP-UO
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 06:28:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pUQoZ-0004Kd-F3
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 06:28:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676978886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BWnc2ADAYAdseJ6af8On1kY2jQfo3zHjQ1slAxJqsnQ=;
 b=JbQLwAcrtfNpbm8NMua94d35WiTnAi9llBNCeh4wc3eZB+4Lgi1CL25Z43iyCE94J4r8of
 uoVhJeKom3Bv+giUYtTqlYHNY/WOcl88c+hd3M9SPocdMUKJyzQc1B9McxDClAZTEu0Lqn
 pXnpQqTZbWu0B4yG25n/gH4WCnfVBqI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-imXMJvFyMYS4dfoIbyCaQw-1; Tue, 21 Feb 2023 06:28:00 -0500
X-MC-Unique: imXMJvFyMYS4dfoIbyCaQw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C62A3813F23;
 Tue, 21 Feb 2023 11:28:00 +0000 (UTC)
Received: from redhat.com (dhcp-192-225.str.redhat.com [10.33.192.225])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E5807C15BAD;
 Tue, 21 Feb 2023 11:27:57 +0000 (UTC)
Date: Tue, 21 Feb 2023 12:27:56 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Fiona Ebner <f.ebner@proxmox.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "Denis V. Lunev" <den@virtuozzo.com>, qemu-devel@nongnu.org,
 t.lamprecht@proxmox.com, jsnow@redhat.com, hreitz@redhat.com,
 eblake@redhat.com, armbru@redhat.com, qemu-block@nongnu.org,
 Alexander Ivanov <alexander.ivanov@virtuozzo.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH] block/mirror: add 'write-blocking-after-ready' copy mode
Message-ID: <Y/SqvDEg/hlb+ZEs@redhat.com>
References: <20221207132719.131227-1-f.ebner@proxmox.com>
 <c120932d-a1a7-5904-3f17-10a7c9ac69af@yandex-team.ru>
 <926be172-1d8a-e896-c051-3c37d048771b@virtuozzo.com>
 <c3982fa3-be00-9cb2-7d71-5f784ac80864@proxmox.com>
 <Y9uf1wlXQd4EIwxO@redhat.com>
 <40969191-9a16-0550-e999-bc44584d81fb@proxmox.com>
 <182b70d7-5123-8bc3-e855-c4bf174e98a1@yandex-team.ru>
 <d03ebb21-999f-fac2-44b0-0a6a1ca3c5ca@proxmox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d03ebb21-999f-fac2-44b0-0a6a1ca3c5ca@proxmox.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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

Am 21.02.2023 um 11:57 hat Fiona Ebner geschrieben:
> Am 14.02.23 um 17:19 schrieb Vladimir Sementsov-Ogievskiy:
> > On 02.02.23 16:27, Fiona Ebner wrote:
> >> Am 02.02.23 um 12:34 schrieb Kevin Wolf:
> >>> But having to switch the mirror job to sync mode just to avoid doing I/O
> >>> on an inactive device sounds wrong to me. It doesn't fix the root cause
> >>> of that problem, but just papers over it.
> >>
> >> If you say the root cause is "the job not being completed before
> >> switchover", then yes. But if the root cause is "switchover happening
> >> while the drive is not actively synced", then a way to switch modes can
> >> fix the root cause :)
> >>
> >>>
> >>> Why does your management tool not complete the mirror job before it
> >>> does the migration switchover that inactivates images?
> >>
> >> I did talk with my team leader about the possibility, but we decided to
> >> not go for it, because it requires doing the migration in two steps with
> >> pause-before-switchover and has the potential to increase guest downtime
> >> quite a bit. So I went for this approach instead.
> >>
> > 
> > 
> > Interesting point. Maybe we need a way to automatically complete all the
> > jobs before switchower?  It seems no reason to break the jobs if user
> > didn't cancel them. (and of course no reason to allow a code path
> > leading to assertion).
> > 
> 
> Wouldn't that be a bit unexpected? There could be jobs unrelated to
> migration or jobs at early stages. But sure, being able to trigger the
> assertion is not nice.
> 
> Potential alternatives could be pausing the jobs or failing migration
> with a clean error?

I wonder if the latter is what we would get if child_job.inactivate()
just returned an error if the job isn't completed yet?

It would potentially result in a mix of active and inactive BDSes,
though, which is a painful state to be in. If you don't 'cont'
afterwards, you're likely to hit another assertion once you try to do
something with an inactive BDS.

Pausing the job feels a bit dangerous, because it means that you can
resume it as a user. We'd have to add code to check that the image has
actually been activated again before we allow to resume the job.

> For us, the former is still best done in combination with a way to
> switch to active (i.e. write-blocking) mode for drive-mirror.

Switching between these modes is a useful thing to have either way.

> The latter would force us to complete the drive-mirror job before
> switchover even with active (i.e. write-blocking) mode, breaking our
> usage of drive-mirror+migration that worked (in almost all cases, but it
> would have been all cases if we had used active mode ;)) for many years now.
> 
> Maybe adding an option for how the jobs should behave upon switchover
> (e.g. complete/pause/cancel/cancel-migration) could help? Either as a
> job-specific option (more flexible) or a migration option?

Kevin


