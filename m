Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DB73B8675
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 17:45:38 +0200 (CEST)
Received: from localhost ([::1]:59924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lycPB-00042q-Tj
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 11:45:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lycDw-0007XD-FD
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 11:34:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lycDu-00067K-6h
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 11:34:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625067237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DSCTPnFtjujOsTN0k1P9GYrRtcy2doP8M6AuY3L8jpU=;
 b=gGK2hsaIEzAILZ2fFMv8sAY4l4fUPs06FulFFf2OPO7O6ra6lsD0swJsHiAA9c6FW4x+96
 dyUv16JlR0GoJuxC85Csp10XUs+0qeagWZ8cDF2yLuyCfQPggo+du4Vd05dCo86MuI+05g
 d11S1+FP7BCP7XwgslUCS0tVWNIBDpY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-Jh-SnzbnO92P3TYWnEzqpg-1; Wed, 30 Jun 2021 11:33:55 -0400
X-MC-Unique: Jh-SnzbnO92P3TYWnEzqpg-1
Received: by mail-wr1-f69.google.com with SMTP id
 v9-20020a5d4a490000b029011a86baa40cso1114974wrs.7
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 08:33:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DSCTPnFtjujOsTN0k1P9GYrRtcy2doP8M6AuY3L8jpU=;
 b=tOMzwcQlceyqkkkFBqaT13BNohKDEv6PbG0GfGkFSu6fxtbJa+SIFEVdIIufFn1OFR
 ddPCxnGRnn1fngsIJBePHoZz7qRHZDXn6mPTzBcFJbx9wH3u3cb+uxo58p1eGPOitJwS
 khxDAmrbdv7JoURjisAxZmRM6G0T3ggvZsF+j8BzkQAox9eNSLcYI+elEIT4Qet+4N2G
 IBXrIIOMtztU3P935yzlpm8ZW6MMdMnfCFIyycFGwcZCLWyjKYYAz2MtETAfTP4Wc0Sb
 h3EEhvACC07XyWt+yYGMTnIKq9xH97wuIyaC9CPlpEqOUqkAhbqd8juJQHvmEUbjN37W
 xQlw==
X-Gm-Message-State: AOAM5328IcmCvNKbJyTLPvTJucU9KqZHWAxiCpxashh6s0pdO57wDCY4
 jgudmhA6qK9mSihLV+qxpf2yTsoBInM2OmSPXrZeULKAMHDx2GakXiYUa7rrg5m3lSRZnYG3vPa
 RG6aGUCLQICF4PVI=
X-Received: by 2002:adf:d0ca:: with SMTP id z10mr38555911wrh.376.1625067234711; 
 Wed, 30 Jun 2021 08:33:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOUl9WVF8WHOQxGD+9pVjPL4YDs86E7hXZS1K/4adYeRP5gWcn19YM/WN9M4aTIRTrqNHlqg==
X-Received: by 2002:adf:d0ca:: with SMTP id z10mr38555882wrh.376.1625067234475; 
 Wed, 30 Jun 2021 08:33:54 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id k13sm22065073wrp.73.2021.06.30.08.33.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 08:33:53 -0700 (PDT)
Date: Wed, 30 Jun 2021 16:33:51 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 1/2] migration: Move yank outside
 qemu_start_incoming_migration()
Message-ID: <YNyO30eC6ekyAfaq@work-vm>
References: <20210629181356.217312-1-peterx@redhat.com>
 <20210629181356.217312-2-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210629181356.217312-2-peterx@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: Lukas Straub <lukasstraub2@web.de>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> Starting from commit b5eea99ec2f5c, qmp_migrate_recover() calls unregister
> before calling qemu_start_incoming_migration(). I believe it wanted to mitigate
> the next call to yank_register_instance(), but I think that's wrong.
> 
> Firstly, if during recover, we should keep the yank instance there, not
> "quickly removing and adding it back".
> 
> Meanwhile, calling qmp_migrate_recover() twice with b5eea99ec2f5c will directly
> crash the dest qemu (right now it can't; but it'll start to work right after
> the next patch) because the 1st call of qmp_migrate_recover() will unregister
> permanently when the channel failed to establish, then the 2nd call of
> qmp_migrate_recover() crashes at yank_unregister_instance().
> 
> This patch fixes it by moving yank ops out of qemu_start_incoming_migration()
> into qmp_migrate_incoming.  For qmp_migrate_recover(), drop the unregister of
> yank instance too since we keep it there during the recovery phase.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/migration.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 4228635d18..1bb03d1eca 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -456,10 +456,6 @@ static void qemu_start_incoming_migration(const char *uri, Error **errp)
>  {
>      const char *p = NULL;
>  
> -    if (!yank_register_instance(MIGRATION_YANK_INSTANCE, errp)) {
> -        return;
> -    }
> -
>      qapi_event_send_migration(MIGRATION_STATUS_SETUP);
>      if (strstart(uri, "tcp:", &p) ||
>          strstart(uri, "unix:", NULL) ||
> @@ -474,7 +470,6 @@ static void qemu_start_incoming_migration(const char *uri, Error **errp)
>      } else if (strstart(uri, "fd:", &p)) {
>          fd_start_incoming_migration(p, errp);
>      } else {
> -        yank_unregister_instance(MIGRATION_YANK_INSTANCE);
>          error_setg(errp, "unknown migration protocol: %s", uri);
>      }
>  }
> @@ -2083,9 +2078,14 @@ void qmp_migrate_incoming(const char *uri, Error **errp)
>          return;
>      }
>  
> +    if (!yank_register_instance(MIGRATION_YANK_INSTANCE, errp)) {
> +        return;
> +    }
> +
>      qemu_start_incoming_migration(uri, &local_err);
>  
>      if (local_err) {
> +        yank_unregister_instance(MIGRATION_YANK_INSTANCE);
>          error_propagate(errp, local_err);
>          return;
>      }
> @@ -2114,7 +2114,6 @@ void qmp_migrate_recover(const char *uri, Error **errp)
>       * only re-setup the migration stream and poke existing migration
>       * to continue using that newly established channel.
>       */
> -    yank_unregister_instance(MIGRATION_YANK_INSTANCE);
>      qemu_start_incoming_migration(uri, errp);
>  }
>  
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


