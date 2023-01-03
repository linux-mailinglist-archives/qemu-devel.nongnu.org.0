Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 055CE65C17F
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 15:10:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pChy7-00020O-8Q; Tue, 03 Jan 2023 09:08:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pChy0-0001zz-DC
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 09:08:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pChxy-0003pr-LX
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 09:08:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672754912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=avNssyHUaJ2zv5wBMzMLQNFFvqbUq7e7vQIHFfz4EpY=;
 b=Ha2etVZuQlWlb+Fz0L3J3FqKM/6N+qucrPd8HfniMTJcQ65RXqCCZ1v48PO1/6eHhAk0qt
 hfVrH8NvW7r6zj4+xD+T8NaAsbQyV4Ewhj8EqhQH7mg82jOKAFYXe8bJ7/5J7Cl0aZjMSD
 iDl59BKETt+HYGgQyLxS78jbQ9g7pRM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-486-KG_EHmH1M8WRUyz6gAWBTA-1; Tue, 03 Jan 2023 09:08:31 -0500
X-MC-Unique: KG_EHmH1M8WRUyz6gAWBTA-1
Received: by mail-wm1-f70.google.com with SMTP id
 k20-20020a05600c1c9400b003d9717c8b11so14552464wms.7
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 06:08:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=avNssyHUaJ2zv5wBMzMLQNFFvqbUq7e7vQIHFfz4EpY=;
 b=WaGRFoa4BNOCe2cPQylGPhciWIWsxOZgLi2gzZmJOYOAmt8rtxuHD/+jP8SdpmVxOh
 SJIGRp42/DueC2RNSAZm8RWSwQ4HunVh7/d8Zfh6QtnMpa8UErd3c1N9kAid/x19vGy+
 Pt4kvPHsNT+k1iJ7YZObEFxVJuTe5dxiB3Do3WlBtfA5YYL75CAkPAZaEYmjwv5sIoWN
 Aw5swYCd9y9gAOO2caufdW5vpGWURMzCRu2i6Ou8p62RgY6jR8eORmgq2my1tbVJFqjO
 TQ8sik/kEJk5jZi0yk+spUoaFCYmGNlUXTjrky+aDbStUcOYvGRa8BSliaqm/NpZPaxe
 HGEQ==
X-Gm-Message-State: AFqh2krwIbMpbl0PCSB0myWQ1zYnoX41IVY83DCBhZJM2wggPb5Wbnur
 4fVyL/Zuc56+neLXUCYvgvb6hBw2A+BUidht/bNP+v2gshZdVVcNdaX0JMTFSPrUamnzG5gz1E5
 p6AgpUgpYbx6Ihmc=
X-Received: by 2002:a05:600c:4d22:b0:3cf:a5df:8bb0 with SMTP id
 u34-20020a05600c4d2200b003cfa5df8bb0mr30236112wmp.37.1672754910302; 
 Tue, 03 Jan 2023 06:08:30 -0800 (PST)
X-Google-Smtp-Source: AMrXdXstLl+kt9DclDVmkBzLcc4e7b/cAtK4OVk2sWoskUXtVbszLggF6+6w2MeWrDQTSofG3tXuPA==
X-Received: by 2002:a05:600c:4d22:b0:3cf:a5df:8bb0 with SMTP id
 u34-20020a05600c4d2200b003cfa5df8bb0mr30236098wmp.37.1672754910115; 
 Tue, 03 Jan 2023 06:08:30 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-177-55.web.vodafone.de.
 [109.43.177.55]) by smtp.gmail.com with ESMTPSA id
 j1-20020adfff81000000b0024cb961b6aesm30618059wrr.104.2023.01.03.06.08.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jan 2023 06:08:27 -0800 (PST)
Message-ID: <b9ebccdf-5cea-a051-46e9-f88a8c59a6ef@redhat.com>
Date: Tue, 3 Jan 2023 15:08:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4] tests/qtest: netdev: test stream and dgram backends
Content-Language: en-US
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
References: <20230103110049.120340-1-lvivier@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230103110049.120340-1-lvivier@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.103, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
> +int main(int argc, char **argv)
> +{
> +    int ret;
> +    bool has_ipv4, has_ipv6, has_afunix;
> +    g_autoptr(GError) err = NULL;
> +
> +    g_test_init(&argc, &argv, NULL);
> +
> +    if (socket_check_protocol_support(&has_ipv4, &has_ipv6) < 0) {
> +        g_printerr("socket_check_protocol_support() failed\n");
> +        goto end;
> +    }
> +
> +    tmpdir = g_dir_make_tmp("netdev-socket.XXXXXX", &err);
> +    if (tmpdir == NULL) {
> +        g_error("Can't create temporary directory in %s: %s",
> +                g_get_tmp_dir(), err->message);

Should there also be a "goto end" here?

Apart from that:
Acked-by: Thomas Huth <thuth@redhat.com>


> +    }
> +
> +    if (has_ipv4) {
> +        qtest_add_func("/netdev/stream/inet/ipv4", test_stream_inet_ipv4);
> +        qtest_add_func("/netdev/dgram/inet", test_dgram_inet);
> +        qtest_add_func("/netdev/dgram/mcast", test_dgram_mcast);
> +    }
> +    if (has_ipv6) {
> +        qtest_add_func("/netdev/stream/inet/ipv6", test_stream_inet_ipv6);
> +    }
> +
> +    socket_check_afunix_support(&has_afunix);
> +    if (has_afunix) {
> +        qtest_add_func("/netdev/dgram/unix", test_dgram_unix);
> +        qtest_add_func("/netdev/stream/unix", test_stream_unix);
> +        qtest_add_func("/netdev/stream/unix/abstract",
> +                       test_stream_unix_abstract);
> +        qtest_add_func("/netdev/stream/fd", test_stream_fd);
> +        qtest_add_func("/netdev/dgram/fd", test_dgram_fd);
> +    }
> +
> +end:
> +    ret = g_test_run();
> +
> +    g_rmdir(tmpdir);
> +    g_free(tmpdir);
> +
> +    return ret;
> +}


