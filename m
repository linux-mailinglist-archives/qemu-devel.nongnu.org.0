Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D65AC3DDBC3
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 17:02:43 +0200 (CEST)
Received: from localhost ([::1]:46154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAZSk-000672-2C
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 11:02:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mAZRY-0005Kb-GZ
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 11:01:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mAZRT-0002mH-Qw
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 11:01:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627916482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vIi/HUZWwvgBwY1fsTy0AIUFtMGIMhGU0g1czXQaR5E=;
 b=aIOGJ6PON28afRGqvEF/POJFsbXRkitE7QU20HfbIecOO1CiXrpwXhkeh0Y2QGKaGeNtOf
 uizWQaJQEysXeTPzWWZ2ITiPtjp/4nJ5G4GOSGzM9g6Pq4p9FA02BS/Rjki5hYydhUh7nG
 9gi+WqQ6DdwPEK2rG+rp9hkepLd76bo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-nAbmxZqSMKKLxlGrJH1Weg-1; Mon, 02 Aug 2021 11:01:18 -0400
X-MC-Unique: nAbmxZqSMKKLxlGrJH1Weg-1
Received: by mail-wr1-f70.google.com with SMTP id
 d7-20020adffd870000b02901544ea2018fso3467128wrr.10
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 08:01:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vIi/HUZWwvgBwY1fsTy0AIUFtMGIMhGU0g1czXQaR5E=;
 b=iEbYNXyM87ONf94DnSnwNddJlpGSNIacGEaQdi8tO6D486DuguItzJbk1lMZZv+ZC+
 WZiRpbG1rz7Kqq/ShJLytNapYAncbuAVdPlgJjVNka90RVVPKJrRhZn+x04urd3lsnrV
 DbTZOrPLOOTk74AEoaxENAUlOhLa7ZnxAfx/SN/TWXrpVYurzWGdtprbDo7QnDvDRZ5u
 XIcF0qETPpA5w+2pJ3wcxvUijd1yj+RZ9MK+bNrlPEBH/saMHqDf3Gqj4JT6+33rkyYc
 MTqJF2PV0KZGn5NccKUI+zWtROvgCtDemUa3n9vAlYRa5N0iAV0ohmzekgBcglBgIt/S
 8Eaw==
X-Gm-Message-State: AOAM530QtcXaS4Nn5ypii6ABLmejL05xNrjuJGHQaKPoyF2aeOo0L/5C
 i4G5PqpX5iHKcr8bruabBIIRBgKzbW+d9NqrmpzR+uSSedRaHpIwj2TcsrfzlpxY3eGZ9HDulr1
 v6THprJw/QyQfpCT5b3rrettYwJkvqPYOxOVA7BYCsCa6srxWUWvX2TgBkJIYBr3KPA==
X-Received: by 2002:adf:b30a:: with SMTP id j10mr17485508wrd.43.1627916476885; 
 Mon, 02 Aug 2021 08:01:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxD4AtG09l0udZ0QHCVLKM850zx0lMktPCQ66klJg5z/t36GgEVmhlHYg0uWV00xxpf/l5Ozw==
X-Received: by 2002:adf:b30a:: with SMTP id j10mr17485482wrd.43.1627916476610; 
 Mon, 02 Aug 2021 08:01:16 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.21.182])
 by smtp.gmail.com with ESMTPSA id n8sm11413532wrx.46.2021.08.02.08.01.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 08:01:16 -0700 (PDT)
Subject: Re: [PATCH] hw/char/virtio-serial-bus: fix: Unpop throttled
 VirtQueueElement to queue before discard vq data
To: =?UTF-8?B?QUlFUlBBVElKSUFORzEgW+iJvuWwlOW4leaPkOaxn8K36Zi/5biD6YO96LWb?=
 =?UTF-8?B?5Lmw5o+QXQ==?= <AIERPATIJIANG1@kingsoft.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>
References: <2904D378-AA27-4510-A3C8-7E2E34DF37EF@kingsoft.com>
 <330EE4BB-DE8D-4D4A-9E6E-08E50BDA5E45@kingsoft.com>
 <918AA6D7-F6C6-4A0E-8E65-6C7ECF148304@kingsoft.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <abe0d719-20e2-ebf3-c61a-c1778a461d5c@redhat.com>
Date: Mon, 2 Aug 2021 17:01:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <918AA6D7-F6C6-4A0E-8E65-6C7ECF148304@kingsoft.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "amit@kernel.org" <amit@kernel.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/07/2021 03:58, AIERPATIJIANG1 [艾尔帕提江·阿布都赛买提] wrote:
> Ports enter a "throttled" state when writing to the chardev would block.
> The current output VirtQueueElement is kept around until the chardev
> becomes writable again.
> 
> Because closing the virtio serial device does not reset the queue, we cannot
> directly discard this element,  otherwise the control variables of the front
> and back ends of the queue are inconsistent such as used_index. We should unpop the
> VirtQueueElement to queue, let discard_vq_data process it.
> 
> The test environment:
> kernel: linux-5.12
> Qemu command:
> Qemu-system-x86 -machine pc,accel=kvm \
>     -cpu host,host-phys-bits \
>     -smp 4 \
>     -m 4G \
>     -kernel ./kernel \
>     -display none \
>     -nodefaults \
>     -serial mon:stdio \
>     -append "panic=1 no_timer_check noreplace-smp rootflags=data=ordered rootfstype=ext4 console=ttyS0 reboot=k root=/dev/vda1 rw" \
>     -drive id=os,file=./disk,if=none \
>     -device virtio-blk-pci,drive=os \
>     -device virtio-serial-pci,id=virtio-serial0,bus=pci.0,addr=0x4 \
>     -chardev socket,id=charchannel0,path=/tmp/char-dev-test,server,nowait \
>   -device virtserialport,bus=virtio-serial0.0,nr=1,chardev=charchannel0,id=channel0,name=org.qemu.guest_agent.0
> 
> full up virtio queue after VM started:
> Cat /large-file > /dev/vport1p1
> 
> Host side:
> Open and close character device sockets repeatedly
> 
> After awhile we can’t write any request to /dev/vport1p1 at VM side, VM kernel soft lockup at drivers/char/virtio_console.c: __send_to_port
> 
> 
> Signed-off-by: Arafatms <aierpatijiang1@kingsoft.com>
> 
> diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
> index dd6bc27b3b..36236defdf 100644
> --- a/hw/char/virtio-serial-bus.c
> +++ b/hw/char/virtio-serial-bus.c
> @@ -150,8 +150,12 @@ static void discard_vq_data(VirtQueue *vq, VirtIODevice *vdev)
> 
> static void discard_throttle_data(VirtIOSerialPort *port)
> {
> +    if (!virtio_queue_ready(port->ovq)) {
> +        return;
> +    }

Why do we need to check virtio_queue_ready() now?

> +
>      if (port->elem) {
> -        virtqueue_detach_element(port->ovq, port->elem, 0);
> +        virtqueue_unpop(port->ovq, port->elem, 0);
>          g_free(port->elem);
>          port->elem = NULL;
>      }
> 

It seems the problem you report can only happen when the port is closed from the host side
(because from the guest side I guess the cleanup is done by the guest driver).

Stefan, you have introduced the function discard_throttle_data() in:

  d4c19cdeeb2f ("virtio-serial: add missing virtio_detach_element() call")

do you remember why you prefered to use virtqueue_detach_element() rather than
virtqueue_unpop() (or virtqueue_discard() at this time, see 27e57efe32f5 ("virtio: rename
virtqueue_discard to virtqueue_unpop"))

Thanks,
Laurent


