Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16647666339
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 20:02:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFgLQ-0001BP-A5; Wed, 11 Jan 2023 14:01:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pFgLO-0001A4-0o
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 14:01:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pFgLL-0007ln-OH
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 14:01:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673463658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=13Npydp0zZzvnCih+qoTnkVVmywH6CIJoTcKogs1DK0=;
 b=Ywken4ruPQpF7WUPtUdSzL09m8arr2DklYPPjNQ//z32xoLaHGC5OPgZHmKGiBAVIrH557
 czgmKDyONcLAot+7ScL2kmX7deO2c0ZEGy7C2vLKwe3fJ1rMskiIgPW6tQfy8NVzr9U+3Z
 GETZDEeBfTbiM3+PBIMYgE6XmTB0uEQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-672-pDC_Z0mnOIywHOvttWK6Hg-1; Wed, 11 Jan 2023 14:00:57 -0500
X-MC-Unique: pDC_Z0mnOIywHOvttWK6Hg-1
Received: by mail-wr1-f72.google.com with SMTP id
 k18-20020adfb352000000b002bdd0a7a2b5so24395wrd.0
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 11:00:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=13Npydp0zZzvnCih+qoTnkVVmywH6CIJoTcKogs1DK0=;
 b=OBhguw6SYyPLQ8RLtrMC+MDSAzcT1635ZfBYIZXs98s3C4jN41yApFYsLJyjhilNJ1
 I2f5mE1mxPoU2AW+ix1TiFlnD8Ya4G5WytKNc7Tk7MZZAOjxlejEasDOw8CB/fxrkEzq
 uxePFDTkCch59F2CZtPjFkP1adPr+AtPZnsYX/LbPzq8fKVC7xAmNMIlvbiSgXrV317m
 A1tZMmAqioWNIe3sA9Ugvs442TKy3ZsdHMs6EyY2QtRcd6AVhIGGccDFt/LK7WK+C5vq
 6IQp/yoR2iwhDWPPsxfLMgkH+em6v2Xxg9BgdI/2LAqB2Z46tsqMXA5nm5DkEGAx4swK
 99jw==
X-Gm-Message-State: AFqh2kogUuf2EwemlbR+nHlMeNIq4HrERU0YxaqZDONFKgFbnBF62FIy
 NCigu9P7nIN4hOGQXKWjrvInCGNuZ47sSRgXo3Ck7c5cZxgsVad5CK8fq2JimpjCgA8YiB9E8sp
 krOxO8iJyt7VyIWY=
X-Received: by 2002:a05:6000:1d8b:b0:2aa:1d10:1ecf with SMTP id
 bk11-20020a0560001d8b00b002aa1d101ecfmr17508713wrb.37.1673463656286; 
 Wed, 11 Jan 2023 11:00:56 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtlsC3ag7ChrOvEprjpZR1ybLko+LAJVVklouzgiSSexC477l4tNdGHjvtT8sC3alDZujFoOA==
X-Received: by 2002:a05:6000:1d8b:b0:2aa:1d10:1ecf with SMTP id
 bk11-20020a0560001d8b00b002aa1d101ecfmr17508701wrb.37.1673463656064; 
 Wed, 11 Jan 2023 11:00:56 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 f6-20020adffcc6000000b002bbdcd15e44sm10818258wrs.37.2023.01.11.11.00.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 11:00:55 -0800 (PST)
Date: Wed, 11 Jan 2023 19:00:53 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Jiang Jiacheng <jiangjiacheng@huawei.com>, jdenemar@redhat.com,
 berrange@redhat.com
Cc: qemu-devel@nongnu.org, quintela@redhat.com, yubihong@huawei.com,
 xiexiangyou@huawei.com, zhengchuan@huawei.com, linyilu@huawei.com
Subject: Re: [RESEND PATCH 2/2] migration: report multiFd related thread pid
 to libvirt
Message-ID: <Y78HZb0AG55Yp/i/@work-vm>
References: <20230109121235.2666476-1-jiangjiacheng@huawei.com>
 <20230109121235.2666476-3-jiangjiacheng@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230109121235.2666476-3-jiangjiacheng@huawei.com>
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

* Jiang Jiacheng via (qemu-devel@nongnu.org) wrote:
> From: Zheng Chuan <zhengchuan@huawei.com>
> 
> Report multiFd related thread pid to libvirt in order to
> pin multiFd thread to different cpu.

With multifd you may well want to pin different multifd threads
to different cores; so you need to include the 'id' and 'name' fields of
the multifd thread in the event.

(Copying in Jiri and Dan )

Dave

> ---
>  migration/multifd.c |  4 ++++
>  qapi/migration.json | 12 ++++++++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 000ca4d4ec..f3f7e8ae31 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -17,6 +17,7 @@
>  #include "exec/ramblock.h"
>  #include "qemu/error-report.h"
>  #include "qapi/error.h"
> +#include "qapi/qapi-events-migration.h"
>  #include "ram.h"
>  #include "migration.h"
>  #include "socket.h"
> @@ -650,6 +651,9 @@ static void *multifd_send_thread(void *opaque)
>      int ret = 0;
>      bool use_zero_copy_send = migrate_use_zero_copy_send();
>  
> +    /* report multifd thread pid to libvirt */
> +    qapi_event_send_migration_multifd_pid(qemu_get_thread_id());
> +
>      trace_multifd_send_thread_start(p->id);
>      rcu_register_thread();
>  
> diff --git a/qapi/migration.json b/qapi/migration.json
> index aafc940617..33fc319329 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -1286,6 +1286,18 @@
>  { 'event': 'MIGRATION_PASS',
>    'data': { 'pass': 'int' } }
>  
> +##
> +# @MIGRATION_MULTIFD_PID:
> +#
> +# Emitted when multifd thread appear
> +#
> +# @pid: pid of multifd thread
> +#
> +# Since: 7.2
> +##
> +{ 'event': 'MIGRATION_MULTIFD_PID',
> +  'data': { 'pid': 'int' } }
> +
>  ##
>  # @MIGRATION_PID:
>  #
> -- 
> 2.33.0
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


