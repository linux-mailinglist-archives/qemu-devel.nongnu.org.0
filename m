Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE52D5F402F
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 11:46:29 +0200 (CEST)
Received: from localhost ([::1]:50080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofeVQ-0004a9-Qh
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 05:46:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tom.leiming@gmail.com>)
 id 1ofeSs-0001hI-Bz
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 05:43:50 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:44719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tom.leiming@gmail.com>)
 id 1ofeSq-0006o9-Ju
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 05:43:50 -0400
Received: by mail-pg1-x534.google.com with SMTP id c7so12260860pgt.11
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 02:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=U16ld6fgiAl2VzPXw2vpzgUsTq1GDPKXULp31YXb5XY=;
 b=c16ldyQb3HZHxQIdRzIFCQODA29wPOsD/CGP73fnrIcbKwRHOoS5+UxoiBX2HHFzFm
 IuAlErOoQBrZUoAJJvzqfH2ejWEMofLjOXPo9gtqEF2aXnXl6iGyPQILIBXJS81MO6Cx
 mrQ8nmY7T5ZNA+CVayLHq0OMsQ/d+E6YIvuNBG3/nC++q0LAkPmlpTuBgMHpamF1dBgw
 nIiKR+0BnikgeBNbew1bIYZ/dKUO0Vd1ePYbB0ra5RUAVl/r7YLCnD/Jw1KWg88rlT0Y
 PZ/EfS+bJTvb3ghU2SYbtFMNiTKgM1DKLbyQqcF6+JwdwSt0IK3XOdqHjKg0+L8KdeGE
 L0jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=U16ld6fgiAl2VzPXw2vpzgUsTq1GDPKXULp31YXb5XY=;
 b=P9V4KG00eLt7A6YgbxjZc0HbaQ1QmzarjYEwwexMIJS7YegcSIT0j9HCrABO7T/zvt
 JD56Mcfs62rwJaGinKgnDVYXubQ3g6ctUbBCcQKJQ+BN69PjqC8EWziJ4LsAXAr2sRJz
 WuAI3w6JY/pWIAxMVEFs6BsTcP0cqkEg1ieYaNus6MtclGSyT/SuZcQ91/k7jye21KtA
 MpPWnyV+mBB8rMagSyovHTtov48U0NtBNL96JTrbQscdAcHNDdXaF60lAH1TlDIjl39E
 hIWoZdgxEwREfaTim3Cc0rXkzTz9bZvMcnq3Vfv8Ui11UP95p2AW/vwVf04mX0WS7dP2
 cD6w==
X-Gm-Message-State: ACrzQf0HZ8ZgYqdjrOFX8Q937qSWuX+0kfYDZRlBvdEjKGzh0GBfbQGK
 nDLkIeCywBOHGSGv0ze+CvA=
X-Google-Smtp-Source: AMsMyM6z9dQo1p6DFxFXBRn+gRwfwkvOktPU/dHCgljsraXWWh6QNuPeRSLnbDtzTB+ZNEicBlD72Q==
X-Received: by 2002:a05:6a00:1705:b0:55a:b9c4:6e14 with SMTP id
 h5-20020a056a00170500b0055ab9c46e14mr26631686pfc.40.1664876626787; 
 Tue, 04 Oct 2022 02:43:46 -0700 (PDT)
Received: from T590 ([43.228.180.230]) by smtp.gmail.com with ESMTPSA id
 h19-20020a656393000000b0042c0ffa0e62sm8190518pgv.47.2022.10.04.02.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 02:43:45 -0700 (PDT)
Date: Tue, 4 Oct 2022 17:43:34 +0800
From: Ming Lei <tom.leiming@gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: io-uring@vger.kernel.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, Kirill Tkhai <kirill.tkhai@openvz.org>,
 Manuel Bentele <development@manuel-bentele.de>,
 qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 rjones@redhat.com, Xie Yongji <xieyongji@bytedance.com>,
 "Denis V. Lunev" <den@openvz.org>, Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: ublk-qcow2: ublk-qcow2 is available
Message-ID: <YzwARuAZdaoGTUfP@T590>
References: <Yza1u1KfKa7ycQm0@T590>
 <Yzs9xQlVuW41TuNC@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yzs9xQlVuW41TuNC@fedora>
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=tom.leiming@gmail.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 03, 2022 at 03:53:41PM -0400, Stefan Hajnoczi wrote:
> On Fri, Sep 30, 2022 at 05:24:11PM +0800, Ming Lei wrote:
> > ublk-qcow2 is available now.
> 
> Cool, thanks for sharing!
> 
> > 
> > So far it provides basic read/write function, and compression and snapshot
> > aren't supported yet. The target/backend implementation is completely
> > based on io_uring, and share the same io_uring with ublk IO command
> > handler, just like what ublk-loop does.
> > 
> > Follows the main motivations of ublk-qcow2:
> > 
> > - building one complicated target from scratch helps libublksrv APIs/functions
> >   become mature/stable more quickly, since qcow2 is complicated and needs more
> >   requirement from libublksrv compared with other simple ones(loop, null)
> > 
> > - there are several attempts of implementing qcow2 driver in kernel, such as
> >   ``qloop`` [2], ``dm-qcow2`` [3] and ``in kernel qcow2(ro)`` [4], so ublk-qcow2
> >   might useful be for covering requirement in this field
> > 
> > - performance comparison with qemu-nbd, and it was my 1st thought to evaluate
> >   performance of ublk/io_uring backend by writing one ublk-qcow2 since ublksrv
> >   is started
> > 
> > - help to abstract common building block or design pattern for writing new ublk
> >   target/backend
> > 
> > So far it basically passes xfstest(XFS) test by using ublk-qcow2 block
> > device as TEST_DEV, and kernel building workload is verified too. Also
> > soft update approach is applied in meta flushing, and meta data
> > integrity is guaranteed, 'make test T=qcow2/040' covers this kind of
> > test, and only cluster leak is reported during this test.
> > 
> > The performance data looks much better compared with qemu-nbd, see
> > details in commit log[1], README[5] and STATUS[6]. And the test covers both
> > empty image and pre-allocated image, for example of pre-allocated qcow2
> > image(8GB):
> > 
> > - qemu-nbd (make test T=qcow2/002)
> 
> Single queue?

Yeah.

> 
> > 	randwrite(4k): jobs 1, iops 24605
> > 	randread(4k): jobs 1, iops 30938
> > 	randrw(4k): jobs 1, iops read 13981 write 14001
> > 	rw(512k): jobs 1, iops read 724 write 728
> 
> Please try qemu-storage-daemon's VDUSE export type as well. The
> command-line should be similar to this:
> 
>   # modprobe virtio_vdpa # attaches vDPA devices to host kernel

Not found virtio_vdpa module even though I enabled all the following
options:

        --- vDPA drivers                                 
          <M>   vDPA device simulator core               
          <M>     vDPA simulator for networking device   
          <M>     vDPA simulator for block device        
          <M>   VDUSE (vDPA Device in Userspace) support 
          <M>   Intel IFC VF vDPA driver                 
          <M>   Virtio PCI bridge vDPA driver            
          <M>   vDPA driver for Alibaba ENI

BTW, my test environment is VM and the shared data is done in VM too, and
can virtio_vdpa be used inside VM?

>   # modprobe vduse
>   # qemu-storage-daemon \
>       --blockdev file,filename=test.qcow2,cache.direct=of|off,aio=native,node-name=file \
>       --blockdev qcow2,file=file,node-name=qcow2 \
>       --object iothread,id=iothread0 \
>       --export vduse-blk,id=vduse0,name=vduse0,num-queues=$(nproc),node-name=qcow2,writable=on,iothread=iothread0
>   # vdpa dev add name vduse0 mgmtdev vduse
> 
> A virtio-blk device should appear and xfstests can be run on it
> (typically /dev/vda unless you already have other virtio-blk devices).
> 
> Afterwards you can destroy the device using:
> 
>   # vdpa dev del vduse0
> 
> > 
> > - ublk-qcow2 (make test T=qcow2/022)
> 
> There are a lot of other factors not directly related to NBD vs ublk. In
> order to get an apples-to-apples comparison with qemu-* a ublk export
> type is needed in qemu-storage-daemon. That way only the difference is
> the ublk interface and the rest of the code path is identical, making it
> possible to compare NBD, VDUSE, ublk, etc more precisely.

Maybe not true.

ublk-qcow2 uses io_uring to handle all backend IO(include meta IO) completely,
and so far single io_uring/pthread is for handling all qcow2 IOs and IO
command.


thanks, 
Ming

