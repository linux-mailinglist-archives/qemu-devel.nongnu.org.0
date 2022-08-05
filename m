Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC2758A92E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 12:04:26 +0200 (CEST)
Received: from localhost ([::1]:43320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJuBt-00031D-Li
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 06:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oJtoy-0007k5-Li
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:40:46 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:44669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oJtox-0001kk-1u
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:40:44 -0400
Received: by mail-ej1-x632.google.com with SMTP id c24so3998298ejd.11
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 02:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tzBOKTbLW9QI6/XLAk3mbUSzBI4NtTj/McufBL58ASA=;
 b=ZOdR1WSmkalqyrmM7BIdJy+Z9qACFo/NGvDJri2lSoELeyZfjyPPGwXChN7q72i/8A
 elNnsTd3ECxVU3ZgISsvBKj/LGxV7eyi9P0LZV120YG1zBuEn7unCLlz7Alc0dfmZ1MC
 r8tJ05vJ5S6IIOHRzKCnkKYjopOjrgUOqo6F9DISJFu5Ky5aVrtFsNh8BuUpeXkPOORS
 13BPrxQ1byiBWZaaVRcZln1p79p/cp/uT7NvbPbcLsu6HkKSPgrMNQtGOkThEuGPsWzQ
 WRlnPoinNVEeDq/DABn3/ob1kRenFqu3rcOJN4URvjjaRjytwDmQEZYmr51xkT94XnX8
 NJ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tzBOKTbLW9QI6/XLAk3mbUSzBI4NtTj/McufBL58ASA=;
 b=sNEYKyesih2MmMWWfHt3B6LAMo+3Yky4YgTNcEhUkY8ZA7mEE3E6FYHmTuVSkvvmeo
 DqzqC0YsoTAMcliGMRvjmBjFDHpWd+AkwPjQYQcrBIKWfcBdyA8Uy3321A5pq3OwsgPl
 OAwrXvmtOeXqu83okmY65IYqbGrRhvQr0qNG1yU+LaZU/j3jZe50f6MqO5pJWsZml1dH
 8oqztJ0jEZE+KTp0X49EXqad0+wQLoKHKgtDjSsORf0zdIP9zKBql3AaHS+KZStx66XP
 i8d3W9nj2DBJr33FeS2A6PiUFBCj8HYRVmNHh1we1UdKBfgYHTbPsMHz9MtDVlEpqGmr
 C0Mg==
X-Gm-Message-State: ACgBeo1Quj6M11orXLyIwV/3O7M6gCdObX1Q2za+J/EVtCy7t0D6Yr+q
 u9223/Z1BerNcwbIeHqvpGc=
X-Google-Smtp-Source: AA6agR6EFAIGg4t3bHAMuI6p759t4KtO6YCz48lXJgy2eZv2oboRyjbe/iwaOYp4eGRPLxxKPLUXbQ==
X-Received: by 2002:a17:907:2da6:b0:730:8b30:e517 with SMTP id
 gt38-20020a1709072da600b007308b30e517mr4777067ejc.291.1659692441390; 
 Fri, 05 Aug 2022 02:40:41 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 s21-20020a1709066c9500b0071cbc7487e1sm1395927ejr.69.2022.08.05.02.40.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Aug 2022 02:40:40 -0700 (PDT)
Message-ID: <17d794db-4c17-b438-b71b-f6224791a496@redhat.com>
Date: Fri, 5 Aug 2022 11:40:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] virtio-scsi: fix race in virtio_scsi_dataplane_start()
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: sgarzare@redhat.com, kwolf@redhat.com,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fam Zheng <fam@euphon.net>,
 Qing Wang <qinwang@redhat.com>
References: <20220803162824.948023-1-stefanha@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220803162824.948023-1-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 8/3/22 18:28, Stefan Hajnoczi wrote:
> diff --git a/hw/scsi/virtio-scsi-dataplane.c b/hw/scsi/virtio-scsi-dataplane.c
> index 8bb6e6acfc..a575c3f0cd 100644
> --- a/hw/scsi/virtio-scsi-dataplane.c
> +++ b/hw/scsi/virtio-scsi-dataplane.c
> @@ -66,6 +66,21 @@ static int virtio_scsi_set_host_notifier(VirtIOSCSI *s, VirtQueue *vq, int n)
>       return 0;
>   }
>   
> +/* Context: BH in IOThread */
> +static void virtio_scsi_dataplane_start_bh(void *opaque)
> +{
> +    VirtIOSCSI *s = opaque;
> +    VirtIOSCSICommon *vs = VIRTIO_SCSI_COMMON(s);
> +    int i;
> +
> +    virtio_queue_aio_attach_host_notifier(vs->ctrl_vq, s->ctx);
> +    virtio_queue_aio_attach_host_notifier_no_poll(vs->event_vq, s->ctx);
> +
> +    for (i = 0; i < vs->conf.num_queues; i++) {
> +        virtio_queue_aio_attach_host_notifier(vs->cmd_vqs[i], s->ctx);
> +    }
> +}
> +
>   /* Context: BH in IOThread */
>   static void virtio_scsi_dataplane_stop_bh(void *opaque)
>   {
> @@ -136,16 +151,18 @@ int virtio_scsi_dataplane_start(VirtIODevice *vdev)
>   
>       memory_region_transaction_commit();
>   
> -    aio_context_acquire(s->ctx);
> -    virtio_queue_aio_attach_host_notifier(vs->ctrl_vq, s->ctx);
> -    virtio_queue_aio_attach_host_notifier_no_poll(vs->event_vq, s->ctx);
> -
> -    for (i = 0; i < vs->conf.num_queues; i++) {
> -        virtio_queue_aio_attach_host_notifier(vs->cmd_vqs[i], s->ctx);
> -    }
> -
>       s->dataplane_starting = false;
>       s->dataplane_started = true;
> +
> +    /*
> +     * Attach notifiers from within the IOThread. It's possible to attach
> +     * notifiers from our thread directly but this approach has the advantages
> +     * that virtio_scsi_dataplane_start_bh() is symmetric with
> +     * virtio_scsi_dataplane_stop_bh() and the s->dataplane_started assignment
> +     * above doesn't require explicit synchronization.
> +     */
> +    aio_context_acquire(s->ctx);
> +    aio_wait_bh_oneshot(s->ctx, virtio_scsi_dataplane_start_bh, s);
>       aio_context_release(s->ctx);

Taking the AioContext lock for code that is running in another thread 
seems wrong.  But really there is no need to take the lock: I think it 
wanted to protect against the handler running before 
s->dataplane_starting/started were set, but it's not needed now because 
the iothread is busy running the bottom half.

Also, please do the same in virtio-blk as well.

Thanks,

Paolo

