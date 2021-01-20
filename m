Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8332FCDBA
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 11:09:14 +0100 (CET)
Received: from localhost ([::1]:46754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2AQL-0001b5-Eu
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 05:09:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1l2AOj-0000lP-J2
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 05:07:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1l2AOf-0001wB-4w
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 05:07:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611137248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8cggUzRn4lOs52HBsBswqDhV+XZ5Tlz4oRWhseOX2PA=;
 b=eMi2oai843Ii4wNCTZN56xCZFu3fASp1bifMGs8+IAFPUap4v83igZeY2gV+x2D2qa11T6
 PVdmUGfFfHFpRirXRFxwouXrHUhziHgSmPu2taLHhQKmXoIEaxzuQ7AdeASqsCDgPl2tmh
 8EPVtk2ZMmsNM3DNldcg0FsEXscHrf0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-I9_7i0dTNHyS3IQhlfnDBw-1; Wed, 20 Jan 2021 05:07:26 -0500
X-MC-Unique: I9_7i0dTNHyS3IQhlfnDBw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 240C510054FF
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 10:07:25 +0000 (UTC)
Received: from localhost (unknown [10.40.208.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 386ED5D74B;
 Wed, 20 Jan 2021 10:07:23 +0000 (UTC)
Date: Wed, 20 Jan 2021 11:07:22 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Michal Privoznik <mprivozn@redhat.com>
Subject: Re: [PATCH] hostmem: Don't report pmem attribute if unsupported
Message-ID: <20210120110722.03e0d14f@redhat.com>
In-Reply-To: <96eb4f94e6381082ec0188ad180f60f19f2583fc.1611059652.git.mprivozn@redhat.com>
References: <96eb4f94e6381082ec0188ad180f60f19f2583fc.1611059652.git.mprivozn@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 19 Jan 2021 13:35:35 +0100
Michal Privoznik <mprivozn@redhat.com> wrote:

> When management applications (like Libvirt) want to check whether
> memory-backend-file.pmem is supported they can list object
> properties using 'qom-list-properties'. However, 'pmem' is
> declared always (and thus reported always) and only at runtime
> QEMU errors out if it was built without libpmem (and thus can not
> guarantee write persistence). This is suboptimal since we have
> ability to declare attributes at compile time.
> 
> Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=1915216
> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  backends/hostmem-file.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/backends/hostmem-file.c b/backends/hostmem-file.c
> index 40e1e5b3e3..7e30eb5985 100644
> --- a/backends/hostmem-file.c
> +++ b/backends/hostmem-file.c
> @@ -123,6 +123,7 @@ static void file_memory_backend_set_align(Object *o, Visitor *v,
>      fb->align = val;
>  }
>  
> +#ifdef CONFIG_LIBPMEM
>  static bool file_memory_backend_get_pmem(Object *o, Error **errp)
>  {
>      return MEMORY_BACKEND_FILE(o)->is_pmem;
> @@ -139,17 +140,9 @@ static void file_memory_backend_set_pmem(Object *o, bool value, Error **errp)
>          return;
>      }
>  
> -#ifndef CONFIG_LIBPMEM
> -    if (value) {
> -        error_setg(errp, "Lack of libpmem support while setting the 'pmem=on'"
> -                   " of %s. We can't ensure data persistence.",
> -                   object_get_typename(o));
> -        return;
> -    }
> -#endif
> -
>      fb->is_pmem = value;
>  }
> +#endif /* CONFIG_LIBPMEM */
>  
>  static void file_backend_unparent(Object *obj)
>  {
> @@ -180,8 +173,10 @@ file_backend_class_init(ObjectClass *oc, void *data)
>          file_memory_backend_get_align,
>          file_memory_backend_set_align,
>          NULL, NULL);
> +#ifdef CONFIG_LIBPMEM
>      object_class_property_add_bool(oc, "pmem",
>          file_memory_backend_get_pmem, file_memory_backend_set_pmem);
> +#endif
>  }
>  
>  static void file_backend_instance_finalize(Object *o)


