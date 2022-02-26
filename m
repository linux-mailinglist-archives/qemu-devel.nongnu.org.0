Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D714C54AB
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 09:44:51 +0100 (CET)
Received: from localhost ([::1]:43708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNsh8-0006dZ-SD
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 03:44:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nNsZp-0002d9-FR
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 03:37:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nNsZn-0005RA-7x
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 03:37:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645864634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5E6byQELW3GEOC3mT+OAD8uJdxdkxAc+OecbLQDZDlQ=;
 b=LzueWlc/YihWbc2UWxqG5d4vPD+x9ZExyqTNQPU9qsDmm5JJWn5CzHjLueog55/1fnuGGy
 ICh1Sdk0Q4d17x9iXIkDlbLbS1tfYpnHlqEIxt0mOpiNEwXFjX47uGKB4Z5x0TZT3eBl2Q
 3UuVC3qc+4ofCKFqRNsgiEpfZyPDtUU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-451-8c_OjR2OOdWg7lI97YSFew-1; Sat, 26 Feb 2022 03:37:13 -0500
X-MC-Unique: 8c_OjR2OOdWg7lI97YSFew-1
Received: by mail-wm1-f70.google.com with SMTP id
 q17-20020a1ca711000000b0037be98d03a1so3024913wme.0
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 00:37:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=5E6byQELW3GEOC3mT+OAD8uJdxdkxAc+OecbLQDZDlQ=;
 b=ijR+HggfR8n0gFlMJI90CGNaDScWhbgM8YhfULTaTfJajHv7yY2RM8FQ+7t0q4f9Rw
 LejRL/ksTxDC4I+96+i9b0N/PvCfbVFD/bet1Nvp2xcyV4FRR+ty4J43RncWIZ+/T426
 CBxkpKCeK4tQIf7EEnSaJ43C+EZaW/HaXQ46CQDGEEC+/HsomDtzrYi0U2VHwb/0y33R
 PoqcgeeL7bkWIqW8upNlfTFG6NOnFmxZL1b3tRg2J3afCZ9456WtPWdnAmgmv6cCqcqn
 MRaJhB/e6tjb9ZCl53wSvRJsEo3VLNsSop+iNXvT+z9nNLMyTs/0SGYYF9ZY28l0dkoZ
 QOmA==
X-Gm-Message-State: AOAM5326+n8F+FzGBxQl22CAcff/o0hj0r831UbLSvjLEQR632EnmawE
 0P4RuwcP7dkSdA44cvXGFUzKY0tu/A8KejD+9wpylHceY68itQFXJmhOfHVgBZlh6NI1P7p/Sud
 kLFzK+Qa88sd+w2k=
X-Received: by 2002:a5d:52cb:0:b0:1e4:b8b5:6ce1 with SMTP id
 r11-20020a5d52cb000000b001e4b8b56ce1mr8785848wrv.268.1645864632127; 
 Sat, 26 Feb 2022 00:37:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz+jzr4cVULzgjrwdfWp6YqEAuiOhsaPnvWExbIMTDKNJsbwNIHaBQrLz9hN4WmeSg1vyn1JA==
X-Received: by 2002:a5d:52cb:0:b0:1e4:b8b5:6ce1 with SMTP id
 r11-20020a5d52cb000000b001e4b8b56ce1mr8785833wrv.268.1645864631798; 
 Sat, 26 Feb 2022 00:37:11 -0800 (PST)
Received: from ?IPV6:2003:cb:c71e:7200:b047:4385:f064:3dcc?
 (p200300cbc71e7200b0474385f0643dcc.dip0.t-ipconnect.de.
 [2003:cb:c71e:7200:b047:4385:f064:3dcc])
 by smtp.gmail.com with ESMTPSA id
 g17-20020a5d4891000000b001e74e998bf9sm4357814wrq.33.2022.02.26.00.37.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Feb 2022 00:37:11 -0800 (PST)
Message-ID: <87e10d93-dfbe-8799-81ea-f1c5cd951c74@redhat.com>
Date: Sat, 26 Feb 2022 09:37:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] virtio/virtio-balloon: Prefer Object* over void* parameter
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
References: <20220217225351.140095-1-shentey@gmail.com>
 <20220217225351.140095-3-shentey@gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220217225351.140095-3-shentey@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.02.22 23:53, Bernhard Beschow wrote:
> *opaque is an alias to *obj. Using the ladder makes the code consistent with
> with other devices, e.g. accel/kvm/kvm-all and accel/tcg/tcg-all. It also
> makes the cast more typesafe.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/virtio/virtio-balloon.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> index 9a4f491b54..38732d4118 100644
> --- a/hw/virtio/virtio-balloon.c
> +++ b/hw/virtio/virtio-balloon.c
> @@ -241,7 +241,7 @@ static void balloon_stats_get_all(Object *obj, Visitor *v, const char *name,
>                                    void *opaque, Error **errp)
>  {
>      Error *err = NULL;
> -    VirtIOBalloon *s = opaque;
> +    VirtIOBalloon *s = VIRTIO_BALLOON(obj);
>      int i;
>  
>      if (!visit_start_struct(v, name, NULL, 0, &err)) {
> @@ -276,7 +276,7 @@ static void balloon_stats_get_poll_interval(Object *obj, Visitor *v,
>                                              const char *name, void *opaque,
>                                              Error **errp)
>  {
> -    VirtIOBalloon *s = opaque;
> +    VirtIOBalloon *s = VIRTIO_BALLOON(obj);
>      visit_type_int(v, name, &s->stats_poll_interval, errp);
>  }
>  
> @@ -284,7 +284,7 @@ static void balloon_stats_set_poll_interval(Object *obj, Visitor *v,
>                                              const char *name, void *opaque,
>                                              Error **errp)
>  {
> -    VirtIOBalloon *s = opaque;
> +    VirtIOBalloon *s = VIRTIO_BALLOON(obj);
>      int64_t value;
>  
>      if (!visit_type_int(v, name, &value, errp)) {
> @@ -1014,12 +1014,12 @@ static void virtio_balloon_instance_init(Object *obj)
>      s->free_page_hint_notify.notify = virtio_balloon_free_page_hint_notify;
>  
>      object_property_add(obj, "guest-stats", "guest statistics",
> -                        balloon_stats_get_all, NULL, NULL, s);
> +                        balloon_stats_get_all, NULL, NULL, NULL);
>  
>      object_property_add(obj, "guest-stats-polling-interval", "int",
>                          balloon_stats_get_poll_interval,
>                          balloon_stats_set_poll_interval,
> -                        NULL, s);
> +                        NULL, NULL);
>  }
>  
>  static const VMStateDescription vmstate_virtio_balloon = {


LGTM

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


