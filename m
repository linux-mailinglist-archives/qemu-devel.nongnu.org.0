Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A152CBA86
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 11:27:02 +0100 (CET)
Received: from localhost ([::1]:54560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkPLh-0000e5-CJ
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 05:27:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kkP8c-0002Bx-6Q
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 05:13:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kkP8X-0001tu-W2
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 05:13:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606904004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LkiKgVKI6w4w52ww5LuVE/YLM+kYXgzi2oo7wxc930M=;
 b=TGdCQn0cOmgmhbxmu4VioCfyqxeZk+dVwTjLAx053AMhZCxRZGEKS08KS++x4D5HHNkjo0
 qJHaFerBqgUg6lbQ+eRzoW0VHGjoWkp8vLo+HFlCE9IVghGveN1rOvAAPBeA2p+m6uGLOH
 xAPM6TYf4CwPpNZVqs+1jeH0QLNs0D0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-4_L_pPblOJSrJOLtxFg1nQ-1; Wed, 02 Dec 2020 05:13:23 -0500
X-MC-Unique: 4_L_pPblOJSrJOLtxFg1nQ-1
Received: by mail-wm1-f69.google.com with SMTP id l5so2820603wmi.4
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 02:13:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LkiKgVKI6w4w52ww5LuVE/YLM+kYXgzi2oo7wxc930M=;
 b=JBSphoKd3FmRF45DUSBYeV4hxl5ZX5r/xYlWVaTjhlbg1E3uPPk8i+eYs8PIYPZJIJ
 XjmFxawpMUEvY0dwJY3wq3aMM+UBN/1PHkJple/DjMcM03rgb4HVRhV7lrFBCY0JI5Fy
 PLiWsa/IurpS3xXKL3PboWFo1pNp2U3RBYLdfUHvgN08InfNygyHaGevqWYvRz2JS9PQ
 t6o4uSgm1gg+V4zJ0mEfwhRYcDy1iDfdmrOOfLgLodNboQxF//XgdsGjvjHxUR21eutP
 9wPxWIlJTkEMPBxfGzG6N5TLpEaU2zuHcpxdJunEb+c2AZK4Xw4+rk2Dfh7RWGHef8o6
 d/pQ==
X-Gm-Message-State: AOAM531tbhZZWEUoz96H7U8WE3NNehjElEc1u5SF8KQbWRH9JHwCPA7M
 O1eEgt5gH8Us493WutkDd31gn0DLoFYbO38s8SA3X/E787OBBKaa1mhrdplLDLZF2xjAlBSa5ZK
 PewVSPtzkBboRAmU=
X-Received: by 2002:a1c:f617:: with SMTP id w23mr2321410wmc.52.1606904002071; 
 Wed, 02 Dec 2020 02:13:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz3Wfbhmh94fcjMLCCjq69bGNJTdqimigR+8DLgL9MEvZZ1+8iUpuWzW1MELiJEnvuJBiC/XQ==
X-Received: by 2002:a1c:f617:: with SMTP id w23mr2321382wmc.52.1606904001818; 
 Wed, 02 Dec 2020 02:13:21 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id l13sm1433858wrm.24.2020.12.02.02.13.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 02:13:21 -0800 (PST)
Date: Wed, 2 Dec 2020 05:13:18 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v2 01/27] migration: Network Failover can't work with a
 paused guest
Message-ID: <20201202050918-mutt-send-email-mst@kernel.org>
References: <20201118083748.1328-1-quintela@redhat.com>
 <20201118083748.1328-2-quintela@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201118083748.1328-2-quintela@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 18, 2020 at 09:37:22AM +0100, Juan Quintela wrote:
> If we have a paused guest, it can't unplug the network VF device, so
> we wait there forever.  Just change the code to give one error on that
> case.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>

It's certainly possible but it's management that created
this situation after all - why do we bother to enforce
a policy? It is possible that management will unpause immediately
afterwards and everything will proceed smoothly.

Yes migration will not happen until guest is
unpaused but the same it true of e.g. a guest that is stuck
because of a bug.




> ---
>  migration/migration.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 87a9b59f83..d44fc880f9 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -3548,6 +3548,18 @@ static void *migration_thread(void *opaque)
>      qemu_savevm_state_setup(s->to_dst_file);
>  
>      if (qemu_savevm_state_guest_unplug_pending()) {
> +        /* if guest is paused, it can send back the wait event */
> +        if (!runstate_is_running()) {
> +            Error *local_err = NULL;
> +
> +            error_setg(&local_err, "migration: network failover and "
> +                       "guest is paused'");
> +            migrate_set_error(s, local_err);
> +            error_free(local_err);
> +            migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
> +                              MIGRATION_STATUS_FAILED);
> +            goto end;
> +        }
>          migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
>                            MIGRATION_STATUS_WAIT_UNPLUG);
>  
> @@ -3597,6 +3609,7 @@ static void *migration_thread(void *opaque)
>      }
>  
>      trace_migration_thread_after_loop();
> +end:
>      migration_iteration_finish(s);
>      object_unref(OBJECT(s));
>      rcu_unregister_thread();
> -- 
> 2.26.2


