Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE41596D59
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 13:12:03 +0200 (CEST)
Received: from localhost ([::1]:55962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOGxr-0008UF-Ky
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 07:11:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOGmw-0002lu-VW
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 07:00:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOGmt-00059j-KZ
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 07:00:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660734038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=THBHjEFddsQQTLgMPYZDWuAsYfzAwfdxf4FQ+fLY97M=;
 b=e5uHI4SncHPyycO0N9Bm1V9otozBCb262fe+41QzMvZpf6V9ItLPLx7auRzu1BInR4ZWrE
 Du4zS5Kf3OBJ4K+SVyzS0agcao/CMhXYZzmJrB7rARcW68k6ds2oNNs6KvJQbEWLkUuMI/
 lVjiqFrApmhlqIsBFNryUHLu9EEhjpQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-37-FFr9NamlMvmztFtyUTg2qg-1; Wed, 17 Aug 2022 07:00:37 -0400
X-MC-Unique: FFr9NamlMvmztFtyUTg2qg-1
Received: by mail-wr1-f69.google.com with SMTP id
 v20-20020adf8b54000000b002216d3e3d5dso2339485wra.12
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 04:00:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=THBHjEFddsQQTLgMPYZDWuAsYfzAwfdxf4FQ+fLY97M=;
 b=OscGBwDQ8yMyxGd8TAghK8fn5iNVtUUyxBiQJanzAfetp4RW4mqEI6PrJN6YsZsz2m
 +Elvc3PWwwONHCEsfkDyQTEXddnx5SWxrR6eAvXlj9F5MPchX/hzRb+ZRsd5/Z8iP/2F
 Fk8QHZpqBza0sHWQlk3MgXkJrmlzJGCxSKCSlOXhp3PZK8AwmY6KF/qZvpUzqiunTrEY
 vQjN+rJmIZrLMH2CqifgiQE+Ig4M4S8W+sXxNpaIQ5skNyi/KmGbrGP3ewDzCDy/9/1E
 tHUWbyozzHK3PPTV/uBjzv1eM4aTYkpe0i69SD1ZlpTmeOGmW2HJ1g4OfvcNmmvsg781
 Tucw==
X-Gm-Message-State: ACgBeo3p5qjgauznPrWknBBecfXivqf4kCNUx+Y1tuu7RIUIJDdTwCZn
 PFFaHI03v9tvcaY0ohN//kr44s4WBi8kZJtkLTQGT9llMzfFGoxk8dWkZau+dkjHz6CL7S72Kpd
 DZDzwApOSDStmzkc=
X-Received: by 2002:a7b:c399:0:b0:3a5:f3fb:85e0 with SMTP id
 s25-20020a7bc399000000b003a5f3fb85e0mr1788868wmj.38.1660734036223; 
 Wed, 17 Aug 2022 04:00:36 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4vTHptfn8PooL7CSkBuqY1rqfVtcCTqJEfWFKKND00rPnFLMnccF39po+kCdv4jP5MwKNZMw==
X-Received: by 2002:a7b:c399:0:b0:3a5:f3fb:85e0 with SMTP id
 s25-20020a7bc399000000b003a5f3fb85e0mr1788851wmj.38.1660734035935; 
 Wed, 17 Aug 2022 04:00:35 -0700 (PDT)
Received: from redhat.com ([2.55.43.215]) by smtp.gmail.com with ESMTPSA id
 z6-20020a5d4406000000b0021d70a871cbsm12637008wrq.32.2022.08.17.04.00.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 04:00:35 -0700 (PDT)
Date: Wed, 17 Aug 2022 07:00:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH  v2 1/4] hw/virtio: incorporate backend features in
 features
Message-ID: <20220817065935-mutt-send-email-mst@kernel.org>
References: <20220728135503.1060062-1-alex.bennee@linaro.org>
 <20220728135503.1060062-2-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220728135503.1060062-2-alex.bennee@linaro.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 28, 2022 at 02:55:00PM +0100, Alex Bennée wrote:
> There are some extra bits used over a vhost-user connection which are
> hidden from the device itself. We need to set them here to ensure we
> enable things like the protocol extensions.
> 
> Currently net/vhost-user.c has it's own inscrutable way of persisting
> this data but it really should live in the core vhost_user code.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20220726192150.2435175-7-alex.bennee@linaro.org>

I went back and forth on this, but in the end I feel
it is safer to defer this one until after the release.

> ---
>  hw/virtio/vhost-user.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index 75b8df21a4..1936a44e82 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -1460,7 +1460,14 @@ static int vhost_user_set_features(struct vhost_dev *dev,
>       */
>      bool log_enabled = features & (0x1ULL << VHOST_F_LOG_ALL);
>  
> -    return vhost_user_set_u64(dev, VHOST_USER_SET_FEATURES, features,
> +    /*
> +     * We need to include any extra backend only feature bits that
> +     * might be needed by our device. Currently this includes the
> +     * VHOST_USER_F_PROTOCOL_FEATURES bit for enabling protocol
> +     * features.
> +     */
> +    return vhost_user_set_u64(dev, VHOST_USER_SET_FEATURES,
> +                              features | dev->backend_features,
>                                log_enabled);
>  }
>  
> -- 
> 2.30.2


