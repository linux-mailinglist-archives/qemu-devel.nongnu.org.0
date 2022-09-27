Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9CC5EC6C9
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 16:48:47 +0200 (CEST)
Received: from localhost ([::1]:40836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odBt8-00054N-0C
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 10:48:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odACH-0005Qc-9G
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 09:00:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odACC-00017n-Qq
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 09:00:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664283617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=No4SXQlwW2cJIOd9ehgVOMnm1ET9u+UhGVVvOc6rVBE=;
 b=KTPOUgr4aJylSGwUfTYRVAXtUdPs5I5CD8K8mocMsu9ImpAgy4E064nBrVPwW71tI8FDRX
 FM4Y/k3PaqUlShj/mMISek4g0VcZkl3zQhy/KA5UXOMPmEZ45hKozMD/W+9BVQ5JDXAFP+
 l/cGe12q/yr9cMqfEqUu0qIBDItiRAI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-481-LAwbZW34NFS4_drOXFGGgA-1; Tue, 27 Sep 2022 09:00:16 -0400
X-MC-Unique: LAwbZW34NFS4_drOXFGGgA-1
Received: by mail-wr1-f71.google.com with SMTP id
 r23-20020adfb1d7000000b002286358a916so2119916wra.3
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 06:00:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=No4SXQlwW2cJIOd9ehgVOMnm1ET9u+UhGVVvOc6rVBE=;
 b=iJ4O6SlMLoF/Fchh7SKkKUL8JW/lXS7HoqY/dRR4lGpk36tEATAg2qufZ6DbY0FJbq
 kEpO6WuQqO9CJvvW+LoqSDoj4P3miYkuVPIjxFebOvCFz44DQHa6q6ubnySHTKlHBAwF
 GcAknimKYq8oE4onCW84+0JWzvg5tnRDm5x2JFAIo1FOIzdLjsbZgh9d9GAZun+32T0Z
 QHUb+0ayTXlhhDWTk0pFP8MJy0LTZVE5uvb1O19AY4G1G2JyfQDQahEq/kHJ1uziZOls
 ymlF2V8AURbLDCwj6PDAEpNTJRMFq6XaSs4hmEGhJNc6m+l3LtzgT4z9AiDZES7Rq4tT
 uteQ==
X-Gm-Message-State: ACrzQf0Zk8GIlG/1BHrLqtxhMxgZ0736w8HLCdQXAh3M7mD0YvGrJfpe
 pCqSTiBpr50a+f8nHsBGFAuCZLCAilCUUe6hPoCQP7Od7rQGSTwsAjqL+HV56jraRjheJzSD8g1
 aCXOMO90TWwsEd5A=
X-Received: by 2002:a05:6000:1845:b0:22a:4b7a:6f55 with SMTP id
 c5-20020a056000184500b0022a4b7a6f55mr16680291wri.288.1664283615140; 
 Tue, 27 Sep 2022 06:00:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7mEMXGXMUafwfAvDqRau83L0h4EjldVlMBwxvUEFO3KPIET7aqRG8MXh6YKIDnAMSlItdvzA==
X-Received: by 2002:a05:6000:1845:b0:22a:4b7a:6f55 with SMTP id
 c5-20020a056000184500b0022a4b7a6f55mr16680264wri.288.1664283614916; 
 Tue, 27 Sep 2022 06:00:14 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-179-30.web.vodafone.de.
 [109.43.179.30]) by smtp.gmail.com with ESMTPSA id
 o16-20020a05600c511000b003a319b67f64sm3209856wms.0.2022.09.27.06.00.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Sep 2022 06:00:14 -0700 (PDT)
Message-ID: <8559e561-1f03-81e6-78e6-ba97bb74bebb@redhat.com>
Date: Tue, 27 Sep 2022 15:00:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 5/7] tests/x86: Add 'q35' machine type to
 override-tests in hd-geo-test
Content-Language: en-US
To: Michael Labiuk <michael.labiuk@virtuozzo.com>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, den@virtuozzo.com
References: <20220920104842.605530-1-michael.labiuk@virtuozzo.com>
 <20220920104842.605530-6-michael.labiuk@virtuozzo.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220920104842.605530-6-michael.labiuk@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 20/09/2022 12.48, Michael Labiuk wrote:
> Signed-off-by: Michael Labiuk <michael.labiuk@virtuozzo.com>
> ---
>   tests/qtest/hd-geo-test.c | 105 +++++++++++++++++++++++++++++++++++---
>   1 file changed, 98 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/qtest/hd-geo-test.c b/tests/qtest/hd-geo-test.c
> index 413cf964c0..58b1107d64 100644
> --- a/tests/qtest/hd-geo-test.c
> +++ b/tests/qtest/hd-geo-test.c
...
> @@ -799,7 +857,23 @@ static void test_override_virtio_blk(void)
>       add_drive_with_mbr(args, empty_mbr, 1);
>       add_virtio_disk(args, 0, "pci.0", 3, 10000, 120, 30);
>       add_virtio_disk(args, 1, "pci.0", 4, 9000, 120, 30);
> -    test_override(args, expected);
> +    test_override(args, "pc", expected);
> +}
> +
> +static void test_override_virtio_blk_q35(void)
> +{
> +    TestArgs *args = create_args();
> +    CHSResult expected[] = {
> +        {"/pci@i0cf8/pci-bridge@2/scsi@3/disk@0,0", {10000, 120, 30} },
> +        {"/pci@i0cf8/pci-bridge@2/scsi@4/disk@0,0", {9000, 120, 30} },
> +        {NULL, {0, 0, 0} }
> +    };
> +    add_drive_with_mbr(args, empty_mbr, 1);
> +    add_drive_with_mbr(args, empty_mbr, 1);
> +    setup_pci_bridge(args, "pcie.0", "br");
> +    add_virtio_disk(args, 0, "br", 3, 10000, 120, 30);
> +    add_virtio_disk(args, 1, "br", 4, 9000, 120, 30);
> +    test_override(args, "pc", expected);

Shouldn't that use "q35" as machine instead?

  Thomas


