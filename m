Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4A9322C06
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 15:16:20 +0100 (CET)
Received: from localhost ([::1]:45922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEYU7-0007Cw-F8
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 09:16:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lEYSI-0006ML-5G
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 09:14:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lEYSG-0003xP-Co
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 09:14:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614089663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zQA3fkJo1uAU5TPsKUe1n/8Ftx/oUU4sgYeRhFvYupU=;
 b=UORRAeqo41Ro9z+v1tHLO7Fq9YO8y0T+sJZxRp2Xg5fXseZ6eSVCUUTcIPNBsVCZcmVIBr
 OKBudVS9KGbBh2MJcxjQmIp6g8Xwn9EYH4hGsp5dtFZGqGc1d37K2oqQ4QOgaqBGEkCOgv
 maQ+FPOmrwJDFNiZQqoDGB3ue6iMXnY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-UIjSn30XPcekTMiGsWwu_w-1; Tue, 23 Feb 2021 09:14:21 -0500
X-MC-Unique: UIjSn30XPcekTMiGsWwu_w-1
Received: by mail-wr1-f69.google.com with SMTP id w11so7425007wrp.6
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 06:14:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zQA3fkJo1uAU5TPsKUe1n/8Ftx/oUU4sgYeRhFvYupU=;
 b=rQGnfNNUxVc8qjXrCPIZXupAFFgL0k36qEMS5rx3k7MqiJEP7ogJVClT3S9O3kpDUV
 jCC1gORFblNkH5lTHryeQmBi2DabpwsgCzmmR9+cIi0Xg/ccCwwLtKtmferwhnUbFAgU
 EJ7nIesYtUjQQfE/SWYQtdGesrpS7d2iHlymr3T4+2KueP2SSPwSafOqStFFveAak64B
 poFgsfAMeq/UwMYdYgrp2OXc9F7Bhi5ozBvOWdx9mC2foHTQn5jzap6w6plp45ACuPPp
 FYVjaUMe/TrhHRlj9v437e/StxPY4Qgvrtu3Q0QCH/GMYQE7zyJKKeIiLlEd7kflZiTN
 kZjQ==
X-Gm-Message-State: AOAM533dKiIqNr2mvnrh1OJSgtPbN158vR9pJ02Rn1BK5VOQ9BlHtZBt
 2lFhxRb++i849yFk56uqqYH4pCV8fnXqv2Is2sY2O2jNSnwy1a7aZCHRaveDaTG+cX4vN5EwMr5
 xc3N+im37CF/mBr4=
X-Received: by 2002:a05:600c:2183:: with SMTP id
 e3mr9830634wme.47.1614089659853; 
 Tue, 23 Feb 2021 06:14:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx/hQZbfgQZ9w6SlMO46rz0/6YAxfPtMbxH2KFiouX1BIb1VZHTzRlWETvJGtAYUeZ4/wNQTQ==
X-Received: by 2002:a05:600c:2183:: with SMTP id
 e3mr9830618wme.47.1614089659680; 
 Tue, 23 Feb 2021 06:14:19 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id t15sm2777511wmi.48.2021.02.23.06.14.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 06:14:18 -0800 (PST)
Date: Tue, 23 Feb 2021 09:14:16 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [RFC PATCH 0/6] vhost-user: Shutdown/Flush slave channel properly
Message-ID: <20210223091358-mutt-send-email-mst@kernel.org>
References: <20210125180115.22936-1-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210125180115.22936-1-vgoyal@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: virtio-fs@redhat.com, marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 stefanha@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 25, 2021 at 01:01:09PM -0500, Vivek Goyal wrote:
> Hi,
> 
> We are working on DAX support in virtiofs and have some patches out of
> the tree hosted here.
> 
> https://gitlab.com/virtio-fs/qemu/-/commits/virtio-fs-dev

any plans to post a non RFC version?

> These patches have not been proposed for merge yet, becasue David
> Gilbert noticed that we can run into a deadlock during an emergency
> reboot of guest kernel. (echo b > /proc/sysrq-trigger).
> 
> I have provided details of deadlock in 4th path of the series with
> subject "qemu, vhost-user: Extend protocol to start/stop/flush slave
> channel".
> 
> Basic problem seems to be that we don't have a proper mechanism to
> shutdown slave channel when vhost-user device is stopping. This means
> there might be pending messages in slave channel and slave is blocked
> and waiting for response.
> 
> This is an RFC patch series to enhance vhost-user protocol to 
> properly shutdown/flush slave channel and avoid the deadlock. Though
> we faced the issue in the context of virtiofs, any vhost-user
> device using slave channel can potentially run into issues and
> can benefit from these patches.
> 
> Any feedback is welcome. Currently patches are based on out of
> tree code but after I get some feedback, I can only take pieces
> which are relevant to upstream and post separately.
> 
> Thanks
> Vivek
> 
> Vivek Goyal (6):
>   virtiofsd: Drop ->vu_dispatch_rwlock while waiting for thread to exit
>   libvhost-user: Use slave_mutex in all slave messages
>   vhost-user: Return error code from slave_read()
>   qemu, vhost-user: Extend protocol to start/stop/flush slave channel
>   libvhost-user: Add support to start/stop/flush slave channel
>   virtiofsd: Opt in for slave start/stop/shutdown functionality
> 
>  hw/virtio/vhost-user.c                    | 151 +++++++++++++++++++++-
>  subprojects/libvhost-user/libvhost-user.c | 147 +++++++++++++++++----
>  subprojects/libvhost-user/libvhost-user.h |   8 +-
>  tools/virtiofsd/fuse_virtio.c             |  20 +++
>  4 files changed, 294 insertions(+), 32 deletions(-)
> 
> -- 
> 2.25.4


