Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 251CB6A151E
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 03:56:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVOEp-0002nf-LT; Thu, 23 Feb 2023 21:55:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pVOES-0002lh-R0
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 21:54:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pVOEL-0002Oc-J4
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 21:54:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677207279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jY+WvmWqSxmh1hrdGfa1XtW5aQM8QCb/+e3//Yj+52A=;
 b=Q2fqiv1iS6aVQqm+7UJRPFZNYGGYuMXtRrDdZj0hsDZZR3OnbYTYEAq1rb++6vhZ0akwM+
 qjuqXPQKlxMeKSiUKs4qR/Grkth27iP/CJRbVp4n0XUTedK3VFq1uVS6H7uHnM+V8HC+y3
 IyBM8GPM4yQmFcXCWBraqXGVJGpBxeU=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-471-YWO46L1xPlaxIZuMPB7VKg-1; Thu, 23 Feb 2023 21:54:37 -0500
X-MC-Unique: YWO46L1xPlaxIZuMPB7VKg-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-17255c4ce4fso3620514fac.18
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 18:54:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jY+WvmWqSxmh1hrdGfa1XtW5aQM8QCb/+e3//Yj+52A=;
 b=FdhD3PhPG9YHMh1jyayCUnLByJDmLZcdeXYjWABNq3B38cwuvVIboIF+eW//HepaWK
 Q4teDLK6DkrZnYTI846QsIMtujXTUc6fWFqFumQw6qXF/vUt4mLpufX5OXPO84YFmx9P
 B5w45cnxfHcgMn9gTDifclZ1CR8HZP3+Yv/znelcyTZ1JU7WgglGqwcHBy0EgL1EIKrP
 57ZtMpBcdK7X0zPcD0wYIMBqv2yLgPQSVPKCW/06rKBAZiRz45Nwvzed/7aQtpjIO8Eo
 401lGX0MT13sfWFw9A/dN+h/81d/ofyDChFMKeeKjT0nqYcZZS5YVLRK038rTzpVcfaw
 sVLA==
X-Gm-Message-State: AO0yUKU6vOQ8KhPS2dnkjrPhiBuurS6O0WNybmF+kcjLm5K5V73LbWXq
 JIzrz3jlWSGFMow2a4RscK1oa+qKa5LqbNVMDyMWmR2ktPX2SW9l8gWndNZlt0VWbVFoRamHbGo
 hYfWc5sE60vuDar2Iw8yDmxgRFzUy65U=
X-Received: by 2002:a05:6870:7732:b0:16d:dec4:67bb with SMTP id
 dw50-20020a056870773200b0016ddec467bbmr618531oab.9.1677207276941; 
 Thu, 23 Feb 2023 18:54:36 -0800 (PST)
X-Google-Smtp-Source: AK7set8Dvec6kzfffTxUmGcxeBEgGjqehz7KIqumJkS9ElWFn4oGdSUqEkAXIhGdopuAoOcOO8xI1rXK5RW0OKa97sM=
X-Received: by 2002:a05:6870:7732:b0:16d:dec4:67bb with SMTP id
 dw50-20020a056870773200b0016ddec467bbmr618524oab.9.1677207276731; Thu, 23 Feb
 2023 18:54:36 -0800 (PST)
MIME-Version: 1.0
References: <20230223065924.42503-1-jasowang@redhat.com> <Y/eKecGZp2H3jmIK@x1n>
In-Reply-To: <Y/eKecGZp2H3jmIK@x1n>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 24 Feb 2023 10:54:25 +0800
Message-ID: <CACGkMEvHnVChatgBQ8_jnT2NripMfbotSfgi+hUVb2+SVbc7vQ@mail.gmail.com>
Subject: Re: [PATCH V2 0/5] Fix UNMAP notifier for intel-iommu
To: Peter Xu <peterx@redhat.com>
Cc: mst@redhat.com, qemu-devel@nongnu.org, eric.auger@redhat.com, 
 viktor@daynix.com, lvivier@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

On Thu, Feb 23, 2023 at 11:47 PM Peter Xu <peterx@redhat.com> wrote:
>
> On Thu, Feb 23, 2023 at 02:59:19PM +0800, Jason Wang wrote:
> > Hi All:
> >
> > According to ATS, device should work if ATS is disabled. This is not
> > correctly implemented in the current intel-iommu since it doesn't
> > handle the UNMAP notifier correctly. This breaks the vhost-net +
> > vIOMMU without dt.
> >
> > The root casue is that the when there's a device IOTLB miss (note that
> > it's not specific to PCI so it can work without ATS), Qemu doesn't
> > build the IOVA tree, so when guest start an IOTLB invalidation, Qemu
> > won't trigger the UNMAP notifier.
> >
> > Fixing this by triggering UNMAP notifier in those cases.
>
> Maybe someday we should start merging different places where we used the
> same IOMMU_NOTIFIER_UNMAP event and also taking care of truncation of
> notifier ranges within memory.c, but that can definitely be done later.

Yes, probably.

>
> Reviewed-by: Peter Xu <peterx@redhat.com>
>
> Thanks, Jason!

You're welcome :)

Thanks

>
> --
> Peter Xu
>


