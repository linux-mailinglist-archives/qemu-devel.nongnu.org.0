Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FEB3809BC
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 14:38:36 +0200 (CEST)
Received: from localhost ([::1]:33968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhX5P-00034f-9H
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 08:38:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lhWoP-0007iq-9y
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:21:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lhWoM-0007T5-TO
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:21:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620994857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mMaCJVNLv1j3YvPko1sdb/7l4D0wvwTVgpNy8KrrxzM=;
 b=a3rPuCedzwgw35p47dqI6sSyF2nf6n5yPCp6dTgpNCX9/f36Hwr7QqVV7mUUYZNDZPQhXr
 +V2UD0iPYd6lOVV+HScSWPNf239BrPiHe1FqzrEYU41urKMHtSCyhkY/L675EdvZZCt5SW
 llq5U6BJZ5DYVRmrw5J1cPO94eZeb1I=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-Zo5yejsKM4unRIBn180PAw-1; Fri, 14 May 2021 08:20:53 -0400
X-MC-Unique: Zo5yejsKM4unRIBn180PAw-1
Received: by mail-wr1-f72.google.com with SMTP id
 j33-20020adf91240000b029010e4009d2ffso10185699wrj.0
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 05:20:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mMaCJVNLv1j3YvPko1sdb/7l4D0wvwTVgpNy8KrrxzM=;
 b=d+31GmT+L1k+6/4yx+9T6/+mDt1U//oVhvH5Uj0jZpdR6hSZCwRUVRAl71z1Go5rrX
 BChDrlkC4FPXTfVIMhoOIWvcPGA1ZqfBmUGxbfvPyyNpriaaoD/z9JxuPUeLxvIZ7Cb1
 FBkNdM4Zo6DWKVVgpLhDtwnAB5p2qCnio+UZCZGZLmHENQVlynUMkfjxOU4gUjQHxkjZ
 u93wy6GPLm2aXxhxTChClfa1rLomroUuDdKX0CE6sdcsnhwS5utu9gK2D1EFNHcTddlC
 oUKkJlIuk6psAQMxywaDzSeW1HrnkB9HFDNGs6RXuHzP1tT08hwhM4upsJhq7/29RIhQ
 Gyaw==
X-Gm-Message-State: AOAM533x5I4OHq/B5LdSLpHv0lfZbiodiNb42peUT2M9qqmbZrk8foyK
 groTJyzcmXyyMhN3WqK/vk3jcu8Tz25oWMd0j3gYDIuh54xrdK11iymDX93aCe0lLDrjXCDLy6V
 84OYY9WRRAZiihI0=
X-Received: by 2002:a5d:6701:: with SMTP id o1mr7256078wru.390.1620994851952; 
 Fri, 14 May 2021 05:20:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqd/w4CtE4Mm/lt0+xOlJfFzwp5ht6abhSENPdConZ3ViVqiW54VcocM58WjLapnN8U1dglQ==
X-Received: by 2002:a5d:6701:: with SMTP id o1mr7256062wru.390.1620994851832; 
 Fri, 14 May 2021 05:20:51 -0700 (PDT)
Received: from redhat.com ([2a10:800c:1fa6:0:3809:fe0c:bb87:250e])
 by smtp.gmail.com with ESMTPSA id c5sm1670597wrw.36.2021.05.14.05.20.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 05:20:51 -0700 (PDT)
Date: Fri, 14 May 2021 08:20:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 0/6] vhost-user-blk: Error handling fixes during
 initialistion
Message-ID: <20210514082025-mutt-send-email-mst@kernel.org>
References: <20210429171316.162022-1-kwolf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210429171316.162022-1-kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: den-plotnikov@yandex-team.ru, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 raphael.norwitz@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 29, 2021 at 07:13:10PM +0200, Kevin Wolf wrote:
> vhost-user-blk neglects for several properties to check whether the
> configured value is even compatible with the backend. This results
> sometimes in crashes because of buggy error handling code, and sometimes
> in devices that are presented differently to the guest than the backend
> would expect and that don't work properly therefore.
> 
> This series fixes some of these bugs.

OK so where is this going? Kevin you said you will merge?
If so

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>



> v2:
> - Fix error paths in realize() that didn't set errp
> - Added vhost_dev_cleanup() back in the error path (more faithful revert
>   of 77542d43149)
> 
> Kevin Wolf (6):
>   vhost-user-blk: Make sure to set Error on realize failure
>   vhost-user-blk: Don't reconnect during initialisation
>   vhost-user-blk: Improve error reporting in realize
>   vhost-user-blk: Get more feature flags from vhost device
>   virtio: Fail if iommu_platform is requested, but unsupported
>   vhost-user-blk: Check that num-queues is supported by backend
> 
>  include/hw/virtio/vhost.h |  2 +
>  hw/block/vhost-user-blk.c | 85 ++++++++++++++-------------------------
>  hw/virtio/vhost-user.c    |  5 +++
>  hw/virtio/virtio-bus.c    |  5 +++
>  4 files changed, 42 insertions(+), 55 deletions(-)
> 
> -- 
> 2.30.2


