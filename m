Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1225E5ACDA0
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 10:30:09 +0200 (CEST)
Received: from localhost ([::1]:55246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV7Ue-0000tA-5V
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 04:30:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oV7Q1-0005Qj-IK
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 04:25:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oV7Px-0004Id-PW
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 04:25:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662366317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JXmbi9JaJACD6UBb4CVZJf8gwIwGecI0PVpMJy7LQNw=;
 b=AHpotxMGTxzTutiPP1KYTYDb2t50fV/RgndDrbhr9XfDxwEz8kVT5ix3EcX58KtdD1acvJ
 bgV4pxRswUHlRyOnx+qT2RUbcf8gymNwf/di5nVM0rRz0mMFdWpYklxwtrSU5d4mIeYm4b
 VgkpKIGVUdPm9oLT93mh+3yDph9ELlU=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-172-8kBCq7n1P8OuVLJ2Bzvgcw-1; Mon, 05 Sep 2022 04:25:15 -0400
X-MC-Unique: 8kBCq7n1P8OuVLJ2Bzvgcw-1
Received: by mail-pg1-f199.google.com with SMTP id
 i191-20020a6387c8000000b0042b44ad723bso4124083pge.19
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 01:25:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=JXmbi9JaJACD6UBb4CVZJf8gwIwGecI0PVpMJy7LQNw=;
 b=Ze6Ul4Ezm0QXBmUG3SGDSDa/m/fBWosAx4gjvBVzL8wHcL9b+egwk86dHODBbVdGT5
 httnH/OKVw/e96DH6nY7/DbkN7jqL384LGRk51zM8Xxfv1WNY2d9Pyirbgple5yk1stY
 S0jIXSN6H2a9UNUYo+nL1N812q/UVY3zf6Z1r3zDoTKGOR7nWKqB5wWyPH2ZT7V2n7+U
 EabC7lY8uhmD5LWm4fPK6QcS7bJctK9gSSfyunluDh0CIBoNUdvdlaiTr6EgQ9A5MdFv
 578PIjfl2+kd3UA3AVyDYTUUmZXSE8M7Skxw6keMxIGhDcGuSW+/n6GOHS3cjtD+qlas
 dl1Q==
X-Gm-Message-State: ACgBeo3BS/69PRlC7lGjCy2hS5POFM+6tY84c2WvvCGcze69xZLQkFbT
 JgTADXTju3ykTF17L0qoD4vMCyD5c59Ja9yCbLWWfNZys4wedYeC3DnNh+5op1U8nk1ohOPYomX
 RXYFt+0EeOfkKnoQ=
X-Received: by 2002:a17:90b:2246:b0:1fe:27ce:f0b5 with SMTP id
 hk6-20020a17090b224600b001fe27cef0b5mr18663299pjb.85.1662366314829; 
 Mon, 05 Sep 2022 01:25:14 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5SYskflTOogLw2hhn7VjCjwNrNaqlUoCf0pgmjbJBTDO+pDLPY31Pis63yghiTMkaU+pHokA==
X-Received: by 2002:a17:90b:2246:b0:1fe:27ce:f0b5 with SMTP id
 hk6-20020a17090b224600b001fe27cef0b5mr18663280pjb.85.1662366314550; 
 Mon, 05 Sep 2022 01:25:14 -0700 (PDT)
Received: from [10.72.13.239] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 mn22-20020a17090b189600b001fd7cde9990sm10250340pjb.0.2022.09.05.01.25.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 01:25:13 -0700 (PDT)
Message-ID: <12896ea4-6566-d323-fe5a-ec79bd619526@redhat.com>
Date: Mon, 5 Sep 2022 16:25:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v3 12/15] virtio-net: introduce
 flush_or_purge_queued_packets()
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 f4bug@amsat.org, wangyanan55@huawei.com, hengqi@linux.alibaba.com,
 xuanzhuo@linux.alibaba.com
References: <cover.1661414345.git.kangjie.xu@linux.alibaba.com>
 <c14beaa45cd29f8425d74c53ef11965979dbd6b0.1661414345.git.kangjie.xu@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <c14beaa45cd29f8425d74c53ef11965979dbd6b0.1661414345.git.kangjie.xu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.978, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


在 2022/8/25 16:08, Kangjie Xu 写道:
> Introduce the fucntion flush_or_purge_queued_packets(), it will be
> used in device reset and virtqueue reset. Therefore, we extract the
> common logic as a new function.
>
> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   hw/net/virtio-net.c | 17 +++++++++++------
>   1 file changed, 11 insertions(+), 6 deletions(-)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index dd0d056fde..27b59c0ad6 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -118,6 +118,16 @@ static int vq2q(int queue_index)
>       return queue_index / 2;
>   }
>   
> +static void flush_or_purge_queued_packets(NetClientState *nc)
> +{
> +    if (!nc->peer) {
> +        return;
> +    }
> +
> +    qemu_flush_or_purge_queued_packets(nc->peer, true);
> +    assert(!virtio_net_get_subqueue(nc)->async_tx.elem);
> +}
> +
>   /* TODO
>    * - we could suppress RX interrupt if we were so inclined.
>    */
> @@ -560,12 +570,7 @@ static void virtio_net_reset(VirtIODevice *vdev)
>   
>       /* Flush any async TX */
>       for (i = 0;  i < n->max_queue_pairs; i++) {
> -        NetClientState *nc = qemu_get_subqueue(n->nic, i);
> -
> -        if (nc->peer) {
> -            qemu_flush_or_purge_queued_packets(nc->peer, true);
> -            assert(!virtio_net_get_subqueue(nc)->async_tx.elem);
> -        }
> +        flush_or_purge_queued_packets(qemu_get_subqueue(n->nic, i));
>       }
>   }
>   


