Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EC765D5FD
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 15:39:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD4uZ-0001uX-94; Wed, 04 Jan 2023 09:38:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pD4uX-0001uO-Qi
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 09:38:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pD4uW-0000q9-9f
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 09:38:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672843110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qp/xOB1d7IusI/GUpvbOG7vjwn7yjZCfrWJwxfw4bpY=;
 b=W0Irw2qsTmJFbiUvuCtD/N7j3Jg/sWzuAcpXjgP3K4/jfaH+aKOy/xm63X+PPm/i8oiX/X
 YSovd2D2iLkCu2MzKCRA8pARMd+t6YgzE3w12Zib7RbTMzkCxNEVMAhKzPxIbBWRm054Xy
 rUGwi+OdwiXm/sAN00luFHWKeW2ZtUQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-205-x9qq8RUCMJWWHQIvQjYXWg-1; Wed, 04 Jan 2023 09:38:28 -0500
X-MC-Unique: x9qq8RUCMJWWHQIvQjYXWg-1
Received: by mail-wr1-f69.google.com with SMTP id
 v12-20020adfc5cc000000b0029910b64099so1482082wrg.23
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 06:38:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Qp/xOB1d7IusI/GUpvbOG7vjwn7yjZCfrWJwxfw4bpY=;
 b=ceiEdI4r2AF7b+HltC+7bCdgKxch2obCA0ra31voy/64iG1dS3XvEHLQo1jihws7RL
 VnfCsqZKjeoZhHFFwzNCWTZg6z3+o5FTQQg20BEza7CF9bu8jz/crjr1DdTVnWWcHmCR
 jICs3YYCoEJA1tyvmu1H4lHF27ELuyp2mEGzhSaQphObk9PPV8SYQqVdwNZXJbGfaZtt
 1t5NR/TegvuYRIocSIyD5+Ge2HED6E3TodVW7KTIELARDo7mSpSb0SZ4Sc/UdUN9mbHd
 bSLPfGo1sME8amSiYhP5IaWM6FGJ5KJT4K/VB3VCUZmUY2kfd3lD+EpbhQZ+JwJ3zyUl
 t1hQ==
X-Gm-Message-State: AFqh2kpJzwqHxC8Ad5+F8zs5pSSJ7aZriQdIH1Ova9cieSr62sN4/yj7
 9BTY1PYQIHfSPBYx5kHdWtjtPZNJkOS/w9vbARH14oKBErSMpA+rG83qwKNIZzVsCsrCmQw++U6
 ApjsAjua8k7tWMcM=
X-Received: by 2002:a7b:c449:0:b0:3d1:e1f4:21dc with SMTP id
 l9-20020a7bc449000000b003d1e1f421dcmr34198460wmi.14.1672843107775; 
 Wed, 04 Jan 2023 06:38:27 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvtugBzpRMlTQyvogTZ3p8VUfCSe4Vn8H30jgGAQQPt86H+kw1wfbht/PjBla/DxXaBNonuOQ==
X-Received: by 2002:a7b:c449:0:b0:3d1:e1f4:21dc with SMTP id
 l9-20020a7bc449000000b003d1e1f421dcmr34198446wmi.14.1672843107558; 
 Wed, 04 Jan 2023 06:38:27 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-176-239.web.vodafone.de.
 [109.43.176.239]) by smtp.gmail.com with ESMTPSA id
 bi14-20020a05600c3d8e00b003d9ad6783b1sm15688823wmb.6.2023.01.04.06.38.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 06:38:26 -0800 (PST)
Message-ID: <410624e6-7547-8d38-9c05-dc2b51d29221@redhat.com>
Date: Wed, 4 Jan 2023 15:38:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4] tests/qtest: netdev: test stream and dgram backends
Content-Language: en-US
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Weil <sw@weilnetz.de>
References: <20230103110049.120340-1-lvivier@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230103110049.120340-1-lvivier@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.708, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 03/01/2023 12.00, Laurent Vivier wrote:
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> ---
> 
> Notes:
>      v4:
>        - rework EXPECT_STATE()
>        - use g_dir_make_tmp()
>      
>      v3:
>      - Add "-M none" to avoid error:
>        "No machine specified, and there is no default"
>      
>      v2:
>      - Fix ipv6 free port allocation
>      - Check for IPv4, IPv6, AF_UNIX
>      - Use g_mkdtemp() rather than g_file_open_tmp()
>      - Use socketpair() in test_stream_fd()
>      
>      v1: compared to v14 of "qapi: net: add unix socket type support to netdev backend":
>      - use IP addresses 127.0.0.1 and ::1 rather than localhost
> 
>   tests/qtest/meson.build     |   2 +
>   tests/qtest/netdev-socket.c | 434 ++++++++++++++++++++++++++++++++++++
>   2 files changed, 436 insertions(+)
>   create mode 100644 tests/qtest/netdev-socket.c
[...]
> +static void test_stream_fd(void)
> +{
> +    QTestState *qts0, *qts1;
> +    int sock[2];
> +    int ret;
> +
> +    ret = socketpair(AF_LOCAL, SOCK_STREAM, 0, sock);

I've put your patch into my queue, but this seems to fail on Windows:

  https://cirrus-ci.com/task/4869069434781696?logs=main#L6562

Seems like socketpair() does not exist there?

  Thomas


