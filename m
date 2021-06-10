Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D44B53A27BC
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 11:06:20 +0200 (CEST)
Received: from localhost ([::1]:60538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrGdn-0005Jd-VP
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 05:06:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lrGd2-0004Uj-8t
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 05:05:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lrGct-00057e-U6
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 05:05:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623315922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zidWe7+HBRBA/KtVBH0nqOhw9XZdDQV9FXE42wo6LfU=;
 b=QNp14cXKinO68LfY+iPUGwigLpUUuiVm9K9ehEgOH3kMdVLp5ZZi6PX7Wag2YI3Bw2WG2p
 bvJW3vIpiLqtmHY5P4S9z9/zAxVWhwKIwcbqNHtQD7UkAqpXp5stZI0XCSWGBM/0IKk4QA
 CNw0qHrgx5sybouwkGCOq+cW/7LQ4Kk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-fbDWcOktNWaju-_u0ZA6jQ-1; Thu, 10 Jun 2021 05:05:20 -0400
X-MC-Unique: fbDWcOktNWaju-_u0ZA6jQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 j6-20020a05600c1906b029019e9c982271so3623063wmq.0
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 02:05:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zidWe7+HBRBA/KtVBH0nqOhw9XZdDQV9FXE42wo6LfU=;
 b=KKwiuR7zFaa1jVUgxqNoK1m4afXeD+gncKaPJ7K0SLOoAIcxYkhIxvIiZugGAND/61
 rZt1AKHMkGVd85xjM2WdWryPsLSmUztvIaWJJmXPQ2GHtN+VxQRYzoCwn8Me+O+zA1yi
 bNY3FtTWuBiNJRf5ZFxu3T7/993XOlD7CH3ra0OlTyV7fYZP4ccftQfyKV13gFfKJAMy
 6gjTvk2t/vxh0N7TLMZYyR+M0YCSWGL6huacoeHQDZE+cwJB/G5iocUPs8xY5MTxols6
 cMaW6voYcipLqYM4L6nG5q//kfYp1c0aZCceQwXXptoWojxFoD6SRQxWVQHEqnzYDp9+
 b3yQ==
X-Gm-Message-State: AOAM5311Lvrl0oS+yv+SMuEw0AH2OcgSClA5ktpZGWNxGfMXLHxsSobt
 vXZtOS5CIV04SnuJBs6S7wGr5Zh67Vd1ssiqVZOMpJHwJZCXKnEhS2WJjB7iyWgnH4cg87lgGta
 Z3u4jf7gsyidpoo0=
X-Received: by 2002:a7b:c052:: with SMTP id u18mr14303550wmc.105.1623315919419; 
 Thu, 10 Jun 2021 02:05:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlpjT1JMnmVNKEnwka2WqoEMQZLCRcoyB0MgcfYCbGqF3DbtiYs5aiBR0nRgSfcggKxBPVuA==
X-Received: by 2002:a7b:c052:: with SMTP id u18mr14303520wmc.105.1623315919178; 
 Thu, 10 Jun 2021 02:05:19 -0700 (PDT)
Received: from steredhat (host-79-18-148-79.retail.telecomitalia.it.
 [79.18.148.79])
 by smtp.gmail.com with ESMTPSA id u12sm2766460wrr.40.2021.06.10.02.05.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 02:05:18 -0700 (PDT)
Date: Thu, 10 Jun 2021 11:05:16 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 1/7] vhost: Add Error parameter to vhost_dev_init()
Message-ID: <20210610090516.jca55r3evopt3tth@steredhat>
References: <20210609154658.350308-1-kwolf@redhat.com>
 <20210609154658.350308-2-kwolf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210609154658.350308-2-kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 09, 2021 at 05:46:52PM +0200, Kevin Wolf wrote:
>This allows callers to return better error messages instead of making
>one up while the real error ends up on stderr. Most callers can
>immediately make use of this because they already have an Error
>parameter themselves. The others just keep printing the error with
>error_report_err().
>
>Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>---
> include/hw/virtio/vhost.h    |  2 +-
> backends/cryptodev-vhost.c   |  5 ++++-
> backends/vhost-user.c        |  4 ++--
> hw/block/vhost-user-blk.c    |  4 ++--
> hw/net/vhost_net.c           |  6 +++++-
> hw/scsi/vhost-scsi.c         |  4 +---
> hw/scsi/vhost-user-scsi.c    |  4 +---
> hw/virtio/vhost-user-fs.c    |  3 +--
> hw/virtio/vhost-user-vsock.c |  3 +--
> hw/virtio/vhost-vsock.c      |  3 +--
> hw/virtio/vhost.c            | 16 ++++++++++------
> 11 files changed, 29 insertions(+), 25 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


