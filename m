Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE6040693F
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 11:45:40 +0200 (CEST)
Received: from localhost ([::1]:54780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOd6K-00043c-19
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 05:45:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mOd4w-0002gA-8l
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 05:44:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mOd4t-0006DX-7m
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 05:44:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631267050;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=wARH6z2SyjZ+R4tkuJHb0v6wlm1B7Q+iltI0FHD7tf8=;
 b=JowrIeOrIaBBclWt6SLV/LTETSKZ12BKGr9PAw6+uNkPTOoInDGXE4tKRabnPoprcX47Qq
 Lvn2hFAPiYzSvNVMHZ3oT3qizH8cWBGZpwhjZGFjAPvLL4DCXLLXtg9Fp6m26gBPwxMmmj
 15IcI5huh4RJh6lU+YbvkSgY7rZhby8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-eMzumOA2NI6uPaNTRqEIig-1; Fri, 10 Sep 2021 05:43:57 -0400
X-MC-Unique: eMzumOA2NI6uPaNTRqEIig-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B4B51084681;
 Fri, 10 Sep 2021 09:43:56 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.181])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CBEA10074E5;
 Fri, 10 Sep 2021 09:43:53 +0000 (UTC)
Date: Fri, 10 Sep 2021 10:43:50 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Ashish Kalra <Ashish.Kalra@amd.com>
Subject: Re: [PATCH v4 13/14] migration: for SEV live migration bump downtime
 limit to 1s.
Message-ID: <YTso1rziufm6Fi+j@redhat.com>
References: <cover.1628076205.git.ashish.kalra@amd.com>
 <b1468803a2200c3b5e1f1434eb74302ec4b824c6.1628076205.git.ashish.kalra@amd.com>
MIME-Version: 1.0
In-Reply-To: <b1468803a2200c3b5e1f1434eb74302ec4b824c6.1628076205.git.ashish.kalra@amd.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Thomas.Lendacky@amd.com, brijesh.singh@amd.com, ehabkost@redhat.com,
 jejb@linux.ibm.com, tobin@ibm.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 dovmurik@linux.vnet.ibm.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 04, 2021 at 11:59:47AM +0000, Ashish Kalra wrote:
> From: Ashish Kalra <ashish.kalra@amd.com>
> 
> Now, qemu has a default expected downtime of 300 ms and
> SEV Live migration has a page-per-second bandwidth of 350-450 pages
> ( SEV Live migration being generally slow due to guest RAM pages
> being migrated after encryption using the security processor ).
> With this expected downtime of 300ms and 350-450 pps bandwith,
> the threshold size = <1/3 of the PPS bandwidth = ~100 pages.
> 
> Now, this threshold size is the maximum pages/bytes that can be
> sent in the final completion phase of Live migration
> (where the source VM is stopped) with the expected downtime.
> Therefore, with the threshold size computed above,
> the migration completion phase which halts the source VM
> and then transfers the leftover dirty pages,
> is only reached in SEV live migration case when # of dirty pages are ~100.
> 
> The dirty-pages-rate with larger guest RAM configuration like 4G, 8G, etc.
> is much higher, typically in the range of 300-400+ pages, hence,
> we always remain in the "dirty-sync" phase of migration and never
> reach the migration completion phase with above guest RAM configs.
> 
> To summarize, with larger guest RAM configs,
> the dirty-pages-rate > threshold_size (with the default qemu expected downtime of 300ms).
> 
> So, the fix is to increase qemu's expected downtime.
> 
> This is a tweakable parameter which can be set using "migrate_set_downtime".
> 
> With a downtime of 1 second, we get a threshold size of ~350-450 pages,
> which will handle the "dirty-pages-rate" of 300+ pages and complete
> the migration process, so we bump the default downtime to 1s in case
> of SEV live migration being active.
> 
> Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
> ---
>  migration/migration.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index daea3ecd04..c9bc33fb10 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -3568,6 +3568,10 @@ static void migration_update_counters(MigrationState *s,
>      transferred = current_bytes - s->iteration_initial_bytes;
>      time_spent = current_time - s->iteration_start_time;
>      bandwidth = (double)transferred / time_spent;
> +    if (memcrypt_enabled() &&
> +        s->parameters.downtime_limit < 1000) {
> +        s->parameters.downtime_limit = 1000;
> +    }

I don't think we can be silently changing a value set by the mgmt
app. If the app requests 300 ms downtime, then we *must* honour
that, because it is driven by the SLA they need to privide to the
guest user's workload. If it means the migration won't complete,
it is up to the app to deal with that in some manner.

At most I think this is a documentation task to give guidance to
mgmt apps about what special SEV-only things to consider whe tuning
live migration.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


