Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F32DE5838EA
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 08:41:50 +0200 (CEST)
Received: from localhost ([::1]:55888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGxDS-0006Hw-1a
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 02:41:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leiyang@redhat.com>)
 id 1oGwoX-0007tN-7n
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 02:16:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leiyang@redhat.com>)
 id 1oGwoU-0001Mb-4l
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 02:16:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658988961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n+2Zh4qKdvNhmNmNKL6av4BrAqi/Dx6idy9tjSnkYxA=;
 b=h+TPfXJ5q/RyalMGcaynfu6XrDXg7Ke+3Kx0GNUs3DL630kh/vWg7JY8aHq7rSRpm4gTDY
 RF/tZCz6o7TWNX7OeQpoT9Nfs9GbXESyrrqGBFeRq0YCbH8qpFEQrW44j67K7ouILnY6S8
 PK2TuMQYyt7SkgjPBuvoLJQi3Yk+xTE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-391-U-f3HflFMNuS4eaLnJwekQ-1; Thu, 28 Jul 2022 02:14:42 -0400
X-MC-Unique: U-f3HflFMNuS4eaLnJwekQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 hr24-20020a1709073f9800b0072b57c28438so278366ejc.5
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 23:14:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n+2Zh4qKdvNhmNmNKL6av4BrAqi/Dx6idy9tjSnkYxA=;
 b=qq3Ej9DYxsHwtokjAnMgsaC/u9vNvQZ+lSYU+txQ7I/7FeHXpqW81Bml1eKVlDQsJY
 6HCNviDQ/9meyeCG1jIHlKa9pMhQ7giq9F0wOR3AAo9tr7eScieHBGr70wf711ur3YGJ
 nZJRFw9z5dt/lQfZeDgf1dxoGJGAmP7Y5HCys2wswjD7HnwCxviAokRANCm0ZWFLIxsI
 qTf9muDxsQMIV0UIP5WHFKopcQ2Fz9WprxkrGm0r6jKKUHFNKvvZ6Tlx/axBErf608DL
 V45XMW9X00PPTACiVHrEGuN0HO1ISYsRMF3fD+dkC4Hjgh+jGof5dxIXCsjnsvOkLu6Y
 N0hA==
X-Gm-Message-State: AJIora/d/TZKZDcmqcl/ig6wrWE64+u9J17epglUriL3RO3y3AtCMG6D
 2p3pPTCPClO71DqzAVcF4x9BxKbQY6IQIGH3pQKdpxBzjLfNQ4q32/RuCfZwxoArWIhRDqkvxGL
 n5GyOYuNoxB7/oRafXRUvBfkOWRsL+y8=
X-Received: by 2002:a17:907:8a15:b0:72e:ead3:16d4 with SMTP id
 sc21-20020a1709078a1500b0072eead316d4mr20277180ejc.16.1658988881209; 
 Wed, 27 Jul 2022 23:14:41 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tL1ULwsET+fCcJRdpg9mmhsGketk22HlK/7q9sBhS/VLTJIfaI3flnqTvV8PgdmfEeAUW0m2ljmNr9zGdKZkU=
X-Received: by 2002:a17:907:8a15:b0:72e:ead3:16d4 with SMTP id
 sc21-20020a1709078a1500b0072eead316d4mr20277170ejc.16.1658988880925; Wed, 27
 Jul 2022 23:14:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220726085055.17239-1-jasowang@redhat.com>
 <20220726085055.17239-4-jasowang@redhat.com>
In-Reply-To: <20220726085055.17239-4-jasowang@redhat.com>
From: Lei Yang <leiyang@redhat.com>
Date: Thu, 28 Jul 2022 14:14:04 +0800
Message-ID: <CAPpAL=xujv=gkkQXn=bsiVRXvOLKPWDwASTxfJZKNbBty+dTNQ@mail.gmail.com>
Subject: Re: [PULL 3/3] vdpa: Fix memory listener deletions of iova tree
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, 
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000ef2dc505e4d7728b"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leiyang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

--000000000000ef2dc505e4d7728b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I tried to manually changed this line then test this branch on local host.
After the migration is successful, the qemu core dump occurs on the
shutdown inside guest.

Compiled qemu Steps:
# git clone https://gitlab.com/eperezmartin/qemu-kvm.git
# cd qemu-kvm/
# mkdir build
# cd build/
# git checkout bd85496c2a8c1ebf34f908fca2be2ab9852fd0e9
# vim /root/qemu-kvm/hw/virtio/vhost-vdpa.c
=EF=BC=88Chanege "vhost_iova_tree_remove(v->iova_tree, &mem_region);" to
"vhost_iova_tree_remove(v->iova_tree, result);"=EF=BC=89
# ../configure --target-list=3Dx86_64-softmmu --enable-debug
# make

Core dump messages:
# gdb /root/qemu-kvm/build/x86_64-softmmu/qemu-system-x86_64
core.qemu-system-x86.7419
(gdb) bt full
#0  0x000056107c19afa9 in vhost_vdpa_listener_region_del
(listener=3D0x7ff9a9c691a0, section=3D0x7ffd3889ad20)
    at ../hw/virtio/vhost-vdpa.c:290
        result =3D 0x0
        vaddr =3D 0x7ff29be00000
        mem_region =3D {iova =3D 0, translated_addr =3D 140679973961728, si=
ze =3D
30064771071, perm =3D IOMMU_NONE}
        v =3D 0x7ff9a9c69190
        iova =3D 4294967296
        llend =3D 34359738368
        llsize =3D 30064771072
        ret =3D 32765
        __func__ =3D "vhost_vdpa_listener_region_del"
#1  0x000056107c1ca915 in listener_del_address_space
(listener=3D0x7ff9a9c691a0, as=3D0x56107cccbc00 <address_space_memory>)
    at ../softmmu/memory.c:2939
        section =3D
          {size =3D 30064771072, mr =3D 0x56107e116270, fv =3D 0x7ff1e02a40=
90,
offset_within_region =3D 2147483648, offset_within_address_space =3D
4294967296, readonly =3D false, nonvolatile =3D false}
        view =3D 0x7ff1e02a4090
        fr =3D 0x7ff1e04027f0
#2  0x000056107c1cac39 in memory_listener_unregister
(listener=3D0x7ff9a9c691a0) at ../softmmu/memory.c:2989
#3  0x000056107c19d007 in vhost_vdpa_dev_start (dev=3D0x56107e126ea0,
started=3Dfalse) at ../hw/virtio/vhost-vdpa.c:1134
        v =3D 0x7ff9a9c69190
        ok =3D true
#4  0x000056107c190252 in vhost_dev_stop (hdev=3D0x56107e126ea0,
vdev=3D0x56107f40cb50) at ../hw/virtio/vhost.c:1828
        i =3D 32761
        __PRETTY_FUNCTION__ =3D "vhost_dev_stop"
#5  0x000056107bebe26c in vhost_net_stop_one (net=3D0x56107e126ea0,
dev=3D0x56107f40cb50) at ../hw/net/vhost_net.c:315
        file =3D {index =3D 0, fd =3D -1}
        __PRETTY_FUNCTION__ =3D "vhost_net_stop_one"
#6  0x000056107bebe6bf in vhost_net_stop (dev=3D0x56107f40cb50,
ncs=3D0x56107f421850, data_queue_pairs=3D1, cvq=3D0)
    at ../hw/net/vhost_net.c:425
        qbus =3D 0x56107f40cac8
        vbus =3D 0x56107f40cac8
        k =3D 0x56107df1a220
        n =3D 0x56107f40cb50
        peer =3D 0x7ff9a9c69010
        total_notifiers =3D 2
        nvhosts =3D 1
        i =3D 0
--Type <RET> for more, q to quit, c to continue without paging--
        r =3D 32765
        __PRETTY_FUNCTION__ =3D "vhost_net_stop"
#7  0x000056107c14af24 in virtio_net_vhost_status (n=3D0x56107f40cb50,
status=3D15 '\017') at ../hw/net/virtio-net.c:298
        vdev =3D 0x56107f40cb50
        nc =3D 0x56107f421850
        queue_pairs =3D 1
        cvq =3D 0
#8  0x000056107c14b17e in virtio_net_set_status (vdev=3D0x56107f40cb50,
status=3D15 '\017') at ../hw/net/virtio-net.c:372
        n =3D 0x56107f40cb50
        q =3D 0x56107f40cb50
        i =3D 32765
        queue_status =3D 137 '\211'
#9  0x000056107c185af2 in virtio_set_status (vdev=3D0x56107f40cb50, val=3D1=
5
'\017') at ../hw/virtio/virtio.c:1947
        k =3D 0x56107dfe2c60
#10 0x000056107c188cbb in virtio_vmstate_change (opaque=3D0x56107f40cb50,
running=3Dfalse, state=3DRUN_STATE_SHUTDOWN)
    at ../hw/virtio/virtio.c:3195
        vdev =3D 0x56107f40cb50
        qbus =3D 0x56107f40cac8
        k =3D 0x56107df1a220
        backend_run =3D false
#11 0x000056107bfdca5e in vm_state_notify (running=3Dfalse,
state=3DRUN_STATE_SHUTDOWN) at ../softmmu/runstate.c:334
        e =3D 0x56107f419950
        next =3D 0x56107f224b80
#12 0x000056107bfd43e6 in do_vm_stop (state=3DRUN_STATE_SHUTDOWN,
send_stop=3Dfalse) at ../softmmu/cpus.c:263
        ret =3D 0
#13 0x000056107bfd4420 in vm_shutdown () at ../softmmu/cpus.c:281
#14 0x000056107bfdd584 in qemu_cleanup () at ../softmmu/runstate.c:813
#15 0x000056107bd81a5b in main (argc=3D65, argv=3D0x7ffd3889b178,
envp=3D0x7ffd3889b388) at ../softmmu/main.c:51


Thanks
Lei

Jason Wang <jasowang@redhat.com> =E4=BA=8E2022=E5=B9=B47=E6=9C=8826=E6=97=
=A5=E5=91=A8=E4=BA=8C 16:51=E5=86=99=E9=81=93=EF=BC=9A

> From: Eugenio P=C3=A9rez <eperezma@redhat.com>
>
> vhost_vdpa_listener_region_del is always deleting the first iova entry
> of the tree, since it's using the needle iova instead of the result's
> one.
>
> This was detected using a vga virtual device in the VM using vdpa SVQ.
> It makes some extra memory adding and deleting, so the wrong one was
> mapped / unmapped. This was undetected before since all the memory was
> mappend and unmapped totally without that device, but other conditions
> could trigger it too:
>
> * mem_region was with .iova =3D 0, .translated_addr =3D (correct GPA).
> * iova_tree_find_iova returned right result, but does not update
>   mem_region.
> * iova_tree_remove always removed region with .iova =3D 0. Right iova wer=
e
>   sent to the device.
> * Next map will fill the first region with .iova =3D 0, causing a mapping
>   with the same iova and device complains, if the next action is a map.
> * Next unmap will cause to try to unmap again iova =3D 0, causing the
>   device to complain that no region was mapped at iova =3D 0.
>
> Fixes: 34e3c94edaef ("vdpa: Add custom IOTLB translations to SVQ")
> Reported-by: Lei Yang <leiyang@redhat.com>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  hw/virtio/vhost-vdpa.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index bce64f4..3ff9ce3 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -290,7 +290,7 @@ static void
> vhost_vdpa_listener_region_del(MemoryListener *listener,
>
>          result =3D vhost_iova_tree_find_iova(v->iova_tree, &mem_region);
>          iova =3D result->iova;
> -        vhost_iova_tree_remove(v->iova_tree, &mem_region);
> +        vhost_iova_tree_remove(v->iova_tree, result);
>      }
>      vhost_vdpa_iotlb_batch_begin_once(v);
>      ret =3D vhost_vdpa_dma_unmap(v, iova, int128_get64(llsize));
> --
> 2.7.4
>
>

--000000000000ef2dc505e4d7728b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div style=3D"color:rgb(46,52,54);font-family:monospa=
ce;font-size:13.3333px;width:71ch">I tried to manually changed this line th=
en test this branch on local host. After the migration is successful, the q=
emu core dump occurs on the shutdown inside guest.=C2=A0</div><div style=3D=
"color:rgb(46,52,54);font-family:monospace;font-size:13.3333px;width:71ch">=
<br></div><div style=3D"color:rgb(46,52,54);font-family:monospace;font-size=
:13.3333px;width:71ch">Compiled qemu Steps:</div><div style=3D"color:rgb(46=
,52,54);font-family:monospace;font-size:13.3333px;width:71ch"># git clone=
=C2=A0<a href=3D"https://gitlab.com/eperezmartin/qemu-kvm.git" target=3D"_b=
lank" style=3D"color:rgb(46,52,54)">https://gitlab.com/eperezmartin/qemu-kv=
m.git</a></div><div style=3D"color:rgb(46,52,54);font-family:monospace;font=
-size:13.3333px;width:71ch"># cd qemu-kvm/</div><div style=3D"color:rgb(46,=
52,54);font-family:monospace;font-size:13.3333px;width:71ch"># mkdir build<=
/div><div style=3D"color:rgb(46,52,54);font-family:monospace;font-size:13.3=
333px;width:71ch"># cd build/</div><div style=3D"color:rgb(46,52,54);font-f=
amily:monospace;font-size:13.3333px;width:71ch"># git checkout bd85496c2a8c=
1ebf34f908fca2be2ab9852fd0e9</div><div style=3D"color:rgb(46,52,54);font-fa=
mily:monospace;font-size:13.3333px;width:71ch"># vim /root/qemu-kvm/hw/virt=
io/vhost-vdpa.c</div><div style=3D"color:rgb(46,52,54);font-family:monospac=
e;font-size:13.3333px;width:71ch">=EF=BC=88Chanege &quot;vhost_iova_tree_re=
move(v-&gt;iova_tree, &amp;mem_region);&quot; to &quot;vhost_iova_tree_remo=
ve(v-&gt;iova_tree, result);&quot;=EF=BC=89</div><div style=3D"color:rgb(46=
,52,54);font-family:monospace;font-size:13.3333px;width:71ch"># ../configur=
e --target-list=3Dx86_64-softmmu --enable-debug</div><div style=3D"color:rg=
b(46,52,54);font-family:monospace;font-size:13.3333px;width:71ch"># make</d=
iv></div><div style=3D"color:rgb(46,52,54);font-family:monospace;font-size:=
13.3333px;width:71ch"><br></div><div style=3D"color:rgb(46,52,54);font-fami=
ly:monospace;font-size:13.3333px;width:71ch">Core dump messages:<br></div><=
div style=3D"color:rgb(46,52,54);font-family:monospace;font-size:13.3333px;=
width:71ch"># gdb /root/qemu-kvm/build/x86_64-softmmu/qemu-system-x86_64 co=
re.qemu-system-x86.7419<br></div><div style=3D"color:rgb(46,52,54);font-fam=
ily:monospace;font-size:13.3333px;width:71ch">(gdb) bt full<br>#0 =C2=A00x0=
00056107c19afa9 in vhost_vdpa_listener_region_del (listener=3D0x7ff9a9c691a=
0, section=3D0x7ffd3889ad20)<br>=C2=A0 =C2=A0 at ../hw/virtio/vhost-vdpa.c:=
290<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D 0x0<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 vaddr =3D 0x7ff29be00000<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 mem_region =
=3D {iova =3D 0, translated_addr =3D 140679973961728, size =3D 30064771071,=
 perm =3D IOMMU_NONE}<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 v =3D 0x7ff9a9c69190<b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0 iova =3D 4294967296<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 llend =3D 34359738368<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 llsize =3D 3006=
4771072<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 32765<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 __func__ =3D &quot;vhost_vdpa_listener_region_del&quot;<br>#1 =
=C2=A00x000056107c1ca915 in listener_del_address_space (listener=3D0x7ff9a9=
c691a0, as=3D0x56107cccbc00 &lt;address_space_memory&gt;)<br>=C2=A0 =C2=A0 =
at ../softmmu/memory.c:2939<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 section =3D<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {size =3D 30064771072, mr =3D 0x56107e11=
6270, fv =3D 0x7ff1e02a4090, offset_within_region =3D 2147483648, offset_wi=
thin_address_space =3D 4294967296, readonly =3D false, nonvolatile =3D fals=
e}<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 view =3D 0x7ff1e02a4090<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 fr =3D 0x7ff1e04027f0<br>#2 =C2=A00x000056107c1cac39 in memor=
y_listener_unregister (listener=3D0x7ff9a9c691a0) at ../softmmu/memory.c:29=
89<br>#3 =C2=A00x000056107c19d007 in vhost_vdpa_dev_start (dev=3D0x56107e12=
6ea0, started=3Dfalse) at ../hw/virtio/vhost-vdpa.c:1134<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 v =3D 0x7ff9a9c69190<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 ok =3D tr=
ue<br>#4 =C2=A00x000056107c190252 in vhost_dev_stop (hdev=3D0x56107e126ea0,=
 vdev=3D0x56107f40cb50) at ../hw/virtio/vhost.c:1828<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 i =3D 32761<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 __PRETTY_FUNCTION__ =
=3D &quot;vhost_dev_stop&quot;<br>#5 =C2=A00x000056107bebe26c in vhost_net_=
stop_one (net=3D0x56107e126ea0, dev=3D0x56107f40cb50) at ../hw/net/vhost_ne=
t.c:315<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 file =3D {index =3D 0, fd =3D -1}<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 __PRETTY_FUNCTION__ =3D &quot;vhost_net_stop_o=
ne&quot;<br>#6 =C2=A00x000056107bebe6bf in vhost_net_stop (dev=3D0x56107f40=
cb50, ncs=3D0x56107f421850, data_queue_pairs=3D1, cvq=3D0)<br>=C2=A0 =C2=A0=
 at ../hw/net/vhost_net.c:425<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 qbus =3D 0x561=
07f40cac8<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 vbus =3D 0x56107f40cac8<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 k =3D 0x56107df1a220<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 n =
=3D 0x56107f40cb50<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 peer =3D 0x7ff9a9c69010<b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0 total_notifiers =3D 2<br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 nvhosts =3D 1<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 i =3D 0<br>--Type &lt;=
RET&gt; for more, q to quit, c to continue without paging--<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 r =3D 32765<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 __PRETTY_FUNCT=
ION__ =3D &quot;vhost_net_stop&quot;<br>#7 =C2=A00x000056107c14af24 in virt=
io_net_vhost_status (n=3D0x56107f40cb50, status=3D15 &#39;\017&#39;) at ../=
hw/net/virtio-net.c:298<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 vdev =3D 0x56107f40c=
b50<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 nc =3D 0x56107f421850<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 queue_pairs =3D 1<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 cvq =3D 0<br=
>#8 =C2=A00x000056107c14b17e in virtio_net_set_status (vdev=3D0x56107f40cb5=
0, status=3D15 &#39;\017&#39;) at ../hw/net/virtio-net.c:372<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 n =3D 0x56107f40cb50<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 q =3D=
 0x56107f40cb50<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 i =3D 32765<br>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 queue_status =3D 137 &#39;\211&#39;<br>#9 =C2=A00x000056107c=
185af2 in virtio_set_status (vdev=3D0x56107f40cb50, val=3D15 &#39;\017&#39;=
) at ../hw/virtio/virtio.c:1947<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 k =3D 0x5610=
7dfe2c60<br>#10 0x000056107c188cbb in virtio_vmstate_change (opaque=3D0x561=
07f40cb50, running=3Dfalse, state=3DRUN_STATE_SHUTDOWN)<br>=C2=A0 =C2=A0 at=
 ../hw/virtio/virtio.c:3195<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 vdev =3D 0x56107=
f40cb50<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 qbus =3D 0x56107f40cac8<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 k =3D 0x56107df1a220<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 ba=
ckend_run =3D false<br>#11 0x000056107bfdca5e in vm_state_notify (running=
=3Dfalse, state=3DRUN_STATE_SHUTDOWN) at ../softmmu/runstate.c:334<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 e =3D 0x56107f419950<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 next =3D 0x56107f224b80<br>#12 0x000056107bfd43e6 in do_vm_stop (state=
=3DRUN_STATE_SHUTDOWN, send_stop=3Dfalse) at ../softmmu/cpus.c:263<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 0<br>#13 0x000056107bfd4420 in vm_shutdown=
 () at ../softmmu/cpus.c:281<br>#14 0x000056107bfdd584 in qemu_cleanup () a=
t ../softmmu/runstate.c:813<br>#15 0x000056107bd81a5b in main (argc=3D65, a=
rgv=3D0x7ffd3889b178, envp=3D0x7ffd3889b388) at ../softmmu/main.c:51<br></d=
iv><div style=3D"color:rgb(46,52,54);font-family:monospace;font-size:13.333=
3px;width:71ch"><br></div><div style=3D"color:rgb(46,52,54);font-family:mon=
ospace;font-size:13.3333px;width:71ch"><br></div><div style=3D"color:rgb(46=
,52,54);font-family:monospace;font-size:13.3333px;width:71ch">Thanks</div><=
div style=3D"color:rgb(46,52,54);font-family:monospace;font-size:13.3333px;=
width:71ch">Lei</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Jason Wang &lt;<a href=3D"mailto:jasowang@redhat.com">=
jasowang@redhat.com</a>&gt; =E4=BA=8E2022=E5=B9=B47=E6=9C=8826=E6=97=A5=E5=
=91=A8=E4=BA=8C 16:51=E5=86=99=E9=81=93=EF=BC=9A<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">From: Eugenio P=C3=A9rez &lt;<a href=3D"ma=
ilto:eperezma@redhat.com" target=3D"_blank">eperezma@redhat.com</a>&gt;<br>
<br>
vhost_vdpa_listener_region_del is always deleting the first iova entry<br>
of the tree, since it&#39;s using the needle iova instead of the result&#39=
;s<br>
one.<br>
<br>
This was detected using a vga virtual device in the VM using vdpa SVQ.<br>
It makes some extra memory adding and deleting, so the wrong one was<br>
mapped / unmapped. This was undetected before since all the memory was<br>
mappend and unmapped totally without that device, but other conditions<br>
could trigger it too:<br>
<br>
* mem_region was with .iova =3D 0, .translated_addr =3D (correct GPA).<br>
* iova_tree_find_iova returned right result, but does not update<br>
=C2=A0 mem_region.<br>
* iova_tree_remove always removed region with .iova =3D 0. Right iova were<=
br>
=C2=A0 sent to the device.<br>
* Next map will fill the first region with .iova =3D 0, causing a mapping<b=
r>
=C2=A0 with the same iova and device complains, if the next action is a map=
.<br>
* Next unmap will cause to try to unmap again iova =3D 0, causing the<br>
=C2=A0 device to complain that no region was mapped at iova =3D 0.<br>
<br>
Fixes: 34e3c94edaef (&quot;vdpa: Add custom IOTLB translations to SVQ&quot;=
)<br>
Reported-by: Lei Yang &lt;<a href=3D"mailto:leiyang@redhat.com" target=3D"_=
blank">leiyang@redhat.com</a>&gt;<br>
Signed-off-by: Eugenio P=C3=A9rez &lt;<a href=3D"mailto:eperezma@redhat.com=
" target=3D"_blank">eperezma@redhat.com</a>&gt;<br>
Signed-off-by: Jason Wang &lt;<a href=3D"mailto:jasowang@redhat.com" target=
=3D"_blank">jasowang@redhat.com</a>&gt;<br>
---<br>
=C2=A0hw/virtio/vhost-vdpa.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c<br>
index bce64f4..3ff9ce3 100644<br>
--- a/hw/virtio/vhost-vdpa.c<br>
+++ b/hw/virtio/vhost-vdpa.c<br>
@@ -290,7 +290,7 @@ static void vhost_vdpa_listener_region_del(MemoryListen=
er *listener,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D vhost_iova_tree_find_iova(v-&g=
t;iova_tree, &amp;mem_region);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iova =3D result-&gt;iova;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 vhost_iova_tree_remove(v-&gt;iova_tree, &amp;m=
em_region);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vhost_iova_tree_remove(v-&gt;iova_tree, result=
);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0vhost_vdpa_iotlb_batch_begin_once(v);<br>
=C2=A0 =C2=A0 =C2=A0ret =3D vhost_vdpa_dma_unmap(v, iova, int128_get64(llsi=
ze));<br>
-- <br>
2.7.4<br>
<br>
</blockquote></div>

--000000000000ef2dc505e4d7728b--


