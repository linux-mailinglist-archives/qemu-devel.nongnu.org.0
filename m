Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C69667E17
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 19:24:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG2F3-0002i8-8l; Thu, 12 Jan 2023 13:23:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pG2Ez-0002cR-TJ
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 13:23:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pG2Ey-0000hz-CK
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 13:23:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673547831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y+osxrYtWXXLKGKEKxmJIszP5jVp75hxyKd6eFYrC4I=;
 b=YT1pYPKsKyKgpw/aIbNws1hZCmlJQR9CnzEMgY2Gl+xqlqY7v890ddLT2ILcQbaN6GR0CG
 GNsEI0fV+1+N3MUJyHEE+6zRVZ3PZ0ykcMOTJgpyYJpAni/gqnAX3dObL92H5xjxiSq1ue
 ot5P5MN5Oh3iVp19d6PcqTNHextvxYk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-96-9SygoOi4NaKVKn6bCE-8Dw-1; Thu, 12 Jan 2023 13:23:49 -0500
X-MC-Unique: 9SygoOi4NaKVKn6bCE-8Dw-1
Received: by mail-wr1-f69.google.com with SMTP id
 d27-20020adfa35b000000b002bc813ba677so2604011wrb.6
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 10:23:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y+osxrYtWXXLKGKEKxmJIszP5jVp75hxyKd6eFYrC4I=;
 b=4MaBSRq4PhYTzLDQCs1SM85h6z2qsOuy17wbGgewJWjL6QiuKhM5KwbnLb4W8EeMKQ
 SCNnPVk71NZ6xGf0Kme+IJjnJ1oYV7ulx0fIVGYwK9JvEaENKHErqkSDQtC5Da2X799x
 UcCblZQShweJCnSFg6hnFmzYRcg8NpdiJiLc7jhVBSAc0KWo7DpDhzsVAwDyFifQXsYD
 xCtgFmM3DKLBfT6+nBM5uTois3TO6e1NLE/jCjxPj3EVY9U+K2/wlZsL2s2beUPtQCO4
 qZa2kLoqXw/FXABqgrUtagMpApC+Vk5/Bi3ksg5eLujECm2oRye3S2XVaLdooUhOd8LE
 8xyw==
X-Gm-Message-State: AFqh2kqXyibyrLXhWxC7rmDeEmr8StBYFugzJbXs2m1mfclwjQtqEpOP
 9YTg4tPtvdXODDnKCjgbMoQVO+xQ6WnJf80VjNKA56S3cZQU7kLfnvZaSHGYUYVWXwxBxLsRfLS
 3r64KIUdbKHXCBNQ=
X-Received: by 2002:a05:600c:b4d:b0:3d3:5d69:7aa5 with SMTP id
 k13-20020a05600c0b4d00b003d35d697aa5mr54532308wmr.25.1673547828096; 
 Thu, 12 Jan 2023 10:23:48 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuqGsfnfIViRFKHjKF+LscmWXEgbKpzzOhHjD3Wv4RTeKdWrleFdcDXP7MK5iw3KhhbFmW8rA==
X-Received: by 2002:a05:600c:b4d:b0:3d3:5d69:7aa5 with SMTP id
 k13-20020a05600c0b4d00b003d35d697aa5mr54532296wmr.25.1673547827897; 
 Thu, 12 Jan 2023 10:23:47 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a05600c19cd00b003c6f1732f65sm29729724wmq.38.2023.01.12.10.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 10:23:47 -0800 (PST)
Date: Thu, 12 Jan 2023 18:23:45 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
Subject: Re: [PATCH v3 5/8] migration/ram: Factor out check for advised
 postcopy
Message-ID: <Y8BQMULsYfV/31yB@work-vm>
References: <20230112164403.105085-1-david@redhat.com>
 <20230112164403.105085-6-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230112164403.105085-6-david@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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

* David Hildenbrand (david@redhat.com) wrote:
> Let's factor out this check, to be used in virtio-mem context next.
> 
> While at it, fix a spelling error in a related comment.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  include/migration/misc.h | 4 +++-
>  migration/migration.c    | 7 +++++++
>  migration/ram.c          | 8 +-------
>  3 files changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/include/migration/misc.h b/include/migration/misc.h
> index 465906710d..8b49841016 100644
> --- a/include/migration/misc.h
> +++ b/include/migration/misc.h
> @@ -67,8 +67,10 @@ bool migration_has_failed(MigrationState *);
>  /* ...and after the device transmission */
>  bool migration_in_postcopy_after_devices(MigrationState *);
>  void migration_global_dump(Monitor *mon);
> -/* True if incomming migration entered POSTCOPY_INCOMING_DISCARD */
> +/* True if incoming migration entered POSTCOPY_INCOMING_DISCARD */
>  bool migration_in_incoming_postcopy(void);
> +/* True if incoming migration entered POSTCOPY_INCOMING_ADVISE */
> +bool migration_incoming_postcopy_advised(void);
>  /* True if background snapshot is active */
>  bool migration_in_bg_snapshot(void);
>  
> diff --git a/migration/migration.c b/migration/migration.c
> index 1d33a7efa0..b7677c14a9 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -2094,6 +2094,13 @@ bool migration_in_incoming_postcopy(void)
>      return ps >= POSTCOPY_INCOMING_DISCARD && ps < POSTCOPY_INCOMING_END;
>  }
>  
> +bool migration_incoming_postcopy_advised(void)
> +{
> +    PostcopyState ps = postcopy_state_get();
> +
> +    return ps >= POSTCOPY_INCOMING_ADVISE && ps < POSTCOPY_INCOMING_END;
> +}
> +
>  bool migration_in_bg_snapshot(void)
>  {
>      MigrationState *s = migrate_get_current();
> diff --git a/migration/ram.c b/migration/ram.c
> index 334309f1c6..e51a7ee0ce 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -4091,12 +4091,6 @@ int ram_load_postcopy(QEMUFile *f, int channel)
>      return ret;
>  }
>  
> -static bool postcopy_is_advised(void)
> -{
> -    PostcopyState ps = postcopy_state_get();
> -    return ps >= POSTCOPY_INCOMING_ADVISE && ps < POSTCOPY_INCOMING_END;
> -}
> -
>  static bool postcopy_is_running(void)
>  {
>      PostcopyState ps = postcopy_state_get();
> @@ -4167,7 +4161,7 @@ static int ram_load_precopy(QEMUFile *f)
>      MigrationIncomingState *mis = migration_incoming_get_current();
>      int flags = 0, ret = 0, invalid_flags = 0, len = 0, i = 0;
>      /* ADVISE is earlier, it shows the source has the postcopy capability on */
> -    bool postcopy_advised = postcopy_is_advised();
> +    bool postcopy_advised = migration_incoming_postcopy_advised();
>      if (!migrate_use_compression()) {
>          invalid_flags |= RAM_SAVE_FLAG_COMPRESS_PAGE;
>      }
> -- 
> 2.39.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


