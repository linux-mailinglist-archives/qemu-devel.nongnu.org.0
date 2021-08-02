Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2D33DDFC9
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 21:04:32 +0200 (CEST)
Received: from localhost ([::1]:44884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAdEl-0002jz-Pp
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 15:04:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mAd8s-0002nC-On
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 14:58:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mAd8p-0004Ss-N7
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 14:58:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627930703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sitiBWu430/ZXp64y6ceSGmhz3L5zj5pDnGChqFmBpE=;
 b=DRuvtKw7uBld8XatfOn68PJhkkrb/+givBOaL9KBWBJo9Siv4EO4PuMrr7ByN8zkgQMuDO
 higgzZhZLgE+nA+fEmFRnsNN93/f4hKOPa3C8B/yFCEtjvw8VEEYRpGynMAz1sOXw+mWAx
 8z4W0LqyVLrRpwej9SU5AboDrfr4zw0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-yScjoktDP7-o_Z6nBCNeCw-1; Mon, 02 Aug 2021 14:58:21 -0400
X-MC-Unique: yScjoktDP7-o_Z6nBCNeCw-1
Received: by mail-wm1-f70.google.com with SMTP id
 w25-20020a1cf6190000b0290252505ddd56so3135517wmc.3
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 11:58:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sitiBWu430/ZXp64y6ceSGmhz3L5zj5pDnGChqFmBpE=;
 b=trOVAdWLp0E5XrcZ8xyO8DRng1P65FlXLIOELtAnuG+POyS5DViQEPRPNoye4N6pVy
 swrQCMKrQuSzWK2enHr+pkc381AF3E0yj3EoqkyvryxqKHP3jWaZputsrH8nJ9t06YiG
 QSDAHqb2FOlTgnEDs6sHCrWz0eh8HTBJCC9C7QENyQC1SCBqXzIPrt+9DwlH6rOMGuN3
 0F93mJt7UuULBHAomWK9QnCcYic3Xz6ePERST+IV/7kjJMOvubVU0FouZ9yCr1R9bosP
 rRrs0w7Il6PSMXb4+wDjq61XbNeqyGfyVLta2hGQ48ktzl0Hr+0xDh5GjqBHd3heDYQO
 Rl7A==
X-Gm-Message-State: AOAM533XA37TE8hsCM6gmMBWB8VZDpe6qLUvQnQ3obTwDxbgFIKa/hfn
 KmVwng+6v6tS1MWDv36yRRvw9K0dUGul0YUcwXOPTsMW7osj6aDuWAkFreKhEA68JkpdVtPu4Cn
 H9Nb+TKal14L+jcE=
X-Received: by 2002:a05:6000:110:: with SMTP id
 o16mr19374205wrx.2.1627930700514; 
 Mon, 02 Aug 2021 11:58:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAIYzjgMVhYy3YSrMk0LlvFv56TKE/rWsJVefrlYk0Y6fVApxh87s3H4LF4A9+/iaFPDfYCA==
X-Received: by 2002:a05:6000:110:: with SMTP id
 o16mr19374194wrx.2.1627930700401; 
 Mon, 02 Aug 2021 11:58:20 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id k18sm218094wms.1.2021.08.02.11.58.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 11:58:20 -0700 (PDT)
Subject: Re: [PATCH 12/16] vhost: Clean up how VhostOpts method
 vhost_get_config() fails
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210720125408.387910-1-armbru@redhat.com>
 <20210720125408.387910-13-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4d0d6438-dc67-4d4a-96d8-d337e589eea8@redhat.com>
Date: Mon, 2 Aug 2021 20:58:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720125408.387910-13-armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/20/21 2:54 PM, Markus Armbruster wrote:
> vhost_user_get_config() can fail without setting an error.  Unclean.
> Its caller vhost_dev_get_config() compensates by substituting a
> generic error then.  Goes back to commit 50de51387f "vhost:
> Distinguish errors in vhost_dev_get_config()".
> 
> Clean up by moving the generic error from vhost_dev_get_config() to
> all the failure paths that neglect to set an error.
> 
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/virtio/vhost-user.c |  2 ++
>  hw/virtio/vhost.c      | 10 ++--------
>  2 files changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index 29ea2b4fce..dbbd6fbc25 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -2139,10 +2139,12 @@ static int vhost_user_get_config(struct vhost_dev *dev, uint8_t *config,
>      msg.payload.config.offset = 0;
>      msg.payload.config.size = config_len;
>      if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
> +        error_setg_errno(errp, -EPROTO, "vhost_get_config failed");
>          return -EPROTO;
>      }
>  
>      if (vhost_user_read(dev, &msg) < 0) {
> +        error_setg_errno(errp, -EPROTO, "vhost_get_config failed");
>          return -EPROTO;
>      }

Oops, should be error_setg_errno(EPROTO)!


