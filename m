Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8E748D29B
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 08:07:04 +0100 (CET)
Received: from localhost ([::1]:44346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7uCN-00087N-8n
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 02:07:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n7u62-0005B2-74
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 02:00:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n7u60-0001pU-GV
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 02:00:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642057227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=40nEoaSit89+HtguCuomuGlXqnL9Hk2vSluNqbx0ezE=;
 b=h2Iub9i0mGAoGaCvCbb1VSvTVitVEcBtsjcgNNJ1/eBJGSGjBgak7TTHfWQgL7AZcvNwp1
 /MxvOEmHDh2hl0gP4/M9yvPX4LqB9ZK5VqtPu47LU8W9wzfM5MJqttYv8sd/TV67WiK1kd
 zgsJ8slpTWbtDp98sPyyrCOoNEiylLQ=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-bTVbo3n4NhShYaJlXv2F3g-1; Thu, 13 Jan 2022 02:00:26 -0500
X-MC-Unique: bTVbo3n4NhShYaJlXv2F3g-1
Received: by mail-pj1-f69.google.com with SMTP id
 j5-20020a17090a738500b001b33f47e757so5689930pjg.5
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 23:00:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=40nEoaSit89+HtguCuomuGlXqnL9Hk2vSluNqbx0ezE=;
 b=20h1dVmKGcf5z7AVI/jpQ4Obn6YB8VihG/r0aMjDdARGsxbBQph5OOtczBRMh8PMbC
 gnCQbrkWGKc9i1W9kHWaamt0j/pWaC1T2O99UnPAJo6KycrHRF1kyeFjwgR8J1ttO3pT
 u9wA/DJBqqc60Qau8iPoTQ5XkJzji7uk5LR6Y4TEFf9kE0R/QkN+6Dss19KyUcnElvCp
 K9o7DuYwj71ynLNFxVbBlpVzuesy2RVtmWaxkBoO6ivBB1jqDau2uZRmPGg/fp4fr5Ff
 ZTBPExOMkYZ5Tc+A3ux3Ddm3/NkO9fOn+o0lCIThHufh+UM4IzxISxH4+ek4WUu3bUXG
 nNvQ==
X-Gm-Message-State: AOAM532NATeFVADrKC5UhneXb2yRrmmrLC4vqmvz7G2g2vRmCYnDz9QT
 P8XXEXf8s3Nt2qhrxRoL3fyxzZT+ofDg6wfisw2RnL8LR0wWqNOlgr4JeEd+bd1UtWViUmGUbA8
 v7DSOauDbvrU4c8A=
X-Received: by 2002:a17:902:be17:b0:149:c4ae:63aa with SMTP id
 r23-20020a170902be1700b00149c4ae63aamr3114387pls.6.1642057225122; 
 Wed, 12 Jan 2022 23:00:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxFifq2c0Xtnun1ZTwVk32xD+eC2TtDJuAui5buJDRNfLrX3pynjM3Dhhw34weUKse1ZDPNAg==
X-Received: by 2002:a17:902:be17:b0:149:c4ae:63aa with SMTP id
 r23-20020a170902be1700b00149c4ae63aamr3114368pls.6.1642057224883; 
 Wed, 12 Jan 2022 23:00:24 -0800 (PST)
Received: from xz-m1.local ([191.101.132.233])
 by smtp.gmail.com with ESMTPSA id v11sm1582563pfi.191.2022.01.12.23.00.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 23:00:24 -0800 (PST)
Date: Thu, 13 Jan 2022 15:00:18 +0800
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v7 3/5] migration: Add zero-copy parameter for QMP/HMP
 for Linux
Message-ID: <Yd/OAt8z35orDwOM@xz-m1.local>
References: <20220106221341.8779-1-leobras@redhat.com>
 <20220106221341.8779-4-leobras@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220106221341.8779-4-leobras@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 06, 2022 at 07:13:40PM -0300, Leonardo Bras wrote:
> Add property that allows zero-copy migration of memory pages,
> and also includes a helper function migrate_use_zero_copy() to check
> if it's enabled.
> 
> No code is introduced to actually do the migration, but it allow
> future implementations to enable/disable this feature.
> 
> On non-Linux builds this parameter is compiled-out.

I feel sad every time seeing a new parameter needs to be mostly duplicated 3
times in the code. :(

> diff --git a/migration/socket.c b/migration/socket.c
> index 05705a32d8..f7a77aafd3 100644
> --- a/migration/socket.c
> +++ b/migration/socket.c
> @@ -77,6 +77,11 @@ static void socket_outgoing_migration(QIOTask *task,
>      } else {
>          trace_migration_socket_outgoing_connected(data->hostname);
>      }
> +
> +    if (migrate_use_zero_copy()) {
> +        error_setg(&err, "Zero copy not available in migration");
> +    }

I got confused the 1st time looking at it..  I think this is not strongly
needed, but that's okay:

Reviewed-by: Peter Xu <peterx@redhat.com>

Thanks,

-- 
Peter Xu


