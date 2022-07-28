Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A36E5838E4
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 08:41:07 +0200 (CEST)
Received: from localhost ([::1]:55008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGxCk-0005eJ-8d
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 02:41:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGwzC-0004RD-Ti
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 02:27:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGwzA-0004Mz-9V
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 02:27:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658989623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+w6k+4SSE1QHnG7eyl5pXB6uiuRrnuRNhidSnhvG4lE=;
 b=EKg7k6jTltu4gg0nT+h5dFr4QUJDep1/D/czKSjadA5KBPbFTyCLlI6rZ/EOZTYNGM0WHZ
 gQyEgD2sUaWVE6ELUfuM/9PyJIkKk95ISADzMB5D4dIc5UA1+mxqLYZ2MKRXdYo5+6rUBa
 43xhINQSnPLW9RgNDgjLhMuMIGbjbs8=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-115-1_DiGxZ6MI6fKFqGBcheBQ-1; Thu, 28 Jul 2022 02:27:02 -0400
X-MC-Unique: 1_DiGxZ6MI6fKFqGBcheBQ-1
Received: by mail-lj1-f199.google.com with SMTP id
 m17-20020a2e8711000000b0025e09ef4496so109991lji.21
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 23:27:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+w6k+4SSE1QHnG7eyl5pXB6uiuRrnuRNhidSnhvG4lE=;
 b=F9Iybimx3UG/4mN/K8ObmmnUw1UaLpSrKBl/665gnnItV4W8Jhm2w50TwddZp5GEU4
 J3vusMnZ3CqoS01cn9kPPtqNZCnNJczEUzm82BAsQpH+iI1JZsci8aTJBFuEFvq8avYp
 ZKwaOrZC3/l2OkYfee3jmXA6iTJNbkbI2jxqWiY1aZUueW+ul6/E0jmONtOd2wfXbSd7
 UDLvtlTmHpp7nydmZj63/Uaxf1Gx5ofiN/792not+cYG1shXpxriWt0q7SsYmoStLPBA
 grzS2W0UIMo4HIklJLtYvb2gAfiBtGHJTA5MpEo01ADKdyjM+jNZ7nv1E6lcN1aDIk7w
 242g==
X-Gm-Message-State: AJIora+EwO/G9upRWgPoFnvu9W24v2UFDsdXDijFmL+kCkrDLpN0JYER
 cw2cI8/CkTTWNSjdjMnEb+N8q0IqQtRNyrEjr+w8ToZsR8n5ZFUdmVJSaIc7FjEzSNQzS2ZLOnL
 EiNMA7EvQSUNCgYcrs1Xg9XSpmb1lnoY=
X-Received: by 2002:ac2:4205:0:b0:48a:95e6:395c with SMTP id
 y5-20020ac24205000000b0048a95e6395cmr6137364lfh.238.1658989620223; 
 Wed, 27 Jul 2022 23:27:00 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tinckJwQJEdOswoPWMuS2khqwvSbrrWMb9/QVUuK5cKgX83B7/QM49xAgwRXyhZdvXIbidGeKQdO9HQ1KkHv8=
X-Received: by 2002:ac2:4205:0:b0:48a:95e6:395c with SMTP id
 y5-20020ac24205000000b0048a95e6395cmr6137351lfh.238.1658989619615; Wed, 27
 Jul 2022 23:26:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220726085055.17239-1-jasowang@redhat.com>
 <20220726085055.17239-4-jasowang@redhat.com>
 <CAPpAL=xujv=gkkQXn=bsiVRXvOLKPWDwASTxfJZKNbBty+dTNQ@mail.gmail.com>
In-Reply-To: <CAPpAL=xujv=gkkQXn=bsiVRXvOLKPWDwASTxfJZKNbBty+dTNQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 28 Jul 2022 14:26:48 +0800
Message-ID: <CACGkMEtBUK1e=hqm9VhxweuQKV+U+MAHhqeuQFqmr4hUpB98Lw@mail.gmail.com>
Subject: Re: [PULL 3/3] vdpa: Fix memory listener deletions of iova tree
To: Lei Yang <leiyang@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, Jul 28, 2022 at 2:14 PM Lei Yang <leiyang@redhat.com> wrote:
>
> I tried to manually changed this line then test this branch on local host=
. After the migration is successful, the qemu core dump occurs on the shutd=
own inside guest.
>
> Compiled qemu Steps:
> # git clone https://gitlab.com/eperezmartin/qemu-kvm.git
> # cd qemu-kvm/
> # mkdir build
> # cd build/
> # git checkout bd85496c2a8c1ebf34f908fca2be2ab9852fd0e9

I got this

fatal: reference is not a tree: bd85496c2a8c1ebf34f908fca2be2ab9852fd0e9

and my HEAD is:

commit 7b17a1a841fc2336eba53afade9cadb14bd3dd9a (HEAD -> master, tag:
v7.1.0-rc0, origin/master, origin/HEAD)
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Tue Jul 26 18:03:16 2022 -0700

    Update version for v7.1.0-rc0 release

    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> # vim /root/qemu-kvm/hw/virtio/vhost-vdpa.c
> =EF=BC=88Chanege "vhost_iova_tree_remove(v->iova_tree, &mem_region);" to =
"vhost_iova_tree_remove(v->iova_tree, result);"=EF=BC=89

Any reason you need to manually change the line since it has been merged?

> # ../configure --target-list=3Dx86_64-softmmu --enable-debug
> # make

So if I understand you correctly, you meant the issue is not fixed?

Thanks

>
> Core dump messages:
> # gdb /root/qemu-kvm/build/x86_64-softmmu/qemu-system-x86_64 core.qemu-sy=
stem-x86.7419
> (gdb) bt full
> #0  0x000056107c19afa9 in vhost_vdpa_listener_region_del (listener=3D0x7f=
f9a9c691a0, section=3D0x7ffd3889ad20)
>     at ../hw/virtio/vhost-vdpa.c:290
>         result =3D 0x0
>         vaddr =3D 0x7ff29be00000
>         mem_region =3D {iova =3D 0, translated_addr =3D 140679973961728, =
size =3D 30064771071, perm =3D IOMMU_NONE}
>         v =3D 0x7ff9a9c69190
>         iova =3D 4294967296
>         llend =3D 34359738368
>         llsize =3D 30064771072
>         ret =3D 32765
>         __func__ =3D "vhost_vdpa_listener_region_del"
> #1  0x000056107c1ca915 in listener_del_address_space (listener=3D0x7ff9a9=
c691a0, as=3D0x56107cccbc00 <address_space_memory>)
>     at ../softmmu/memory.c:2939
>         section =3D
>           {size =3D 30064771072, mr =3D 0x56107e116270, fv =3D 0x7ff1e02a=
4090, offset_within_region =3D 2147483648, offset_within_address_space =3D =
4294967296, readonly =3D false, nonvolatile =3D false}
>         view =3D 0x7ff1e02a4090
>         fr =3D 0x7ff1e04027f0
> #2  0x000056107c1cac39 in memory_listener_unregister (listener=3D0x7ff9a9=
c691a0) at ../softmmu/memory.c:2989
> #3  0x000056107c19d007 in vhost_vdpa_dev_start (dev=3D0x56107e126ea0, sta=
rted=3Dfalse) at ../hw/virtio/vhost-vdpa.c:1134
>         v =3D 0x7ff9a9c69190
>         ok =3D true
> #4  0x000056107c190252 in vhost_dev_stop (hdev=3D0x56107e126ea0, vdev=3D0=
x56107f40cb50) at ../hw/virtio/vhost.c:1828
>         i =3D 32761
>         __PRETTY_FUNCTION__ =3D "vhost_dev_stop"
> #5  0x000056107bebe26c in vhost_net_stop_one (net=3D0x56107e126ea0, dev=
=3D0x56107f40cb50) at ../hw/net/vhost_net.c:315
>         file =3D {index =3D 0, fd =3D -1}
>         __PRETTY_FUNCTION__ =3D "vhost_net_stop_one"
> #6  0x000056107bebe6bf in vhost_net_stop (dev=3D0x56107f40cb50, ncs=3D0x5=
6107f421850, data_queue_pairs=3D1, cvq=3D0)
>     at ../hw/net/vhost_net.c:425
>         qbus =3D 0x56107f40cac8
>         vbus =3D 0x56107f40cac8
>         k =3D 0x56107df1a220
>         n =3D 0x56107f40cb50
>         peer =3D 0x7ff9a9c69010
>         total_notifiers =3D 2
>         nvhosts =3D 1
>         i =3D 0
> --Type <RET> for more, q to quit, c to continue without paging--
>         r =3D 32765
>         __PRETTY_FUNCTION__ =3D "vhost_net_stop"
> #7  0x000056107c14af24 in virtio_net_vhost_status (n=3D0x56107f40cb50, st=
atus=3D15 '\017') at ../hw/net/virtio-net.c:298
>         vdev =3D 0x56107f40cb50
>         nc =3D 0x56107f421850
>         queue_pairs =3D 1
>         cvq =3D 0
> #8  0x000056107c14b17e in virtio_net_set_status (vdev=3D0x56107f40cb50, s=
tatus=3D15 '\017') at ../hw/net/virtio-net.c:372
>         n =3D 0x56107f40cb50
>         q =3D 0x56107f40cb50
>         i =3D 32765
>         queue_status =3D 137 '\211'
> #9  0x000056107c185af2 in virtio_set_status (vdev=3D0x56107f40cb50, val=
=3D15 '\017') at ../hw/virtio/virtio.c:1947
>         k =3D 0x56107dfe2c60
> #10 0x000056107c188cbb in virtio_vmstate_change (opaque=3D0x56107f40cb50,=
 running=3Dfalse, state=3DRUN_STATE_SHUTDOWN)
>     at ../hw/virtio/virtio.c:3195
>         vdev =3D 0x56107f40cb50
>         qbus =3D 0x56107f40cac8
>         k =3D 0x56107df1a220
>         backend_run =3D false
> #11 0x000056107bfdca5e in vm_state_notify (running=3Dfalse, state=3DRUN_S=
TATE_SHUTDOWN) at ../softmmu/runstate.c:334
>         e =3D 0x56107f419950
>         next =3D 0x56107f224b80
> #12 0x000056107bfd43e6 in do_vm_stop (state=3DRUN_STATE_SHUTDOWN, send_st=
op=3Dfalse) at ../softmmu/cpus.c:263
>         ret =3D 0
> #13 0x000056107bfd4420 in vm_shutdown () at ../softmmu/cpus.c:281
> #14 0x000056107bfdd584 in qemu_cleanup () at ../softmmu/runstate.c:813
> #15 0x000056107bd81a5b in main (argc=3D65, argv=3D0x7ffd3889b178, envp=3D=
0x7ffd3889b388) at ../softmmu/main.c:51
>
>
> Thanks
> Lei
>
> Jason Wang <jasowang@redhat.com> =E4=BA=8E2022=E5=B9=B47=E6=9C=8826=E6=97=
=A5=E5=91=A8=E4=BA=8C 16:51=E5=86=99=E9=81=93=EF=BC=9A
>>
>> From: Eugenio P=C3=A9rez <eperezma@redhat.com>
>>
>> vhost_vdpa_listener_region_del is always deleting the first iova entry
>> of the tree, since it's using the needle iova instead of the result's
>> one.
>>
>> This was detected using a vga virtual device in the VM using vdpa SVQ.
>> It makes some extra memory adding and deleting, so the wrong one was
>> mapped / unmapped. This was undetected before since all the memory was
>> mappend and unmapped totally without that device, but other conditions
>> could trigger it too:
>>
>> * mem_region was with .iova =3D 0, .translated_addr =3D (correct GPA).
>> * iova_tree_find_iova returned right result, but does not update
>>   mem_region.
>> * iova_tree_remove always removed region with .iova =3D 0. Right iova we=
re
>>   sent to the device.
>> * Next map will fill the first region with .iova =3D 0, causing a mappin=
g
>>   with the same iova and device complains, if the next action is a map.
>> * Next unmap will cause to try to unmap again iova =3D 0, causing the
>>   device to complain that no region was mapped at iova =3D 0.
>>
>> Fixes: 34e3c94edaef ("vdpa: Add custom IOTLB translations to SVQ")
>> Reported-by: Lei Yang <leiyang@redhat.com>
>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
>> Signed-off-by: Jason Wang <jasowang@redhat.com>
>> ---
>>  hw/virtio/vhost-vdpa.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>> index bce64f4..3ff9ce3 100644
>> --- a/hw/virtio/vhost-vdpa.c
>> +++ b/hw/virtio/vhost-vdpa.c
>> @@ -290,7 +290,7 @@ static void vhost_vdpa_listener_region_del(MemoryLis=
tener *listener,
>>
>>          result =3D vhost_iova_tree_find_iova(v->iova_tree, &mem_region)=
;
>>          iova =3D result->iova;
>> -        vhost_iova_tree_remove(v->iova_tree, &mem_region);
>> +        vhost_iova_tree_remove(v->iova_tree, result);
>>      }
>>      vhost_vdpa_iotlb_batch_begin_once(v);
>>      ret =3D vhost_vdpa_dma_unmap(v, iova, int128_get64(llsize));
>> --
>> 2.7.4
>>


