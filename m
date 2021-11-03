Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 092EB443F96
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 10:48:30 +0100 (CET)
Received: from localhost ([::1]:58348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miCsf-0003oT-1B
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 05:48:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1miCqz-000381-Vk
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 05:46:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1miCqx-0003Qq-CO
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 05:46:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635932801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ss5TQ3YdBPmdS8VX/Z6Up93GSvud2C45dQDNh5DQEhc=;
 b=LZM0K8EzQbLZ2F+gn8AlJ1knp3asSQkDMPlhI8tLJkNRIEv6mPODat6uHl7Cu83dV5Hl9h
 Vc0OvZ3JxKDvBbIsscDrJQIQyYqoFIt2Ur/FI6dAEIWb7X2lXE8vsqJADb5iFL8qlGmT/j
 tpIbF7VbaKJkOM8+Efg1wf3jUei2OTk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-cvh3i3YWNeCP3w6W8Dnomg-1; Wed, 03 Nov 2021 05:46:40 -0400
X-MC-Unique: cvh3i3YWNeCP3w6W8Dnomg-1
Received: by mail-wr1-f72.google.com with SMTP id
 q5-20020a5d5745000000b00178abb72486so312010wrw.9
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 02:46:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ss5TQ3YdBPmdS8VX/Z6Up93GSvud2C45dQDNh5DQEhc=;
 b=LMQzP1ZS8qlgv+X7ZC8QczgLlGGOTT1fVnT9z4h+jwWAuo1pvUeZfxEgnN7gIvUoLM
 QS5uNdj0/J61KJetTEUeqGC5dz6/nn9nn+xCf3hQ/Yq5TqmPN3FEKFxS4xVfMSNpiAbp
 HMXsog0k5NwtkOXT/ZhrfCA6l3uZTHGaQstquz86So1jtzGsxpkhH4bNCg1h8WVTwnye
 2+k1krFk4w7c2iXeX0xOv4YWFr12XLDm2OLJ0g2hDLqqVPOPdC5EIHHiCZRnYJce5U8N
 VccJ+mjHogBaUsYvJdbmRuus14zSRjvkI4ywSWJrkMCLUUtWPB/BnfwRR4gjJm+5Llqt
 droA==
X-Gm-Message-State: AOAM530cInTzKH9iVXB9XAEd9o91MH2mEnVug6g14w1G0MNPzgogXUz+
 +7BqcNwn4LBEYKE+BgKZ3Daf5e2J/cLzVQ+le64hiLjexEbFspk4LWxYGbsPD3+Kml/EEx6cpZD
 5u2bjUFP6yTZ1jSM=
X-Received: by 2002:adf:f6cf:: with SMTP id y15mr7734771wrp.56.1635932799153; 
 Wed, 03 Nov 2021 02:46:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRB+h3kKBXDTVKPZZDttj595eNfGErLw8sjyrdDTiYxNTtAJCccTOn1pBpQLBm4+hN1p8TrA==
X-Received: by 2002:adf:f6cf:: with SMTP id y15mr7734743wrp.56.1635932798920; 
 Wed, 03 Nov 2021 02:46:38 -0700 (PDT)
Received: from [192.168.43.238] (203.red-95-127-187.staticip.rima-tde.net.
 [95.127.187.203])
 by smtp.gmail.com with ESMTPSA id f19sm1209519wmq.34.2021.11.03.02.46.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Nov 2021 02:46:38 -0700 (PDT)
Message-ID: <a3004034-0221-bb40-3b22-2c57824cac83@redhat.com>
Date: Wed, 3 Nov 2021 10:46:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] softmmu/qdev-monitor: fix use-after-free in qdev_set_id()
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
References: <20211102163342.31162-1-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211102163342.31162-1-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.549, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Markus

On 11/2/21 17:33, Stefan Hajnoczi wrote:
> Reported by Coverity (CID 1465222).
> 
> Fixes: 4a1d937796de0fecd8b22d7dbebf87f38e8282fd ("softmmu/qdev-monitor: add error handling in qdev_set_id")
> Cc: Damien Hedde <damien.hedde@greensocs.com>
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  softmmu/qdev-monitor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index 4851de51a5..06f86a1a96 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -581,8 +581,8 @@ const char *qdev_set_id(DeviceState *dev, char *id, Error **errp)
>          if (prop) {
>              dev->id = id;
>          } else {
> -            g_free(id);
>              error_setg(errp, "Duplicate device ID '%s'", id);
> +            g_free(id);
>              return NULL;
>          }
>      } else {
> 

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>


