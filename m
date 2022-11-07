Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B817C61F463
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 14:31:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os2DB-0001T4-Ux; Mon, 07 Nov 2022 08:30:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1os2D6-0001OD-8E
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 08:30:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1os2D4-0004ek-6M
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 08:30:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667827840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K5woQDQbeaRGM83mxY9SNpjOg9XLltdoc2bcTGYYuWQ=;
 b=P0UqMTZRmzmkcVLtx/gic0ADBH9cXkIbruTHAaa5B9OCpLgbWCPdGx60wVr4ogxYFoZLBa
 jL5A+YKPNGxj+BUWkT93mOPl/uW1q36E3UhLI9nICqYeuxfZp65LwzbjKHgb/7vcWUZfN/
 eK6noPHjknWraOYuA/Jdn0BBcCK5M6k=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-404-Moz3nTNyPPiC896YKG8iQg-1; Mon, 07 Nov 2022 08:30:39 -0500
X-MC-Unique: Moz3nTNyPPiC896YKG8iQg-1
Received: by mail-wm1-f72.google.com with SMTP id
 186-20020a1c02c3000000b003cfab28cbe0so861924wmc.9
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 05:30:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K5woQDQbeaRGM83mxY9SNpjOg9XLltdoc2bcTGYYuWQ=;
 b=E7gwPPPeGmxAC5UxQklLumXN0t0IW+HimpBW2U6cf2+SUEabuPcPyBHgMWWWfEKtb4
 7RPiQzSnn7MjiSKqs7k9vDqy77wY94om/dVDP0+k7kpm7WCv7Jo1nRABKgMWDyv/UmOb
 Pri8XgTcDHKYVQ1Q/1FKHoZdmfEQRKhzOlX/b76VvkI2gx9CFz9DnNyNn04epVNZLwG5
 tcm4ejPQ1lpZPwJ8wsGeZk6XEG6xGxwklXBJJ45ipYITwnSHnQyzUy15I18zEcEQvW59
 BomnmblYycfHpBKyrhfrJecq7fcB7dwggrNZeFT0ZF6km/VXD2wj9XvHRouIlT8idf5f
 AHEQ==
X-Gm-Message-State: ACrzQf0x+Gj07pAzkyT5M2SEWT2FMy8/jKx9qRqE7fBDq3F1l7a8wlvQ
 35zAJylDTHczDgtrBJmy7Z8O1u7n3U4Lz7pMHE9OLYB4OhB9ddU871O/3/7G5TT4cfSJdzdfsWn
 7yfftuZEkPR9aWtw=
X-Received: by 2002:a7b:cd12:0:b0:3cf:8a10:615c with SMTP id
 f18-20020a7bcd12000000b003cf8a10615cmr16104804wmj.61.1667827838370; 
 Mon, 07 Nov 2022 05:30:38 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6DF7bVRffEI1IM0oaCE9t42HK9qQb/KY0GVkxyD0Y892frsooPbRjSoGXGH/ntnj47Q7eJWA==
X-Received: by 2002:a7b:cd12:0:b0:3cf:8a10:615c with SMTP id
 f18-20020a7bcd12000000b003cf8a10615cmr16104776wmj.61.1667827838027; 
 Mon, 07 Nov 2022 05:30:38 -0800 (PST)
Received: from redhat.com ([169.150.226.212]) by smtp.gmail.com with ESMTPSA id
 bh2-20020a05600005c200b002366d1cc198sm7403486wrb.41.2022.11.07.05.30.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 05:30:37 -0800 (PST)
Date: Mon, 7 Nov 2022 08:30:32 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Christian A. Ehrhardt" <lk@c--e.de>
Cc: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Yajun Wu <yajunw@nvidia.com>, Parav Pandit <parav@nvidia.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-block@nongnu.org
Subject: Re: [PULL v2 31/82] vhost: Change the sequence of device start
Message-ID: <20221107082635-mutt-send-email-mst@kernel.org>
References: <20221102160336.616599-1-mst@redhat.com>
 <20221102160336.616599-32-mst@redhat.com>
 <CAG4p6K6=HcZs+TfzC7QMmUxKhity0_dYo4-UWwiXv7oJSvDO2g@mail.gmail.com>
 <20221105124218-mutt-send-email-mst@kernel.org>
 <Y2f2Qa+nfrF3t/tg@cae.in-ulm.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y2f2Qa+nfrF3t/tg@cae.in-ulm.de>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Sun, Nov 06, 2022 at 07:00:33PM +0100, Christian A. Ehrhardt wrote:
> 
> Hi,
> 
> On Sat, Nov 05, 2022 at 12:43:05PM -0400, Michael S. Tsirkin wrote:
> > On Sat, Nov 05, 2022 at 05:35:57PM +0100, Bernhard Beschow wrote:
> > > 
> > > 
> > > On Wed, Nov 2, 2022 at 5:24 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > 
> > >     From: Yajun Wu <yajunw@nvidia.com>
> > > 
> > >     This patch is part of adding vhost-user vhost_dev_start support. The
> > >     motivation is to improve backend configuration speed and reduce live
> > >     migration VM downtime.
> > > 
> > >     Moving the device start routines after finishing all the necessary device
> > >     and VQ configuration, further aligning to the virtio specification for
> > >     "device initialization sequence".
> > > 
> > >     Following patch will add vhost-user vhost_dev_start support.
> > > 
> > >     Signed-off-by: Yajun Wu <yajunw@nvidia.com>
> > >     Acked-by: Parav Pandit <parav@nvidia.com>
> > > 
> > >     Message-Id: <20221017064452.1226514-2-yajunw@nvidia.com>
> > >     Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > >     Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > >     ---
> > >      hw/block/vhost-user-blk.c | 18 +++++++++++-------
> > >      hw/net/vhost_net.c        | 12 ++++++------
> > >      2 files changed, 17 insertions(+), 13 deletions(-)
> > > 
> > > 
> > > A git bisect tells me that this is the first bad commit for failing qos-tests
> > > which only fail when parallel jobs are enabled, e.g. `make check-qtest -j8`:
> 
> Parallel test run is not required provided that the test machine is
> sufficiently busy (load > number of CPU threads). In this case a single
> invocation of the qos test will fail reliably with this change.
> 
> However, the change is not really the root cause of the failures.
> 
> > > Summary of Failures:
> > > 
> > >  76/541 qemu:qtest+qtest-aarch64 / qtest-aarch64/qos-test                      
> > >   ERROR          18.68s   killed by signal 6 SIGABRT
> > >  77/541 qemu:qtest+qtest-arm / qtest-arm/qos-test                              
> > >   ERROR          17.60s   killed by signal 6 SIGABRT
> > >  93/541 qemu:qtest+qtest-i386 / qtest-i386/qos-test                            
> > >   ERROR          18.98s   killed by signal 6 SIGABRT
> > > 108/541 qemu:qtest+qtest-ppc64 / qtest-ppc64/qos-test                          
> > >   ERROR          16.40s   killed by signal 6 SIGABRT
> > > 112/541 qemu:qtest+qtest-i386 / qtest-i386/bios-tables-test                    
> > >   ERROR          145.94s   killed by signal 6 SIGABRT
> > > 130/541 qemu:qtest+qtest-x86_64 / qtest-x86_64/qos-test                        
> > >   ERROR          17.32s   killed by signal 6 SIGABRT
> > > 243/541 qemu:qtest+qtest-x86_64 / qtest-x86_64/bios-tables-test                
> > >   ERROR          127.70s   killed by signal 6 SIGABRT
> > > 
> > > Ok:                 500
> > > Expected Fail:      0  
> > > Fail:               7  
> > > Unexpected Pass:    0  
> > > Skipped:            34  
> > > Timeout:            0  
> > > 
> > > Can anyone else reproduce this?
> > 
> > Could you pls try latest for_upstream in my tree?
> > That should have this fixed.
> 
> Your new pull request simply drops this change and this does fix
> make check-qtest. However, this looks accidental to me and the real
> bug is there in plain origin/master, too.
> 
> What happens is this backtrace a recursive call to vu_gpio_stop
> via the backtrace below. It is caused by a delayed of the TCP
> connection (the delayed part only triggers with heavy load on the
> machine).
> 
> You can get the failure back (probably in upstream) if the test is
> forced to us "use-started=off" which can be set on the command line.
> E.g. like this:
> 
> diff --git a/tests/qtest/libqos/virtio-gpio.c b/tests/qtest/libqos/virtio-gpio.c
> index 762aa6695b..17c6b71e8b 100644
> --- a/tests/qtest/libqos/virtio-gpio.c
> +++ b/tests/qtest/libqos/virtio-gpio.c
> @@ -154,14 +154,14 @@ static void virtio_gpio_register_nodes(void)
>      QOSGraphEdgeOptions edge_opts = { };
> 
>      /* vhost-user-gpio-device */
> -    edge_opts.extra_device_opts = "id=gpio0,chardev=chr-vhost-user-test";
> +    edge_opts.extra_device_opts = "id=gpio0,chardev=chr-vhost-user-test,use-started=off";
>      qos_node_create_driver("vhost-user-gpio-device",
>                              virtio_gpio_device_create);
>      qos_node_consumes("vhost-user-gpio-device", "virtio-bus", &edge_opts);
>      qos_node_produces("vhost-user-gpio-device", "vhost-user-gpio");
> 
>      /* virtio-gpio-pci */
> -    edge_opts.extra_device_opts = "id=gpio0,addr=04.0,chardev=chr-vhost-user-test";
> +    edge_opts.extra_device_opts = "id=gpio0,addr=04.0,chardev=chr-vhost-user-test,use-started=on";
>      add_qpci_address(&edge_opts, &addr);
>      qos_node_create_driver("vhost-user-gpio-pci", virtio_gpio_pci_create);
>      qos_node_consumes("vhost-user-gpio-pci", "pci-bus", &edge_opts);
> 
> 
> I haven't verified this but from looking at the code other types of
> vhost devices seem to have the same problem (e.g. vhost-user-i2c looks
> suspicious).
> 
> Ok, here's the backtrace:
> 
> #0  vu_gpio_stop (vdev=vdev@entry=0x560e0ae449d0) at ../hw/virtio/vhost-user-gpio.c:143
> #1  0x0000560e0768fb1f in vu_gpio_disconnect (dev=<optimized out>) at ../hw/virtio/vhost-user-gpio.c:260
> #2  vu_gpio_event (opaque=<optimized out>, event=<optimized out>) at ../hw/virtio/vhost-user-gpio.c:279
> #3  0x0000560e078057b5 in tcp_chr_disconnect_locked (chr=0x560e0a00f800) at ../chardev/char-socket.c:470
> #4  0x0000560e078058d3 in tcp_chr_write (chr=0x560e0a00f800, buf=<optimized out>, len=<optimized out>) at ../chardev/char-socket.c:129
> #5  0x0000560e07808a63 in qemu_chr_write_buffer (s=s@entry=0x560e0a00f800, buf=buf@entry=0x7ffc76812ac0 <error: Cannot access memory at address 0x7ffc76812ac0>, len=20, offset=offset@entry=0x7ffc76812a40, write_all=write_all@entry=true) at ../chardev/char.c:121
> #6  0x0000560e07808e84 in qemu_chr_write (s=0x560e0a00f800, buf=buf@entry=0x7ffc76812ac0 <error: Cannot access memory at address 0x7ffc76812ac0>, len=len@entry=20, write_all=write_all@entry=true) at ../chardev/char.c:173
> #7  0x0000560e078010e6 in qemu_chr_fe_write_all (be=be@entry=0x560e0ae44bc0, buf=buf@entry=0x7ffc76812ac0 <error: Cannot access memory at address 0x7ffc76812ac0>, len=len@entry=20) at ../chardev/char-fe.c:53
> #8  0x0000560e07676d16 in vhost_user_write (msg=msg@entry=0x7ffc76812ac0, fds=fds@entry=0x0, fd_num=fd_num@entry=0, dev=<optimized out>, dev=<optimized out>) at ../hw/virtio/vhost-user.c:490
> #9  0x0000560e076777c0 in vhost_user_get_vring_base (dev=0x560e0ae44c08, ring=0x7ffc76812d80) at ../hw/virtio/vhost-user.c:1260
> #10 0x0000560e0767314e in vhost_virtqueue_stop (dev=dev@entry=0x560e0ae44c08, vdev=vdev@entry=0x560e0ae449d0, vq=0x560e0ae7a570, idx=0) at ../hw/virtio/vhost.c:1220
> #11 0x0000560e07675236 in vhost_dev_stop (hdev=hdev@entry=0x560e0ae44c08, vdev=vdev@entry=0x560e0ae449d0) at ../hw/virtio/vhost.c:1884
> #12 0x0000560e0768f2fd in vu_gpio_stop (vdev=0x560e0ae449d0) at ../hw/virtio/vhost-user-gpio.c:148
> #13 0x0000560e0766a6a3 in virtio_set_status (vdev=0x560e0ae449d0, val=<optimized out>) at ../hw/virtio/virtio.c:2442
> #14 0x0000560e0751a2e0 in vm_state_notify (running=running@entry=false, state=state@entry=RUN_STATE_SHUTDOWN) at ../softmmu/runstate.c:334
> #15 0x0000560e07514d70 in do_vm_stop (send_stop=false, state=RUN_STATE_SHUTDOWN) at ../softmmu/cpus.c:262
> #16 vm_shutdown () at ../softmmu/cpus.c:280
> #17 0x0000560e0751af63 in qemu_cleanup () at ../softmmu/runstate.c:827
> #18 0x0000560e07350f33 in qemu_default_main () at ../softmmu/main.c:38
> #19 0x00007f0a5655bd90 in __libc_start_call_main (main=main@entry=0x560e0734c3e0 <main>, argc=argc@entry=25, argv=argv@entry=0x7ffc768130a8) at ../sysdeps/nptl/libc_start_call_main.h:58
> #20 0x00007f0a5655be40 in __libc_start_main_impl (main=0x560e0734c3e0 <main>, argc=25, argv=0x7ffc768130a8, init=<optimized out>, fini=<optimized out>, rtld_fini=<optimized out>, stack_end=0x7ffc76813098) at ../csu/libc-start.c:392
> #21 0x0000560e07350e55 in _start ()
> 
> 
> Any Ideas how to fix this properly?
> 
>     regards    Christian

so fundamentally, any write into a socket can trigger stop?
I don't think we realized this.
Hmm this needs some thought there are likely more issues
like this.

-- 
MST


