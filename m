Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C51E3C7BE7
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 04:42:37 +0200 (CEST)
Received: from localhost ([::1]:42394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Ur6-0007Km-Kp
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 22:42:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m3Upb-0006Rf-PZ
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 22:41:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m3UpZ-0006F9-GI
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 22:41:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626230460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oo+4Fb67xGaME4oVE/L6AZBixugGVIOIXxEjC8WGgWE=;
 b=JrCLtqFhsNiRCMBasQehSPF+xpvZGWo9H73cuLAR7hCd3uilXdcF8/mOedjfVbX93zMkQI
 oE3vq+raMhy5tLgOTT65mmat9+F+1/D6hBcBjb0f4t4vjNa7qzNPQ1u6ubFapuIHf5xHcO
 17cBXmXbHZvTft3ovooH8mKUALuhHTs=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-uTSYbz-sPUaIiQQoYYW2Kw-1; Tue, 13 Jul 2021 22:40:59 -0400
X-MC-Unique: uTSYbz-sPUaIiQQoYYW2Kw-1
Received: by mail-pf1-f197.google.com with SMTP id
 x35-20020a056a0018a3b029032d069176ceso501160pfh.20
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 19:40:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=oo+4Fb67xGaME4oVE/L6AZBixugGVIOIXxEjC8WGgWE=;
 b=ZrTfCQmUcXXDf6H9wgMMz0NXSbs5c+w3qsOwM+hVsM414nZ1Sl0/DSdSeseJxA2Nyr
 VzvpmeCbuFZmhZm3lKoDdGEpaLeC0uChc0hz4+URnkh76f55DGuP08MXKemz84joGGWY
 L1o8i4EkKBbihUGZkooTe1U+wIwxQWx1uVfQ3Hm8ZAHR+eI+DXi3L8tgv3rDlOiddpY2
 R9ZD4cWmGN/VYb21+L1F1jM06Uqz+Xaul6IWoA1dHPGrsZEybG14cSuK8WnL7IMgPKYI
 T84N+7hg5Lpb9UAJD6G5Ep5AGJaH1bdHU37pwgD+FgzwGhVABjAAdZsB+m7sQoBqCze/
 xfxA==
X-Gm-Message-State: AOAM533AJwfthCdzFnvbwXV+1mf3us0xz6y9oIzw4b8lIX4iuoOF8WDI
 apdJPMByrsofAFuDGlF/F3pMWZhSJteyeKvXI7DSYFqr/1i7QBQ51b/j9ZvRg4w/rEh917GWYp1
 4s/Bjwj0uM8OGRlo=
X-Received: by 2002:a17:90a:588b:: with SMTP id
 j11mr7244457pji.114.1626230458775; 
 Tue, 13 Jul 2021 19:40:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDEJLCL76SgG8kaNagN9mOH3/ZGWHMAx4CHAp8Fs377084ES+6mZfMpTYO9S0XCctNvOpagg==
X-Received: by 2002:a17:90a:588b:: with SMTP id
 j11mr7244423pji.114.1626230458520; 
 Tue, 13 Jul 2021 19:40:58 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id e23sm509034pfd.26.2021.07.13.19.40.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jul 2021 19:40:58 -0700 (PDT)
Subject: Re: [PATCH v6 6/6] hmp: add virtio commands
To: Jonah Palmer <jonah.palmer@oracle.com>, qemu-devel@nongnu.org
References: <1626086137-16292-1-git-send-email-jonah.palmer@oracle.com>
 <1626086137-16292-7-git-send-email-jonah.palmer@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <a92fd4c4-73cc-3b6b-89fa-b5ae35304a2d@redhat.com>
Date: Wed, 14 Jul 2021 10:40:46 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1626086137-16292-7-git-send-email-jonah.palmer@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.368, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 joao.m.martins@oracle.com, mreitz@redhat.com, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/7/12 ÏÂÎç6:35, Jonah Palmer Ð´µÀ:
> +void hmp_virtio_queue_status(Monitor *mon, const QDict *qdict)
> +{
> +    Error *err = NULL;
> +    const char *path = qdict_get_try_str(qdict, "path");
> +    int queue = qdict_get_int(qdict, "queue");
> +    VirtQueueStatus *s = qmp_x_debug_virtio_queue_status(path, queue, &err);
> +
> +    if (err != NULL) {
> +        hmp_handle_error(mon, err);
> +        return;
> +    }
> +
> +    monitor_printf(mon, "%s:\n", path);
> +    monitor_printf(mon, "  device_type:          %s\n",
> +                   VirtioType_str(s->device_type));
> +    monitor_printf(mon, "  index:                %d\n", s->queue_index);
> +    monitor_printf(mon, "  inuse:                %d\n", s->inuse);
> +    monitor_printf(mon, "  last_avail_idx:       %d (%"PRId64" %% %"PRId64")\n",
> +                   s->last_avail_idx, s->last_avail_idx % s->vring_num,
> +                   s->vring_num);
> +    monitor_printf(mon, "  shadow_avail_idx:     %d (%"PRId64" %% %"PRId64")\n",
> +                   s->shadow_avail_idx, s->shadow_avail_idx % s->vring_num,
> +                   s->vring_num);
> +    monitor_printf(mon, "  used_idx:             %d (%"PRId64" %% %"PRId64")\n",
> +                   s->used_idx, s->used_idx % s->vring_num, s->vring_num);


The modular information is not the case of packed ring where the queue 
size does not have to be a power of 2.

Thanks


> +    monitor_printf(mon, "  signalled_used:       %d (%"PRId64" %% %"PRId64")\n",
> +                   s->signalled_used, s->signalled_used % s->vring_num,
> +                   s->vring_num);
> +    monitor_printf(mon, "  signalled_used_valid: %d\n", s->signalled_used_valid);
> +    monitor_printf(mon, "  VRing:\n");
> +    monitor_printf(mon, "    num:         %"PRId64"\n", s->vring_num);
> +    monitor_printf(mon, "    num_default: %"PRId64"\n", s->vring_num_default);
> +    monitor_printf(mon, "    align:       %"PRId64"\n", s->vring_align);
> +    monitor_printf(mon, "    desc:        0x%016"PRIx64"\n", s->vring_desc);
> +    monitor_printf(mon, "    avail:       0x%016"PRIx64"\n", s->vring_avail);
> +    monitor_printf(mon, "    used:        0x%016"PRIx64"\n", s->vring_used);
> +
> +    qapi_free_VirtQueueStatus(s);


