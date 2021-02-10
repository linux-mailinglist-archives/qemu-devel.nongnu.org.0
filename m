Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE18317289
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 22:42:01 +0100 (CET)
Received: from localhost ([::1]:45508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9xFH-0007pW-6T
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 16:41:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l9xCh-0007Kl-RI
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 16:39:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l9xCd-0007pt-PA
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 16:39:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612993153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/Vcl9X4dztvXDBTwjxL91cxDZi77KjzDyuj8LZK8YlY=;
 b=dslXpcyqlYJ+TDjW80O6/pp0rEupVGI5yjUe5fo4ymzAhjk6UXluam1tOPVrPcAUrivobN
 GfTDwme+RTlkLyXDV4lHwDz/z5Jb92GsmXoRnLEzC1g8TVCB80SBtF83cUyt+3xuD9cfEL
 EdoWEtQes12cnJeTJ/UfysB6LxdkCzo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-eFcwV4vBMeWoWguvB4S33A-1; Wed, 10 Feb 2021 16:39:12 -0500
X-MC-Unique: eFcwV4vBMeWoWguvB4S33A-1
Received: by mail-wm1-f70.google.com with SMTP id m25so2054663wmi.6
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 13:39:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/Vcl9X4dztvXDBTwjxL91cxDZi77KjzDyuj8LZK8YlY=;
 b=tx9H+2MxNF9d11G9elWooITn8K/W2dEIHkop+UOt8i2k5XYEDHXKCXxigg4qjD7z9U
 Q3R2kPpXZBXZiL6ptCfB4AJmn8Zlg563rSeiuJ/5TbZ0NM7ieW/cUvbwHvIh4cyiURiF
 dZ0cwBePG39G47wKwDgR5GUMNyhAP6zPttJh1DS6uUtWZTsBGZqw7AisSouuMMSp41nF
 0iMK+VTRYhsTUlDAtwT4xKUNcKJftFq9cjBlgptGOCT0BFO+cDmcE2NSK5HuwtNsIK3H
 1pDYCEJYSDhononXFP3FVjmoDdzZs5PlFV7Ym5JlGPMKubWEpj0e7zmEtMBx5uaTBrCS
 v7Dg==
X-Gm-Message-State: AOAM532pTLkfcthIZav2C1fCMa9BJza6gX8wNjHo1IGkaQ7HihEg5hDW
 GRfbfRAe7tWLhYji3c0iNlff54QOlQW8P30mcBdRsy4Zv2kQ3DipwbQi7Ct/zVW+w/LH3fWlYtH
 9sBNI4LIcs61+6mI=
X-Received: by 2002:a7b:c193:: with SMTP id y19mr1041867wmi.23.1612993151083; 
 Wed, 10 Feb 2021 13:39:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwpyCWrUdIhib1Lm75kDqfIAgxgqeSQaLjysTqrFsJ28WnUarploiVkUKptcJpjkU1EVsfdxw==
X-Received: by 2002:a7b:c193:: with SMTP id y19mr1041846wmi.23.1612993150886; 
 Wed, 10 Feb 2021 13:39:10 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id l1sm3861719wmq.17.2021.02.10.13.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 13:39:09 -0800 (PST)
Date: Wed, 10 Feb 2021 16:39:06 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [RFC PATCH 0/6] vhost-user: Shutdown/Flush slave channel properly
Message-ID: <20210210163830-mutt-send-email-mst@kernel.org>
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
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
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
> 
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

No comments so far - do you plan to post a non-RFC patchset?


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


