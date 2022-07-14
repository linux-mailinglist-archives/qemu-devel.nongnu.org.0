Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6C45749BE
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 11:56:14 +0200 (CEST)
Received: from localhost ([::1]:38618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBvZs-0000CD-DV
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 05:56:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBvKI-0003KD-Fy
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:40:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBvKF-0005hn-Pt
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:40:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657791603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W4Y1tnkTtMc0/phWCIquUwDvzi+KWFuDaKziS4LyO8E=;
 b=TKTgubUEYuT6TvC9awbjtatOL7VQS1/BxVPgKSfla/vdcnxwbp7279mbk/biKRirMSmIQa
 Y7qQFUi5pFmjY//Wyav9n0qu6XBt41OkPYV1EQPSnq27G/IAbi6gRriMhmmi5DNrkGB2/b
 Yke0zJ9/cJ4gqwo83W4yElyLloxkY1c=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-510-89DDSR3gMQGGKXVRqzwAvw-1; Thu, 14 Jul 2022 05:40:01 -0400
X-MC-Unique: 89DDSR3gMQGGKXVRqzwAvw-1
Received: by mail-ej1-f71.google.com with SMTP id
 hr24-20020a1709073f9800b0072b57c28438so549978ejc.5
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 02:40:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=W4Y1tnkTtMc0/phWCIquUwDvzi+KWFuDaKziS4LyO8E=;
 b=lreWTRQ3PUsqIbJUJZoGbE5BHOJEPglRa05OMc9+CSxhx6uix8+3eTlbc+2ZDjA5bC
 AB94ThDxqGOkuOL9y9goxQBTlDiO1c+tPu9tS08bGGyKymqUp3yvyQDUx754xSvkruH6
 SIHGvoLu+vS717i2dElHevCGxHStjJ7nhtaGk8h5b2hjlhMej3CqLwKKD24LnhmSJHOw
 yQnJlvQ6eS1/xbATFSbia3XNR13cJQUkyywBN18pq+sRaSzTlcg00VoTIVZVN41sJY1F
 cU9Z+3l/R/VCC2t38AsD8SfXd4jvOSGhTCBTu02Ewb5VQLNNjNqre5gYdR5k+ahJ86fV
 11Ag==
X-Gm-Message-State: AJIora9xa1TCa9kJCUUmDvD3zfxkzFXKVGLm7mkm6usr/9zxREZe5liz
 yNt6H5rF0qgkrLjtqmdFLIvJHxT9YXVpHhG1l2Df2qUetjYejqATTww8VtxZAwjnOAV+D5T8Lwe
 BOCXqZHblChdVIWM=
X-Received: by 2002:a17:907:2722:b0:72b:735a:d3b4 with SMTP id
 d2-20020a170907272200b0072b735ad3b4mr7972183ejl.363.1657791599925; 
 Thu, 14 Jul 2022 02:39:59 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vj8TlgPtllUZb+bZOXEZALuGLqF8FuNWOTkG7XITdgx9b7XKJVFxZ0dbSC6yZuN8RMqK+sWg==
X-Received: by 2002:a17:907:2722:b0:72b:735a:d3b4 with SMTP id
 d2-20020a170907272200b0072b735ad3b4mr7972156ejl.363.1657791599757; 
 Thu, 14 Jul 2022 02:39:59 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170906218200b0072a815f3344sm480203eju.137.2022.07.14.02.39.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jul 2022 02:39:59 -0700 (PDT)
Message-ID: <073257d3-745a-2823-1853-316bdc3f4a73@redhat.com>
Date: Thu, 14 Jul 2022 11:39:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC v3 6/8] stubs: add memory_region_from_host() and
 memory_region_get_fd()
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
 <20220708041737.1768521-7-stefanha@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220708041737.1768521-7-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
> The blkio block driver will need to look up the file descriptor for a
> given pointer. This is possible in softmmu builds where the memory API
> is available for querying guest RAM.
>
> Add stubs so tools like qemu-img that link the block layer still build
> successfully. In this case there is no guest RAM but that is fine.
> Bounce buffers and their file descriptors will be allocated with
> libblkio's blkio_alloc_mem_region() so we won't rely on QEMU's
> memory_region_get_fd() in that case.
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   stubs/memory.c    | 13 +++++++++++++
>   stubs/meson.build |  1 +
>   2 files changed, 14 insertions(+)
>   create mode 100644 stubs/memory.c

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


