Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 599E44BBE00
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 18:07:02 +0100 (CET)
Received: from localhost ([::1]:51304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL6ii-0008SX-Re
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 12:07:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nL6Zy-00089n-Rn
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 11:57:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nL6Zo-0000WS-Mr
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 11:57:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645203460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZD4wFKoKIljH4JJpzSaYSiiiVluNhivyKYyxQc+zYOI=;
 b=E0ou3Ruv5HoKXe/TC/EAMlMxQr96Hc4D+jzefPN6z4uPlUZoclGlsoDRgipWjb3KSwIsnm
 ULBH1MPSpguOY64ZgHDO0e0qRnhKD3dSNzwIujPzsT2GtBNgFhVIdkfPqOUu19Zi/3uE17
 HTjYzNnxckAgCjFkGbHCWkG2+Nm0LuM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-298-hHVyft5iP2eDy1aqj5t8yg-1; Fri, 18 Feb 2022 11:57:38 -0500
X-MC-Unique: hHVyft5iP2eDy1aqj5t8yg-1
Received: by mail-ed1-f71.google.com with SMTP id
 o5-20020a50c905000000b00410effbf65dso5841463edh.17
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 08:57:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZD4wFKoKIljH4JJpzSaYSiiiVluNhivyKYyxQc+zYOI=;
 b=ukP8J4KtA7zOAl2QY8nWiRB0iJX2kgdnfDmYL/QPtjTFVVOV8+kupvX9m6jA6trgdA
 G5Pv04+qQHl1QntArgcWepvV3WiHhN/LUbSBRinQoEcrEntWiGytW4G3sRa4sMlou74U
 ddnC7hEkpGI+rTZ9EJV5tEyYxUytMV8dpK4Nrsz5BkLvHRs4+h2nKBXVzKxnc4TXTVSU
 +kUzXhJkqHTCzybQaAwdSfa6FzLmOf/ZPo3ZppyEMw7Ig+a0GBhYa/5mvjQefqe9PWKf
 7xQPMGuEHyK5h2ryC9BmlH8XZRBvsjqgwwFyUELlOvOO+UizN1VWRMyjhVIaZkT+QvmX
 xZMQ==
X-Gm-Message-State: AOAM530XelPZo52vTcfkKAlKYKCU5tWN6e6fW+wHWIuBldRYJ/xdG9EN
 kuMxF0HErqLTL5WnTdoNcAsA62S4mtVwk1IbTyRfgxIk1Igw8AYnrlR2f1c7lcmNrl0sjinKrcQ
 5ZEMVvoMb0PzTgkA=
X-Received: by 2002:aa7:c446:0:b0:410:9a8e:9b85 with SMTP id
 n6-20020aa7c446000000b004109a8e9b85mr8979302edr.319.1645203455745; 
 Fri, 18 Feb 2022 08:57:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzkCgKZ2KTGxRbmaOL0PKbEMiGHQJYQOVvLIIDqmysoZyRDW3c3VisxJCaMVVePDtnECxUTlQ==
X-Received: by 2002:aa7:c446:0:b0:410:9a8e:9b85 with SMTP id
 n6-20020aa7c446000000b004109a8e9b85mr8979291edr.319.1645203455546; 
 Fri, 18 Feb 2022 08:57:35 -0800 (PST)
Received: from sgarzare-redhat (host-95-248-229-156.retail.telecomitalia.it.
 [95.248.229.156])
 by smtp.gmail.com with ESMTPSA id go13sm2404449ejc.190.2022.02.18.08.57.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 08:57:35 -0800 (PST)
Date: Fri, 18 Feb 2022 17:57:32 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Subject: Re: [PATCH 2/2] Allow VIRTIO_F_IN_ORDER to be negotiated for vdpa
 devices
Message-ID: <20220218165732.47cvp7wshxfpi3nu@sgarzare-redhat>
References: <20220215072231.2498-1-gdawar@xilinx.com>
 <20220215072231.2498-3-gdawar@xilinx.com>
 <20220217023150-mutt-send-email-mst@kernel.org>
 <20220217142910.eovyddvvpxkvzchf@sgarzare-redhat>
 <CAJaqyWe-FSKSVYyDr_cMzGWQreTi+bkY9O6eaOvF5NmJoTBx9w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJaqyWe-FSKSVYyDr_cMzGWQreTi+bkY9O6eaOvF5NmJoTBx9w@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>,
 Martin Petrus Hubertus Habets <martinh@xilinx.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, tanujk@xilinx.com, pabloc@xilinx.com,
 Gautam Dawar <gautam.dawar@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 18, 2022 at 11:24:23AM +0100, Eugenio Perez Martin wrote:
>On Thu, Feb 17, 2022 at 3:29 PM Stefano Garzarella <sgarzare@redhat.com> wrote:
>>
>> On Thu, Feb 17, 2022 at 02:32:48AM -0500, Michael S. Tsirkin wrote:
>> >On Tue, Feb 15, 2022 at 12:52:31PM +0530, Gautam Dawar wrote:
>> >> This patch adds the ability to negotiate VIRTIO_F_IN_ORDER bit
>> >> for vhost-vdpa backend when the underlying device supports this
>> >> feature.
>> >> This would aid in reaping performance benefits with HW devices
>> >> that implement this feature. At the same time, it shouldn't have
>> >> any negative impact as vhost-vdpa backend doesn't involve any
>> >> userspace virtqueue operations.
>> >>
>> >> Signed-off-by: Gautam Dawar <gdawar@xilinx.com>
>> >
>> >Having features that hardware implements but qemu does not
>> >means we can't migrate between them.
>> >So I'd rather see a userspace implementation.
>>
>> FYI Jason proposed to support VIRTIO_F_IN_ORDER in QEMU/Linux as an idea
>> for the next GSoC/Outreachy. I offered to mentor and prepared a project
>> description [1], if anyone else is interested, it would be great to have
>> a co-mentor :-)
>>
>
>I'd be happy to co-mentor for sure, should I edit the wiki to reflect it?

Great :-)

Yes, please edit the wiki page here: 
https://wiki.qemu.org/Internships/ProjectIdeas/VIRTIO_F_IN_ORDER

Thanks,
Stefano


