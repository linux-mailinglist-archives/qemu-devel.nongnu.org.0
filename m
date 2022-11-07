Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 571C361FC3F
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 18:55:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os6KF-0005LK-Pf; Mon, 07 Nov 2022 12:54:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1os6KB-0005Gr-B9
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 12:54:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1os6K9-0004wa-1z
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 12:54:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667843656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V815n3/eT7/e19Mfa8t5ArjALw9xXtgbNy9vKUZs2Lc=;
 b=Y/GFU09X8WcnoumnzocTXRcNFDzjB6P7P6d8dhe0Q+SuFHIsSNg/HmGe8jwD1X3Hrd33Uh
 y/JHZpQUQK9PvObT2Z3gVxGSYUrzkk/Hch5m++PJgWXjLzmgeRqRxFHsmaP+W2ffZkgG5R
 MsItAOPaahVHIqqpAv4FzJPQqG75YGE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-351-dy6ekUKNP4-aC9excskdzA-1; Mon, 07 Nov 2022 12:54:14 -0500
X-MC-Unique: dy6ekUKNP4-aC9excskdzA-1
Received: by mail-wr1-f72.google.com with SMTP id
 t12-20020adfa2cc000000b0022adcbb248bso3048234wra.1
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 09:54:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V815n3/eT7/e19Mfa8t5ArjALw9xXtgbNy9vKUZs2Lc=;
 b=a9wwB/Zc4vzM0wisfTAGACEg7zXUHuL/vc2AnJcD1u9nZ61pVe2m73SIC1qJZkApqF
 L5lfb61dpEkSEVdeyGvMqWmJckecDrkBvEeM9plq5jmHeZtlGWrBRmibn1blakTr5TKa
 fGA4TUPvXCagrIztvvGUlIulbeGovRAg2JrSsVoRbyaPH6tx+ycG5sIdEA/Fb+k4BWtg
 QEL/OLXdkHN4jeAgxO98aF9NyGIOH5ZsX1JHR3q2Ly28+HaehFIb6L1k8ZAMuJLDnC8E
 C3m0K3UgN+RYGiEY+77JrTeYWwZ7Q/eV4zcSdYeznypmSjMVBT6TOj4tB+BNnGK2z+EU
 NNQQ==
X-Gm-Message-State: ACrzQf2wKgX9OzpB+SLd14YeTa5j+5l7Cr5H41QgF1sLYLZu/zVwUhu6
 EnDOoC+uAAlSX881wIUpHbyBaJGYV7Gf6TFumRrUUMc9lx37YhBnK9ruHEAefq/fuP/YMtUW2O4
 Y2mGvwd7VvqRf3rA=
X-Received: by 2002:a05:600c:21a:b0:3cf:6e78:8e89 with SMTP id
 26-20020a05600c021a00b003cf6e788e89mr30699457wmi.46.1667843653325; 
 Mon, 07 Nov 2022 09:54:13 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7VcyXYAbrkqRCDFyqPlp/g1ymUEHmEz1/2aDg0pyLsMK/hzUScURbDDI7iyg+TW062ZQa0yg==
X-Received: by 2002:a05:600c:21a:b0:3cf:6e78:8e89 with SMTP id
 26-20020a05600c021a00b003cf6e788e89mr30699432wmi.46.1667843652999; 
 Mon, 07 Nov 2022 09:54:12 -0800 (PST)
Received: from redhat.com ([169.150.226.212]) by smtp.gmail.com with ESMTPSA id
 t20-20020a05600c199400b003cf9bf5208esm10680537wmq.19.2022.11.07.09.54.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 09:54:12 -0800 (PST)
Date: Mon, 7 Nov 2022 12:54:08 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Christian A. Ehrhardt" <lk@c--e.de>
Cc: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Yajun Wu <yajunw@nvidia.com>, Parav Pandit <parav@nvidia.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-block@nongnu.org,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PULL v2 31/82] vhost: Change the sequence of device start
Message-ID: <20221107125329-mutt-send-email-mst@kernel.org>
References: <20221102160336.616599-1-mst@redhat.com>
 <20221102160336.616599-32-mst@redhat.com>
 <CAG4p6K6=HcZs+TfzC7QMmUxKhity0_dYo4-UWwiXv7oJSvDO2g@mail.gmail.com>
 <20221105124218-mutt-send-email-mst@kernel.org>
 <Y2f2Qa+nfrF3t/tg@cae.in-ulm.de>
 <20221107082635-mutt-send-email-mst@kernel.org>
 <Y2lA1OBh61FnXSWY@cae.in-ulm.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y2lA1OBh61FnXSWY@cae.in-ulm.de>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Mon, Nov 07, 2022 at 06:31:00PM +0100, Christian A. Ehrhardt wrote:
> On Mon, Nov 07, 2022 at 08:30:32AM -0500, Michael S. Tsirkin wrote:
> > On Sun, Nov 06, 2022 at 07:00:33PM +0100, Christian A. Ehrhardt wrote:
> > > 
> > > Hi,
> > > 
> > > On Sat, Nov 05, 2022 at 12:43:05PM -0400, Michael S. Tsirkin wrote:
> > > > On Sat, Nov 05, 2022 at 05:35:57PM +0100, Bernhard Beschow wrote:
> > > > > 
> > > > > 
> > > > > On Wed, Nov 2, 2022 at 5:24 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > 
> > > > >     From: Yajun Wu <yajunw@nvidia.com>
> > > > > 
> > > > >     This patch is part of adding vhost-user vhost_dev_start support. The
> > > > >     motivation is to improve backend configuration speed and reduce live
> > > > >     migration VM downtime.
> > > > > 
> > > > >     Moving the device start routines after finishing all the necessary device
> > > > >     and VQ configuration, further aligning to the virtio specification for
> > > > >     "device initialization sequence".
> > > > > 
> > > > >     Following patch will add vhost-user vhost_dev_start support.
> > > > > 
> > > > >     Signed-off-by: Yajun Wu <yajunw@nvidia.com>
> > > > >     Acked-by: Parav Pandit <parav@nvidia.com>
> > > > > 
> > > > >     Message-Id: <20221017064452.1226514-2-yajunw@nvidia.com>
> > > > >     Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > > > >     Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > > >     ---
> > > > >      hw/block/vhost-user-blk.c | 18 +++++++++++-------
> > > > >      hw/net/vhost_net.c        | 12 ++++++------
> > > > >      2 files changed, 17 insertions(+), 13 deletions(-)
> > > > > 
> > > > > 
> > > > > A git bisect tells me that this is the first bad commit for failing qos-tests
> > > > > which only fail when parallel jobs are enabled, e.g. `make check-qtest -j8`:
> > > 
> > > Parallel test run is not required provided that the test machine is
> > > sufficiently busy (load > number of CPU threads). In this case a single
> > > invocation of the qos test will fail reliably with this change.
> > > 
> > > However, the change is not really the root cause of the failures.
> > > 
> > > > > Summary of Failures:
> > > > > 
> > > > >  76/541 qemu:qtest+qtest-aarch64 / qtest-aarch64/qos-test                      
> > > > >   ERROR          18.68s   killed by signal 6 SIGABRT
> > > > >  77/541 qemu:qtest+qtest-arm / qtest-arm/qos-test                              
> > > > >   ERROR          17.60s   killed by signal 6 SIGABRT
> > > > >  93/541 qemu:qtest+qtest-i386 / qtest-i386/qos-test                            
> > > > >   ERROR          18.98s   killed by signal 6 SIGABRT
> > > > > 108/541 qemu:qtest+qtest-ppc64 / qtest-ppc64/qos-test                          
> > > > >   ERROR          16.40s   killed by signal 6 SIGABRT
> > > > > 112/541 qemu:qtest+qtest-i386 / qtest-i386/bios-tables-test                    
> > > > >   ERROR          145.94s   killed by signal 6 SIGABRT
> > > > > 130/541 qemu:qtest+qtest-x86_64 / qtest-x86_64/qos-test                        
> > > > >   ERROR          17.32s   killed by signal 6 SIGABRT
> > > > > 243/541 qemu:qtest+qtest-x86_64 / qtest-x86_64/bios-tables-test                
> > > > >   ERROR          127.70s   killed by signal 6 SIGABRT
> > > > > 
> > > > > Ok:                 500
> > > > > Expected Fail:      0  
> > > > > Fail:               7  
> > > > > Unexpected Pass:    0  
> > > > > Skipped:            34  
> > > > > Timeout:            0  
> > > > > 
> > > > > Can anyone else reproduce this?
> > > > 
> > > > Could you pls try latest for_upstream in my tree?
> > > > That should have this fixed.
> > > 
> > > Your new pull request simply drops this change and this does fix
> > > make check-qtest. However, this looks accidental to me and the real
> > > bug is there in plain origin/master, too.
> > > 
> > > What happens is this backtrace a recursive call to vu_gpio_stop
> > > via the backtrace below. It is caused by a delayed of the TCP
> > > connection (the delayed part only triggers with heavy load on the
> > > machine).
> > > 
> > > You can get the failure back (probably in upstream) if the test is
> > > forced to us "use-started=off" which can be set on the command line.
> > > E.g. like this:
> > > 
> > > diff --git a/tests/qtest/libqos/virtio-gpio.c b/tests/qtest/libqos/virtio-gpio.c
> > > index 762aa6695b..17c6b71e8b 100644
> > > --- a/tests/qtest/libqos/virtio-gpio.c
> > > +++ b/tests/qtest/libqos/virtio-gpio.c
> > > @@ -154,14 +154,14 @@ static void virtio_gpio_register_nodes(void)
> > >      QOSGraphEdgeOptions edge_opts = { };
> > > 
> > >      /* vhost-user-gpio-device */
> > > -    edge_opts.extra_device_opts = "id=gpio0,chardev=chr-vhost-user-test";
> > > +    edge_opts.extra_device_opts = "id=gpio0,chardev=chr-vhost-user-test,use-started=off";
> > >      qos_node_create_driver("vhost-user-gpio-device",
> > >                              virtio_gpio_device_create);
> > >      qos_node_consumes("vhost-user-gpio-device", "virtio-bus", &edge_opts);
> > >      qos_node_produces("vhost-user-gpio-device", "vhost-user-gpio");
> > > 
> > >      /* virtio-gpio-pci */
> > > -    edge_opts.extra_device_opts = "id=gpio0,addr=04.0,chardev=chr-vhost-user-test";
> > > +    edge_opts.extra_device_opts = "id=gpio0,addr=04.0,chardev=chr-vhost-user-test,use-started=on";
> > >      add_qpci_address(&edge_opts, &addr);
> > >      qos_node_create_driver("vhost-user-gpio-pci", virtio_gpio_pci_create);
> > >      qos_node_consumes("vhost-user-gpio-pci", "pci-bus", &edge_opts);
> > > 
> > > 
> > > I haven't verified this but from looking at the code other types of
> > > vhost devices seem to have the same problem (e.g. vhost-user-i2c looks
> > > suspicious).
> > > 
> > > Ok, here's the backtrace:
> > > 
> > > #0  vu_gpio_stop (vdev=vdev@entry=0x560e0ae449d0) at ../hw/virtio/vhost-user-gpio.c:143
> > > #1  0x0000560e0768fb1f in vu_gpio_disconnect (dev=<optimized out>) at ../hw/virtio/vhost-user-gpio.c:260
> > > #2  vu_gpio_event (opaque=<optimized out>, event=<optimized out>) at ../hw/virtio/vhost-user-gpio.c:279
> > > #3  0x0000560e078057b5 in tcp_chr_disconnect_locked (chr=0x560e0a00f800) at ../chardev/char-socket.c:470
> > > #4  0x0000560e078058d3 in tcp_chr_write (chr=0x560e0a00f800, buf=<optimized out>, len=<optimized out>) at ../chardev/char-socket.c:129
> > > #5  0x0000560e07808a63 in qemu_chr_write_buffer (s=s@entry=0x560e0a00f800, buf=buf@entry=0x7ffc76812ac0 <error: Cannot access memory at address 0x7ffc76812ac0>, len=20, offset=offset@entry=0x7ffc76812a40, write_all=write_all@entry=true) at ../chardev/char.c:121
> > > #6  0x0000560e07808e84 in qemu_chr_write (s=0x560e0a00f800, buf=buf@entry=0x7ffc76812ac0 <error: Cannot access memory at address 0x7ffc76812ac0>, len=len@entry=20, write_all=write_all@entry=true) at ../chardev/char.c:173
> > > #7  0x0000560e078010e6 in qemu_chr_fe_write_all (be=be@entry=0x560e0ae44bc0, buf=buf@entry=0x7ffc76812ac0 <error: Cannot access memory at address 0x7ffc76812ac0>, len=len@entry=20) at ../chardev/char-fe.c:53
> > > #8  0x0000560e07676d16 in vhost_user_write (msg=msg@entry=0x7ffc76812ac0, fds=fds@entry=0x0, fd_num=fd_num@entry=0, dev=<optimized out>, dev=<optimized out>) at ../hw/virtio/vhost-user.c:490
> > > #9  0x0000560e076777c0 in vhost_user_get_vring_base (dev=0x560e0ae44c08, ring=0x7ffc76812d80) at ../hw/virtio/vhost-user.c:1260
> > > #10 0x0000560e0767314e in vhost_virtqueue_stop (dev=dev@entry=0x560e0ae44c08, vdev=vdev@entry=0x560e0ae449d0, vq=0x560e0ae7a570, idx=0) at ../hw/virtio/vhost.c:1220
> > > #11 0x0000560e07675236 in vhost_dev_stop (hdev=hdev@entry=0x560e0ae44c08, vdev=vdev@entry=0x560e0ae449d0) at ../hw/virtio/vhost.c:1884
> > > #12 0x0000560e0768f2fd in vu_gpio_stop (vdev=0x560e0ae449d0) at ../hw/virtio/vhost-user-gpio.c:148
> > > #13 0x0000560e0766a6a3 in virtio_set_status (vdev=0x560e0ae449d0, val=<optimized out>) at ../hw/virtio/virtio.c:2442
> > > #14 0x0000560e0751a2e0 in vm_state_notify (running=running@entry=false, state=state@entry=RUN_STATE_SHUTDOWN) at ../softmmu/runstate.c:334
> > > #15 0x0000560e07514d70 in do_vm_stop (send_stop=false, state=RUN_STATE_SHUTDOWN) at ../softmmu/cpus.c:262
> > > #16 vm_shutdown () at ../softmmu/cpus.c:280
> > > #17 0x0000560e0751af63 in qemu_cleanup () at ../softmmu/runstate.c:827
> > > #18 0x0000560e07350f33 in qemu_default_main () at ../softmmu/main.c:38
> > > #19 0x00007f0a5655bd90 in __libc_start_call_main (main=main@entry=0x560e0734c3e0 <main>, argc=argc@entry=25, argv=argv@entry=0x7ffc768130a8) at ../sysdeps/nptl/libc_start_call_main.h:58
> > > #20 0x00007f0a5655be40 in __libc_start_main_impl (main=0x560e0734c3e0 <main>, argc=25, argv=0x7ffc768130a8, init=<optimized out>, fini=<optimized out>, rtld_fini=<optimized out>, stack_end=0x7ffc76813098) at ../csu/libc-start.c:392
> > > #21 0x0000560e07350e55 in _start ()
> > > 
> > > 
> > > Any Ideas how to fix this properly?
> > > 
> > >     regards    Christian
> > 
> > so fundamentally, any write into a socket can trigger stop?
> > I don't think we realized this.
> > Hmm this needs some thought there are likely more issues
> > like this.
> 
> The code in net/vhost-user.c seems to realize this and uses
> aio to schedule the close. I was wondering if chardev should
> do this for OPEN/CLOSE events by default (or by request).
> However, I couldn't figure out how to ensure that the device
> remains alive until the callback is actually called.
> 
>       regards   Christian

Cc Alex who's been looking at this.

-- 
MST


