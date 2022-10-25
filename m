Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAF560D114
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 17:56:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onMHB-0005RJ-Lp; Tue, 25 Oct 2022 11:55:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1onMHA-0005Gb-2P
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 11:55:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1onMH8-0002Rp-B5
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 11:55:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666713333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=94sY5Z0VkgJbNE6OJy4xPd+z2iXvGOKWRE3Tll+iuFE=;
 b=DevZiskyq7pdDhw8dJeEpXDN7qrQtSIMhYsUp30txaPBSI+F4yF4USI+DaSZnFZznyu278
 h68F/cVv1058+I2GlXmG6KQGe4GDUYmHHw43qno2sxjG5pJ0XRBRRBt/T1+2d9h+orSIGo
 INJtMtxNzjnzRzFSscK6ymZAwf19oDo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-364-bXNoW3iNOR6crTompgYGhw-1; Tue, 25 Oct 2022 11:55:30 -0400
X-MC-Unique: bXNoW3iNOR6crTompgYGhw-1
Received: by mail-wr1-f69.google.com with SMTP id
 i14-20020adfa50e000000b0023652707418so4841208wrb.20
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 08:55:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=94sY5Z0VkgJbNE6OJy4xPd+z2iXvGOKWRE3Tll+iuFE=;
 b=mjXrC3vY8NqM0mB5npUhBs9KTHXsmRONN2FNQV/YG9Q1RnAKQ65Ywy8y7AA5+sXV13
 1AE9+WBGGUqt7yjwPmC5e7kIrokDtPyyA29tt1rU9XJCNugdYjRJ01W6jcsv1q/o/En4
 SWJ9X8FQVmmtFFvbLgarfIb0dwpdlL3wKOG0aKxPKe9DtsvEqm8DhhI2wzz4lA7F8g+H
 YXIbObz0a3+NMo6q8EkwZGnnE/OKBqvTVZDXDopWyg20WFap+iRm5HgMxv2Dnahe+tNo
 6BAr6QAKjGWkTtixMqIU0NjBA2GjDgF0ox1PC38S+mOQQ7Sx8/10iJy/G7egmwkvWSXD
 UjvA==
X-Gm-Message-State: ACrzQf3st6tDbOTrLOHWTOjLS7qx+i1YH8zMYU97PaYUcJYl4W4gnuVz
 CVEBk9YHbxN1Y+MFLkI6pZHSLsQvd/WiDFDhI7FqcRf3u/glkUdEsJ4Zp5/flNHdinmFH3LTVS2
 SYeWk28O51LKnmbA=
X-Received: by 2002:a5d:6dca:0:b0:22c:c6f9:57d2 with SMTP id
 d10-20020a5d6dca000000b0022cc6f957d2mr25856225wrz.474.1666713329635; 
 Tue, 25 Oct 2022 08:55:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6p0YRC2Zh/KLco50qYrqawygvfFOVG2ttV8ONVLsNI94/BDnycabhEenBRb/jKKXN5b8zxzw==
X-Received: by 2002:a5d:6dca:0:b0:22c:c6f9:57d2 with SMTP id
 d10-20020a5d6dca000000b0022cc6f957d2mr25856212wrz.474.1666713329473; 
 Tue, 25 Oct 2022 08:55:29 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-58.web.vodafone.de.
 [109.43.176.58]) by smtp.gmail.com with ESMTPSA id
 m17-20020a056000009100b0022eafed36ebsm2936617wrx.73.2022.10.25.08.55.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 08:55:28 -0700 (PDT)
Message-ID: <23c3554e-1793-b0fd-354c-e31e6dfe543f@redhat.com>
Date: Tue, 25 Oct 2022 17:55:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 15/16] tests/qtest: virtio-9p-test: Adapt the case for
 win32
Content-Language: en-US
To: Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20221024045759.448014-1-bin.meng@windriver.com>
 <20221024045759.448014-16-bin.meng@windriver.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221024045759.448014-16-bin.meng@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 24/10/2022 06.57, Bin Meng wrote:
> From: Guohuai Shi <guohuai.shi@windriver.com>
> 
> Windows does not provide the getuid() API. Let's create a local
> one and return a fixed value 0 as the uid for testing.
> 
> Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>   tests/qtest/virtio-9p-test.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
> index 25305a4cf7..e81e3e3709 100644
> --- a/tests/qtest/virtio-9p-test.c
> +++ b/tests/qtest/virtio-9p-test.c
> @@ -34,6 +34,13 @@ static uint32_t genfid(void)
>       return fid_generator++;
>   }
>   
> +#ifdef CONFIG_WIN32
> +static uint32_t getuid(void)
> +{
> +    return 0;
> +}
> +#endif
> +
>   /**
>    * Splits the @a in string by @a delim into individual (non empty) strings
>    * and outputs them to @a out. The output array @a out is NULL terminated.

Acked-by: Thomas Huth <thuth@redhat.com>


