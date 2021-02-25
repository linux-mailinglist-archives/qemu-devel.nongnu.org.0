Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D8B324C1A
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 09:35:54 +0100 (CET)
Received: from localhost ([::1]:36882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFC7j-0000eh-Cz
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 03:35:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lFC6K-0008SN-1Z
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 03:34:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lFC6H-0007OH-Ku
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 03:34:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614242060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3Z+B5rCibcEMmZDh47QzOLvDM8NBc5T5IBG+qFh4wfg=;
 b=FXR9Pd5uQIgDe8EWa5JwckHb3mnyASe3wGJ8PpOfcjGFr6VBNvx/jk8oI+PiuY02fjkFS9
 yA3JMyScoscG+SNv2PkkaMOqYdsUnPZBzUfa6tBdanUVJOJiS5B1R1b4dj15D4PY5PXWyp
 +++2Ulnd+ZQS3QO3ByQgz8ZC6Z0nvrw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-FvmMJJGCNRq1MTT5lkVeNw-1; Thu, 25 Feb 2021 03:34:18 -0500
X-MC-Unique: FvmMJJGCNRq1MTT5lkVeNw-1
Received: by mail-wm1-f69.google.com with SMTP id v130so1529850wma.0
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 00:34:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3Z+B5rCibcEMmZDh47QzOLvDM8NBc5T5IBG+qFh4wfg=;
 b=NtpI491g4cH9IBhc0E5d0Z5MQnN03ZlQnzCHFMKz075fJZZS6XxqF78AXh0rVCluwi
 kNM5C9wpVpTyz840d+e7ewaEjuTYh5QzTnqTDstMibu2FktrfwmeUbd5FUZN9OfuO7g1
 eYV9a9h/gOkYRQuIcgGscz23oVfcJh3Aq8HPm5flrp6vHX44wasjRSoWJFO4EwLJ7NzT
 +kOTtLkEQGGoc+AJ3U5qvtvTEo+9ekc9UtMtAXHhJSjoFdIqCMYWFJVaUmam9iAoIyLf
 oo0CvJRTIudBdo/xgPjGwXmoUU7CjeB/xg7IWrtuiL2F2jGLIQCDNwFymMOYMBBAGIBi
 eBYw==
X-Gm-Message-State: AOAM533seNqlWbbDamaVoDCdsqh4r9F1bYaTiHXjdAnJy9U6+QGzlFYE
 KbpsQM0bQ1DaZ87gdu98T+IcVu43YOExxJ8DvNBY+KkTs8QIH2ierZyYm6gQjpgy0EAZ0HwwT1E
 sdorAcrUWOZqtjyo=
X-Received: by 2002:adf:9f10:: with SMTP id l16mr2256944wrf.0.1614242057054;
 Thu, 25 Feb 2021 00:34:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzGpymZqxqmis23wWfzzhIJ5wycw31aSmSYk9JPPyT4QKF5JxixEGqewU51tAkiB/xPgrmkRA==
X-Received: by 2002:adf:9f10:: with SMTP id l16mr2256925wrf.0.1614242056821;
 Thu, 25 Feb 2021 00:34:16 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id c26sm7031291wrb.87.2021.02.25.00.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 00:34:16 -0800 (PST)
Date: Thu, 25 Feb 2021 09:34:13 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH v4] virtio-blk: Respect discard granularity
Message-ID: <20210225083413.yeyegvqbke3u5pyz@steredhat>
References: <20210224101747.hmgou6z7qzmk62ft@steredhat>
 <20210225001239.47046-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210225001239.47046-1-akihiko.odaki@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 25, 2021 at 09:12:39AM +0900, Akihiko Odaki wrote:
>Report the configured granularity for discard operation to the
>guest. If this is not set use the block size.
>
>Since until now we have ignored the configured discard granularity
>and always reported the block size, let's add
>'report-discard-granularity' property and disable it for older
>machine types to avoid migration issues.
>
>Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
>---
> hw/block/virtio-blk.c          | 8 +++++++-
> hw/core/machine.c              | 4 +++-
> include/hw/virtio/virtio-blk.h | 1 +
> 3 files changed, 11 insertions(+), 2 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


