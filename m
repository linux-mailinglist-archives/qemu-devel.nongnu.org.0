Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DFD637D78
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 17:06:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyEir-0007ey-Lt; Thu, 24 Nov 2022 11:05:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oyEib-0007e9-3T
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 11:04:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oyEiX-0008Fw-8x
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 11:04:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669305886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6+Y3A7CEmHysquXuOgawuhqEq/WOpoZ+xc+dE61SiLU=;
 b=GeKdru7uWpYT9YpRXG73nuL2mGiT3FLUZv3c09Tz9qdBlFXP60VQDKLseuqk1VMhbIr0lu
 n66ItKyOu8cMhVIfcUpR2ScTAFSjpOuA2G+Tah1IE17Y2/qRiRK9hdA/BtLQs8LKfPnQLP
 bRMcdegvF6IjX7l3rL4YVaq3NA7/A/4=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-185-o1NTVm8BM4OWKRiLK87aHw-1; Thu, 24 Nov 2022 11:04:45 -0500
X-MC-Unique: o1NTVm8BM4OWKRiLK87aHw-1
Received: by mail-qt1-f197.google.com with SMTP id
 hg24-20020a05622a611800b003a66175d924so2013693qtb.1
 for <qemu-devel@nongnu.org>; Thu, 24 Nov 2022 08:04:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6+Y3A7CEmHysquXuOgawuhqEq/WOpoZ+xc+dE61SiLU=;
 b=NzL8gAmzeQv5VFabS5GipowWMxBnGIlCsFxH2/jWTPbVW9a4733ITgnq4+hA3HmQ1H
 NpHVUtCRsWd2h72Cl7td1DTXbck4TeBNd25qumR2+rII0mO/ifp/5/FjzohntRQ+Fo7+
 XJO21hAGkqrgBTa4WzalOFlj8YRXioHqceOF0G/hDKVPLwk/7SUtC2eBaHAQcaHfMnpR
 83jrXy0wTkpxjiuqoRFiB4VL8dfIaWDOvcJIJIyZFj4zu6ISWLA//seRmiM9XV5TFzBZ
 CY8fZaonvSikNtm1PV4NUgFE/RAZYkT062Pok9C1RkjaOfNpmKl9DivLn5zhE3UdeKEw
 dexg==
X-Gm-Message-State: ANoB5pkMptuv6wRhT9H3skwaphIFx1NVVpj6Lzr4uCczUOGOsHLu0gK+
 8lWxITUSz1ULvjnEeu7QsLHcA7NeRDXmJfAtExlHF86dDHZ0MbB/dGuiTWHWM0iaMwpbrTA/5de
 70sDQ3eaZ24M3f9I=
X-Received: by 2002:a05:620a:126e:b0:6ec:3480:ee5a with SMTP id
 b14-20020a05620a126e00b006ec3480ee5amr30108670qkl.603.1669305884313; 
 Thu, 24 Nov 2022 08:04:44 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6wKN5LtQieHu46io5EYPXPbUyi9EcA/SMqct+Z+kWgnnqvF3VKU2zaF/kP2zuvEkG8jOYwhQ==
X-Received: by 2002:a05:620a:126e:b0:6ec:3480:ee5a with SMTP id
 b14-20020a05620a126e00b006ec3480ee5amr30108651qkl.603.1669305884066; 
 Thu, 24 Nov 2022 08:04:44 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 t24-20020a05622a181800b003a50b9f099esm774638qtc.12.2022.11.24.08.04.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 08:04:43 -0800 (PST)
Date: Thu, 24 Nov 2022 11:04:42 -0500
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, Li Xiaohui <xiaohli@redhat.com>
Subject: Re: [PATCH v1 1/1] migration: Fix yank on postcopy multifd crashing
 guest after migration
Message-ID: <Y3+WGof3MQtaCYdS@x1n>
References: <20221109055629.789795-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221109055629.789795-1-leobras@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

On Wed, Nov 09, 2022 at 02:56:29AM -0300, Leonardo Bras wrote:
> diff --git a/migration/savevm.c b/migration/savevm.c
> index a0cdb714f7..250caff7f4 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -1889,6 +1889,8 @@ static void *postcopy_ram_listen_thread(void *opaque)
>          exit(EXIT_FAILURE);
>      }
>  
> +    migration_load_cleanup();

It's a bit weird to call multifd-load-clean in a listen phase..

How about moving it right above
trace_process_incoming_migration_co_postcopy_end_main()?  Then the new
helper can also be static.

> +
>      migrate_set_state(&mis->state, MIGRATION_STATUS_POSTCOPY_ACTIVE,
>                                     MIGRATION_STATUS_COMPLETED);
>      /*
> -- 
> 2.38.1
> 

-- 
Peter Xu


