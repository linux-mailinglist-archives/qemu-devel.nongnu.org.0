Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FB568A6D1
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 00:12:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO5DF-0007DK-AU; Fri, 03 Feb 2023 18:11:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pO5DA-0007Bt-4t
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 18:11:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pO5D4-0000Yz-QR
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 18:11:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675465869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VZskXHmWmPW5TkEkafO+Iwm1j3YxvdFc+fNRaVVCiGs=;
 b=L8WokVpCAU7PmvVr96N/aC66KDb8jfvJx5TqS4G8006LDI6XOpc4hRmN8pIyVbUl8NkCDP
 pCnrOTCzmP8mDuoVoo3EGX6HBv/l96eiRcl/uAZHLEgoSwimH0O1IbXw1Gdk1OkQCzP5c6
 PYeOf1/QPHSF5/0UXLzEE96bEukcbHg=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-636-xc1hRkolMja2GBlQaUZw5Q-1; Fri, 03 Feb 2023 18:11:08 -0500
X-MC-Unique: xc1hRkolMja2GBlQaUZw5Q-1
Received: by mail-io1-f69.google.com with SMTP id
 q12-20020a6b8e0c000000b0071d8eef7c67so3830014iod.5
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 15:11:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VZskXHmWmPW5TkEkafO+Iwm1j3YxvdFc+fNRaVVCiGs=;
 b=M55OgWaT5cpIJ3LN4UtL5LyM5DAPMODBpylOESyI+UbIjAR4ejGCjBycgIe041udpN
 7kMW4+Apskz6itG2Y1I6zJHw8hxrhLKjJWszKlBeiI04zv4SZJF2K0LGaVh1UbIXwnwy
 qSGfwBPpdFavM5q3idOMSn+Qz2CRwNrlDkosIuha7hnW+6TGsim+gwYLiY/RxevMKGYu
 kPco+zus04ZeEFKWGRQNcrqUARW+QuJa4mA1CylK6xkflagw1gkQroJrujfnnKlR87a+
 8F0b9k3HmxPC4ByQ+xb66ilxcIoU6J5DB4KBd8IOCFLnEQRznq/dpbuWWx42emNp31ia
 vd8A==
X-Gm-Message-State: AO0yUKWEOBQ4IHEk1XhckqajkWc6mXIaz3aK1xSs95ftNFSyX6ExKdrg
 Aekr1dC60QU2AIGfkrsVUnekO2NCm6hFi2bZ8JmxoTqdzkmXVLEqt4/jUMqeHye3T4fo0x8ophy
 SC1GM7IlORCfYv3Y=
X-Received: by 2002:a05:6602:2d0a:b0:719:d382:9d7f with SMTP id
 c10-20020a0566022d0a00b00719d3829d7fmr10216484iow.4.1675465867512; 
 Fri, 03 Feb 2023 15:11:07 -0800 (PST)
X-Google-Smtp-Source: AK7set8dsdpa2P7whuYgIJOUEfrb9s03bNt3PQswskraR/hfFBeQ1SD26Z9bMK4y5ShD2KhcVJKcGw==
X-Received: by 2002:a05:6602:2d0a:b0:719:d382:9d7f with SMTP id
 c10-20020a0566022d0a00b00719d3829d7fmr10216471iow.4.1675465867297; 
 Fri, 03 Feb 2023 15:11:07 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 n20-20020a056638121400b003acde48bdc3sm1212089jas.111.2023.02.03.15.11.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 15:11:06 -0800 (PST)
Date: Fri, 3 Feb 2023 16:11:05 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: John Johnson <john.g.johnson@oracle.com>
Cc: qemu-devel@nongnu.org, clg@redhat.com, philmd@linaro.org
Subject: Re: [PATCH v2 11/23] vfio-user: get region info
Message-ID: <20230203161105.44e7ece6.alex.williamson@redhat.com>
In-Reply-To: <f8cb1656f09ac50ab5ba68ca40be700fc2d66e59.1675228037.git.john.g.johnson@oracle.com>
References: <cover.1675228037.git.john.g.johnson@oracle.com>
 <f8cb1656f09ac50ab5ba68ca40be700fc2d66e59.1675228037.git.john.g.johnson@oracle.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
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

On Wed,  1 Feb 2023 21:55:47 -0800
John Johnson <john.g.johnson@oracle.com> wrote:
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 792e247..d26b325 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -1584,6 +1584,11 @@ int vfio_region_setup(Object *obj, VFIODevice *vbasedev, VFIORegion *region,
>      region->size = info->size;
>      region->fd_offset = info->offset;
>      region->nr = index;
> +    if (vbasedev->regfds != NULL) {
> +        region->fd = vbasedev->regfds[index];
> +    } else {
> +        region->fd = vbasedev->fd;
> +    }
>  
>      if (region->size) {
>          region->mem = g_new0(MemoryRegion, 1);
> @@ -1635,7 +1640,7 @@ int vfio_region_mmap(VFIORegion *region)
>  
>      for (i = 0; i < region->nr_mmaps; i++) {
>          region->mmaps[i].mmap = mmap(NULL, region->mmaps[i].size, prot,
> -                                     MAP_SHARED, region->vbasedev->fd,
> +                                     MAP_SHARED, region->fd,
>                                       region->fd_offset +
>                                       region->mmaps[i].offset);
>          if (region->mmaps[i].mmap == MAP_FAILED) {
> @@ -2442,10 +2447,17 @@ void vfio_put_base_device(VFIODevice *vbasedev)
>          int i;
>  
>          for (i = 0; i < vbasedev->num_regions; i++) {
> +            if (vbasedev->regfds != NULL && vbasedev->regfds[i] != -1) {
> +                close(vbasedev->regfds[i]);
> +            }

There's an exit in vfio_get_region_info() where regfds is allocated and
the regfd[i] could still be zero initialized, ie. if .get_region_info()
fails.  vfio_get_all_regions() ignores the return value of
vfio_get_region_info().  We could close(0) here.  Thanks,

Alex


