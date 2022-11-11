Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89914625A9F
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 13:42:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otTM7-00045X-U1; Fri, 11 Nov 2022 07:41:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1otTM4-00042L-96
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 07:41:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1otTM2-0000Tt-TF
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 07:41:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668170514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Jv29R0VQ3qnKjggpKh4iOd/uqtOAL1IL6QpYGRSg78=;
 b=fZ13LpD6Hm1+zVrKOQdVwiJ4WKXaN4pQ5coSa7/ayRVkz8tSxlU4wtS63RlyKK0cpMbFxw
 UEmmDju/WdiQfeJ36WfgRXkw9PEiguTA3ue9TiTyfSMShENcrCXaBNB9XOaw5ItuXaVv9I
 AnbTWEs1QNWiGj2BNusQRBxR9/kMU5M=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-43-5DZ2elLPPL6LFhnDc0atFw-1; Fri, 11 Nov 2022 07:41:52 -0500
X-MC-Unique: 5DZ2elLPPL6LFhnDc0atFw-1
Received: by mail-qv1-f69.google.com with SMTP id
 h1-20020a0ceda1000000b004b899df67a4so3581311qvr.1
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 04:41:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/Jv29R0VQ3qnKjggpKh4iOd/uqtOAL1IL6QpYGRSg78=;
 b=79GxoKVzHE6jOaeTR9/gLiKV4isAxxg7fsLQMLpyoWAPPA/+iqyA6Nzrjq3JJblX2F
 12cs4FAJN5yjljXcir+/eFArzugwLnQrMagvAf4pRkWY8diNYLMCusQTOV1JWiK9wlaJ
 /VVvqyKLS2VLXax5mjmRJkyFhCHSyZFO8g1Clb+qthym4rnGQiLPIpBbVgQlRABL6fyM
 ik65H3mHay0XVJ3H/pLqHShrFtb8VptyDIi7TV41VhtKbwvJ2UmSNx8rEeDhYF7dwb/H
 je9or3lqvPLJThM2tNDDIAlsiEWmv139CYqkPPuCyIDYZaXzZ4gb7vZnuUohXiHAARHp
 2N7Q==
X-Gm-Message-State: ANoB5pnHq9nO9RnXw+mcACnusHPv0hBQqaQsYqVq+bRWLNm1ZiWdd3Xh
 yRc4aOLayRR9P3RD9PntvK9OpQtsSLNgiDE1Z+jDGwPXs/txCYB4TZAjoCZFn6KV2zZbWGAJzRW
 0nuDkbmPLtChxWUM=
X-Received: by 2002:a05:622a:1995:b0:3a4:fb34:7d9a with SMTP id
 u21-20020a05622a199500b003a4fb347d9amr1005309qtc.379.1668170512335; 
 Fri, 11 Nov 2022 04:41:52 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7PFljl2/zVBaEhd6Dj6zua10eI8Rq8KCjskwJ/kM3Y3I7nnjGXO+838hDEFlQrEQOE22ir1A==
X-Received: by 2002:a05:622a:1995:b0:3a4:fb34:7d9a with SMTP id
 u21-20020a05622a199500b003a4fb347d9amr1005290qtc.379.1668170512146; 
 Fri, 11 Nov 2022 04:41:52 -0800 (PST)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 v5-20020a05620a0f0500b006eec09eed39sm1390201qkl.40.2022.11.11.04.41.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 04:41:51 -0800 (PST)
Message-ID: <472bcf30-3fea-ba6a-7f8e-9c373026c6b2@redhat.com>
Date: Fri, 11 Nov 2022 13:41:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 8/8] virtio-blk: minimize virtio_blk_reset() AioContext
 lock region
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>
References: <20221108211930.876142-1-stefanha@redhat.com>
 <20221108211930.876142-9-stefanha@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <20221108211930.876142-9-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



Am 08/11/2022 um 22:19 schrieb Stefan Hajnoczi:
> blk_drain() needs the lock because it calls AIO_WAIT_WHILE().
>
> The s->rq loop doesn't need the lock because dataplane has been stopped
> when virtio_blk_reset() is called.
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>


Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>


