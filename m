Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 913A15FB2E1
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 15:08:12 +0200 (CEST)
Received: from localhost ([::1]:49558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiEzS-0002oQ-M0
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 09:08:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oiDO8-0006E3-RT
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 07:25:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oiDNn-00010s-Bt
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 07:25:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665487497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GeONVlDFEwLu43jLvpmdV84vn469sZt1LblgpiNdNOo=;
 b=SDnWgfwm/FmdHJi2rLE/T3YosRNBHouVALHs36iV+II7NZk/cH60kWUgmWc1pmRXZZXJsP
 cyZmXljJo4JN6XvX/tXiXob5t2xd9aru7BnTMMavXnGLl5tmZ4fQuuko7lL0Tp0AJ9TRDJ
 rfKxQ8JSuEw2uAsYx7nTGHNPENAdsss=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-438-YDJfMK9sOYWzboCT7RKvpQ-1; Tue, 11 Oct 2022 07:24:56 -0400
X-MC-Unique: YDJfMK9sOYWzboCT7RKvpQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 h17-20020adfaa91000000b0022e9f2245c8so2851309wrc.19
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 04:24:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GeONVlDFEwLu43jLvpmdV84vn469sZt1LblgpiNdNOo=;
 b=msHMWsUJnmzp/crel+/j26e+ru/rwPMmYcOWUzH9tfRk/F7z6ZtVqrzQW7JBLBZG9e
 Eqs6lgB6GYOV6s3oh43WZQKgZKiV3vNFfy1sBU8lXh0iMOjQLprsHdQQRh23oSJeYzom
 MIr6sp11/CIGqm8W7LYqACJdmU2cHCtm+CWnAkqzXmz4nc+frYRpQREBp4xrCs/+0WLE
 oQY1QMmSJ6+/naQCyt7/YQcO1RmjazyeU+iFhobUu3uL7P7urZYMZe3C2NMW4zXKapk0
 AHP4d6HcXLgvhDQwidoFliCZfV6k5Y8s47hyTUF3zyN7v1xruYANCS9lChqVSdeC1Nwg
 sBXA==
X-Gm-Message-State: ACrzQf0WcK12o1+cjbqQjNLUWBJWeH7H60F7HuVCoK8KIkDPOV3ZwVoz
 lWPh3l0YCNE4xSYuZEWhCL7KUxjO/1Hpr0ShyLuLZUE6tDVjwSrC+cDmX/KiPqSJPjfQG/jEdEW
 jkZbKmGmLS7V+u/c=
X-Received: by 2002:a7b:cb41:0:b0:3b3:34d6:189f with SMTP id
 v1-20020a7bcb41000000b003b334d6189fmr23275861wmj.6.1665487494781; 
 Tue, 11 Oct 2022 04:24:54 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4AX46tz4lKo9g1njQNjpak7bsfCYWvXRfLIHhXpQReXjZspP4jwJCUu0RAOARjP4VzoAC+Bg==
X-Received: by 2002:a7b:cb41:0:b0:3b3:34d6:189f with SMTP id
 v1-20020a7bcb41000000b003b334d6189fmr23275840wmj.6.1665487494542; 
 Tue, 11 Oct 2022 04:24:54 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-11.web.vodafone.de.
 [109.43.176.11]) by smtp.gmail.com with ESMTPSA id
 f9-20020a05600c4e8900b003c6c4639ac6sm1732974wmq.34.2022.10.11.04.24.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Oct 2022 04:24:54 -0700 (PDT)
Message-ID: <283af5bb-9d3a-75fc-7813-7bf0b3737be2@redhat.com>
Date: Tue, 11 Oct 2022 13:24:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v5 5/9] tests/x86: Add 'q35' machine type to hotplug
 hd-geo-test
Content-Language: en-US
To: Michael Labiuk <michael.labiuk@virtuozzo.com>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, den@virtuozzo.com,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20220929223547.1429580-1-michael.labiuk@virtuozzo.com>
 <20220929223547.1429580-6-michael.labiuk@virtuozzo.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220929223547.1429580-6-michael.labiuk@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.934, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 30/09/2022 00.35, Michael Labiuk via wrote:
> Add pci bridge setting to test hotplug.
> Duplicate tests for plugging scsi and virtio devices for q35 machine type.
> 
> Signed-off-by: Michael Labiuk <michael.labiuk@virtuozzo.com>
> ---
>   tests/qtest/hd-geo-test.c | 76 ++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 75 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/hd-geo-test.c b/tests/qtest/hd-geo-test.c
> index 278464c379..4a7628077b 100644
> --- a/tests/qtest/hd-geo-test.c
> +++ b/tests/qtest/hd-geo-test.c
> @@ -963,6 +963,42 @@ static void test_override_scsi_hot_unplug(void)
>       test_override_hot_unplug(args, "scsi-disk0", expected, expected2);
>   }
>   
> +static void test_override_scsi_hot_unplug_q35(void)
> +{
> +    TestArgs *args = create_args();
> +    CHSResult expected[] = {
> +        {
> +            "/pci@i0cf8/pci-bridge@1/pci-bridge@0/scsi@2/channel@0/disk@0,0",
> +            {10000, 120, 30}
> +        },
> +        {
> +            "/pci@i0cf8/pci-bridge@1/pci-bridge@0/scsi@2/channel@0/disk@1,0",
> +            {20, 20, 20}
> +        },
> +        {NULL, {0, 0, 0} }
> +    };
> +    CHSResult expected2[] = {
> +        {
> +            "/pci@i0cf8/pci-bridge@1/pci-bridge@0/scsi@2/channel@0/disk@1,0",
> +            {20, 20, 20}
> +        },
> +        {NULL, {0, 0, 0} }
> +    };
> +
> +    args->argc = append_arg(args->argc, args->argv, ARGV_SIZE,
> +                            g_strdup("-device pcie-root-port,id=p0 "
> +                                     "-device pcie-pci-bridge,bus=p0,id=b1 "
> +                                     "-machine q35"));
> +
> +    add_drive_with_mbr(args, empty_mbr, 1);
> +    add_drive_with_mbr(args, empty_mbr, 1);
> +    add_scsi_controller(args, "virtio-scsi-pci", "b1", 2);
> +    add_scsi_disk(args, 0, 0, 0, 0, 0, 10000, 120, 30);
> +    add_scsi_disk(args, 1, 0, 0, 1, 0, 20, 20, 20);
> +
> +    test_override_hot_unplug(args, "scsi-disk0", expected, expected2);
> +}
> +
>   static void test_override_virtio_hot_unplug(void)
>   {
>       TestArgs *args = create_args();
> @@ -986,6 +1022,41 @@ static void test_override_virtio_hot_unplug(void)
>       test_override_hot_unplug(args, "virtio-disk0", expected, expected2);
>   }
>   
> +static void test_override_virtio_hot_unplug_q35(void)
> +{
> +    TestArgs *args = create_args();
> +    CHSResult expected[] = {
> +        {
> +            "/pci@i0cf8/pci-bridge@1/pci-bridge@0/scsi@2/disk@0,0",
> +            {10000, 120, 30}
> +        },
> +        {
> +            "/pci@i0cf8/pci-bridge@1/pci-bridge@0/scsi@3/disk@0,0",
> +            {20, 20, 20}
> +        },
> +        {NULL, {0, 0, 0} }
> +    };
> +    CHSResult expected2[] = {
> +        {
> +            "/pci@i0cf8/pci-bridge@1/pci-bridge@0/scsi@3/disk@0,0",
> +            {20, 20, 20}
> +        },
> +        {NULL, {0, 0, 0} }
> +    };
> +
> +    args->argc = append_arg(args->argc, args->argv, ARGV_SIZE,
> +                            g_strdup("-device pcie-root-port,id=p0 "
> +                                     "-device pcie-pci-bridge,bus=p0,id=b1 "
> +                                     "-machine q35"));
> +
> +    add_drive_with_mbr(args, empty_mbr, 1);
> +    add_drive_with_mbr(args, empty_mbr, 1);
> +    add_virtio_disk(args, 0, "b1", 2, 10000, 120, 30);
> +    add_virtio_disk(args, 1, "b1", 3, 20, 20, 20);
> +
> +    test_override_hot_unplug(args, "virtio-disk0", expected, expected2);
> +}
> +
>   int main(int argc, char **argv)
>   {
>       Backend i;
> @@ -1035,11 +1106,14 @@ int main(int argc, char **argv)
>                              test_override_virtio_blk_q35);
>               qtest_add_func("hd-geo/override/zero_chs_q35",
>                              test_override_zero_chs_q35);
> -
>               if (qtest_has_device("lsi53c895a")) {
>                   qtest_add_func("hd-geo/override/scsi_q35",
>                                  test_override_scsi_q35);
>               }
> +            qtest_add_func("hd-geo/override/scsi_hot_unplug_q35",
> +                           test_override_scsi_hot_unplug_q35);
> +            qtest_add_func("hd-geo/override/virtio_hot_unplug_q35",
> +                           test_override_virtio_hot_unplug_q35);
>           }
>       } else {
>           g_test_message("QTEST_QEMU_IMG not set or qemu-img missing; "

Acked-by: Thomas Huth <thuth@redhat.com>


