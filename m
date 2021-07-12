Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 722CE3C62D3
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 20:42:51 +0200 (CEST)
Received: from localhost ([::1]:42512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m30tG-0002f4-3h
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 14:42:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m30rQ-0001s1-5c
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 14:40:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m30rN-0007L1-Lh
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 14:40:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626115252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ihz8YTlA52wV43a5ybK6aJCFcwoVSun5PgF7yEl0lNQ=;
 b=Nv3TNzGlC9BQFVVuymTew/N6j5WaE6iRDHL+0A5kk/YMW7WhPiwIlYtnoJyOW21/Pys+93
 udiTRLsaZQuTTRiy5+nWI08N6u6had1ZYgkfBuXB5sq/DyE9DRznrxvVl0oxjS4bOymJ9h
 iBfqpNb1VWwfARDnsIMwJYBPoiTfxNw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-ZrJTgi-QO2uWSfiEy1PfHQ-1; Mon, 12 Jul 2021 14:40:51 -0400
X-MC-Unique: ZrJTgi-QO2uWSfiEy1PfHQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 d16-20020a1c73100000b02901f2d21e46efso414096wmb.6
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 11:40:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ihz8YTlA52wV43a5ybK6aJCFcwoVSun5PgF7yEl0lNQ=;
 b=rb2uECjijNW6E322vGRid1ohpcDPKQUnI1DZRrrzcdcj0i9wdtDYLZ+oPuHB4ZyZQ0
 +Rn3+dWFJb4h1k9wjKCsAk4lWYIyOa5qZ2dLrNiXU0R+8gqzAxqMSDsNGQQ3OLGmE/RD
 Rdt6vlurQfR85juv4U6xGgcZ83i5KFYDC0S7Co7y4U1QRZNsEnaCQ2yhc1y0e9fsqR3l
 R5QFCdVkkQM45M0mUG8EN18L8Z7PKZ28a0Pwaq46L/gg2jYaoIlm5Ki+XMrqDIyiPPuw
 8DhyZ19YCvQ7Y7R8mEG8dRgeOBZdlPDFlm1HHRG3kYX5ZPw3RbtA1uGqa/OQ6ADB4CET
 1eGA==
X-Gm-Message-State: AOAM531QHXvSiL6Pp7qbaazd9QXU87cHAWHnrMzRYNjPVAM4rQchwx+O
 34nrHMRzATRSHdxWPK477uX8xt54bS2hjByc15YbmKkfCJMdJVzC8BJL+CSZQM+DLWa6S4mbDYX
 WgdUs8UK3/cXa5ns=
X-Received: by 2002:a5d:504d:: with SMTP id h13mr490836wrt.46.1626115250082;
 Mon, 12 Jul 2021 11:40:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxivsilOGdO4IvuH9KTE8UjfVLszvsa3QFeYnWn8KcfO5Yym1IjxaBBH0iMxA+3Knkmb3Gp0g==
X-Received: by 2002:a5d:504d:: with SMTP id h13mr490814wrt.46.1626115249916;
 Mon, 12 Jul 2021 11:40:49 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id b6sm209723wmj.34.2021.07.12.11.40.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 11:40:49 -0700 (PDT)
Date: Mon, 12 Jul 2021 19:40:47 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 3/3] migration: Clear error at entry of
 migrate_fd_connect()
Message-ID: <YOyMr1cxQ9PdU5TQ@work-vm>
References: <20210708190653.252961-1-peterx@redhat.com>
 <20210708190653.252961-4-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210708190653.252961-4-peterx@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Li Xiaohui <xiaohli@redhat.com>, Lukas Straub <lukasstraub2@web.de>,
 qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> For each "migrate" command, remember to clear the s->error before going on.
> For one reason, when there's a new error it'll be still remembered; see
> migrate_set_error() who only sets the error if error==NULL.  Meanwhile if a
> failed migration completes (e.g., postcopy recovered and finished), we
> shouldn't dump an error when calling migrate_fd_cleanup() at last.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/migration.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index bb1edf862a..338df01e97 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1855,6 +1855,15 @@ void migrate_set_error(MigrationState *s, const Error *error)
>      }
>  }
>  
> +static void migrate_error_free(MigrationState *s)
> +{
> +    QEMU_LOCK_GUARD(&s->error_mutex);
> +    if (s->error) {
> +        error_free(s->error);
> +        s->error = NULL;
> +    }
> +}
> +
>  void migrate_fd_error(MigrationState *s, const Error *error)
>  {
>      trace_migrate_fd_error(error_get_pretty(error));
> @@ -3966,6 +3975,13 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
>      int64_t rate_limit;
>      bool resume = s->state == MIGRATION_STATUS_POSTCOPY_PAUSED;
>  
> +    /*
> +     * If there's a previous error, free it and prepare for another one.
> +     * Meanwhile if migration completes successfully, there won't have an error
> +     * dumped when calling migrate_fd_cleanup().
> +     */
> +    migrate_error_free(s);
> +
>      s->expected_downtime = s->parameters.downtime_limit;
>      if (resume) {
>          assert(s->cleanup_bh);
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


