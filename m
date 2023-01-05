Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA1765F2F6
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 18:40:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDU87-0003yx-BE; Thu, 05 Jan 2023 12:34:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pDU7s-0003tj-LU
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 12:34:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pDU7q-000409-Lh
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 12:34:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672940037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KpoZFtNZIeQ02bOl8UIUsezj+gn1qmfeHQ9WsplstyA=;
 b=N4cg8/1Oqh2TkV47O8EfuW4mEoZRQfH97abuvqgb/d0FxEIL4iFAlFbOD37p97crM5tOpW
 +51PKt6wnlKeoK9JUbbM/vKH5aHhWucM8xdjHvgyuEsnRnXRFs3vPE/D4sNyghJhgTlGtr
 Zi3tmgYOGPXrxVoO2wCDlzYs0OsnhDI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-617-yRrA451NOiuOykSgTQbkTw-1; Thu, 05 Jan 2023 12:33:56 -0500
X-MC-Unique: yRrA451NOiuOykSgTQbkTw-1
Received: by mail-wm1-f69.google.com with SMTP id
 r15-20020a05600c35cf00b003d9a14517b2so1300498wmq.2
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 09:33:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KpoZFtNZIeQ02bOl8UIUsezj+gn1qmfeHQ9WsplstyA=;
 b=izCFqiJtsQlRG63sCGRYE94MO/01Bea44oljgUAGoTGPRvtHoYVw6OsCZ5b2e3o8YP
 e0R12aGh2RTl2X1ODj1pUKM6AB0QgpdYt4DaHyiI1eZ74t3uTQDwPvzufdoNWRTS1Qxc
 q9dNn0TmHEYAv3jrNu0ch5f5ECHb1q3Y6avvGn0PyRQXjjrAL0nVkDA4qqZ2URGqYlOt
 reT+qeLYKAJoPPjHpC2WL2sU1T0WstyO2gytBHl0aSbBq1up/5rWL2un0fcoEXXp3ZbK
 kXtyG9NrbdHnfW5VizwyzWd2jwe+pOr1h1YzALkvstvua09nZ0xQZSipLqg+ymqdDMo8
 qDCg==
X-Gm-Message-State: AFqh2krEDSQYaMpNmRMDc4jHWvip5PxQhVfGX1mS7IOei8zutZ+FVYoB
 QY6xzL4LP8I0f8IqDxgMor95X8rGJoL41zBZ1EOWdd9z5vJf/HrwzwBOgj3zBzgZsnEYUEHxXXm
 YdyUcakUjevv6F3o=
X-Received: by 2002:adf:eecf:0:b0:242:14f5:7a96 with SMTP id
 a15-20020adfeecf000000b0024214f57a96mr33777463wrp.47.1672940034860; 
 Thu, 05 Jan 2023 09:33:54 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs6qh7+dPxvCn02EgckFw8Oq8duYBgdyusQiyLtPoxndaNDHfJm59CDVKg8O5BQlpTRwikmfg==
X-Received: by 2002:adf:eecf:0:b0:242:14f5:7a96 with SMTP id
 a15-20020adfeecf000000b0024214f57a96mr33777449wrp.47.1672940034671; 
 Thu, 05 Jan 2023 09:33:54 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 h9-20020adffd49000000b00242209dd1ffsm37060154wrs.41.2023.01.05.09.33.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 09:33:54 -0800 (PST)
Date: Thu, 5 Jan 2023 17:33:52 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
Subject: Re: [PATCH v3 2/6] migration/vmstate: Introduce
 VMSTATE_WITH_TMP_TEST() and VMSTATE_BITMAP_TEST()
Message-ID: <Y7cKAEw+5kvSoE60@work-vm>
References: <20221222110215.130392-1-david@redhat.com>
 <20221222110215.130392-3-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221222110215.130392-3-david@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

* David Hildenbrand (david@redhat.com) wrote:
> We'll make use of both next in the context of virtio-mem.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  include/migration/vmstate.h | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
> index 79eb2409a2..73ad1ae0eb 100644
> --- a/include/migration/vmstate.h
> +++ b/include/migration/vmstate.h
> @@ -712,8 +712,9 @@ extern const VMStateInfo vmstate_info_qlist;
>   *        '_state' type
>   *    That the pointer is right at the start of _tmp_type.
>   */
> -#define VMSTATE_WITH_TMP(_state, _tmp_type, _vmsd) {                 \
> +#define VMSTATE_WITH_TMP_TEST(_state, _test, _tmp_type, _vmsd) {     \
>      .name         = "tmp",                                           \
> +    .field_exists = (_test),                                         \
>      .size         = sizeof(_tmp_type) +                              \
>                      QEMU_BUILD_BUG_ON_ZERO(offsetof(_tmp_type, parent) != 0) + \
>                      type_check_pointer(_state,                       \
> @@ -722,6 +723,9 @@ extern const VMStateInfo vmstate_info_qlist;
>      .info         = &vmstate_info_tmp,                               \
>  }
>  
> +#define VMSTATE_WITH_TMP(_state, _tmp_type, _vmsd) \
> +    VMSTATE_WITH_TMP_TEST(_state, NULL, _tmp_type, _vmsd)
> +
>  #define VMSTATE_UNUSED_BUFFER(_test, _version, _size) {              \
>      .name         = "unused",                                        \
>      .field_exists = (_test),                                         \
> @@ -745,8 +749,9 @@ extern const VMStateInfo vmstate_info_qlist;
>  /* _field_size should be a int32_t field in the _state struct giving the
>   * size of the bitmap _field in bits.
>   */
> -#define VMSTATE_BITMAP(_field, _state, _version, _field_size) {      \
> +#define VMSTATE_BITMAP_TEST(_field, _state, _test, _version, _field_size) { \
>      .name         = (stringify(_field)),                             \
> +    .field_exists = (_test),                                         \
>      .version_id   = (_version),                                      \
>      .size_offset  = vmstate_offset_value(_state, _field_size, int32_t),\
>      .info         = &vmstate_info_bitmap,                            \
> @@ -754,6 +759,9 @@ extern const VMStateInfo vmstate_info_qlist;
>      .offset       = offsetof(_state, _field),                        \
>  }
>  
> +#define VMSTATE_BITMAP(_field, _state, _version, _field_size) \
> +    VMSTATE_BITMAP_TEST(_field, _state, NULL, _version, _field_size)
> +
>  /* For migrating a QTAILQ.
>   * Target QTAILQ needs be properly initialized.
>   * _type: type of QTAILQ element
> -- 
> 2.38.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


