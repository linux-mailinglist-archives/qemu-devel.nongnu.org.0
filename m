Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B94D966060B
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 18:56:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDqx1-0005fP-Cg; Fri, 06 Jan 2023 12:56:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pDqwy-0005eR-C8
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 12:56:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pDqww-0006cl-Lt
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 12:56:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673027773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G/hN04lvv5yUrqMdVOFFmVvTdoXiSdEZHWcaRUQ93/g=;
 b=H54angDVi9is8SvLwuGdN0if/sdDLMRVbfjszsq73/q0wd75zs26BVOPUYwQ4IDYXgJWfr
 vCOej+STCbgFMO5V+raF8w8l1R7dM8Db2Ez+kMdKE82koYFYnQ1i2A47g3axH69t1r57Rf
 +qohpvjpP3QCJIcd9V9JT8PkY54LKjw=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-241-BNa2XixQO_2HGaUJVmFeXw-1; Fri, 06 Jan 2023 12:56:11 -0500
X-MC-Unique: BNa2XixQO_2HGaUJVmFeXw-1
Received: by mail-io1-f71.google.com with SMTP id
 t3-20020a6bc303000000b006f7844c6298so1144970iof.23
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 09:56:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=G/hN04lvv5yUrqMdVOFFmVvTdoXiSdEZHWcaRUQ93/g=;
 b=6HhIs12rvLM/ffr/oKmF2x0RJYi0EKewBfQ6si2pFuGLBoIp4BEDlxQsSEQWgDUQTu
 ckNPATpdZ4+8KP6iEa54GFjAuAlG00eFyWWFRlMcPeXHBmlFXE9fDrNan1aLOFfIqssp
 rrI+0QAjXs0J3O0DKxOnAAnVYGPUXhKlU6CoY2qkAr1hiFQ6s4zxNQNgHFc7YUGmA0ya
 yjREBGdn30iuc+gY0EdL4zPO5/CCYgUQcnG4G7hjPzw3bPmjYgeOF98NWR7/fhKlsjhD
 S6LbD8urj9wnSEfjg9uql7zl01YN7ugDFLOo2tXf9KdJr0kZ/efQlHJ4HJsz0hN86Jcr
 ABUQ==
X-Gm-Message-State: AFqh2kovHQjXphYef38kDS5WWIodzNJk3TsYU33fPeQ6/9WExTuqWy+A
 agyzAXvS8fhVAm153sMd9RvrvJxUOpXDN5Fo1gZEeiOuGupR+ylicDNizJlyv2OrCmFxW7UO1gX
 FKUkwJ5FojrC8I7Q=
X-Received: by 2002:a05:6e02:1bed:b0:30d:8a39:a85e with SMTP id
 y13-20020a056e021bed00b0030d8a39a85emr3008257ilv.18.1673027771014; 
 Fri, 06 Jan 2023 09:56:11 -0800 (PST)
X-Google-Smtp-Source: AMrXdXumhzn0E6WK91AjKRoZxTC/3XJ2H8jw1xYmAReo3cqcq/jBplBXhbcQUKSpP1h3ArsLjkhPiQ==
X-Received: by 2002:a05:6e02:1bed:b0:30d:8a39:a85e with SMTP id
 y13-20020a056e021bed00b0030d8a39a85emr3008233ilv.18.1673027770711; 
 Fri, 06 Jan 2023 09:56:10 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 r9-20020a02aa09000000b0039e5418fb01sm484668jam.73.2023.01.06.09.56.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 09:56:10 -0800 (PST)
Date: Fri, 6 Jan 2023 10:56:08 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: <qemu-devel@nongnu.org>, Halil Pasic <pasic@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Eric Farman
 <farman@linux.ibm.com>, Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, "Ilya Leoshkevich"
 <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, "Juan Quintela"
 <quintela@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>, Vladimir
 Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, John Snow
 <jsnow@redhat.com>, <qemu-s390x@nongnu.org>, <qemu-block@nongnu.org>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor
 Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun
 Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH v5 03/14] migration: Simplify migration_iteration_run()
Message-ID: <20230106105608.0d74a96c.alex.williamson@redhat.com>
In-Reply-To: <20221229110345.12480-4-avihaih@nvidia.com>
References: <20221229110345.12480-1-avihaih@nvidia.com>
 <20221229110345.12480-4-avihaih@nvidia.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, 29 Dec 2022 13:03:34 +0200
Avihai Horon <avihaih@nvidia.com> wrote:

> From: Juan Quintela <quintela@redhat.com>

IMHO, there should always be a commit log description.  Why is this a
simplification?  What does it allow us to do?  Nothing later obviously
depends on this, why is it part of this series?  Thanks,

Alex

> Signed-off-by: Juan Quintela <quintela@redhat.com>
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> ---
>  migration/migration.c | 25 +++++++++++++------------
>  1 file changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 9795d0ec5c..61b9ce0fe8 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -3758,23 +3758,24 @@ static MigIterateState migration_iteration_run(MigrationState *s)
>      trace_migrate_pending(pending_size, s->threshold_size,
>                            pend_pre, pend_compat, pend_post);
>  
> -    if (pending_size && pending_size >= s->threshold_size) {
> -        /* Still a significant amount to transfer */
> -        if (!in_postcopy && pend_pre <= s->threshold_size &&
> -            qatomic_read(&s->start_postcopy)) {
> -            if (postcopy_start(s)) {
> -                error_report("%s: postcopy failed to start", __func__);
> -            }
> -            return MIG_ITERATE_SKIP;
> -        }
> -        /* Just another iteration step */
> -        qemu_savevm_state_iterate(s->to_dst_file, in_postcopy);
> -    } else {
> +
> +    if (!pending_size || pending_size < s->threshold_size) {
>          trace_migration_thread_low_pending(pending_size);
>          migration_completion(s);
>          return MIG_ITERATE_BREAK;
>      }
>  
> +    /* Still a significant amount to transfer */
> +    if (!in_postcopy && pend_pre <= s->threshold_size &&
> +        qatomic_read(&s->start_postcopy)) {
> +        if (postcopy_start(s)) {
> +            error_report("%s: postcopy failed to start", __func__);
> +        }
> +        return MIG_ITERATE_SKIP;
> +    }
> +
> +    /* Just another iteration step */
> +    qemu_savevm_state_iterate(s->to_dst_file, in_postcopy);
>      return MIG_ITERATE_RESUME;
>  }
>  


