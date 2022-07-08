Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CBF56B522
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 11:10:35 +0200 (CEST)
Received: from localhost ([::1]:44792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9k0P-0002C4-Ve
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 05:10:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o9jxL-0007gt-08
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 05:07:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o9jxH-0000CI-HG
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 05:07:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657271238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KUpPE7gHdzroa9HgWhgdWUJmPTvh6ceayUp6RPfp4qA=;
 b=UyoSvJpLQCySlqkmZJ8zWqFuG2vwgh69gTcMpM+N2DGFRvbXrrSA6rLZP7l/dLtaGPBljj
 2tShxuMRFiQcDAbOsh8SphYa0fYh9MzPRFo/vahHTtFRlMnGJD8lqEG5wAtZP3WVH6t2Xd
 C9c+dik9uYQ8A+tM+z09opz4ZcrfttA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-502-3iNVViU3O-GIrsk9wooAEQ-1; Fri, 08 Jul 2022 05:07:09 -0400
X-MC-Unique: 3iNVViU3O-GIrsk9wooAEQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 h12-20020a05600c28cc00b003a2d3e91d7eso744039wmd.9
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 02:07:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KUpPE7gHdzroa9HgWhgdWUJmPTvh6ceayUp6RPfp4qA=;
 b=l1ybzsvCTpCoHveUtRQxaM+Zbcnoe4US8jsjzkDZ187j0BUzOTyTUvlpjcQqN/XrNQ
 Wu9RVVjNEl8ry0cWGh+mvnpMzfL5TbDu4YIiK/xLKroGPFk6QH1j7NoWGoqJ6m/yh3i5
 cd+Ky//F1DjKLRRZegBCgjy/hlLnmaLcOThroUNvXIAMxpTphyAssSvHb0I//Sco6T5o
 UPWQNGmXdoBXWl0tgE8m0mcEdEUJXDFkGQO39bI2DnkZs/hnq786Yv508D6Zhiud1mQV
 jAai8yrw7+jFElXH59KPTgFykdXeU2H5mOFBuQyEQP4q7nsaXSYcasktRGkHFm2yyxDf
 VFEQ==
X-Gm-Message-State: AJIora/NSCy/Q4Qyo2Q0YVg1jfcosgYWduGF2dx18nnf5U1KS6LeTNG+
 6Urd1eviENfuEgJCguvCX4MZlM7lpauQJnVKNwZcN+YjluZ5Q5X48XvSLbY6wFsMtUbwhWyIRcB
 A+4X90twaOcDkQaE=
X-Received: by 2002:a05:6000:2c9:b0:21b:c8d7:dc8d with SMTP id
 o9-20020a05600002c900b0021bc8d7dc8dmr2308303wry.408.1657271228343; 
 Fri, 08 Jul 2022 02:07:08 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tOT/8p2ReNkdGwF+YyCODisJLYIn7wzFoCeKCMa19eFoUubx63cM9gkqUrW59o7RUwRNK/KQ==
X-Received: by 2002:a05:6000:2c9:b0:21b:c8d7:dc8d with SMTP id
 o9-20020a05600002c900b0021bc8d7dc8dmr2308270wry.408.1657271228102; 
 Fri, 08 Jul 2022 02:07:08 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 m12-20020adfe0cc000000b0021d4155cd6fsm22036774wri.53.2022.07.08.02.07.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jul 2022 02:07:07 -0700 (PDT)
Message-ID: <fef736a3-e5b9-762b-2605-5f04170fbf54@redhat.com>
Date: Fri, 8 Jul 2022 11:07:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 3/8] virtio_blk_process_queued_requests: always run in a bh
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
References: <20220609143727.1151816-1-eesposit@redhat.com>
 <20220609143727.1151816-4-eesposit@redhat.com>
 <YsRJeay6omYXu3Cd@stefanha-x1.localdomain>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <YsRJeay6omYXu3Cd@stefanha-x1.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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



Am 05/07/2022 um 16:23 schrieb Stefan Hajnoczi:
> On Thu, Jun 09, 2022 at 10:37:22AM -0400, Emanuele Giuseppe Esposito wrote:
>> diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
>> index f9224f23d2..03e10a36a4 100644
>> --- a/hw/block/dataplane/virtio-blk.c
>> +++ b/hw/block/dataplane/virtio-blk.c
>> @@ -234,8 +234,16 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
>>          goto fail_aio_context;
>>      }
>>  
>> +    blk_inc_in_flight(s->conf->conf.blk);
> 
> Missing comment explaining why the in-flight counter is incremented and
> where the matching decrement operation is located.
> 
> I think you can get away without a comment if blk_inc_in_flight() is
> right next to aio_bh_new(), but in this case there are a few lines of
> code in between and it becomes unclear if there is a connection.

I will simply add:

    /*
     * virtio_blk_restart_bh() code will take care of decrementing
     * in_flight counter.
     */

should make sense.

> 
>> +    /*
>> +     * vblk->bh is only set in virtio_blk_dma_restart_cb, which
>> +     * is called only on vcpu start or stop.
>> +     * Therefore it must be null.
>> +     */
>> +    assert(vblk->bh == NULL);
>>      /* Process queued requests before the ones in vring */
> 
> This comment makes an assumption about the order of file descriptor
> handlers vs BHs in the event loop. I suggest removing the comment. There
> is no reason for processing queued requests first anyway since
> virtio-blk devices can complete requests in any order.
> 

Ok, I guess you mean in a separate patch.

Thank you,
Emanuele


