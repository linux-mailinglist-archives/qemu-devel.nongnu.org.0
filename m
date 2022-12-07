Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 067DD645AE5
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 14:26:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2uP4-0006Tl-Cc; Wed, 07 Dec 2022 08:24:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p2uOw-0006SP-RT
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 08:23:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p2uOt-0008E8-Nv
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 08:23:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670419431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9WFCdtac99WU9vz5YdXk3VVfV979ToR5jdlkbd5OKyc=;
 b=BB6yt+kPiPiN7mrcmAOz+1X/rHf6semhzuL0xV4Y8a10stCn6ITDRsBoUhA5nWgomLTYqZ
 smFv5pFwUT0WILeA7LXxzv/403U8SGgFeQVaeQcrRjBvEP9Ln/QBox4K7RauPa1uOqjvD9
 h4a3at2bjVwPq40A6TF7f1AY1D4S2qY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-250-oLX8fAJkOMOJvELfxtm2gg-1; Wed, 07 Dec 2022 08:23:49 -0500
X-MC-Unique: oLX8fAJkOMOJvELfxtm2gg-1
Received: by mail-wm1-f71.google.com with SMTP id
 f1-20020a1cc901000000b003cf703a4f08so599853wmb.2
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 05:23:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9WFCdtac99WU9vz5YdXk3VVfV979ToR5jdlkbd5OKyc=;
 b=t4BbHoI/VvuCC0IlVckDwGD+zYrQ1w0RlyVemZ+W78oa+BKZE8SpPrJED7fkM+2A71
 P0olzD8b/Uacpobc7yyl8s8eMDPXzXcBqdSKvZWgxSOrquFslUjIn9816vFRgoCdNG3t
 EGElgNLRvIQRa8RhabasTF8BH3+JXm85KzSCjDUurSuIFh0vRebYH6PGcYJCj1Oew1Ql
 1H7nHy4qiVC+6wX3QzmICshwx+byEqTHKP1xvTiQQv+Z8RUwjx2PFz/SRmk8yPqvAy3X
 QzelkTlStjYNxgkdDuwkIuO3UW3gpi2b56e7tf0rm1aho3JAJ+xP4xU6OwVuVIsg685+
 3LMg==
X-Gm-Message-State: ANoB5pnAWGsMzzmXSUM10DkOIXeWlvARUm7VqT68wjq/AjsdvNO5Vgz+
 QZz2kMhgxiVlfPj0MpXdX6OpuQpboP+U+AzCI1L+8gmTknO7tlN+yGmMfYwaxv+UVNhHioMdJ2u
 RNL0wWy7KyA9Xlsw=
X-Received: by 2002:a05:600c:1f1b:b0:3cf:35c8:289f with SMTP id
 bd27-20020a05600c1f1b00b003cf35c8289fmr58939107wmb.153.1670419428654; 
 Wed, 07 Dec 2022 05:23:48 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4HFrZbMzr6FZtwV6YUoKm4pd02Rk6cDVALMiLOC7cpBVgbctP/gXaeeo61eYrudqjrItM2Sg==
X-Received: by 2002:a05:600c:1f1b:b0:3cf:35c8:289f with SMTP id
 bd27-20020a05600c1f1b00b003cf35c8289fmr58939083wmb.153.1670419428364; 
 Wed, 07 Dec 2022 05:23:48 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-178-155.web.vodafone.de.
 [109.43.178.155]) by smtp.gmail.com with ESMTPSA id
 e4-20020adff344000000b00236488f62d6sm19986052wrp.79.2022.12.07.05.23.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Dec 2022 05:23:47 -0800 (PST)
Message-ID: <aeee1b23-e273-1baa-c1a5-2131736b9c5f@redhat.com>
Date: Wed, 7 Dec 2022 14:23:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/1] qemu-iotests/stream-under-throttle: do not shutdown
 QEMU
Content-Language: en-US
To: Christian Borntraeger <borntraeger@linux.ibm.com>,
 qemu-devel <qemu-devel@nongnu.org>, hreitz@redhat.com
Cc: qemu-s390x <qemu-s390x@nongnu.org>, Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, kwolf@redhat.com, qemu-block@nongnu.org
References: <20221207131452.8455-1-borntraeger@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221207131452.8455-1-borntraeger@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.262, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 07/12/2022 14.14, Christian Borntraeger wrote:
> Without a kernel or boot disk a QEMU on s390 will exit (usually with a
> disabled wait state). This breaks the stream-under-throttle test case.
> Do not exit qemu if on s390.
> 
> Signed-off-by: Christian Borntraeger <borntraeger@linux.ibm.com>
> ---
>   tests/qemu-iotests/tests/stream-under-throttle | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/tests/qemu-iotests/tests/stream-under-throttle b/tests/qemu-iotests/tests/stream-under-throttle
> index 8d2d9e16840d..c24dfbcaa2f2 100755
> --- a/tests/qemu-iotests/tests/stream-under-throttle
> +++ b/tests/qemu-iotests/tests/stream-under-throttle
> @@ -88,6 +88,8 @@ class TestStreamWithThrottle(iotests.QMPTestCase):
>                              'x-iops-total=10000,x-bps-total=104857600')
>           self.vm.add_blockdev(self.vm.qmp_to_opts(blockdev))
>           self.vm.add_device('virtio-blk,iothread=iothr0,drive=throttled-node')
> +        if iotests.qemu_default_machine == 's390-ccw-virtio':
> +            self.vm.add_args('-no-shutdown')
>           self.vm.launch()

I guess you could even add that unconditionally for all architectures?

Anyway:
Reviewed-by: Thomas Huth <thuth@redhat.com>


