Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D20F625B26
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 14:27:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otT0k-0000Tc-6l; Fri, 11 Nov 2022 07:19:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1otT0h-0000Sk-FW
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 07:19:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1otT0c-0000LO-ST
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 07:19:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668169185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fNhtIm9bqnZ0v+gE1Xn6kqPRlWou0p7Pl/D4KvXBlkU=;
 b=B6HbfLoUuArolTNf15YGf76QwhwFsc/P++Q4ygTwW/PJCLz1FDyc6LOUkPKyV3khuRPWTt
 0n91ARxH0kovTRLNa1ISjg8iRkOkSZwWLNWqkKROkGJpKHlBogbWw0s7j2kAo9lt0Oydvp
 1bpsjp6orS0sg21tTkHNHW2KGY7cBWY=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-145-sx0PUUHwP9aRr3JjQuYwqg-1; Fri, 11 Nov 2022 07:19:44 -0500
X-MC-Unique: sx0PUUHwP9aRr3JjQuYwqg-1
Received: by mail-qt1-f198.google.com with SMTP id
 w27-20020a05622a191b00b003a56c0e1cd0so3491977qtc.4
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 04:19:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fNhtIm9bqnZ0v+gE1Xn6kqPRlWou0p7Pl/D4KvXBlkU=;
 b=Lobqt8lnE26MaiMIWkijc3PS1vBo/sRtrvlqtETEhH75Ex49wNBtTaAu6eM2aHkAlE
 BkeAk9KFiJzlUG1F8nO2yrgG4ajtAwjXWGGwCvSJg+LveLfYf5CJl+CHDsf//rsH/+DB
 piaA4skmOqP9Uk/W+MzuU7jsaRwKGxyaEY2uhna197bvyRH/GfGW2vPVL0DPp9q+Hh2e
 0gRYa4jM4QbLmHVPfCjeaypyR9yr545s8XfuPpCehlw/2Ov90hf/gFc/tRApAaNXxdxW
 OIjRjFExxmkrlrbkvuZqLyii05mjDTwjE4dOd/J9P4FwbuWJOUg+4thIstw8vpcGTQA9
 67dg==
X-Gm-Message-State: ANoB5pkOPMPRsr/ac/6PUsF6hxHp/9PAt58UY7tvz44UTmjR/Wpe0XnC
 m/nZaNys68ahMTPH0roMHb8Se1Hor166NLsGXQMgJzJrvwI7kzOE3aEVbiVP9Lvttp9Y9vAtRCN
 fyFHp8EFBAAsvb60=
X-Received: by 2002:a05:622a:54e:b0:3a5:7cf8:1a6e with SMTP id
 m14-20020a05622a054e00b003a57cf81a6emr974113qtx.48.1668169183838; 
 Fri, 11 Nov 2022 04:19:43 -0800 (PST)
X-Google-Smtp-Source: AA0mqf50HAdyM4CHMoiVvAcA6fpjfiRrjwldiRuoAaK0YVdQA6ocinQxZGSVEYLFmCuu2CiXff2FRQ==
X-Received: by 2002:a05:622a:54e:b0:3a5:7cf8:1a6e with SMTP id
 m14-20020a05622a054e00b003a57cf81a6emr974100qtx.48.1668169183639; 
 Fri, 11 Nov 2022 04:19:43 -0800 (PST)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 q6-20020a05622a04c600b003992448029esm1192405qtx.19.2022.11.11.04.19.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 04:19:43 -0800 (PST)
Message-ID: <d42190d6-ded9-2499-78f4-beb55acec167@redhat.com>
Date: Fri, 11 Nov 2022 13:19:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 3/8] virtio: categorize callbacks in GS
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>
References: <20221108211930.876142-1-stefanha@redhat.com>
 <20221108211930.876142-4-stefanha@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <20221108211930.876142-4-stefanha@redhat.com>
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
> All the callbacks below are always running in the main loop.
>
> The callbacks are the following:
> - start/stop_ioeventfd: these are the callbacks where
>   blk_set_aio_context(iothread) is done, so they are called in the main
>   loop.
>
> - save and load: called during migration, when VM is stopped from the
>   main loop.
>
> - reset: before calling this callback, stop_ioeventfd is invoked, so
>   it can only run in the main loop.
>
> - set_status: going through all the callers we can see it is called
>   from a MemoryRegionOps callback, which always run in a vcpu thread and
>   hold the BQL.
>
> - realize: iothread is not even created yet.
>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> Message-Id: <20220609143727.1151816-5-eesposit@redhat.com>
>


Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>


