Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D185F3D20C0
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 11:20:47 +0200 (CEST)
Received: from localhost ([::1]:57496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Uso-0006kr-TM
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 05:20:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m6UrH-0005gu-Pr
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 05:19:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m6UrG-0001MI-9i
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 05:19:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626945549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QIODGrfY9pFZctTIP/gk9jrCqWADRLf/acidTr5aaxo=;
 b=TZ/cGgPx9X55UnqN/6VTM9EIz33kTa8YO3i0ji3j5wZ99gsC2yo73CxOHMb3GAEx4d3J6o
 tX+IaFr+17O1sSHEDW67I7pOVormAVDb3LwJ1jncd06cXYDlPXBr5kNtH8OeyC2fBAh0k6
 uj08N1Xynl7LhduUBoMP59ST4uKz5Ow=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-3g1MayrtNy6N17LwmiCa1g-1; Thu, 22 Jul 2021 05:19:08 -0400
X-MC-Unique: 3g1MayrtNy6N17LwmiCa1g-1
Received: by mail-pl1-f199.google.com with SMTP id
 o8-20020a1709026b08b029012b8dd981a0so2425073plk.5
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 02:19:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=QIODGrfY9pFZctTIP/gk9jrCqWADRLf/acidTr5aaxo=;
 b=r6WYqXbdHFDzrsWCOZzx3jsemuskET/En4To+lP212AMzgQtdKdSfpMwPHQuERj9xO
 nKhI+NNkSbbg4IU7KyzaGi9QbFsEsQqsZx5A5Za7Lf4lWS5Z4cwj8T7bsDkH7hYdZfj6
 P8DMeCH1shqRgsg8rbjFoVX4rxF80ykcsTEfbLNPYZtT4BOuFsdPwRdb+Gwv8WWMnZ9N
 JJjxOy+5SHCcNkqQTCz+1I9IylQTI5GOvsWjCanRdWegi8RQIio0fPlrqZDsckjGT2/v
 Cp47W4RzMEfBrTxFRHcybO93wuHXVro6/eSZYExWyR46hFZ1/tXLdAE/6IJQjMoawV9e
 7AZQ==
X-Gm-Message-State: AOAM530dF8/48Dh+6aPzto0MiGvlY7IIpPYuRcgE2Oty5KNeRfwBXhZC
 yQgoxlOEjVwGX/5FDvXUyiB4VZuKxswhiDDLxQHJLV0qS2JE4FYAE/S85qiCKyUnl4bcKYzkWik
 YK6wyRUIeZr08Cjo=
X-Received: by 2002:a17:90a:d3d2:: with SMTP id
 d18mr8131140pjw.102.1626945547247; 
 Thu, 22 Jul 2021 02:19:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTfLPq6Q2t2qYTdPedDhTEY49wpUkuuVa5LILVecpz47CSmDe+dRXqhQ6NOwiWRZFp49hb8A==
X-Received: by 2002:a17:90a:d3d2:: with SMTP id
 d18mr8131121pjw.102.1626945547092; 
 Thu, 22 Jul 2021 02:19:07 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id a13sm31036724pfl.92.2021.07.22.02.19.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 02:19:06 -0700 (PDT)
Subject: Re: [PATCH v6 6/6] hmp: add virtio commands
To: Jonah Palmer <jonah.palmer@oracle.com>, qemu-devel@nongnu.org
References: <1626086137-16292-1-git-send-email-jonah.palmer@oracle.com>
 <1626086137-16292-7-git-send-email-jonah.palmer@oracle.com>
 <a92fd4c4-73cc-3b6b-89fa-b5ae35304a2d@redhat.com>
 <5fb48b8e-4380-45b5-2057-97d0e72dcf54@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <d0ef30f7-518a-1e16-489c-c85889a3b9e2@redhat.com>
Date: Thu, 22 Jul 2021 17:18:58 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <5fb48b8e-4380-45b5-2057-97d0e72dcf54@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.117, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, thuth@redhat.com, qemu-block@nongnu.org,
 mst@redhat.com, michael.roth@amd.com, david@redhat.com, armbru@redhat.com,
 amit@kernel.org, dgilbert@redhat.com, eric.auger@redhat.com,
 dmitrii.stepanov@cloud.ionos.com, kraxel@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com, si-wei.liu@oracle.com, marcandre.lureau@redhat.com,
 joao.m.martins@oracle.com, mreitz@redhat.com,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/7/21 下午5:11, Jonah Palmer 写道:
>
>
> On 7/13/21 10:40 PM, Jason Wang wrote:
>>
>> 在 2021/7/12 下午6:35, Jonah Palmer 写道:
>>> +void hmp_virtio_queue_status(Monitor *mon, const QDict *qdict)
>>> +{
>>> +    Error *err = NULL;
>>> +    const char *path = qdict_get_try_str(qdict, "path");
>>> +    int queue = qdict_get_int(qdict, "queue");
>>> +    VirtQueueStatus *s = qmp_x_debug_virtio_queue_status(path, 
>>> queue, &err);
>>> +
>>> +    if (err != NULL) {
>>> +        hmp_handle_error(mon, err);
>>> +        return;
>>> +    }
>>> +
>>> +    monitor_printf(mon, "%s:\n", path);
>>> +    monitor_printf(mon, "  device_type:          %s\n",
>>> +                   VirtioType_str(s->device_type));
>>> +    monitor_printf(mon, "  index:                %d\n", 
>>> s->queue_index);
>>> +    monitor_printf(mon, "  inuse:                %d\n", s->inuse);
>>> +    monitor_printf(mon, "  last_avail_idx:       %d (%"PRId64" %% 
>>> %"PRId64")\n",
>>> +                   s->last_avail_idx, s->last_avail_idx % 
>>> s->vring_num,
>>> +                   s->vring_num);
>>> +    monitor_printf(mon, "  shadow_avail_idx:     %d (%"PRId64" %% 
>>> %"PRId64")\n",
>>> +                   s->shadow_avail_idx, s->shadow_avail_idx % 
>>> s->vring_num,
>>> +                   s->vring_num);
>>> +    monitor_printf(mon, "  used_idx:             %d (%"PRId64" %% 
>>> %"PRId64")\n",
>>> +                   s->used_idx, s->used_idx % s->vring_num, 
>>> s->vring_num);
>>
>>
>> The modular information is not the case of packed ring where the 
>> queue size does not have to be a power of 2.
> Doesn't modulo work for any integer, regardless if it's a power of 2 or not? Could you clarify this for me?


For packed ring, the index doesn't increase freely, it's always small 
than the virtqueue size.

So showing the modulo arithmetic seems useless since the device or 
driver doesn't use modulo for calculating the real offset.

Thanks


>
> Thank you,


