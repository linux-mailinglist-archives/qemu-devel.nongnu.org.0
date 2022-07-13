Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB89D573874
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 16:10:50 +0200 (CEST)
Received: from localhost ([::1]:59424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBd4i-0002Ba-Jy
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 10:10:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBd2u-0000XC-FO
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 10:08:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBd2r-0003kH-86
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 10:08:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657721331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B3Lt5aMIZtCmbOX6e0Lw9RjR8fEScdw1da+k9lLTPzo=;
 b=ZQ7ZHiyE+G06blJ8Wym8xBm5NdDo5JnZ4Cohb1ofQW7oum8G3UfPdEeRlw+sNbbeqm6A9A
 ZoKLVJ/FAn80e4admF5Ua3aea3nAHEs/MDf2Kqld1I+gVPJWcoyL/2wfKe3Asf6M/sIcma
 /IxmD2P9yj56J/RswCKJNwsRldFTiQg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-H0I9o79JOVqsyoUl-YInYg-1; Wed, 13 Jul 2022 10:08:50 -0400
X-MC-Unique: H0I9o79JOVqsyoUl-YInYg-1
Received: by mail-ed1-f72.google.com with SMTP id
 h17-20020a056402281100b0043aa5c0493dso8513686ede.16
 for <qemu-devel@nongnu.org>; Wed, 13 Jul 2022 07:08:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=B3Lt5aMIZtCmbOX6e0Lw9RjR8fEScdw1da+k9lLTPzo=;
 b=dbQD3UD8AmAnpnvUUx2YeCv3UU5M+rj8yjOFd59JNf37aBwoWKqwVnRoqbwNzosFPK
 86JIQ1BfAJ9MDQ3T2uZDmGQhC3Elds4ywu4SLCxauSv/xi+Bk29zdQnb/yY1w/jNgSFI
 GeViWj7pjl10zgm3LumtSTDj7f3Za6o72U5zUU1kTgHd+k97HIsS/icDLR/7jmXllGcB
 sQO+lNbytkvB7YzXPzBD0aHFp6vzJTaWjSWtIAqo38ZyF/LajhUlhpLivAikW9GaWZnW
 4dtBjeV+3x7uqmgfBN/m9yHLONM7z2XyKSHpbk2Gdt9arNlyr8K2aDr97gjXFXTNc+O5
 n4Ew==
X-Gm-Message-State: AJIora/q3nhRXPQVk1y9OgkQnRczsd3fEm20lBdc1QyxrmOUN2gx7xNA
 wUDtHpf88YAINg+klp2Zcy9mpte6LMaPkr/ySDj14bmmzpf4Hn8hOzPud/nsekXZYawc3t+dhWc
 9Im1HcqRo1K/N6wE=
X-Received: by 2002:a05:6402:2689:b0:43a:dc35:11bb with SMTP id
 w9-20020a056402268900b0043adc3511bbmr5419632edd.262.1657721329171; 
 Wed, 13 Jul 2022 07:08:49 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sMORld5B/eFvgDKOTtVedgfFr2u3eu7jVPT4MqCGtNLdTUMShCqIcRS3jjjpBAXwKzYw4nTw==
X-Received: by 2002:a05:6402:2689:b0:43a:dc35:11bb with SMTP id
 w9-20020a056402268900b0043adc3511bbmr5419587edd.262.1657721328923; 
 Wed, 13 Jul 2022 07:08:48 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 b18-20020a056402139200b0043a4a5813d8sm8027572edv.2.2022.07.13.07.08.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jul 2022 07:08:48 -0700 (PDT)
Message-ID: <a68e0f09-339d-72eb-87e7-5ec3ce9f8ca7@redhat.com>
Date: Wed, 13 Jul 2022 16:08:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC v3 3/8] block: pass size to bdrv_unregister_buf()
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Alberto Faria <afaria@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eric Blake <eblake@redhat.com>,
 sgarzare@redhat.com, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Fam Zheng <fam@euphon.net>, Yanan Wang <wangyanan55@huawei.com>
References: <20220708041737.1768521-1-stefanha@redhat.com>
 <20220708041737.1768521-4-stefanha@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220708041737.1768521-4-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 08.07.22 06:17, Stefan Hajnoczi wrote:
> The only implementor of bdrv_register_buf() is block/nvme.c, where the
> size is not needed when unregistering a buffer. This is because
> util/vfio-helpers.c can look up mappings by address.
>
> Future block drivers that implement bdrv_register_buf() may not be able
> to do their job given only the buffer address. Add a size argument to
> bdrv_unregister_buf().
>
> Also document the assumptions about
> bdrv_register_buf()/bdrv_unregister_buf() calls. The same <host, size>
> values that were given to bdrv_register_buf() must be given to
> bdrv_unregister_buf().
>
> gcc 11.2.1 emits a spurious warning that img_bench()'s buf_size local
> variable might be uninitialized, so it's necessary to silence the
> compiler.
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   include/block/block-global-state.h          | 5 ++++-
>   include/block/block_int-common.h            | 2 +-
>   include/sysemu/block-backend-global-state.h | 2 +-
>   block/block-backend.c                       | 4 ++--
>   block/io.c                                  | 6 +++---
>   block/nvme.c                                | 2 +-
>   qemu-img.c                                  | 4 ++--
>   7 files changed, 14 insertions(+), 11 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


