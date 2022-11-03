Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 167B061899A
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 21:33:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqgtO-0007ej-68; Thu, 03 Nov 2022 16:32:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqgsy-0007ZS-Iq
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 16:32:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqgsx-0006U0-7s
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 16:32:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667507542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gWRMXbZuWodk+ZBI/GrzAI+gKOgHumjszDV6MqhtouU=;
 b=V50o2JqVUZLdIT6zACu2SEmMsK/ts7sl8ZO7D6fadd1nx6XhEw3arUmY2+kI5szVhfNlSx
 CBtPKOyGUjiVWUKgS0NDqUNjRYzls6nsFQO9fpLr+QYQinlAd30gzjHUomtmvPSpBB18Lj
 5JAle2eNsnzEOCovijGCFK5d1piqAqg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-336-brn7D6YXMN2ru1rSY9Q_fA-1; Thu, 03 Nov 2022 16:32:21 -0400
X-MC-Unique: brn7D6YXMN2ru1rSY9Q_fA-1
Received: by mail-wm1-f70.google.com with SMTP id
 j2-20020a05600c1c0200b003cf7397fc9bso1347001wms.5
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 13:32:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gWRMXbZuWodk+ZBI/GrzAI+gKOgHumjszDV6MqhtouU=;
 b=vBMIUXw6CowlyF1w4cMpF0pO3S96JuoRm1UiSRrJNKgW5+13imgAU/w5/lelCM79no
 CiOD3X61lGn6Z2L0oI56u9ehaLkQI8J0HTuOgU27AnChLe/96F8w8K3xfZ3yrUnihk5l
 u8DcZ0IHd6kMlO0is3lrTjFHfAnkgbubf1Hx5L0U4VDIhRKDx8dLhuyfCnRYtAg5RrFp
 LIjzzHVRMLyxyhVqH4AaZK46SftdHkPKLPfWy9jSQe/Oa8vzU5XzoKHGCIylOr30sbS1
 lYf8C8LxvxQ8fUGeqorSYnYZ/Fc7lw/dukNZApClZAxedkEfbhU1XiWKfjf4YrXOshuT
 1Uog==
X-Gm-Message-State: ACrzQf1uFnoNfuk4xHexY3WyXT75ci1A/GS0NL/ZheHQWZpV+2mFbANs
 Pa5PRo6rfXgrW2twpakaIGS+P0OYYysegz2uZMw8cV3U7tKqADx4VK73BQrV7qE3bzksKxDHuor
 MbIyga1+COC3X/qg=
X-Received: by 2002:adf:ef82:0:b0:234:ef87:dc8d with SMTP id
 d2-20020adfef82000000b00234ef87dc8dmr20694386wro.297.1667507540075; 
 Thu, 03 Nov 2022 13:32:20 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6DeMUXOaEfFcbyPDVGUFjJaJnbW+xXo2F+NBX8yphPRjnCBwdE8k7ErcVdOhmG8SAYC11RqA==
X-Received: by 2002:adf:ef82:0:b0:234:ef87:dc8d with SMTP id
 d2-20020adfef82000000b00234ef87dc8dmr20694372wro.297.1667507539856; 
 Thu, 03 Nov 2022 13:32:19 -0700 (PDT)
Received: from redhat.com ([2.55.15.188]) by smtp.gmail.com with ESMTPSA id
 q23-20020a1ce917000000b003c5571c27a1sm1022066wmc.32.2022.11.03.13.32.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 13:32:18 -0700 (PDT)
Date: Thu, 3 Nov 2022 16:32:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 peter.maydell@linaro.org, philmd@linaro.org, qemu-devel@nongnu.org,
 stefanha@redhat.com
Subject: Re: [PULL v2 00/82] pci,pc,virtio: features, tests, fixes, cleanups
Message-ID: <20221103163136-mutt-send-email-mst@kernel.org>
References: <2821393d-21fe-cb7b-1396-dac6fe4dfa6b@linaro.org>
 <20221103154208.91501-1-ani@anisinha.ca>
 <CAARzgwzc66yTTSiKT6Q4-hGZ2m1jcuy8d9D_NjacVpCMut=3tw@mail.gmail.com>
 <CAARzgwxTpKmAqb7K7MzKG8MF6q3U8=z4nbxGoK-0b-rxPSvz+Q@mail.gmail.com>
 <CAARzgwyVA8M_9S2Hio5m9Zin9JyeWcHUeejQJj6=e98FkPYL2A@mail.gmail.com>
 <Y2P9QAMyL2MIfbSL@redhat.com>
 <CAARzgwzJtTaq317XvdMxd2JTZm9C+NjNNFE84anUORE0WxEx9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAARzgwzJtTaq317XvdMxd2JTZm9C+NjNNFE84anUORE0WxEx9w@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Nov 03, 2022 at 11:14:21PM +0530, Ani Sinha wrote:
> 
> 
> On Thu, Nov 3, 2022 at 23:11 Daniel P. Berrangé <berrange@redhat.com> wrote:
> 
>     On Thu, Nov 03, 2022 at 10:26:26PM +0530, Ani Sinha wrote:
>     > On Thu, Nov 3, 2022 at 10:18 PM Ani Sinha <ani@anisinha.ca> wrote:
>     > >
>     > > On Thu, Nov 3, 2022 at 10:17 PM Ani Sinha <ani@anisinha.ca> wrote:
>     > > >
>     > > > On Thu, Nov 3, 2022 at 9:12 PM Ani Sinha <ani@anisinha.ca> wrote:
>     > > > >
>     > > > > > To pull this image:
>     > > > >
>     > > > > > $ docker pull registry.gitlab.com/qemu-project/qemu/fedora:latest
>     > > > >
>     > > > > Actually the URL is:
>     > > > >
>     > > > > $ docker pull registry.gitlab.com/qemu-project/qemu/qemu/
>     fedora:latest
>     > > > >
>     > > > > > (or to be sure to pull the very same:)
>     > > > >
>     > > > > > $ docker pull
>     > > > > > registry.gitlab.com/qemu-project/qemu/
>     fedora:d6d20c1c6aede3a652eb01b781530cc10392de2764503c84f9bf4eb1d7a89d26
>     > > > >
>     > > > > Same here,
>     > > > >
>     > > > > registry.gitlab.com/qemu-project/qemu/qemu/
>     fedora:d6d20c1c6aede3a652eb01b781530cc10392de2764503c84f9bf4eb1d7a89d26
>     > > >
>     > > > I pulled this container,
>     >
>     > This is fc35, the same mst is using:
>     >
>     > # cat /etc/fedora-release
>     > Fedora release 35 (Thirty Five)
>     >
>     > Hmm. Something else is going on in the gitlab specific environment.
> 
>     Or it is a non-deterministic race condition and the chance  of hitting
>     it varies based on your hardware and/or CPU load.
> 
> 
> Can we kick off the same CI job again? Does it pass this time? 
> 

It's completely deterministic on gitlab. Stefan also reproduced on
his F36 box.

-- 
MST


