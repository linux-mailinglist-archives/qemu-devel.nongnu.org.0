Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB172E8DA6
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 18:30:06 +0100 (CET)
Received: from localhost ([::1]:40072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kw7Cf-0005BK-10
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 12:30:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kw7B0-0004Xb-JJ
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 12:28:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kw7Ax-0002DH-Bw
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 12:28:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609694896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VVa/oFE765Ck7q2AaJD1033VoWvKmXWI/fHy9riV+oE=;
 b=cbducTZEp7QVNCHZ0+XimmPpklDvYDNELFvCWyHcbK67zHNVPkZe9P0BrQhAlKn2a6+6Hg
 nemb0Q3lQdE2Qlk3l4Sizmyn2ijFh9/kOT1H3m+CtUirQeixF2g10Z0BqR94CDGGZn/UJQ
 KEVQOi7n5ZQQEhSnvyVZvezmBmX7GjI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-y_oiw6aJP7e9tsRsSm5Oeg-1; Sun, 03 Jan 2021 12:28:14 -0500
X-MC-Unique: y_oiw6aJP7e9tsRsSm5Oeg-1
Received: by mail-wm1-f70.google.com with SMTP id f187so8950745wme.3
 for <qemu-devel@nongnu.org>; Sun, 03 Jan 2021 09:28:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VVa/oFE765Ck7q2AaJD1033VoWvKmXWI/fHy9riV+oE=;
 b=nnH2bleVRBGYBjOXd9A+CmiSh8xW5CNvEiLoDMCYbI2ORAqmmQ9BOlppevImAUvegP
 iBX11zUjHXvs01+OOuXsAG8C71KCRfC+wJ1pEmptwybjGdBH39tw5diOLTkYT7cXBdGf
 5X+6XqSdGGTMGBwWI2S2Vc3gl9nNcQN8M7T3AnSEn44Qt+mcWtXeE7uI607h4zs4xIoa
 KazDcL6IDo2p5micotbu1Q7+iG+eACaqWyHxF1+uUueMqq7bj+X+ejvbYLu9tVzdOgfk
 CqqD+94f/kyoYudrj/hGe3a3htPoqIyXVz0jaRfwSC5K9BkluqAALLq+aL4Y9mIbMzio
 6MWQ==
X-Gm-Message-State: AOAM5317hkSS1BKDcZczM0eFEGzOIDnMxTyykIPa1sq5IwrI/eev7N0r
 i0OEzsSbDkerWW10lqHhZSmGGsiHJ0VuMudYoN5jqQTb6PbpWTBPrpuUGlklRLfhDOxR4ZJCLHc
 JIaJZqyege/GacKM=
X-Received: by 2002:a5d:43d2:: with SMTP id v18mr76958763wrr.326.1609694892914; 
 Sun, 03 Jan 2021 09:28:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxzAyDXjQLU19pdVNtNmGloR3mMrkxsOW0JhzK5O2YEZPeMUVar5pTREZdgPfXmjvHVkPCinA==
X-Received: by 2002:a5d:43d2:: with SMTP id v18mr76958749wrr.326.1609694892792; 
 Sun, 03 Jan 2021 09:28:12 -0800 (PST)
Received: from [192.168.1.34] (194.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id b83sm31588086wmd.48.2021.01.03.09.28.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Jan 2021 09:28:12 -0800 (PST)
Subject: Re: [BUG] qemu git error with virgl
To: Torsten Wohlfarth <towo@siduction.org>
References: <30eb4fc7-ef1f-4e92-4e1f-46b71ae8d9f0@siduction.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a6651e26-58b8-cee0-bb15-198e6fb64d48@redhat.com>
Date: Sun, 3 Jan 2021 18:28:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <30eb4fc7-ef1f-4e92-4e1f-46b71ae8d9f0@siduction.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.262, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Gerd + patch author/reviewer.

On 1/2/21 2:11 PM, Torsten Wohlfarth wrote:
> Hello,
> 
> i can't start any system if i use virgl. I get the following error:
> 
> qemu-x86_64: ../ui/console.c:1791: dpy_gl_ctx_create: Assertion
> `con->gl' failed.
> ./and.sh: line 27: 3337167 Aborted                 qemu-x86_64 -m 4096
> -smp cores=4,sockets=1 -cpu host -machine pc-q35-4.0,accel=kvm -device
> virtio-vga,virgl=on,xres=1280,yres=800 -display sdl,gl=on -device
> intel-hda,id=sound0,msi=on -device
> hda-micro,id=sound0-codec0,bus=sound0.0,cad=0 -device qemu-xhci,id=xhci
> -device usb-tablet,bus=xhci.0 -net
> nic,macaddr=52:54:00:12:34:62,model=e1000 -net
> tap,ifname=$INTERFACE,script=no,downscript=no -drive
> file=/media/daten2/image/lineageos.qcow2,if=virtio,index=1,media=disk,cache=none,aio=threads
> 
> Set 'tap3' nonpersistent
> 
> i have bicected the issue:
> 
> towo:Defiant> git bisect good
> b4e1a342112e50e05b609e857f38c1f2b7aafdc4 is the first bad commit
> commit b4e1a342112e50e05b609e857f38c1f2b7aafdc4
> Author: Paolo Bonzini <pbonzini@redhat.com>
> Date:   Tue Oct 27 08:44:23 2020 -0400
> 
>     vl: remove separate preconfig main_loop
> 
>     Move post-preconfig initialization to the x-exit-preconfig. If
> preconfig
>     is not requested, just exit preconfig mode immediately with the QMP
>     command.
> 
>     As a result, the preconfig loop will run with accel_setup_post
>     and os_setup_post restrictions (xen_restrict, chroot, etc.)
>     already done.
> 
>     Reviewed-by: Igor Mammedov <imammedo@redhat.com>
>     Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> 
>  include/sysemu/runstate.h |  1 -
>  monitor/qmp-cmds.c        |  9 -----
>  softmmu/vl.c              | 95
> ++++++++++++++++++++---------------------------
>  3 files changed, 41 insertions(+), 64 deletions(-)
> 
> Regards,
> 
> Torsten Wohlfarth
> 
> 
> 


