Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE6A625B08
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 14:14:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otSyu-000748-3p; Fri, 11 Nov 2022 07:18:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1otSyp-0006zS-Fv
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 07:17:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1otSyh-0008Sm-Kv
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 07:17:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668169066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z26EXTIIOGhSt9l97S+QVjBK6ldXpU5F3uIh93mrA+o=;
 b=gZnYNHCqvm6Z4qNzNBq9cQlH8Ayt0iVRJefZodz8b+L27Lus/FzSC/5nRi1Uz3SxAg9rxn
 LWDoDutfZ1T4yIrbvbvlDJIopRrxUcCWKSrnJz4P3N5EOHN/DstJMNrwiSdP7Z0aSbX6Hw
 x4gETnrqQhkkUGMWJNY7z0W0NaJiKiw=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-561-WiGh7D-3MJaZmqYoWJHeew-1; Fri, 11 Nov 2022 07:17:45 -0500
X-MC-Unique: WiGh7D-3MJaZmqYoWJHeew-1
Received: by mail-qv1-f72.google.com with SMTP id
 l6-20020ad44446000000b004bb60364075so3564418qvt.13
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 04:17:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z26EXTIIOGhSt9l97S+QVjBK6ldXpU5F3uIh93mrA+o=;
 b=hU3k4Iuv04B8pHEq4KuXPsCUnX26ualCiHZtMnm0RQDxtuJNByYLpBuwgB/IcXekaJ
 xwzGbmrsls91XMYNAvtW/WlWZJFv8N1bH/t7qRt6H+1Ug7ty/wRXVhXwgTZUiPfpuegD
 QTYC84tya+nq57+M7Gl5e9Gfyt9HJUJuPzX2VCka3q2IfhVlAv+clZ0W4tcIo699qZld
 VnERPJe8lx0/K+b3CkaX+3DH8nlUH4/tgB0KO7NDmQ5z2kyWO47OL/LDO/nZj4u8BbkD
 0GLE+VXRAzn4sGxOpp/BSo6sV/ruviguSZsALeFbtzZnf54q12ZOjGcZe0T/ajX8DhSz
 NPvA==
X-Gm-Message-State: ANoB5pmoKy51okgQhfjAaXJlcJFxse0mo33tNVAMO/a+JTE3Prfa8rO5
 40z5iqHvdDcX+/AHQ8Mru3k3Dbl/s2ugrLZ1+8XNdYwVvm3hnq04do1qgfC92zXimZT2OqjQ7vq
 iPPrSNcQwNqPAmTk=
X-Received: by 2002:a05:622a:481b:b0:3a5:1c8e:7c58 with SMTP id
 fb27-20020a05622a481b00b003a51c8e7c58mr924100qtb.371.1668169065165; 
 Fri, 11 Nov 2022 04:17:45 -0800 (PST)
X-Google-Smtp-Source: AA0mqf76M2RuiKoxuLxRrZ2XtEEqBBfkFMX9v18J8/v8hXjvBylq445E5temw/+LM7eCznAIOG7XEg==
X-Received: by 2002:a05:622a:481b:b0:3a5:1c8e:7c58 with SMTP id
 fb27-20020a05622a481b00b003a51c8e7c58mr924088qtb.371.1668169064980; 
 Fri, 11 Nov 2022 04:17:44 -0800 (PST)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 az17-20020a05620a171100b006f3e6933bacsm1264201qkb.113.2022.11.11.04.17.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 04:17:44 -0800 (PST)
Message-ID: <095751c2-1536-0594-f9d2-d8f239141a8e@redhat.com>
Date: Fri, 11 Nov 2022 13:17:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/8] virtio_queue_aio_attach_host_notifier: remove
 AioContext lock
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>
References: <20221108211930.876142-1-stefanha@redhat.com>
 <20221108211930.876142-2-stefanha@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <20221108211930.876142-2-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



Am 08/11/2022 um 22:19 schrieb Stefan Hajnoczi:
> From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>
> virtio_queue_aio_attach_host_notifier() and
> virtio_queue_aio_attach_host_notifier_nopoll() run always in the
> main loop, so there is no need to protect them with AioContext
> lock.
>
> On the other side, virtio_queue_aio_detach_host_notifier() runs
> in a bh in the iothread context, but it is always scheduled
> (thus serialized) by the main loop. Therefore removing the
> AioContext lock is safe.
>
> In order to remove the AioContext lock it is necessary to switch
> aio_wait_bh_oneshot() to AIO_WAIT_WHILE_UNLOCKED(). virtio-blk and
> virtio-scsi are the only users of aio_wait_bh_oneshot() so it is
> possible to make this change.
>
> For now bdrv_set_aio_context() still needs the AioContext lock.
>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> Message-Id: <20220609143727.1151816-2-eesposit@redhat.com>
>


Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>


