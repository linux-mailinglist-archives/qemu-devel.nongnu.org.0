Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D37DA610B96
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 09:51:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooK8Q-0002rL-3m; Fri, 28 Oct 2022 03:50:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooK7r-0002nl-Pn
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 03:50:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooK7q-0007cZ-0v
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 03:49:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666943396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=djLB6Kvh6ALHSa0RuaTm7tEhlXLUmsGD4pHxfvrMU58=;
 b=IV8El63bbQl79fzvE1TVKIfUjp3LDFiZO+U6PkV/SG/zJmMJq9s1Vx0/Xiw0uhVq5e5v0O
 MfkDV0zaTo1dh0OQc44HiIXQIML8Ql9+j4Rlt4gkymxfWVvIEQIlljlOrWSlec7+GGX3dy
 unTwTn4J8oIIMWIq5yPWizCIRnpAg+U=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-269-6EXJyikpMamBwG6mw39Whw-1; Fri, 28 Oct 2022 03:49:55 -0400
X-MC-Unique: 6EXJyikpMamBwG6mw39Whw-1
Received: by mail-wr1-f72.google.com with SMTP id
 w23-20020adf8bd7000000b002358f733307so1046518wra.17
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 00:49:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=djLB6Kvh6ALHSa0RuaTm7tEhlXLUmsGD4pHxfvrMU58=;
 b=4ocGtZ49hy+oqSIOzZp9V+6j3nVr7EMnEh/IelmNkWIu8djSkGCOl/55k/6YXm5TCI
 gct2Oz2agH3nt3svUNeWVpCseiy6CkWWk5508vm2508cix+A1GAsJmaZne5/YcBnOVB1
 +xhWwKVLL4bVByhYspTpnkFHcvRNLZKhTjdUg4Kdby9GwjCATvI2FxAfU0dsxmBkcaSx
 edVjhzlXX9Wz3pstjoEdzwoafbePgXERpGyEeK3xykRmXe/gwGguI6nG+CZvLQgjaSba
 et0o8a73bziA7cNl5IgfU4tDwJBTliDRqm7/M9qhAAg7iASpS6xtha3sSHehkbRAfz3L
 e7MQ==
X-Gm-Message-State: ACrzQf1HUH5RTJSqJqHJcSsrs0jB7gqAGeWih705Emg2d4W4rZhlmWhY
 ioEm5B6P3Cy/jR4ou927iWV9gOkGx8jKB+01RoWuxC3+zLwKAsPTde+M2PJVDNalvOoLPB24bKx
 ulV3EVREiqAPPsus=
X-Received: by 2002:a5d:6901:0:b0:22f:b097:7de6 with SMTP id
 t1-20020a5d6901000000b0022fb0977de6mr35727178wru.373.1666943394142; 
 Fri, 28 Oct 2022 00:49:54 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM616Ye0AzbT1RD/DDmGzf5foNqhOfMVbPTREqb3dBl3oJOJmnH+h/jqhpdDr9OKRBDLaSztXQ==
X-Received: by 2002:a5d:6901:0:b0:22f:b097:7de6 with SMTP id
 t1-20020a5d6901000000b0022fb0977de6mr35727169wru.373.1666943393880; 
 Fri, 28 Oct 2022 00:49:53 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-14.web.vodafone.de.
 [109.43.177.14]) by smtp.gmail.com with ESMTPSA id
 i8-20020a1c5408000000b003c5571c27a1sm4274620wmb.32.2022.10.28.00.49.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 00:49:53 -0700 (PDT)
Message-ID: <6142892b-a78a-bdc3-6a94-de7533386713@redhat.com>
Date: Fri, 28 Oct 2022 09:49:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v6 04/11] tests/qtest: device-plug-test: Reverse the usage
 of double/single quotes
Content-Language: en-US
To: Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20221028045736.679903-1-bin.meng@windriver.com>
 <20221028045736.679903-5-bin.meng@windriver.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221028045736.679903-5-bin.meng@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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

On 28/10/2022 06.57, Bin Meng wrote:
> The usage of double/single quotes in test_q35_pci_unplug_json_request()
> should be reversed to work on both win32 and non-win32 platforms:
> 
> - The value of -device parameter needs to be surrounded by "" as
>    Windows does not drop '' when passing it to QEMU which causes
>    QEMU command line option parser failure.
> - The JSON key/value pairs need to be surrounded by '' to make the
>    JSON parser happy on Windows.
> 
> Fixes: a12f1a7e56b7 ("tests/x86: Add subtest with 'q35' machine type to device-plug-test")
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> 
> ---
> 
> Changes in v6:
> - new patch: "tests/qtest: device-plug-test: Reverse the usage of double/single quotes"
> 
>   tests/qtest/device-plug-test.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/qtest/device-plug-test.c b/tests/qtest/device-plug-test.c
> index 3f44f731d1..5a6afa2b57 100644
> --- a/tests/qtest/device-plug-test.c
> +++ b/tests/qtest/device-plug-test.c
> @@ -112,16 +112,16 @@ static void test_pci_unplug_json_request(void)
>   
>   static void test_q35_pci_unplug_json_request(void)
>   {
> -    const char *port = "-device '{\"driver\": \"pcie-root-port\", "
> -                                      "\"id\": \"p1\"}'";
> +    const char *port = "-device \"{'driver': 'pcie-root-port', "
> +                                  "'id': 'p1'}\"";
>   
> -    const char *bridge = "-device '{\"driver\": \"pcie-pci-bridge\", "
> -                                   "\"id\": \"b1\", "
> -                                   "\"bus\": \"p1\"}'";
> +    const char *bridge = "-device \"{'driver': 'pcie-pci-bridge', "
> +                                    "'id': 'b1', "
> +                                    "'bus': 'p1'}\"";
>   
> -    const char *device = "-device '{\"driver\": \"virtio-mouse-pci\", "
> -                                   "\"bus\": \"b1\", "
> -                                   "\"id\": \"dev0\"}'";
> +    const char *device = "-device \"{'driver': 'virtio-mouse-pci', "
> +                                    "'bus': 'b1', "
> +                                    "'id': 'dev0'}\"";
>   
>       QTestState *qtest = qtest_initf("-machine q35 %s %s %s",
>                                       port, bridge, device);

Reviewed-by: Thomas Huth <thuth@redhat.com>


