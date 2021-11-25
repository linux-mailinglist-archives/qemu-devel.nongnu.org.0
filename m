Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF6C45DEA3
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 17:35:59 +0100 (CET)
Received: from localhost ([::1]:55904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqHj4-0000dO-BA
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 11:35:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mqHhG-0008Ab-ER
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 11:34:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mqHhC-0006yR-VN
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 11:34:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637858041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=crUZ3WvHS/+1ixt8DqE1aPbXxgkGK6WVsm8yIMICTs4=;
 b=AEN8nYqXXKSdgo2n2flf73GvmGfQ6tqJOFDy+R7TCqkIP222ZkEgXtQbO2SMwB/T+nriJd
 SMGxIowrF8lJY67/A9hR3x0LPwqHQhiRhYrt+qvTh5jJiG5Y1zm0UbnVnBFWQvr/IkUbC6
 8rjs+n34EyHCp4W8GeELU8mjgJNqpe0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-386-xRzkCA0iPKuteHmLGhoxaw-1; Thu, 25 Nov 2021 11:33:58 -0500
X-MC-Unique: xRzkCA0iPKuteHmLGhoxaw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83223835B47;
 Thu, 25 Nov 2021 16:33:57 +0000 (UTC)
Received: from localhost (unknown [10.39.193.107])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 648AE60BF4;
 Thu, 25 Nov 2021 16:33:54 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Yishai Hadas <yishaih@nvidia.com>, alex.williamson@redhat.com
Subject: Re: [PATCH] vfio/migration: Improve to read/write full migration
 region per chunk
In-Reply-To: <20211111095040.183977-1-yishaih@nvidia.com>
Organization: Red Hat GmbH
References: <20211111095040.183977-1-yishaih@nvidia.com>
User-Agent: Notmuch/0.33.1 (https://notmuchmail.org)
Date: Thu, 25 Nov 2021 17:33:52 +0100
Message-ID: <871r34jitr.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: kwankhede@nvidia.com, yishaih@nvidia.com, maorg@nvidia.com,
 qemu-devel@nongnu.org, jgg@nvidia.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 11 2021, Yishai Hadas <yishaih@nvidia.com> wrote:

> Upon reading/writing the migration data there is no real reason to limit
> the read/write system call from the file to be 8 bytes.
>
> In addition, there is no reason to depend on the file offset alignment.
> The offset is just some logical value which depends also on the region
> index and has nothing to do with the amount of data that can be
> accessed.
>
> Move to read/write the full region size per chunk, this reduces
> dramatically the number of the systems calls that are needed and improve
> performance.
>
> Signed-off-by: Yishai Hadas <yishaih@nvidia.com>
> ---
>  hw/vfio/migration.c | 36 ++----------------------------------
>  1 file changed, 2 insertions(+), 34 deletions(-)
>
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index ff6b45de6b5..b5f310bb831 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -62,40 +62,8 @@ static inline int vfio_mig_access(VFIODevice *vbasedev, void *val, int count,
>      return 0;
>  }
>  
> -static int vfio_mig_rw(VFIODevice *vbasedev, __u8 *buf, size_t count,
> -                       off_t off, bool iswrite)
> -{
> -    int ret, done = 0;
> -    __u8 *tbuf = buf;
> -
> -    while (count) {
> -        int bytes = 0;
> -
> -        if (count >= 8 && !(off % 8)) {
> -            bytes = 8;
> -        } else if (count >= 4 && !(off % 4)) {
> -            bytes = 4;
> -        } else if (count >= 2 && !(off % 2)) {
> -            bytes = 2;
> -        } else {
> -            bytes = 1;
> -        }
> -
> -        ret = vfio_mig_access(vbasedev, tbuf, bytes, off, iswrite);
> -        if (ret) {
> -            return ret;
> -        }
> -
> -        count -= bytes;
> -        done += bytes;
> -        off += bytes;
> -        tbuf += bytes;
> -    }
> -    return done;
> -}
> -
> -#define vfio_mig_read(f, v, c, o)       vfio_mig_rw(f, (__u8 *)v, c, o, false)
> -#define vfio_mig_write(f, v, c, o)      vfio_mig_rw(f, (__u8 *)v, c, o, true)
> +#define vfio_mig_read(f, v, c, o)       vfio_mig_access(f, (__u8 *)v, c, o, false)
> +#define vfio_mig_write(f, v, c, o)      vfio_mig_access(f, (__u8 *)v, c, o, true)
>  
>  #define VFIO_MIG_STRUCT_OFFSET(f)       \
>                                   offsetof(struct vfio_device_migration_info, f)

I've been looking at this patch and it doesn't look wrong to me in any
obvious way. The question is: why had it been done like that in the
first place?

I dug through the old mailing list discussions, and it seems it had been
introduced in v26, but I don't see any explanation for that. Kirti, do
you remember why you added this?


