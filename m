Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D97637DAF
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 17:42:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyFHI-0005pE-7X; Thu, 24 Nov 2022 11:40:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oyFHF-0005mR-PA
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 11:40:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oyFHE-00010n-2w
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 11:40:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669308037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UgFK2tp5bNMp3kYB5x2rGiAn+dtn7J1LrK1j1ezQ3AU=;
 b=OJPgPWJqXl8ZA15N77wgsql+c/rtZil4pKJgtQ9l6aumSajXHO0gIODTG0r/qp32tZKmWY
 9SvrCyT71WWLsRjZWLFJnz7dSwjdhjbtmMyL05WJwHnOU/IFHwuYtiPHzZo7AxZCJ92UNu
 UrlvTAx3dBSdBDsKXk8DBRxO6GeA0kc=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-554-AZazPnPOOuaqTrDB7wTl6A-1; Thu, 24 Nov 2022 11:40:36 -0500
X-MC-Unique: AZazPnPOOuaqTrDB7wTl6A-1
Received: by mail-qt1-f198.google.com with SMTP id
 fz10-20020a05622a5a8a00b003a4f466998cso2063390qtb.16
 for <qemu-devel@nongnu.org>; Thu, 24 Nov 2022 08:40:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UgFK2tp5bNMp3kYB5x2rGiAn+dtn7J1LrK1j1ezQ3AU=;
 b=lNCRyoSoKO+uSeEAA1gZrIRm19514owZ/I3HN7UnONYXgVGvkYXTD5TDaG5VOdbAHI
 pNRDRrBP/r/cUA/Y4rCanuEZXl0MmBaSCwNSkVH6Ku5tz1Jn5WnrjNttjoGIsjEpUWPA
 WGfI56cp6RsuZh5oO8P7C35yD5QAsRmKU3NPG4amUwstZ22Z585RbDwSmTEO7UOMXMFe
 UBAKc/Wosr9sBJllGJ6oDf2G+knL89NVaLjoVZJ1vLaxvQHFfiReQzoHOjlSjEHsC8FB
 6gso5L1YVbQ6m+8Kn8HsiOxYjvRRvqO0NxClNkkNl+00dvR5X+aksXuZcsq1UVcBvDDM
 +CWQ==
X-Gm-Message-State: ANoB5pmvAxeZKLs0LZ0zzZ7q5VXi3OyizcfA77k/DntItxF/f8Eyzs3S
 8Id7fUrK0aHa8SBYfJK30fcy/7KV/6mowpt0EenA3tV49IXE9YuxuE5kCBZQymIA1q4fU7qbkb9
 j56NgiYVon/aamn8=
X-Received: by 2002:ac8:6e84:0:b0:3a6:ef1:62a4 with SMTP id
 c4-20020ac86e84000000b003a60ef162a4mr14509375qtv.504.1669308036223; 
 Thu, 24 Nov 2022 08:40:36 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4JC6SvNo1e2G1T1YlfRID+Ujn/22TtQKP6cQMetW/UPt6wXLxUAAiVak0ngiaH0O+fd6k6mA==
X-Received: by 2002:ac8:6e84:0:b0:3a6:ef1:62a4 with SMTP id
 c4-20020ac86e84000000b003a60ef162a4mr14509356qtv.504.1669308035982; 
 Thu, 24 Nov 2022 08:40:35 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 h8-20020a05620a244800b006fa4a81e895sm1128867qkn.67.2022.11.24.08.40.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 08:40:35 -0800 (PST)
Date: Thu, 24 Nov 2022 11:40:34 -0500
From: Peter Xu <peterx@redhat.com>
To: Chuang Xu <xuchuangxclwt@bytedance.com>
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com,
 zhouyibo@bytedance.com, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH] migration: reduce time of loading non-iterable vmstate
Message-ID: <Y3+egjXTvLEHDjuT@x1n>
References: <20221118083648.2399615-1-xuchuangxclwt@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221118083648.2399615-1-xuchuangxclwt@bytedance.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

On Fri, Nov 18, 2022 at 04:36:48PM +0800, Chuang Xu wrote:
> The duration of loading non-iterable vmstate accounts for a significant
> portion of downtime (starting with the timestamp of source qemu stop and
> ending with the timestamp of target qemu start). Most of the time is spent
> committing memory region changes repeatedly.
> 
> This patch packs all the changes to memory region during the period of
> loading non-iterable vmstate in a single memory transaction. With the
> increase of devices, this patch will greatly improve the performance.
> 
> Here are the test results:
> test vm info:
> - 32 CPUs 128GB RAM
> - 8 16-queue vhost-net device
> - 16 4-queue vhost-user-blk device.
> 
> 	time of loading non-iterable vmstate
> before		about 210 ms
> after		about 40 ms
> 
> Signed-off-by: Chuang Xu <xuchuangxclwt@bytedance.com>

This is an interesting idea..  I think it means at least the address space
operations will all be messed up if happening during the precopy loading
progress, but I don't directly see its happening either.  For example, in
most post_load()s of vmsd I think the devices should just write directly to
its buffers, accessing MRs directly, even if they want DMAs or just update
fields to correct states.  Even so, I'm not super confident that holds
true, not to mention any other side effects (e.g., would we release bql
during precopy for any reason?).

Copy Paolo and PeterM for some extra eyes.

> ---
>  migration/migration.c | 1 +
>  migration/migration.h | 2 ++
>  migration/savevm.c    | 8 ++++++++
>  3 files changed, 11 insertions(+)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index e6f8bc2478..ed20704552 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -224,6 +224,7 @@ void migration_object_init(void)
>      qemu_sem_init(&current_incoming->postcopy_pause_sem_fast_load, 0);
>      qemu_mutex_init(&current_incoming->page_request_mutex);
>      current_incoming->page_requested = g_tree_new(page_request_addr_cmp);
> +    current_incoming->start_pack_mr_change = false;
>  
>      migration_object_check(current_migration, &error_fatal);
>  
> diff --git a/migration/migration.h b/migration/migration.h
> index 58b245b138..86597f5feb 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -186,6 +186,8 @@ struct MigrationIncomingState {
>       * contains valid information.
>       */
>      QemuMutex page_request_mutex;
> +
> +    bool start_pack_mr_change;
>  };
>  
>  MigrationIncomingState *migration_incoming_get_current(void);
> diff --git a/migration/savevm.c b/migration/savevm.c
> index 48e85c052c..a073009a74 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -2630,6 +2630,12 @@ retry:
>          switch (section_type) {
>          case QEMU_VM_SECTION_START:
>          case QEMU_VM_SECTION_FULL:
> +            /* call memory_region_transaction_begin() before loading non-iterable vmstate */
> +            if (section_type == QEMU_VM_SECTION_FULL && !mis->start_pack_mr_change) {
> +                memory_region_transaction_begin();
> +                mis->start_pack_mr_change = true;

This is slightly hacky to me.  Can we just wrap the begin/commit inside the
whole qemu_loadvm_state_main() call?

> +            }
> +
>              ret = qemu_loadvm_section_start_full(f, mis);
>              if (ret < 0) {
>                  goto out;
> @@ -2650,6 +2656,8 @@ retry:
>              }
>              break;
>          case QEMU_VM_EOF:
> +            /* call memory_region_transaction_commit() after loading non-iterable vmstate */
> +            memory_region_transaction_commit();
>              /* This is the end of migration */
>              goto out;
>          default:
> -- 
> 2.20.1
> 

-- 
Peter Xu


