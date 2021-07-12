Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 603723C5BA5
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 14:04:43 +0200 (CEST)
Received: from localhost ([::1]:35470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2ufx-0000v7-Ur
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 08:04:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m2ueG-0007nz-HN
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:02:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m2ueB-0004h2-JU
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:02:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626091370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iVHCyMts+w3Sq+ZqCEekA6ZEwUE/zvVzJ+M1myUfLoQ=;
 b=LUihiH0X67noW/F4co0hfzZtgMr8rsqdGneLFSHFrdNVwKuFW0mpV9bpkajLGXoWHURqod
 nrSipyBhS+01wszOev32sfv1Rfka//X9MHwEmcd5dU0miTa2cWog74RU9Eva1Vr09XfdQl
 oamCiDxjwCeb+N6bnlUMIpZ5ByryRz8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-ddz1pUsONauSUWoJ7PZGGA-1; Mon, 12 Jul 2021 08:02:49 -0400
X-MC-Unique: ddz1pUsONauSUWoJ7PZGGA-1
Received: by mail-wm1-f72.google.com with SMTP id
 i3-20020a05600c3543b02902075ed92710so7301149wmq.0
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 05:02:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=iVHCyMts+w3Sq+ZqCEekA6ZEwUE/zvVzJ+M1myUfLoQ=;
 b=GRxfVPUytadQVtrMeuXq0EOr1hvKXonyUIyBC5gUTYngsu2EKoE0zcn4Mal1x3A3x8
 qWsDCKSW+rvZGMG6xOtlaw1vh9N14t/I3qb+1fA+242JQX5o8XuMS6tmMYQGrHQQGWOJ
 qtYZYxm1tYgfsj69lpuVzQIiIg2zTo6T/XoRfV3sUx0MVkh51aeHpUmsL7+4LEC0oXLO
 aoDnByocSXG0j9uWNsFHVfr3uxT8l/4jKdVhvtpKMynXVkR0k3wK9DR8JIxZgPaw01lv
 b99yPSTzYOtmryFgh0CGQHwQZe2wKTDh5mMXAZ99QpxYYrL0dctQyz6urisIRdVgYzjf
 Eavg==
X-Gm-Message-State: AOAM532pbY3xMDRrmgm9vLvxXrP32L03RwKOCYtMLGYYgCLheQ4Pe/t/
 ypZJSFG4ezrQG4WuJ6dTk15zaa1hErAVahIPrk1gblHuBgX2111G8Fc7zS7hjCVr2lx9T3GzdVj
 hCP6lMQzj73Va1m8=
X-Received: by 2002:a1c:25c6:: with SMTP id l189mr14410102wml.49.1626091368591; 
 Mon, 12 Jul 2021 05:02:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmhgu2YehrkPtICecyarAcNHgXSxJX8KsKJN20BgZ7Ac+BUDQBFPTTf/eAFqeBr3DgMlMxNA==
X-Received: by 2002:a1c:25c6:: with SMTP id l189mr14410071wml.49.1626091368276; 
 Mon, 12 Jul 2021 05:02:48 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id b16sm11052059wrw.46.2021.07.12.05.02.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 05:02:47 -0700 (PDT)
Date: Mon, 12 Jul 2021 13:02:45 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
Subject: Re: [PATCH] migration/rdma: prevent from double free the same mr
Message-ID: <YOwvZY9AABUY0OKB@work-vm>
References: <20210708144521.1959614-1-lizhijian@cn.fujitsu.com>
 <YOdNxqhcWi6sHoRn@work-vm>
 <e4c969d9-00ec-f43e-d894-b462bbf14eed@fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <e4c969d9-00ec-f43e-d894-b462bbf14eed@fujitsu.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "quintela@redhat.com" <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* lizhijian@fujitsu.com (lizhijian@fujitsu.com) wrote:
> 
> 
> On 09/07/2021 03:11, Dr. David Alan Gilbert wrote:
> > * Li Zhijian (lizhijian@cn.fujitsu.com) wrote:
> >> backtrace:
> >> '0x00007ffff5f44ec2 in __ibv_dereg_mr_1_1 (mr=0x7fff1007d390) at /home/lizhijian/rdma-core/libibverbs/verbs.c:478
> >> 478             void *addr              = mr->addr;
> > ANy idea why it deletes the same mr twice?
> 
> It's easy to reproduce it if we specify a nvdimm backing to a fsdax memory-backend-file which cannot support registering mr like:
> 
> [root@iaas-rpma ~]# mount | grep pmem0
> /dev/pmem0 on /mnt/pmem0 type ext4 (rw,relatime,seclabel,dax=always)
> 
> [root@iaas-rpma ~]# ndctl list -n namespace0.0
> [
>    {
>      "dev":"namespace0.0",
>      "mode":"fsdax",
>      "map":"mem",
>      "size":536870912,
>      "sector_size":512,
>      "blockdev":"pmem0"
>    }
> ]
> 
> 
> `-object memory-backend-file,id=mem1,share=on,mem-path=/mnt/pmem0/nv-128m.img,size=128m,pmem=on,align=2m -device nvdimm,memdev=mem1,id=nv1`
> 
> and then enable rdma-pin-all.
> 
> (qemu) migrate_set_capability rdma-pin-all on
> (qemu)
> 
> Now qemu has at least 2 ram block, pc.ram and mem1. the latter will be failed to register mr:
> `Failed to register local dest ram block! : Invalid argument   `
> 
> in this case, the mr of pc.ram will be deleted twice.

Ah OK, that makes more sense - from your original description I hadn't
noticed it was the failure path.


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> Thanks
> Li
> >
> > Dave
> >
> >> (gdb) bt
> >>   #0  0x00007ffff5f44ec2 in __ibv_dereg_mr_1_1 (mr=0x7fff1007d390) at /home/lizhijian/rdma-core/libibverbs/verbs.c:478
> >>   #1  0x0000555555891fcc in rdma_delete_block (block=<optimized out>, rdma=0x7fff38176010) at ../migration/rdma.c:691
> >>   #2  qemu_rdma_cleanup (rdma=0x7fff38176010) at ../migration/rdma.c:2365
> >>   #3  0x00005555558925b0 in qio_channel_rdma_close_rcu (rcu=0x555556b8b6c0) at ../migration/rdma.c:3073
> >>   #4  0x0000555555d652a3 in call_rcu_thread (opaque=opaque@entry=0x0) at ../util/rcu.c:281
> >>   #5  0x0000555555d5edf9 in qemu_thread_start (args=0x7fffe88bb4d0) at ../util/qemu-thread-posix.c:541
> >>   #6  0x00007ffff54c73f9 in start_thread () at /lib64/libpthread.so.0
> >>   #7  0x00007ffff53f3b03 in clone () at /lib64/libc.so.6 '
> >>
> >> Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
> >> ---
> >>   migration/rdma.c | 1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/migration/rdma.c b/migration/rdma.c
> >> index b6cc4bef4a8..0f22b8227c0 100644
> >> --- a/migration/rdma.c
> >> +++ b/migration/rdma.c
> >> @@ -1143,6 +1143,7 @@ static int qemu_rdma_reg_whole_ram_blocks(RDMAContext *rdma)
> >>   
> >>       for (i--; i >= 0; i--) {
> >>           ibv_dereg_mr(local->block[i].mr);
> >> +        local->block[i].mr = NULL;
> >>           rdma->total_registrations--;
> >>       }
> >>   
> >> -- 
> >> 2.30.2
> >>
> >>
> >>
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


