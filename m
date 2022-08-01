Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D491158706E
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 20:36:10 +0200 (CEST)
Received: from localhost ([::1]:58404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIaGv-00023h-6h
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 14:36:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oIaCE-0000Ce-Ij
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 14:31:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oIaCB-0002pq-EZ
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 14:31:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659378674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BD65Or1AvzGUZjSzKwwbl1NFj3kro8AaM4EBKa8OKaM=;
 b=MIJJ0x34hi55bKqFvDFoAMzk0g8yGv7n5x4S7vICKF/fwrAgicRFx53Bw3gPNWf1p6NZ0m
 0qLtALcjRgkFw1idyuwKvwo6aibEVmnWl6s4YsQ8+jO+8/S0tzpnv+G5MWweYrRm/vMMPF
 WyqqFqWFFTU1qp71VMrmOn8FSBC04Rc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-244-1KrmQMb7MFqrdd_b_Oc40A-1; Mon, 01 Aug 2022 14:31:11 -0400
X-MC-Unique: 1KrmQMb7MFqrdd_b_Oc40A-1
Received: by mail-wm1-f70.google.com with SMTP id
 a18-20020a05600c225200b003a30355c0feso1652076wmm.6
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 11:31:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BD65Or1AvzGUZjSzKwwbl1NFj3kro8AaM4EBKa8OKaM=;
 b=jZaJ4uBr1S3Zk6PUkhuXgAAenHASoNHbH5q+bkbykjU6Rp8nFtvfcOlXy5THP71Vgw
 7rc7J4s51mA7STmCDd2RnQ3XefyX9e+M3rNeW+/9dS22nGhj5oOZNtA0CaSXaDMHgwbG
 tJlr8AVkrkP+9Ndkq7c+iAk1mng1sOiEt5FWRe5ivjzD8RlQQ05lhVlOlkcLkXlU53yK
 7BTArYt9OBVc4CLodvPPzSARTHU8srB+36bNX8JWZmgjoQJ/Rwd35XNteQqX8ikaxptm
 05LYPavsfbu6mqrYC4fugjf7rFvkX2J1az16FYNCrLriaUVG4lIOM4DkqtQ0tK1dQtc4
 yorg==
X-Gm-Message-State: AJIora/CHwETGsc2JwPcCozUr+V5oZtVGfN80ajeBpGB3au0AbiUQS3w
 hwq/GPKLcFpCX5R+h/J/uLi+EdSa2ZtfOj4hPVPiqGIt/bu5wRKVwSrGBXNq5BnStjT4Ve3hDaA
 shsuZQLuxz0dnvqw=
X-Received: by 2002:a05:600c:510f:b0:3a3:254c:b081 with SMTP id
 o15-20020a05600c510f00b003a3254cb081mr12332253wms.65.1659378670542; 
 Mon, 01 Aug 2022 11:31:10 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vEfUQCsJGWe2LdnFiSHPCB1YXl+YvKGaEUjki96umfIa1nfvftuYADAoR1p6LcxxbGFUIjVQ==
X-Received: by 2002:a05:600c:510f:b0:3a3:254c:b081 with SMTP id
 o15-20020a05600c510f00b003a3254cb081mr12332234wms.65.1659378670155; 
 Mon, 01 Aug 2022 11:31:10 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 i15-20020a05600c354f00b003a2fb1224d9sm16149603wmq.19.2022.08.01.11.31.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Aug 2022 11:31:09 -0700 (PDT)
Message-ID: <b649292a-7d80-1d8f-8179-e8d74f5a9310@redhat.com>
Date: Mon, 1 Aug 2022 20:31:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] vdpa: Fix file descriptor leak on get features error
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org
References: <20220801144714.181644-1-eperezma@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <20220801144714.181644-1-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 01/08/2022 16:47, Eugenio Pérez wrote:
> File descriptor vdpa_device_fd is not free in the case of returning
> error from vhost_vdpa_get_features. Fixing it by making all errors go to
> the same error path.
> 
> Resolves: Coverity CID 1490785
> Fixes: 8170ab3f43 ("vdpa: Extract get features part from vhost_vdpa_get_max_queue_pairs")
> 
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   net/vhost-vdpa.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 6abad276a6..303447a68e 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -566,7 +566,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>       g_autofree NetClientState **ncs = NULL;
>       g_autoptr(VhostIOVATree) iova_tree = NULL;
>       NetClientState *nc;
> -    int queue_pairs, r, i, has_cvq = 0;
> +    int queue_pairs, r, i = 0, has_cvq = 0;
>   
>       assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
>       opts = &netdev->u.vhost_vdpa;
> @@ -582,7 +582,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>   
>       r = vhost_vdpa_get_features(vdpa_device_fd, &features, errp);
>       if (unlikely(r < 0)) {
> -        return r;
> +        goto err;

Why don't you use "goto err_svq"?

Thanks,
Laurent


