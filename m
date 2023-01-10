Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7D3664BFA
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 20:05:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFJtk-0000h6-UL; Tue, 10 Jan 2023 14:03:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pFJtU-0000ao-SS
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 14:02:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pFJtT-0003Wo-DG
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 14:02:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673377362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Jjl+iFsVUfqhwGd8i3AU+kl3yi19vtb1FRGfwcx/Wf0=;
 b=JMmcEeFTJ+z8oA+0hWNfrqA08AS/EV7fCLRpIstpPlqMl7NroUYPgwBAA5P8fNKWVl0tiR
 GywNLapmoFutt8Js5a6WZaXl2/2iJbL7VPYHVQPkjbWNXMmRHBiEXlBXiAt2JEJ7e9v5iL
 getIowVLEYyeo0djuVVUZ83sQd6rEsA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-32-PbOUIjP7M_eq4JrE2tetFg-1; Tue, 10 Jan 2023 14:02:40 -0500
X-MC-Unique: PbOUIjP7M_eq4JrE2tetFg-1
Received: by mail-wm1-f71.google.com with SMTP id
 fm17-20020a05600c0c1100b003d96f0a7f2eso9400956wmb.6
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 11:02:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jjl+iFsVUfqhwGd8i3AU+kl3yi19vtb1FRGfwcx/Wf0=;
 b=W5bARs8lJsIEZMfmgNmpdj231IFpFysg0uqh2bqMVQ7W4lPSFkJ14FR2ZXWX5kZ2TM
 v+MmrHN2P49td4XhsMu5zXWDtbgYa6pjDXiAfbp65xOTHlVi7aPEeIhqELA1izQK9+Lv
 ULjIe91w2TCjp65dl9u5l1uYTc3c7Uy6BGlKh9VDxbJmu/Mi4mfhenxqg8YFPf2NUl0c
 09y9We3TMLDoYtYnSoWBNCeNFSoasNRFxn/EtEtipbxJXrWODzQJjssXU0Smo1D0df4s
 VSlSGxcOi/iWGc9+HPGFEeJU0M1b4DixGAv+IkU2Fg0m/UDxZ6tHqTu9/DMiRwrWkELT
 GJtA==
X-Gm-Message-State: AFqh2kqBm0DwxB1pcr+z4Xm42MjsOvxe8Ivo8G+udYVwVZLTwZYe08qH
 TPB9YuvY52CMcR2yrTH0SYzCasBPGY4nPn98+DdtwtFBz8yjAr6O9anVh+nwtXEVfkCH7lpD/Uv
 K0bZV4aP6l651OV4=
X-Received: by 2002:a5d:5707:0:b0:2b9:d6ba:21f1 with SMTP id
 a7-20020a5d5707000000b002b9d6ba21f1mr12354870wrv.21.1673377359543; 
 Tue, 10 Jan 2023 11:02:39 -0800 (PST)
X-Google-Smtp-Source: AMrXdXti4yRxMbmxYPCpbih2Lj96ZOeyLfekKznMfxSxxZEfvVynQwbE5wuUybTcGFhKkrnVeKJaEg==
X-Received: by 2002:a5d:5707:0:b0:2b9:d6ba:21f1 with SMTP id
 a7-20020a5d5707000000b002b9d6ba21f1mr12354856wrv.21.1673377359328; 
 Tue, 10 Jan 2023 11:02:39 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 c18-20020adffb52000000b0025e86026866sm13936293wrs.0.2023.01.10.11.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 11:02:38 -0800 (PST)
Date: Tue, 10 Jan 2023 19:02:36 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Kei IKEDA <s228040u@st.go.tuat.ac.jp>
Cc: qemu-devel@nongnu.org
Subject: Re: Postcopy migration failed with "qemu-system-x86_64:
 postcopy_ram_listen_thread: loadvm failed: -5"
Message-ID: <Y722TIv3N9gMB8te@work-vm>
References: <CANPJ4po4sXZ9F3zbmpup4MmHamZG7GPf0AdDhWhDy=HNpRQyAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANPJ4po4sXZ9F3zbmpup4MmHamZG7GPf0AdDhWhDy=HNpRQyAg@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

* Kei IKEDA (s228040u@st.go.tuat.ac.jp) wrote:
> Hi!
> 
> I am experimenting with post-copy by modifying qemu-6.0.0 in my research.
> I transfer a VM between two machines but it fails most of the time with
> these error messages.
> 
> ```
> qemu-system-x86_64: postcopy_ram_listen_thread: loadvm failed: -5
> 
> 
> qemu-system-x86_64: error while loading state for instance 0x0 of device
> 'kvm-tpr-opt'
> 
> qemu-system-x86_64: load of migration failed: Operation not permitted
> ```
> 
> I checked that it does not happen in vanilla qemu-6.0.0 post-copy migration
> so my modifying causes this error.
> 
> I want to fix this error but I don't know what these error messages mean.
> 
> If anyone knows what the situation is with this error, please let me know.

My guess from that error is that the vapic_post_load function in
hw/i386/kvmvacpic.c is erroring - or something around that;  it tells
you it's the 'kvm-tpr-opt' device that's failing to load, so you need to
find out why.

Are your changes anything to do with apic?

Dave

> Thanks.
> 
> ---Experiment information---
> machine
>  HPE ProLiant DL360 Gen10
> OS
>  Linux 5.11.22 with Ubuntu 22.04.1 LTS
> Startup command
>  source side
>   ```
>   sudo /home/work/qemu-6.0.0/build/x86_64-softmmu/qemu-system-x86_64 -cpu
> host -smp 8 -m 16G -enable-kvm -drive
> if=virtio,file=/var/nfs/migrate/64G.qcow2,cache=none -monitor stdio -qmp
> tcp:localhost:4445,server,nowait -net nic -netdev
> bridge,helper=/usr/lib/qemu/qemu-bridge-helper,id=hn0 -device
> virtio-net-pci,netdev=hn0,id=br0,mac=00:16:3e:33:ad:7d -net
> user,smb=/var/nfs/migrate,hostfwd=tcp::5557-:22,hostfwd=tcp::8000-:11211
>  ```
>  destination side
>   ```
>   sudo /home/kei/work/qeme-6.0.0/build/x86_64-softmmu/qemu-system-x86_64
> -cpu host -smp 8 -m 16G -enable-kvm -drive
> if=virtio,file=/var/nfs/migrate/64G.qcow2,cache=none -monitor stdio
> -incoming tcp:0:4444 -qmp tcp:0:4446,server,nowait -net nic -netdev
> bridge,helper=/usr/lib/qemu/qemu-bridge-helper,id=hn0 -device
> virtio-net-pci,netdev=hn0,id=br0,mac=00:16:3e:33:ad:7d -net
> user,smb=/var/nfs/migrate,hostfwd=tcp::5557-:22,hostfwd=tcp::8000-:11211
>   ```
> ---------------------------------------
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


