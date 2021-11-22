Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9545B458FA9
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 14:45:42 +0100 (CET)
Received: from localhost ([::1]:53238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp9dd-00076n-K9
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 08:45:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mp9X2-0000tz-Vq
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 08:38:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mp9X0-0001ra-V0
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 08:38:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637588328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TPpl4dLb2KzN9j94zo+FyeVR0L5j0uykRCcIXkcFxAM=;
 b=bRFexkZfQb40Ucc2inXHi4Zrujib+xE0/Orb8Zo+ayguqLT47FuQup/26epWI0H8I0tCP1
 FYl8zz7BkpSfu74yi36nfybGzvAIgPF6TEpZlBdKxn4NtU8t0YBSKFBwiwnAkXh+XXj+ra
 7syYFOCy4nP/lMX5Zcb7NYZHjNJ6tW8=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-tEfGm1U0ODaP_BDoxFjJpw-1; Mon, 22 Nov 2021 08:38:47 -0500
X-MC-Unique: tEfGm1U0ODaP_BDoxFjJpw-1
Received: by mail-oi1-f198.google.com with SMTP id
 bj40-20020a05680819a800b002bc9d122f13so12730081oib.2
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 05:38:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=TPpl4dLb2KzN9j94zo+FyeVR0L5j0uykRCcIXkcFxAM=;
 b=RQZIkX4hFwQ9ktfxNbJdt1EDaQuyZfahRymgSfD8dgDjdWi5vQ8F9LRPoLR1ourfbG
 FVgt9XMEwmsSOBIhNRFo8XnbRBU22F3M5xp3uxo2l4pdlAUZPIpfxw8gma7Clkj9E5Yc
 mNMYT+vaEznUA+sdkRmJaOud1i4AHdE5yyiWP5BI49g11ju05ljE6IOGOftmeZUjvl9+
 V7CR26BE0GnxyFC1kW1zdo3tjtsJD9WDX32FcFFUYan/QfghrEmSi/P5HFEHmFSmaNuR
 9LXCrK7k3eILU++NmW44PtVe8APjaaX9xOFummrjCRjkp+6oG6arCSTaG/0eJgQ75AZO
 HC0g==
X-Gm-Message-State: AOAM531u7WG4D3luJ8f8/f4SjgdIMWQztfbb/uayF1JI5M536U0Q3dx9
 juXwH8cuK0ntdH2blZpQvXE3R5vrMJXD+Qt/NEh5YfHzftJeC0Gx8CCUvD2BEkbWxXDr4IfvDan
 PGobKGqolmUSLr7g=
X-Received: by 2002:a4a:3744:: with SMTP id r65mr5003249oor.11.1637588326737; 
 Mon, 22 Nov 2021 05:38:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxO2w4IMuODMrVh7ozN+vd+qfYvlmDtzB/yw2UCjIOVhXy957zBTxRwxlKvR+7kmJVwfDDBCw==
X-Received: by 2002:a4a:3744:: with SMTP id r65mr5003229oor.11.1637588326501; 
 Mon, 22 Nov 2021 05:38:46 -0800 (PST)
Received: from redhat.com ([38.15.36.239])
 by smtp.gmail.com with ESMTPSA id i16sm1862414oig.15.2021.11.22.05.38.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 05:38:46 -0800 (PST)
Date: Mon, 22 Nov 2021 06:38:45 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Yishai Hadas <yishaih@nvidia.com>
Subject: Re: [PATCH] vfio/migration: Improve to read/write full migration
 region per chunk
Message-ID: <20211122063845.42a6c0cb.alex.williamson@redhat.com>
In-Reply-To: <9e1ac80f-da3c-ed68-89f4-c0008220c10d@nvidia.com>
References: <20211111095040.183977-1-yishaih@nvidia.com>
 <9e1ac80f-da3c-ed68-89f4-c0008220c10d@nvidia.com>
Organization: Red Hat
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
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
Cc: cjia@nvidia.com, cohuck@redhat.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 kwankhede@nvidia.com, jgg@nvidia.com, maorg@nvidia.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 22 Nov 2021 09:40:56 +0200
Yishai Hadas <yishaih@nvidia.com> wrote:

> Gentle ping for review, CCing more people who may be involved.

I'll wait for comments from others, but since we're already in the 6.2
freeze and vfio migration is still experimental (and I'm on PTO this
week), I expect this to be queued when the next development window
opens.  Thanks,

Alex


> On 11/11/2021 11:50 AM, Yishai Hadas wrote:
> > Upon reading/writing the migration data there is no real reason to limit
> > the read/write system call from the file to be 8 bytes.
> >
> > In addition, there is no reason to depend on the file offset alignment.
> > The offset is just some logical value which depends also on the region
> > index and has nothing to do with the amount of data that can be
> > accessed.
> >
> > Move to read/write the full region size per chunk, this reduces
> > dramatically the number of the systems calls that are needed and improve
> > performance.
> >
> > Signed-off-by: Yishai Hadas <yishaih@nvidia.com>
> > ---
> >   hw/vfio/migration.c | 36 ++----------------------------------
> >   1 file changed, 2 insertions(+), 34 deletions(-)
> >
> > diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> > index ff6b45de6b5..b5f310bb831 100644
> > --- a/hw/vfio/migration.c
> > +++ b/hw/vfio/migration.c
> > @@ -62,40 +62,8 @@ static inline int vfio_mig_access(VFIODevice *vbasedev, void *val, int count,
> >       return 0;
> >   }
> >   
> > -static int vfio_mig_rw(VFIODevice *vbasedev, __u8 *buf, size_t count,
> > -                       off_t off, bool iswrite)
> > -{
> > -    int ret, done = 0;
> > -    __u8 *tbuf = buf;
> > -
> > -    while (count) {
> > -        int bytes = 0;
> > -
> > -        if (count >= 8 && !(off % 8)) {
> > -            bytes = 8;
> > -        } else if (count >= 4 && !(off % 4)) {
> > -            bytes = 4;
> > -        } else if (count >= 2 && !(off % 2)) {
> > -            bytes = 2;
> > -        } else {
> > -            bytes = 1;
> > -        }
> > -
> > -        ret = vfio_mig_access(vbasedev, tbuf, bytes, off, iswrite);
> > -        if (ret) {
> > -            return ret;
> > -        }
> > -
> > -        count -= bytes;
> > -        done += bytes;
> > -        off += bytes;
> > -        tbuf += bytes;
> > -    }
> > -    return done;
> > -}
> > -
> > -#define vfio_mig_read(f, v, c, o)       vfio_mig_rw(f, (__u8 *)v, c, o, false)
> > -#define vfio_mig_write(f, v, c, o)      vfio_mig_rw(f, (__u8 *)v, c, o, true)
> > +#define vfio_mig_read(f, v, c, o)       vfio_mig_access(f, (__u8 *)v, c, o, false)
> > +#define vfio_mig_write(f, v, c, o)      vfio_mig_access(f, (__u8 *)v, c, o, true)
> >   
> >   #define VFIO_MIG_STRUCT_OFFSET(f)       \
> >                                    offsetof(struct vfio_device_migration_info, f)  
> 
> 


