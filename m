Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DD54F85E0
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 19:23:03 +0200 (CEST)
Received: from localhost ([::1]:57918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncVqX-0008Dd-Ta
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 13:23:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ncVpa-0007AU-0R
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 13:22:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ncVpW-0006Dz-KN
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 13:22:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649352117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RN5ucvGgYYdk2QpsDqo0GMWSNeI/d4ngCM/9jv+pU5I=;
 b=Rylf21BCvd+udtj/gmPfsL0dT/BFqW/6YCOa0R/78hlfmWt8l0ur60MF62DtWg02zCYM4F
 +sldQ7ADkgVjvyp7GEWZPKT7Tahe7JoLkUBYB8u4TWNsX9K9+4vBgIKmSvvoIk823Co9j4
 4TzfCPpLfpL88xuFBWchwUjDUkGy+4k=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-352-IJj1VnpUNcCanBxC67aJ-g-1; Thu, 07 Apr 2022 13:21:56 -0400
X-MC-Unique: IJj1VnpUNcCanBxC67aJ-g-1
Received: by mail-wm1-f72.google.com with SMTP id
 p32-20020a05600c1da000b0038e9e6359dbso49615wms.9
 for <qemu-devel@nongnu.org>; Thu, 07 Apr 2022 10:21:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RN5ucvGgYYdk2QpsDqo0GMWSNeI/d4ngCM/9jv+pU5I=;
 b=GhKUc1FvcS72a80XikW6zsbKo/59JQ7SvTaTMdoB3pwrUwAYI3RXRisng/V6eU0m9o
 38+53GRZ0ofckNiBe5L8nkq2piOS5T7d0coM9QJKc8GEGMt3ej02x415YIay2EJUR3QW
 LbjGLHPJqw6sFcQlUf4giCvqF1qepeRKY7rTif4rpVxqt9xb7vAZTaXWMEdkNHDwy/Ry
 D/hDhkQOW1+iwiw97FiKXJY9+VSksmQs2hdzd5GYW+K+ajaOPLrJmXNyLCjI41Co3sdu
 U45N4nlb42FmksLI8fMvnlPUkHLHTisA9AyfORFiHZiHMT3bY9NUsvaJnxtpejlh/F73
 wLJw==
X-Gm-Message-State: AOAM530H8BoYV1pIUUh/r2+OoPF1sDAO1KvAQFteKWPdc2W/DiIDen7Z
 xlzq/KEker1HFma8cZCMeuzSbdcvLL1JxDN8iVfm7aweSUwycDvTn0NQX2VKuffB/HzJXBXLt/d
 4T1O92ktTvL4FZs8=
X-Received: by 2002:adf:9090:0:b0:206:e6a:2d1 with SMTP id
 i16-20020adf9090000000b002060e6a02d1mr11785390wri.618.1649352115159; 
 Thu, 07 Apr 2022 10:21:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygBgxh+MAXTlObbmCEUEKpYJ00B+KX7mzEX3T7Y3Vrlveup+3rXSs2UO3Vcr7vBL5Ulzxm+g==
X-Received: by 2002:adf:9090:0:b0:206:e6a:2d1 with SMTP id
 i16-20020adf9090000000b002060e6a02d1mr11785374wri.618.1649352114881; 
 Thu, 07 Apr 2022 10:21:54 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 v18-20020a5d5912000000b00205a7d0c6a3sm17063830wrd.69.2022.04.07.10.21.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 10:21:54 -0700 (PDT)
Date: Thu, 7 Apr 2022 18:21:52 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v4 01/19] migration: Postpone releasing
 MigrationState.hostname
Message-ID: <Yk8dsMwa2YoEO7kN@work-vm>
References: <20220331150857.74406-1-peterx@redhat.com>
 <20220331150857.74406-2-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220331150857.74406-2-peterx@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> We used to release it right after migrate_fd_connect().  That's not good
> enough when there're more than one socket pair required, because it'll be
> needed to establish TLS connection for the rest channels.
> 
> One example is multifd, where we copied over the hostname for each channel
> but that's actually not needed.
> 
> Keeping the hostname until the cleanup phase of migration.
> 
> Cc: Daniel P. Berrange <berrange@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/channel.c   | 1 -
>  migration/migration.c | 5 +++++
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/migration/channel.c b/migration/channel.c
> index c4fc000a1a..c6a8dcf1d7 100644
> --- a/migration/channel.c
> +++ b/migration/channel.c
> @@ -96,6 +96,5 @@ void migration_channel_connect(MigrationState *s,
>          }
>      }
>      migrate_fd_connect(s, error);
> -    g_free(s->hostname);
>      error_free(error);
>  }
> diff --git a/migration/migration.c b/migration/migration.c
> index 695f0f2900..281d33326b 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1809,6 +1809,11 @@ static void migrate_fd_cleanup(MigrationState *s)
>      qemu_bh_delete(s->cleanup_bh);
>      s->cleanup_bh = NULL;
>  
> +    if (s->hostname) {
> +        g_free(s->hostname);
> +        s->hostname = NULL;
> +    }
> +
>      qemu_savevm_state_cleanup();
>  
>      if (s->to_dst_file) {
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


