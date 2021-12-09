Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1467B46EC1B
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 16:46:52 +0100 (CET)
Received: from localhost ([::1]:47490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvLdC-0004hH-OR
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 10:46:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mvLbu-0003nS-Vw
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 10:45:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mvLbi-0000LT-QE
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 10:45:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639064717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I+gbtwI9qjVDiNoMtHusBnjkf1Cn0ub0kDcLVUbLgp8=;
 b=Fi21BRsRXMv3/Mnwir7yZOKzmlHQRmV3mpUdRs9u3MCtxRp3eLCaW2fyOfrB69rA9oeUnb
 ZW6x0Aoh1vz7Xy+jOG5rkvNxK71BOOyqeS+SWTRK6goGa4OkAlitdmu8bXnI5NKNL9J0zH
 K0+G5K8K9lHkXcYABX2YUan2zgic09A=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-43-c8P-Vl-6MguMMUJxY-VuyA-1; Thu, 09 Dec 2021 10:45:16 -0500
X-MC-Unique: c8P-Vl-6MguMMUJxY-VuyA-1
Received: by mail-wm1-f72.google.com with SMTP id
 144-20020a1c0496000000b003305ac0e03aso5032839wme.8
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 07:45:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=I+gbtwI9qjVDiNoMtHusBnjkf1Cn0ub0kDcLVUbLgp8=;
 b=vDl0KwIhCzXdfxGdiOeBYKjVrPF47pxmz0WSm/nFb2yHAxJNVRAfvhEC1h909Z74eD
 Ka5n7aJaKxHDEcyjUanX7/z99aeG9bfr93xwXqkVl+S6oAqa2bqY06ZEdcbbepFqLfQc
 U/Ac5VypQBtFazVlHVt9YgMZ4lHSy8Ua5PCe7tcwkaWGTxNDYfSv5YChSD/2jx4Ct2W3
 kcMsM88RrclXztGfkrRfjb/PrsCMiUarMNbPCgk5NMLUNiNE/EUoihlQUOi24K4KnbmL
 TufCChJteGq0QXL1SD3SNp3/LufOd0zl1EErWT+wzpZ3lXJJyWRRuHslcf8xwpfTQJ45
 FNrA==
X-Gm-Message-State: AOAM531QNahyKnmjFEI3CVGXCl29frHQyOa/tLimhMjlLwkrPDh3VDEI
 x6T0xeDgSUzrOoo5f4admIunwMU0Vj33BLTykfUtLWPRE3PMneZcnJ9snX/bOxuXnswlbDP0wn7
 wg24h0XPPwj11qcE=
X-Received: by 2002:a1c:9a89:: with SMTP id c131mr8027530wme.80.1639064715038; 
 Thu, 09 Dec 2021 07:45:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyd5kH2Edj7FVYa/T0J67lq44wdOT8kiAKHhYwQY2+5yb632F/BpfPsh0MfbGajTsDxQ0uiCg==
X-Received: by 2002:a1c:9a89:: with SMTP id c131mr8027489wme.80.1639064714760; 
 Thu, 09 Dec 2021 07:45:14 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id n184sm9181654wme.2.2021.12.09.07.45.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Dec 2021 07:45:14 -0800 (PST)
Message-ID: <404e8b66-b64a-fded-db53-81eef675fc33@redhat.com>
Date: Thu, 9 Dec 2021 16:45:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [RFC] block-backend: prevent dangling BDS pointer in blk_drain()
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20211209142304.381253-1-stefanha@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211209142304.381253-1-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.618,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.803, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09.12.21 15:23, Stefan Hajnoczi wrote:
> The BlockBackend root child can change during bdrv_drained_begin() when
> aio_poll() is invoked. In fact the BlockDriverState can reach refcnt 0
> and blk_drain() is left with a dangling BDS pointer.
>
> One example is scsi_device_purge_requests(), which calls blk_drain() to
> wait for in-flight requests to cancel. If the backup blockjob is active,
> then the BlockBackend root child is a temporary filter BDS owned by the
> blockjob. The blockjob can complete during bdrv_drained_begin() and the
> last reference to the BDS is released when the temporary filter node is
> removed. This results in a use-after-free when blk_drain() calls
> bdrv_drained_end(bs) on the dangling pointer.
>
> The general problem is that a function and its callers must not assume
> that bs is still valid across aio_poll(). Explicitly hold a reference to
> bs in blk_drain() to avoid the dangling pointer.
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
> I found that BDS nodes are sometimes deleted with bs->quiesce_counter >
> 0 (at least when running "make check"), so it is currently not possible
> to put the bdrv_ref/unref() calls in bdrv_do_drained_begin() and
> bdrv_do_drained_end() because they will be unbalanced. That would have
> been a more general solution than only fixing blk_drain().

Deleting nodes that have a `quiesce_counter > 0` doesn’t seem wrong to 
me – deleting only depends on strong references, and so I’d expect that 
anything that increases the quiesce_counter also has a strong reference 
to the node if the former wants the latter to stay around.

I suppose we could make it so that both the quiesce_counter and the 
refcnt need to be 0 before a BDS is deleted (and then deletion can 
happen both from bdrv_unref() and drained_end), but I don’t know whether 
that’s really necessary.  I’d rather leave it to the caller to ensure 
they keep a strong reference throughout the drain.

The question is, how often do we have a situation like this, where we 
take a weak reference for draining, because we assume there’s a strong 
reference backing us up (namely the one through blk->root), but that 
strong reference then can go away due to draining...

> Any suggestions for a better fix?

The fix makes sense to me.

One alternative that comes to my mind is to instead re-fetch `bs = 
blk_bs(blk);` after the AIO_WAIT_WHILE() loop.  But that might be wrong, 
because if the node attached to the BB changed (i.e. isn’t `bs`, and 
isn’t `NULL`), then we’d end the drain on the wrong node.

So I think your fix is the right one.

Hanna

> I think it's likely that more "dangling pointer across aio_poll()"
> problems exist :(.
>
> Here is the (hacky) reproducer:
>
>    build/qemu-system-x86_64 \
>       -name 'avocado-vt-vm1'  \
>       -sandbox on  \
>       -machine q35,memory-backend=mem-machine_mem \
>       -device pcie-root-port,id=pcie-root-port-0,multifunction=on,bus=pcie.0,addr=0x1,chassis=1 \
>       -device pcie-pci-bridge,id=pcie-pci-bridge-0,addr=0x0,bus=pcie-root-port-0  \
>       -nodefaults \
>       -device VGA,bus=pcie.0,addr=0x2 \
>       -m 1024 \
>       -object memory-backend-ram,size=1024M,id=mem-machine_mem  \
>       -smp 10,maxcpus=10,cores=5,threads=1,dies=1,sockets=2  \
>       -cpu 'Cascadelake-Server-noTSX',+kvm_pv_unhalt \
>       -chardev socket,wait=off,server=on,id=qmp_id_qmpmonitor1,path=/tmp/qmp.sock  \
>       -mon chardev=qmp_id_qmpmonitor1,mode=control \
>       -chardev socket,wait=off,server=on,id=qmp_id_catch_monitor,path=/tmp/catch_monitor.sock  \
>       -mon chardev=qmp_id_catch_monitor,mode=control \
>       -device pvpanic,ioport=0x505,id=idgKHYrQ \
>       -chardev socket,wait=off,server=on,id=chardev_serial0,path=/tmp/serial.sock \
>       -device isa-serial,id=serial0,chardev=chardev_serial0  \
>       -chardev socket,id=seabioslog_id_20211110-012521-TNCkxDmn,path=/tmp/seabios.sock,server=on,wait=off \
>       -device isa-debugcon,chardev=seabioslog_id_20211110-012521-TNCkxDmn,iobase=0x402 \
>       -device pcie-root-port,id=pcie-root-port-2,port=0x2,addr=0x1.0x2,bus=pcie.0,chassis=3 \
>       -device virtio-scsi-pci,id=virtio_scsi_pci0,bus=pcie-root-port-2,addr=0x0 \
>       -blockdev node-name=file_image1,driver=file,auto-read-only=on,discard=unmap,aio=threads,filename=test.img,cache.direct=on,cache.no-flush=off \
>       -blockdev node-name=drive_image1,driver=raw,read-only=off,cache.direct=on,cache.no-flush=off,file=file_image1 \
>       -device scsi-hd,id=image1,drive=drive_image1,write-cache=on \
>       -blockdev node-name=file_src1,driver=file,auto-read-only=on,discard=unmap,aio=threads,filename=sr1.qcow2,cache.direct=on,cache.no-flush=off \
>       -blockdev node-name=drive_src1,driver=qcow2,read-only=off,cache.direct=on,cache.no-flush=off,file=file_src1 \
>       -device scsi-hd,id=src1,drive=drive_src1,write-cache=on \
>       -device pcie-root-port,id=pcie-root-port-3,port=0x3,addr=0x1.0x3,bus=pcie.0,chassis=4 \
>       -device virtio-net-pci,mac=9a:11:64:b0:5d:a8,id=idxnEEYY,netdev=idBjpylo,bus=pcie-root-port-3,addr=0x0  \
>       -netdev user,id=idBjpylo  \
>       -vnc :0  \
>       -rtc base=utc,clock=host,driftfix=slew  \
>       -boot menu=off,order=cdn,once=c,strict=off \
>       -enable-kvm \
>       -device pcie-root-port,id=pcie_extra_root_port_0,multifunction=on,bus=pcie.0,addr=0x3,chassis=5 &
>
>    sleep 8 # delay for VM startup and socket creation
>
>    nc -U /tmp/qmp.sock <<EOF
>    {'execute': 'qmp_capabilities'}
>    {'execute': 'blockdev-create', 'arguments': {'options': {'driver': 'file', 'filename': 'dst1.qcow2', 'size': 209715200}, 'job-id': 'file_dst1'}, 'id': 'Fk1bF3FV'}
>    EOF
>    sleep 1 # wait for blockdev-create completion
>    nc -U /tmp/qmp.sock <<EOF
>    {'execute': 'qmp_capabilities'}
>    {'execute': 'job-dismiss', 'arguments': {'id': 'file_dst1'}, 'id': '13R5TDSj'}
>    {'execute': 'blockdev-add', 'arguments': {'node-name': 'file_dst1', 'driver': 'file', 'filename': 'dst1.qcow2', 'aio': 'threads', 'auto-read-only': true, 'discard': 'unmap'}, 'id': 'VIzrN0zy'}
>    {'execute': 'blockdev-create', 'arguments': {'options': {'driver': 'qcow2', 'file': 'file_dst1', 'size': 209715200}, 'job-id': 'drive_dst1'}, 'id': 'YX8t8hBs'}
>    EOF
>    sleep 1 # wait for blockdev-create completion
>    nc -U /tmp/qmp.sock <<EOF
>    {'execute': 'qmp_capabilities'}
>    {'execute': 'job-dismiss', 'arguments': {'id': 'drive_dst1'}, 'id': 'OTZwYb7J'}
>    {'execute': 'blockdev-add', 'arguments': {'node-name': 'drive_dst1', 'driver': 'qcow2', 'file': 'file_dst1', 'read-only': false}, 'id': 'QHyUxtql'}
>    {'execute': 'system_reset', 'id': 'OREutgnz'}
>    {'execute': 'blockdev-backup', 'arguments': {'device': 'drive_src1', 'target': 'drive_dst1', 'job-id': 'drive_src1_qnFF', 'sync': 'full', 'speed': 0, 'compress': false, 'auto-finalize': true, 'auto-dismiss': true, 'on-source-error': 'report', 'on-target-error': 'report'}, 'id': 'WbDARa8c'}
>    EOF
> ---
>   block/block-backend.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/block/block-backend.c b/block/block-backend.c
> index 12ef80ea17..5608c0451b 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -1705,6 +1705,7 @@ void blk_drain(BlockBackend *blk)
>       BlockDriverState *bs = blk_bs(blk);
>   
>       if (bs) {
> +        bdrv_ref(bs);
>           bdrv_drained_begin(bs);
>       }
>   
> @@ -1714,6 +1715,7 @@ void blk_drain(BlockBackend *blk)
>   
>       if (bs) {
>           bdrv_drained_end(bs);
> +        bdrv_unref(bs);
>       }
>   }
>   


