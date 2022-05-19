Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AFC52CE9A
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 10:45:09 +0200 (CEST)
Received: from localhost ([::1]:45952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrbmO-0004O7-GW
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 04:45:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fam.zheng@bytedance.com>)
 id 1nrbix-0003eV-7y
 for qemu-devel@nongnu.org; Thu, 19 May 2022 04:41:35 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:36479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fam.zheng@bytedance.com>)
 id 1nrbis-0000n6-7v
 for qemu-devel@nongnu.org; Thu, 19 May 2022 04:41:32 -0400
Received: by mail-wr1-x434.google.com with SMTP id u3so6105599wrg.3
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 01:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Zu6Jc6vPHdx+DLxnR1TmqxY9QoEaPYsoi3ifcQsAFPk=;
 b=zeI9nOw/qa+Ir+ahRG/199gpdKCGgQdPwFGR+2GBVeKkd9NQHKrv2Xw7orL32VuFDW
 8lEdFQ9IGR1dsccUixD1tXCDoyNhYc/J2ByQd7JJRmOG+w/X5j+drTY1AKAc2eeJHe49
 4sr4i5KYvm+qoMfX9m1iniaGMf0FR3SN2d1RYShRndhPYyGVCdaLxb/Owbvhw6oSS57w
 G7K5vhCw5vbZkFBYKicU/3OC8PcN1mXDVxynmc7ajY11jdD/koUaa8JvqLEEEGZwKetp
 QiXiyMkRK5PkGOSrnjchhLGA21lUwrWaR4wrm6YNdv/dPmCN8RtahpEb7G+tn1U7QAgf
 rIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Zu6Jc6vPHdx+DLxnR1TmqxY9QoEaPYsoi3ifcQsAFPk=;
 b=3AcBnJGfMDtqE3fCKA0z2I4moEniJiqbU2gHPLHPFxquyvWr477np4Q/nE8lsLLrut
 KfUhVKAynhU42qeZ7fxJrRE6tQRfoJsYcYFJ3H+Oh+YD3kfa3OhUT1A/uZihBhRVTY8+
 NEVKDIqUHUZk0lUygO1jODUOfYw99S2gl4q8jZ430/9cyxDhQkhL9hrqVymhbjqDD6zP
 736oaaE/BHIeojnAhA0Hdy0rAgwt6VCTTn09O9GzlmWituIp7YH2iIr+1xZmlLFtARUX
 bMSD9NP0/rhRnxmURHtmtAWt0jFzkOUiHg5pJw+iZLaxugOXSSbjdAjCBbGq6JDHM2l0
 Y6mQ==
X-Gm-Message-State: AOAM533WzwZ/LSUwOusLKJA5az0OA9toKOqeZNvOiJs8F0lWLb6nAIKS
 NnPbkOifv3IWze6k6pYGd9xkig==
X-Google-Smtp-Source: ABdhPJzrgO0iDfpb9JSw3ooLZNe9BU6AWm/lFzSbPVM+AVlG0fAnS2+rHXjUPDoqv9BQp5C+QWdrtQ==
X-Received: by 2002:adf:a459:0:b0:20d:3c9:44a1 with SMTP id
 e25-20020adfa459000000b0020d03c944a1mr2865603wra.560.1652949687055; 
 Thu, 19 May 2022 01:41:27 -0700 (PDT)
Received: from localhost ([46.69.19.220]) by smtp.gmail.com with ESMTPSA id
 i29-20020adfaadd000000b0020c5253d8casm4599719wrc.22.2022.05.19.01.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 01:41:26 -0700 (PDT)
From: Fam Zheng <fam.zheng@bytedance.com>
X-Google-Original-From: Fam Zheng <fam@euphon.net>
Date: Thu, 19 May 2022 09:41:21 +0100
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Kirill Tkhai <kirill.tkhai@openvz.org>, qemu-devel@nongnu.org,
 dm-devel@redhat.com, linux-kernel@vger.kernel.org,
 Kevin Wolf <kwolf@redhat.com>, hreitz@redhat.com,
 Xie Yongji <xieyongji@bytedance.com>, sgarzare@redhat.com
Subject: Re: Attaching qcow2 images to containers
Message-ID: <20220519084121.GA6658@fam-dell>
References: <YoSSkOQaGL0sBNOI@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YoSSkOQaGL0sBNOI@stefanha-x1.localdomain>
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=fam.zheng@bytedance.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022-05-18 07:30, Stefan Hajnoczi wrote:
> Hi Kirill,
> I saw your "[PATCH 0/4] dm: Introduce dm-qcow2 driver to attach QCOW2
> files as block device" patch series:
> https://lore.kernel.org/linux-kernel/YkME5ZS2CpXuNmN6@infradead.org/T/
> 
> There has been recent work in vDPA (VIRTIO Data Path Acceleration) to
> achieve similar functionality. The qemu-storage-daemon VDUSE export
> attaches a virtio-blk device to the host kernel and QEMU's qcow2
> implementation can be used:
> https://patchew.org/QEMU/20220504074051.90-1-xieyongji@bytedance.com/
> 
> A container can then access this virtio-blk device (/dev/vda). Note that
> the virtio-blk device is implemented in software using vDPA/VDUSE, there
> is no virtio-pci device.
> 
> As a quick comparison with a dm-qcow2 target, this approach keeps the
> qcow2 code in QEMU userspace and can take advantage of QEMU block layer
> features (storage migration/mirroring/backup, snapshots, etc). On the
> other hand, it's likely to be more heavyweight because bounce buffers
> are required in VDUSE for security reasons, there is a separate
> userspace process involved, and there's the virtio_blk.ko driver and an
> emulated virtio-blk device involved.
> 
> Another similar feature that was recently added to QEMU is the
> qemu-storage-daemon FUSE export:
> 
>   $ qemu-storage-daemon \
>         --blockdev file,filename=test.img,node-name=drive0 \
> 	--export fuse,node-name=drive0,id=fuse0,mountpoint=/tmp/foo
>   $ ls -alF /tmp/foo
>   -r--------. 1 me me 10737418240 May 18 07:22 /tmp/foo
> 
> This exports a disk image as a file via FUSE. Programs can access it
> like a regular file and qemu-storage-daemon will do the qcow2 I/O on the
> underlying file.
> 
> I wanted to mention these options for exposing qcow2 disk images to
> processes/containers on the host. Depending on your use cases they might
> be interesting. Performance comparisons against VDUSE and FUSE exports
> would be interesting since these new approaches seem to be replacing
> qemu-nbd.

In addition, there was also qemu-tcmu, (more PoC compared to other options):

https://lists.gnu.org/archive/html/qemu-devel/2016-10/msg04408.html

Fam

> 
> Can you share more about your use cases for the dm-qcow2 target? It
> could be useful for everyone I've CCed to be aware of various efforts in
> this area.
> 
> Thanks,
> Stefan



