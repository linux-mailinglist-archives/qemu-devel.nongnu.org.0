Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D25243B8801
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 19:49:26 +0200 (CEST)
Received: from localhost ([::1]:47298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyeKz-00079b-GI
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 13:49:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lyeJz-0006N1-0n
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 13:48:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lyeJw-0007P3-Bi
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 13:48:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625075298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0Iv12GV0ha9xKvgXr45QzYF74HlKvuDsia5uf/ebf1M=;
 b=PfdKCEgVsJhFTQ3DZ1AcO4hllQVe0NCzmZxfUW5Bwt5+TEiHJkaIiqoGrAXYkVxNPIcPc1
 UIVO2Vauw8ktehau7OOYuY6hGxECOGZYBONOENCEhYdZ2va8VV3CgoU6nK1x8stAkfIMQ+
 hBuEeen/f8k7SMQm2XnSu4XSIXFTIZU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-pF10sLy9Ptm9s_p3kUVfQA-1; Wed, 30 Jun 2021 13:48:17 -0400
X-MC-Unique: pF10sLy9Ptm9s_p3kUVfQA-1
Received: by mail-wr1-f72.google.com with SMTP id
 p4-20020a5d63840000b0290126f2836a61so1269277wru.6
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 10:48:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0Iv12GV0ha9xKvgXr45QzYF74HlKvuDsia5uf/ebf1M=;
 b=hsturBnW13/w5pCE2IPn4vV0Ay5TJyCg4A2+edklUNRKG+q25m981efeslTRPnWaFy
 NZ2mL0d15QgBmsc6DeB41u3L9zrD0/lzfgiePh0hZakWU8iLxeLm73Te8+JSP++p7mzX
 wgzPx4uu1gFTrqI9vLnYOxsAujld3NStxz8zVOt2j21IBL1m565j8QEb9jptVpi+HLI4
 7YJOQawlqIHuPbeMyw9G3aNfRSwLrN4yOc9Bq2uLxGQR8ngMBxjFSsZp6ijzLr3HvkEn
 dn+DY4SWPam5h3fJt3L/H7bvR0IjOf6WLbnewD2BdxLUKfVQrnbx7koWrmGSEA4k/rv5
 oM+A==
X-Gm-Message-State: AOAM531gTbVM7wJU8TQGiSPZ/7aJItzKXAAkoI67fr03b9N3yAZCasNI
 7BuJZyCslU3GrWLaBByFLeA62+TbfrJfWVPf+KhIK88DyxCqPByGe2qldwX58GLY9Fn0Q+sZssz
 W0DnZnZJRfOWh36E=
X-Received: by 2002:a7b:c4da:: with SMTP id g26mr5985957wmk.3.1625075296005;
 Wed, 30 Jun 2021 10:48:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/Xbx9fkGYzscnJsMK9nSdpx36B86I20xtWIT92ev9A+c60UGdDiyQJXFG+l59hZ6QXGRCxQ==
X-Received: by 2002:a7b:c4da:: with SMTP id g26mr5985937wmk.3.1625075295825;
 Wed, 30 Jun 2021 10:48:15 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id 16sm9668863wmk.18.2021.06.30.10.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 10:48:15 -0700 (PDT)
Date: Wed, 30 Jun 2021 18:48:13 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 2/2] migration: failover: continue to wait card unplug on
 error
Message-ID: <YNyuXdxm6N8NKeXd@work-vm>
References: <20210629155007.629086-1-lvivier@redhat.com>
 <20210629155007.629086-3-lvivier@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210629155007.629086-3-lvivier@redhat.com>
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
Cc: Jens Freimann <jfreimann@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Laurent Vivier (lvivier@redhat.com) wrote:
> If the user cancels the migration in the unplug-wait state,
> QEMU will try to plug back the card and this fails because the card
> is partially unplugged.
> To avoid the problem, continue to wait the card unplug, but to
> allow the migration to be canceled if the card never finishes to unplug
> use a timeout.
> 
> Bug: https://bugzilla.redhat.com/show_bug.cgi?id=1976852
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

I'll take this for now, but as Juan says, we could really do with some
diags when this happens, so when someone comes and tells us that
the hotplug has failed we can see.  Please send something to add it.


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/migration.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 3e92c405a2b6..3b06d43a7f42 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -3679,6 +3679,17 @@ static void qemu_savevm_wait_unplug(MigrationState *s, int old_state,
>                 qemu_savevm_state_guest_unplug_pending()) {
>              qemu_sem_timedwait(&s->wait_unplug_sem, 250);
>          }
> +        if (s->state != MIGRATION_STATUS_WAIT_UNPLUG) {
> +            int timeout = 120; /* 30 seconds */
> +            /*
> +             * migration has been canceled
> +             * but as we have started an unplug we must wait the end
> +             * to be able to plug back the card
> +             */
> +            while (timeout-- && qemu_savevm_state_guest_unplug_pending()) {
> +                qemu_sem_timedwait(&s->wait_unplug_sem, 250);
> +            }
> +        }
>  
>          migrate_set_state(&s->state, MIGRATION_STATUS_WAIT_UNPLUG, new_state);
>      } else {
> -- 
> 2.31.1
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


