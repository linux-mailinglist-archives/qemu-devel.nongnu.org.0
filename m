Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4C2653CD3
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 09:13:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8GeD-0003Yv-Sq; Thu, 22 Dec 2022 03:09:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p8GeC-0003YN-6X
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 03:09:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p8GeA-0005Ty-Iy
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 03:09:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671696583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fInc+JkUAyuUBr4VwR3d1VSkKanPTFN1ZYhappOmWMc=;
 b=BLhlOvYpXH9i2lcHbo/lm5kZgkpK0Zf7AY9iI0bDtOeVn1WaIKEJVQdJBk5bqphygPivlZ
 gsqTVZJHLPeMvl3Am49R00ZdOvaMDviJkHWtESRBfAwZ9vYebSH8pDpfy+eEmJETrkHnOy
 xroX9p7vUWusuwsL1zu3JHRJDSDFSJQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-190-9xqekOzYOoGeuraysNuRww-1; Thu, 22 Dec 2022 03:09:41 -0500
X-MC-Unique: 9xqekOzYOoGeuraysNuRww-1
Received: by mail-ed1-f72.google.com with SMTP id
 x13-20020a05640226cd00b0047ac11c9774so983010edd.17
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 00:09:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fInc+JkUAyuUBr4VwR3d1VSkKanPTFN1ZYhappOmWMc=;
 b=jrTazXDF4puDCnjL9HI+dNPDKHSJNizVtpdSFUBzHgECKgvfhBIyvcnpPmb0446FKW
 7syI3U3mBFiFknCh+7sdcjumQX2vbN3K/IZz+shrU1KV067WAenBzN/jyc5G/vkkZqP0
 14Pn2jiHuTH7CvqVW7AYD1sF1tKE3bLp4chQKCUmr2ydylIQzMoBbr1nfSGq70lPoYIS
 xtByrsbg2OqWueHbYLX/tvP1SRCkDQob8zhntJ6wFP+qZiGHDwnOhty08GRDiPaYD8hl
 YZmzcb9oYiFr0dVCHW+v66Ax7VknzklawWi6keHh1sk5fx2jqX/SGCwKmInoM+PP9+NL
 ueCQ==
X-Gm-Message-State: AFqh2koYJ1DTy0S3FY4SfKxSxYJjMwHlhDAL7DqLqp4hvx+pBh8Op050
 nQ95gzbLCm9RNElCjHvP0OtyK5GOOcJfwd9dt3GFGqb/SQ35OhL3dTzkghSAsXjjP9VG44R8mCP
 DCfozNID7w6OQYpE=
X-Received: by 2002:a17:907:a08d:b0:7c0:dac7:36d8 with SMTP id
 hu13-20020a170907a08d00b007c0dac736d8mr4074788ejc.10.1671696580704; 
 Thu, 22 Dec 2022 00:09:40 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvdwON2bcJ7K0sGDnQiJtX65NgxCkH5ri4TC6VyNJEUzDAER4ilNsMuD8tRyis9q+OnM1DVTA==
X-Received: by 2002:a17:907:a08d:b0:7c0:dac7:36d8 with SMTP id
 hu13-20020a170907a08d00b007c0dac736d8mr4074768ejc.10.1671696580486; 
 Thu, 22 Dec 2022 00:09:40 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id
 25-20020a170906309900b007c53090d511sm8132514ejv.192.2022.12.22.00.09.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 00:09:40 -0800 (PST)
Message-ID: <9930d0ba-1771-91bc-75b8-9d3acf206037@redhat.com>
Date: Thu, 22 Dec 2022 09:09:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 10/10] libvduse: Fix assignment in vring_set_avail_event
Content-Language: en-US
To: Marcel Holtmann <marcel@holtmann.org>, qemu-devel@nongnu.org,
 mst@redhat.com, xieyongji@bytedance.com
References: <cover.1671628158.git.marcel@holtmann.org>
 <88882e496f70a7f606eabfd8b6183cc2b148c222.1671628158.git.marcel@holtmann.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <88882e496f70a7f606eabfd8b6183cc2b148c222.1671628158.git.marcel@holtmann.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 12/21/22 14:10, Marcel Holtmann wrote:
>   static inline void vring_set_avail_event(VduseVirtq *vq, uint16_t val)
>   {
> -    *((uint16_t *)&vq->vring.used->ring[vq->vring.num]) = htole16(val);
> +    uint16_t *avail;
> +
> +    avail = (uint16_t *)&vq->vring.used->ring[vq->vring.num];
> +    *avail = htole16(val);

That this doesn't warn is basically a compiler bug.

Please use memcpy instead, i.e.

   uint16_t val_le = htole16(val);
   memcpy(&vq->vring.used->ring[vq->vring.num]), &val_le, sizeof(uint16_t));

Paolo


