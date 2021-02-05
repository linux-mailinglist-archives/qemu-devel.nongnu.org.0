Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 446663109C8
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 12:06:04 +0100 (CET)
Received: from localhost ([::1]:50778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7yw7-0003Ty-Ag
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 06:06:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l7yqw-00087P-PF
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 06:00:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l7yqu-0002kL-1e
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 06:00:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612522834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zaf3S9PwtdukBM/etRGWGCJbpMRWSPMiSF+DWj62VHg=;
 b=NhXYj29VsOkb0KcnVAOvnvcNYVlzbZbcLwDHIddR+tGGcK27K4bf/djmBQdc2jyouNTnIL
 GngS/K2kg9NqUCzEqlDxMFJtF0mEukov7+ShzRnJnMbxfDItKNfsuxAGaHr8M+eef2aDpo
 UUrOL8ENRAAWj60vybaE7C8Gu+2XPtg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-Orll_PSkNMC2kyYFMKl4Aw-1; Fri, 05 Feb 2021 06:00:32 -0500
X-MC-Unique: Orll_PSkNMC2kyYFMKl4Aw-1
Received: by mail-wr1-f72.google.com with SMTP id n18so5154957wrm.8
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 03:00:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zaf3S9PwtdukBM/etRGWGCJbpMRWSPMiSF+DWj62VHg=;
 b=U4a1RmXcz8I4yhcy9gN0ah2sph0rfsFtDYqQnzBOlQbKeZoHZnhA2V5WE5tjQFDz2p
 WvLIie/VaWKuI90CEX6eEl7KTjuORD+SprBZzWwou3GXx8xwr3upJFeA5u5EOoXzC6uW
 J+y/0rrxm2GeEkD7GGdAZ/5KAfkHptSFX2OoLSBYfH301BMyYnMbR7/N2vTBB7h6ci3H
 RtRgeW9bVmiw6maKvEuD54ZWo5NKx93WYKJSaol7pKVJ0mz5GNKFfxDtfItYA2nBt2pH
 DbLja8mkLcxzJHLD/UckfADvQ1uWb2wC9cY98+HYk7m4/2OXku/ym+HlfuMPJRs+s84X
 vx5w==
X-Gm-Message-State: AOAM532p6pBZHsV6ybTEWjvNkz4uz1v+otze8JiPk6w1KGuOLbWZITgu
 4i4aAk8jrZy26s4icXXvArDf48qe4YAlOU7mSprDqYYxcCHid3AwQXZIOqUCRW+zcDwejJltXL6
 8XTbK1WL3/jYoZcI=
X-Received: by 2002:adf:c6c1:: with SMTP id c1mr4450510wrh.326.1612522831337; 
 Fri, 05 Feb 2021 03:00:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyjtSI3aEK6/D7CgFJjBY+9g5mc52IH7pR/OM5O2Rk2GRdnPqhQrRPPlWmD6/I5qpnp5IO29Q==
X-Received: by 2002:adf:c6c1:: with SMTP id c1mr4450486wrh.326.1612522831209; 
 Fri, 05 Feb 2021 03:00:31 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id b19sm8269590wmj.22.2021.02.05.03.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 03:00:30 -0800 (PST)
Date: Fri, 5 Feb 2021 06:00:27 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 0/4] Remove the deprecated pc-1.x machine types and
 related stuff
Message-ID: <20210205060017-mutt-send-email-mst@kernel.org>
References: <20210203171832.483176-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210203171832.483176-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, libvir-list@redhat.com,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 03, 2021 at 06:18:28PM +0100, Thomas Huth wrote:
> The pc-1.x machine types have been deprecated since QEMU v5.0 already, and
> nobody complained, so they can now be removed. While we're at it, also
> remove some compatibility switches and related code that are now not
> necessary anymore after these machine types have been removed.
> (We could maybe even remove more stuff like the various host_features
> switches in the virtio devices, but they still might be useful in certain
> cases, so I decided not to remove them yet)


I queued patches 1 and 3. Thanks!

> Thomas Huth (4):
>   hw/i386: Remove the deprecated pc-1.x machine types
>   hw/block/fdc: Remove the check_media_rate property
>   hw/virtio/virtio-balloon: Remove the "class" property
>   hw/usb/bus: Remove the "full-path" property
> 
>  docs/system/deprecated.rst       |  6 --
>  docs/system/removed-features.rst |  6 ++
>  hw/block/fdc.c                   | 17 +-----
>  hw/i386/pc_piix.c                | 94 --------------------------------
>  hw/usb/bus.c                     |  7 +--
>  hw/virtio/virtio-balloon-pci.c   | 11 +---
>  include/hw/usb.h                 |  2 +-
>  tests/qemu-iotests/172.out       | 35 ------------
>  8 files changed, 11 insertions(+), 167 deletions(-)
> 
> -- 
> 2.27.0


