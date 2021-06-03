Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5000399A75
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 08:05:54 +0200 (CEST)
Received: from localhost ([::1]:33010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1logUL-0004ZX-P9
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 02:05:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1logTF-00039B-CY
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 02:04:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1logTD-0001Y5-Um
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 02:04:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622700282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WeILAJfyvX7OlmA7hZ+gzrpXZ18ICrbhrmy0nSixeSE=;
 b=R+ccRZOT7DWU7An+fuTs2NYhmXXbvN6ak/OaceFfviK7RZL48xrhcL/N/0cAFUXmkUQZ4Y
 tKDRU37BURd7h/aDWFQHKk5XB5cvwKQskqXyZH2qPozBM0nnZFB+vQX/hP/rTlRhCClq3V
 nZgKWYIbIFfW+AmeOa+35VnvqCk+vrQ=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-brGbI3boMwGAbpzkCchvWA-1; Thu, 03 Jun 2021 02:04:39 -0400
X-MC-Unique: brGbI3boMwGAbpzkCchvWA-1
Received: by mail-pj1-f72.google.com with SMTP id
 f15-20020a17090aa78fb029015c411f061bso3020697pjq.4
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 23:04:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=WeILAJfyvX7OlmA7hZ+gzrpXZ18ICrbhrmy0nSixeSE=;
 b=kM1nQ0arKB3fmw1wesYhC8pifO5uGUGsrWE3wb3cp5cNQNi74oZZ+LZe4vsLXndU/y
 IZS0G9JwlETT6b6gxmN8iwvro2lHm8/VpKbnnunNZGI7cHZUWtuuhN6Om6bjWL3j100B
 StmdVWOiuV4AxPsmmMPnDCIK15aftYS+w/F4+gc8gB6ccEqoQTUCclslgXSjpMmvaiZD
 P3ID1SXLKaQicHhQXPll9HhEgVtcRdD6waHUpRL3UnA8aEyrj6c9DNhicH+BwvCu/chD
 /jlUeuTME0w6LCFD2gNqFge1CZU5RHhmKuCnVnVuoKiHW1TUwO0bh7LYlQa9PI9ukuEU
 f8vg==
X-Gm-Message-State: AOAM53299POc9rmJ6v03OQFIdGQzEwzuU97n5ZSD5mdyChtFWm0ZHx+F
 qIOgJNlQuvhoFyAXKqsLxH/jE9xkDHGK0LFR44LeZ4RhW2jGNaaI4UlvmR0U6zu5LF7KHIDUMSx
 i9XFoztHOvhxTYj71XsQHZsE08i5LAPYNpLsegIV3PIXiZvGykD+m5d6lsTzpPBejkAU=
X-Received: by 2002:a63:4083:: with SMTP id n125mr1322840pga.57.1622700277983; 
 Wed, 02 Jun 2021 23:04:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwd2qFMICpICsmKW7wUIwegQXvh/5xrb1ubzGgmF0Tx8cu8njUFMKppQpyTN8nTbCRTT5ftjg==
X-Received: by 2002:a63:4083:: with SMTP id n125mr1322817pga.57.1622700277684; 
 Wed, 02 Jun 2021 23:04:37 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id z5sm1178353pfb.114.2021.06.02.23.04.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 23:04:37 -0700 (PDT)
Subject: Re: [PATCH v7 04/10] vhost: add new call back function for config
 interrupt
To: Cindy Lu <lulu@redhat.com>, mst@redhat.com, qemu-devel@nongnu.org
References: <20210602034750.23377-1-lulu@redhat.com>
 <20210602034750.23377-5-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <f20ee6f6-bb79-7848-7478-2941f8f385f9@redhat.com>
Date: Thu, 3 Jun 2021 14:04:34 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210602034750.23377-5-lulu@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/6/2 ÉÏÎç11:47, Cindy Lu Ð´µÀ:
> To support configure interrupt, we need to
> add a new call back function for config interrupt.
>
> Signed-off-by: Cindy Lu <lulu@redhat.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   include/hw/virtio/vhost-backend.h | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
> index 8a6f8e2a7a..adaf6982d2 100644
> --- a/include/hw/virtio/vhost-backend.h
> +++ b/include/hw/virtio/vhost-backend.h
> @@ -125,6 +125,8 @@ typedef int (*vhost_get_device_id_op)(struct vhost_dev *dev, uint32_t *dev_id);
>   
>   typedef bool (*vhost_force_iommu_op)(struct vhost_dev *dev);
>   
> +typedef int (*vhost_set_config_call_op)(struct vhost_dev *dev,
> +                                       int *fd);
>   typedef struct VhostOps {
>       VhostBackendType backend_type;
>       vhost_backend_init vhost_backend_init;
> @@ -170,6 +172,7 @@ typedef struct VhostOps {
>       vhost_vq_get_addr_op  vhost_vq_get_addr;
>       vhost_get_device_id_op vhost_get_device_id;
>       vhost_force_iommu_op vhost_force_iommu;
> +    vhost_set_config_call_op vhost_set_config_call;
>   } VhostOps;
>   
>   extern const VhostOps user_ops;


