Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2B637FB53
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 18:15:58 +0200 (CEST)
Received: from localhost ([::1]:59038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhE0D-0006QD-Vk
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 12:15:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhDyQ-00051h-CC
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:14:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhDyK-00033m-9E
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:14:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620922438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0tp77q5ysve0KVR1U27ldcaPxtkbPq76Nt1/HX8CJIE=;
 b=e4wEvhmkH8hKzpXPIh2kfA9GksVA9wxX4WFcHs/U3crKEMFw9PLQ8zIHl3SS8FiyFl1ST8
 Qto4X8ERp3p4/8OuAEnp9FdNaEt4uiGZlhcWgcaScPEm1aM0kB6pjey+NzPxhuWcoMd7kH
 TIjAdIeUJj5SfZ3eMeYJtnCwOKEq0jY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110-tHLpxNBQN8yDnxP3QIdm1Q-1; Thu, 13 May 2021 12:13:56 -0400
X-MC-Unique: tHLpxNBQN8yDnxP3QIdm1Q-1
Received: by mail-ej1-f69.google.com with SMTP id
 gt39-20020a1709072da7b02903a8f7736a08so7440343ejc.1
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 09:13:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0tp77q5ysve0KVR1U27ldcaPxtkbPq76Nt1/HX8CJIE=;
 b=g3ovs76Zh3lnO5/NqOIA1MgiuCVRfuSAgUnuwt5ZAjQVLG6Z4e1+tcyKF6l2o0WhO3
 4cDteUoFlkSLhKrezW+90bA7PirV/fXBu504iujsuQ7bBy5klCXiMvzCisXTDQAv/Vlc
 4JGFmGvVxGgSGJwbMQVvmzoQ3jcDGZQEuwbTB9aByCoWEfHkd3HmkmmNx6ZPW1ChQzEl
 tXjn+Tl3mveCyOs0Ac5wIdz8vP/eV52su7jDA4ETaDYa2IA7fxVGvDCLy6tJrZUyou1A
 iY5gC98LM+4otCovUQEYYXsH4LaQtvZLl9i7luS0/Qbk+AKxaDzw0f+4sDgOkFN2Gn3G
 Ilsg==
X-Gm-Message-State: AOAM532ZGPXdvlEsBgCorP7Q9OKYfuQ5AG42O82H/mdHr7G4MJZoi5bs
 RPXb5WeoIP6fVknewtc3nCAMm8arcYwfcsjgGUnprz7/GUVKykKzw0094bXG1Dty2Owq38mIekg
 lA0Cg+0TXENQ1BWY=
X-Received: by 2002:a17:906:924a:: with SMTP id
 c10mr5096000ejx.415.1620922435120; 
 Thu, 13 May 2021 09:13:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmHc5wP7ETs1/lxu6k9RoW9ntCzULeHWcuUNnOp6J9N10U/p7qOTGvE5vKn5eLFKQzIL4/jQ==
X-Received: by 2002:a17:906:924a:: with SMTP id
 c10mr5095969ejx.415.1620922434792; 
 Thu, 13 May 2021 09:13:54 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id hz15sm2044803ejc.57.2021.05.13.09.13.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 09:13:54 -0700 (PDT)
Subject: Re: [PATCH] migration/rdma: Fix cm_event used before being initialized
To: Li Zhijian <lizhijian@cn.fujitsu.com>, quintela@redhat.com,
 dgilbert@redhat.com
References: <20210513113750.22970-1-lizhijian@cn.fujitsu.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <56d58cef-1ef0-b68e-9ae3-673767a89074@redhat.com>
Date: Thu, 13 May 2021 18:13:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210513113750.22970-1-lizhijian@cn.fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: qemu-devel@nongnu.org, Yuval Shaia <yuval.shaia.ml@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/13/21 1:37 PM, Li Zhijian wrote:
> A segmentation fault was triggered when i try to abort a postcopy + rdma
> migration.
> 
> since rdma_ack_cm_event releases a uninitialized cm_event in thise case.
> 
> like below:
> 2496     ret = rdma_get_cm_event(rdma->channel, &cm_event);
> 2497     if (ret) {
> 2498         perror("rdma_get_cm_event after rdma_connect");
> 2499         ERROR(errp, "connecting to destination!");
> 2500         rdma_ack_cm_event(cm_event); <<<< cause segmentation fault
> 2501         goto err_rdma_source_connect;
> 2502     }
> 
> Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
> ---
>  migration/rdma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/migration/rdma.c b/migration/rdma.c
> index 00eac34232..2dadb62aed 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -2466,7 +2466,7 @@ static int qemu_rdma_connect(RDMAContext *rdma, Error **errp)
>                                            .private_data = &cap,
>                                            .private_data_len = sizeof(cap),
>                                          };
> -    struct rdma_cm_event *cm_event;
> +    struct rdma_cm_event *cm_event = NULL;
>      int ret;
>  
>      /*
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


