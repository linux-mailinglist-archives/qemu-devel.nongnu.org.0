Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0606D63C5
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 15:48:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjh1T-0005Lq-6T; Tue, 04 Apr 2023 09:48:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pjh1P-0005JQ-39
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 09:48:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pjh1L-00088F-TO
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 09:48:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680616103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Ds5/ajqUGfXKeY9VFw5OelcrOyzu89kZvASH8+GETc=;
 b=Ei+9W/aYT4GhN2QW5Ys88PHjTwwyuebSGzNoTLJ/J7Jx6+zvwD423AJQLrxjD2i5gTUv/4
 K/PjyXfa5vfKAidDqAAM8+YRBeco73+303RF8dvw7vBSlj8pSTIVhs6A3GsHonEuk2NnaX
 Tk2Ft10KacVaiVg1G4aKWNEU9UxcTms=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-NeQl_PWOOcuqqHsDsq2f6w-1; Tue, 04 Apr 2023 09:48:21 -0400
X-MC-Unique: NeQl_PWOOcuqqHsDsq2f6w-1
Received: by mail-ed1-f69.google.com with SMTP id
 b18-20020a50b412000000b0050234a3ad75so41587420edh.23
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 06:48:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680616100; x=1683208100;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3Ds5/ajqUGfXKeY9VFw5OelcrOyzu89kZvASH8+GETc=;
 b=QCptAloYRuXLZYt2Dh5/nvS7A8d04nrbbW8l4bJFOXFAMEJnhpLlGOGxAf37oPY3aY
 1Ad//wsIAT+Il56s/Ok25Wj63w8dxXk0tpK+mbVkoeRRXLbzY6sz37INOXO8MtZ8yq7p
 AlWATi9OJyhKXYt7vxXx3+j4NbKJ2yq4IKAXWtzC9j4wL1fe2uscoUIK2UbtUBvzmdIT
 vE3OwA1NfjkAxC5eluGJJOr5lrK/pkJQWPfCUQDiAd41J6/SaN/Zlj+V0wTHOvd2SYN+
 OXFqMlmh3yK7NDJh6cbNiSiLK7DlD6aeBVYRoH8YG4aB/7vqy4ZrYtV8m+XEyJ+GHlsz
 q5gQ==
X-Gm-Message-State: AAQBX9e8gRg0crZp+rAKjbH+v7OgIAm3EdTTecJ+D+VLbRDZEb5Rnxvn
 RP/tOtZ348baaf4QhxBmRrgL+qkFOBX8yivw4VZlMuhACFytJ3Gk0HECIHfCagNHU+V2H8b7hd7
 HLDioc67WzeXCg7g=
X-Received: by 2002:a50:ee82:0:b0:502:9c52:4482 with SMTP id
 f2-20020a50ee82000000b005029c524482mr2716158edr.6.1680616100746; 
 Tue, 04 Apr 2023 06:48:20 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y5qKtJArzt5vjLnqK938KdCMSHh2DEyWT5rZ9s26+YNR3QfBOYRiRkZGgdvP7vKL6c4CH6cQ==
X-Received: by 2002:a50:ee82:0:b0:502:9c52:4482 with SMTP id
 f2-20020a50ee82000000b005029c524482mr2716141edr.6.1680616100437; 
 Tue, 04 Apr 2023 06:48:20 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 u23-20020a50d517000000b004af720b855fsm5924565edi.82.2023.04.04.06.48.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 06:48:20 -0700 (PDT)
Message-ID: <739d3d6b-8583-8ca5-edd5-36c1c881fc53@redhat.com>
Date: Tue, 4 Apr 2023 15:48:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] block/nvme: use AIO_WAIT_WHILE_UNLOCKED()
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>
References: <20230404112044.427062-1-stefanha@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230404112044.427062-1-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.925, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 4/4/23 13:20, Stefan Hajnoczi wrote:
> A few Admin Queue commands are submitted during nvme_file_open(). They
> are synchronous since device initialization cannot continue until the
> commands complete.
> 
> AIO_WAIT_WHILE() is currently used, but the block/nvme.c code actually
> doesn't rely on the AioContext lock. Replace it with
> AIO_WAIT_WHILE_UNLOCKED(NULL, condition). There is no change in behavior
> and the dependency on the AioContext lock is eliminated.
> 
> This is a step towards removing the AioContext lock.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   block/nvme.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/block/nvme.c b/block/nvme.c
> index 5b744c2bda..829b9c04db 100644
> --- a/block/nvme.c
> +++ b/block/nvme.c
> @@ -512,7 +512,6 @@ static int nvme_admin_cmd_sync(BlockDriverState *bs, NvmeCmd *cmd)
>   {
>       BDRVNVMeState *s = bs->opaque;
>       NVMeQueuePair *q = s->queues[INDEX_ADMIN];
> -    AioContext *aio_context = bdrv_get_aio_context(bs);
>       NVMeRequest *req;
>       int ret = -EINPROGRESS;
>       req = nvme_get_free_req_nowait(q);
> @@ -521,7 +520,7 @@ static int nvme_admin_cmd_sync(BlockDriverState *bs, NvmeCmd *cmd)
>       }
>       nvme_submit_command(q, req, cmd, nvme_admin_cmd_sync_cb, &ret);
>   
> -    AIO_WAIT_WHILE(aio_context, ret == -EINPROGRESS);
> +    AIO_WAIT_WHILE_UNLOCKED(NULL, ret == -EINPROGRESS);
>       return ret;
>   }
> 


Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


