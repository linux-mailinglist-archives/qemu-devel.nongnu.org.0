Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D0268BFAD
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 15:12:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP2Db-0006ex-Qs; Mon, 06 Feb 2023 09:11:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1pP2DZ-0006eY-Uy
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 09:11:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1pP2DY-0002mJ-9X
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 09:11:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675692694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FCEYo5GZG1cjQJe5fl5B22YWWBzGwDNvW1dg1MXOaCY=;
 b=CIHOyXPOAPW624+xwXtH7awRS6Jjr8NsyIA3JpqyJjbM4ebe8Dy/LaJ796nvEHmB+R8hlS
 EFvwLeoMF2zTWVCvtr/qF6b6kbUsI6Jz0Z09D+XWTfY5JmhHaQNpwG7oDDUT+dxVtjdVlz
 MLoUcoXX+csLc3PcpNHM0j9ShYVljuI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-483-GKR4GhJTNUmlaCuPOy9FSA-1; Mon, 06 Feb 2023 09:11:24 -0500
X-MC-Unique: GKR4GhJTNUmlaCuPOy9FSA-1
Received: by mail-ej1-f70.google.com with SMTP id
 y12-20020a170906470c00b008a479dfaf54so1712962ejq.5
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 06:11:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FCEYo5GZG1cjQJe5fl5B22YWWBzGwDNvW1dg1MXOaCY=;
 b=36yRvEivAUxZ+WNtM3VTdm+yZtvmSLM9V9QGDMEI7E0U5RFnumEdMt7yh7h/Q0Gd7M
 XiZd0xFFBhKhB/ERtB1J25FgZNIAt7EKq+alT0cSwoUD6j1EOHVDgRZlULjaef5b2hnN
 bwV1NL54Lrxvlgeq/eobv92ofyO286SZA80G4338Vc222RBCtXnMhg7GSQCewUMKM/X8
 jku8TA2Pll2BL3Rn9pUab+mYnZ+KV8PMzOq5KuskXB0j81mMbEHkMKvDwThysMY5pCoL
 PovtU0py/s0IQIA9gxfDxRJY2BhdvHa7g1BWJkKngueCjDDKBLg6q9SWg2wDYm1lCBSf
 jk6A==
X-Gm-Message-State: AO0yUKWsVR7+QX5KC6LJ44La6Zxqoz7Ddqbcbp2sTV7Jtt30fXDQMUkg
 E1/FctN8nqnolW5iPLnDJ9BEkLP9AvXZCv9fOtuoIOqZL5Z4+QS00huwy4yOpym8pvhWyjRXqbt
 dJ6Ybbe0aQCCC3Rw=
X-Received: by 2002:a17:906:9610:b0:881:a3ec:2b40 with SMTP id
 s16-20020a170906961000b00881a3ec2b40mr22040433ejx.59.1675692682902; 
 Mon, 06 Feb 2023 06:11:22 -0800 (PST)
X-Google-Smtp-Source: AK7set/zLpCfT5ktwIFFXCrDWK/lgg8/NOugHBZrBAoLWUP4jaz5JXVrHIv8kD3y+H2WUhh2F+giWw==
X-Received: by 2002:a17:906:9610:b0:881:a3ec:2b40 with SMTP id
 s16-20020a170906961000b00881a3ec2b40mr22040408ejx.59.1675692682687; 
 Mon, 06 Feb 2023 06:11:22 -0800 (PST)
Received: from [10.43.2.39] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 c18-20020a1709060fd200b0088f8abd3214sm5544070ejk.92.2023.02.06.06.11.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 06:11:22 -0800 (PST)
Message-ID: <8291c176-b868-c0e9-af59-0827c6c46807@redhat.com>
Date: Mon, 6 Feb 2023 15:11:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC 0/3] virtio-blk: add iothread-vq-mapping parameter
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20230118194732.1258208-1-stefanha@redhat.com>
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
In-Reply-To: <20230118194732.1258208-1-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 1/18/23 20:47, Stefan Hajnoczi wrote:
> This is a preview of the iothread-vq-mapping parameter that assigns virtqueues
> to IOThreads. The syntax is implemented but multiple IOThreads are not actually
> supported yet. The purpose of this RFC is to reach agreement on the syntax and
> to prepare for libvirt support.
> 
> virtio-blk and virtio-scsi devices will need a way to specify the
> mapping between IOThreads and virtqueues. At the moment all virtqueues
> are assigned to a single IOThread or the main loop. This single thread
> can be a CPU bottleneck, so it is necessary to allow finer-grained
> assignment to spread the load.
> 
> This series introduces command-line syntax for the new iothread-vq-mapping
> property is as follows:
> 
>   --device '{"driver":"virtio-blk-pci","iothread-vq-mapping":[{"iothread":"iothread0","vqs":[0,1,2]},...]},...'
> 
> IOThreads are specified by name and virtqueues are specified by 0-based
> index.
> 
> It will be common to simply assign virtqueues round-robin across a set
> of IOThreads. A convenient syntax that does not require specifying
> individual virtqueue indices is available:
> 
>   --device '{"driver":"virtio-blk-pci","iothread-vq-mapping":[{"iothread":"iothread0"},{"iothread":"iothread1"},...]},...'
> 
> There is no way to reassign virtqueues at runtime and I expect that to be a
> very rare requirement.
> 
> Perhaps libvirt only needs to support round-robin because specifying individual
> virtqueues is very specific and probably only useful for low-level performance
> investigation. The libvirt domain XML syntax for this could be:
> 
>   <driver name='qemu' type='qcow2'>
>     <iothreads>
>       <iothread id="1"/>
>       <iothread id="2"/>
>       <iothread id="3"/>
>     </iothreads>
>     ...
>   </driver>

Just for completeness, this how disk XML looks now:

  <disk type='file' device='disk'>
    <driver name='qemu' type='qcow2' queues='4' iothread='1'/>
    <source file='/tmp/data.qcow'/>
    <target dev='vda' bus='virtio'/>
    <address type='pci' domain='0x0000' bus='0x00' slot='0x03' function='0x0'/>
  </disk>

It corresponds to the following cmd line:

  -blockdev '{"driver":"file","filename":"/tmp/data.qcow","node-name":"libvirt-3-storage","auto-read-only":true,"discard":"unmap"}' \
  -blockdev '{"node-name":"libvirt-3-format","read-only":false,"driver":"qcow2","file":"libvirt-3-storage"}' \
  -device '{"driver":"virtio-blk-pci","iothread":"iothread1","num-queues":4,"bus":"pci.0","addr":"0x3","drive":"libvirt-3-format","id":"virtio-disk0","bootindex":1}' \

We already have @iothread attribute, so inventing an <iothread/>
subelement is a bit misleading, because if users query which disk uses
iothreads, they need to change their XPATH. Currently they can get away
with:

  //disk[driver/@iothread]/source/@file

but I guess for backwards compatibility, we can put the first iothread
ID into the attribute, e.g.:

  <driver iothread="2">
    <iothread>
     <iothread id="2"/>
     <iothread id="4"/>
    </iothread>
  </driver>


We've done something similar, when introducing multiple listen addresses
for VNC.

Now, an iothread is actually a thread pool. I guess we will never ever
need to assign individual threads from the pool to queues, right?

Michal


