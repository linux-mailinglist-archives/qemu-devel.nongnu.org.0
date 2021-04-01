Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF99F351566
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 15:54:34 +0200 (CEST)
Received: from localhost ([::1]:50836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRxmL-0007m6-8O
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 09:54:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lRxlE-0007HL-Hf
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 09:53:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lRxlB-0002YO-9w
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 09:53:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617285199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=av5491mK8lY7FZmth3+NJvATrWovEFEz99op4Fwg/50=;
 b=LvBs4X8qAwVTVUh7ztJd4uNS2y5vORqBD793Lnur5x8mN14k9HcxCgsfDXnJcPfZNditPe
 ZCFVovVYERUjwChwo/J5HQojjIKLFDUByijppIA7iv9Rg3ZWNAxijEAMlcVzBlfyMR9Rup
 0d1WoGLKHlZmxxexf9nFswYPSb/Wxok=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-SxCtRbo8OsWHuAzDX4pgbw-1; Thu, 01 Apr 2021 09:53:17 -0400
X-MC-Unique: SxCtRbo8OsWHuAzDX4pgbw-1
Received: by mail-wr1-f70.google.com with SMTP id p12so2787143wrn.18
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 06:53:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=av5491mK8lY7FZmth3+NJvATrWovEFEz99op4Fwg/50=;
 b=Gzqt0w8yfmYZL/iShTThDN0OmW3ECRuk7ELcpeHjf75Zuy/tylkl1o8T6E4Spvcyb4
 i2HX+WNxUMBSrQJBbLuAb6UmVXDR3y7unXlqhCI2Y/n+xl/wtXq6j0ucg14mG2LOKvoy
 Ip4QhloR4x0khFGkSainDxFqfB7RQjui2Pc1XJ6F7pIbGo182zFfT27/JuQM1LpaimSi
 +yZ06ynLFZnHOlFodvFLZleTJ369R6osgg7OuzTnfeTPLqUqWgDjTz8cowvrrnd6NEov
 3J2+zqzY1Bkpp593vThI8/Ud/i8OzaXOrjHhgw5CbOnXpn7vFwJ1Kg02PTZkI7mv7Myv
 P2Sw==
X-Gm-Message-State: AOAM533/DkNaYTdfZwOpb8jzV67jFN5iQdzW/8eh6SqA80h86e8VfOHh
 31t5IZLB8bdj9yPsxtFmAPVkDgbFft9dszeiwmYZJCF6i4Cuw5AaPw/DC32XBbhKpQhb+f+NHc3
 UxRgAhQRaZ+Nv/Rg=
X-Received: by 2002:a1c:23c2:: with SMTP id j185mr8120863wmj.54.1617285196881; 
 Thu, 01 Apr 2021 06:53:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGjJKG+WxjelGqnYMQV+q/d5ovLK6/6VqJw0Qk17ZA+9j9QKvDsjIZaJ1FRqNUksj52h78SA==
X-Received: by 2002:a1c:23c2:: with SMTP id j185mr8120844wmj.54.1617285196651; 
 Thu, 01 Apr 2021 06:53:16 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id i17sm10029216wrp.77.2021.04.01.06.53.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 06:53:16 -0700 (PDT)
Date: Thu, 1 Apr 2021 09:53:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: virtio-pci reset option
Message-ID: <20210401095259-mutt-send-email-mst@kernel.org>
References: <CAARzgwyS6Lhcqx6nPqtbdwzZuhz+roKCiVLDPzftpsxN2T+H2Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAARzgwyS6Lhcqx6nPqtbdwzZuhz+roKCiVLDPzftpsxN2T+H2Q@mail.gmail.com>
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 01, 2021 at 05:09:23PM +0530, Ani Sinha wrote:
> Hi MST:
> 
> ref: https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-bus-pci
> 
> What: /sys/bus/pci/devices/.../reset
> Date: July 2009
> Contact: Michael S. Tsirkin <mst@redhat.com>
> Description:
> Some devices allow an individual function to be reset
> without affecting other functions in the same device.
> For devices that have this support, a file named reset
> will be present in sysfs.  Writing 1 to this file
> will perform reset.
> 
> 
> Can you please tell me which change in the kernel virtio-pci driver
> enabled this option to be available in sysfs? The kernel we are
> running does not seem to have this option for virtio-pci devices. I
> cannot seem to pin-point the exact change that is needed to get this.
> 
> 
> thanks
> 
> ani

Likely this one:

commit eb1556c493d8abc5bfc8685561bcea934700e200
Author: Julia Suvorova <jusual@redhat.com>
Date:   Tue Aug 20 18:30:05 2019 +0200

    virtio-pci: Add Function Level Reset support
    


-- 
MST


