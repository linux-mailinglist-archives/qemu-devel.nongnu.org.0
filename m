Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D0D649F0C
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 13:45:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4i9t-0001Tk-Ud; Mon, 12 Dec 2022 07:43:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p4i9q-0001TQ-LN
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 07:43:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p4i9o-0004oG-SM
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 07:43:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670849023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O4MGQCuTOyzayUSFNUpN0X+InL/+GMmjkp7efri2xOo=;
 b=YSi7CZ6uSnlBa11qWOSf6+fu58yuew1OFNqJ2DBOMaKObzUu0wmaRmRhwBm19r90Pxdy4w
 Y7oqyZa/9mN/5r3gR9MwpSvNbYnTNMTEvCs4if3i3dx7FvzP4CkoyUV08QGX3+fA5Om4W4
 3UpGioTXR2coDPSNGDpu/tpQ06Mq7eo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-368-uk3XRvJNNu-JD3OsP11uew-1; Mon, 12 Dec 2022 07:43:40 -0500
X-MC-Unique: uk3XRvJNNu-JD3OsP11uew-1
Received: by mail-wr1-f70.google.com with SMTP id
 v14-20020adf8b4e000000b0024174021277so2211231wra.13
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 04:43:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O4MGQCuTOyzayUSFNUpN0X+InL/+GMmjkp7efri2xOo=;
 b=kGH6szyqjB723o2upPIwmcpGBdefqcs65cz2boynLjzSUeU/x6ZCZ/eSOvB+FLDrs6
 k4uoBBb7ap8SAmPTSBuce7Myyfv47joymmKp9GHz9WHJUp+ykLro9ydosJfA1uWaTIWF
 ZvQcp9uKSDdcVHqd/LhOnJNkK2qCjNFEsbZanNXo+O9AotBq3uv69QMF932vrF5mYH7r
 JORDrA06S3S/PwGdqwa0So1Cf6aqT0EfqE4nbSTzDpl6OtmuM0YJLdJfHzu5vVMiVP3K
 TPKQ5kd580lPCY3thfvk0Gb/Vya2qYhTQOfDJgh/Bg9DVgnE2gx3jO7HjZOEWjqCx9cs
 Vj/w==
X-Gm-Message-State: ANoB5plGrrddn2DonNWBRruRjg9ZrOWcqII1ojTnxZO/qXZ6GRlv46YN
 /ZmCexJmXdqFXTvH1ynMhp665eb0KrShPyFyEv0miVz177e9SG7Z6kitEf/AEmxHham5hklIUG0
 PqnzCMuiLu9etRkw=
X-Received: by 2002:a05:600c:a4f:b0:3c6:e63e:89b3 with SMTP id
 c15-20020a05600c0a4f00b003c6e63e89b3mr12742163wmq.15.1670849019301; 
 Mon, 12 Dec 2022 04:43:39 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5ZCe8x/aJvg/71Rs2x8PjWKiOv5LuU9upncPvdtElEW7Ii0dWipacfPNKCUkadseKSPX7rUg==
X-Received: by 2002:a05:600c:a4f:b0:3c6:e63e:89b3 with SMTP id
 c15-20020a05600c0a4f00b003c6e63e89b3mr12742143wmq.15.1670849018976; 
 Mon, 12 Dec 2022 04:43:38 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-178-127.web.vodafone.de.
 [109.43.178.127]) by smtp.gmail.com with ESMTPSA id
 m16-20020a7bcb90000000b003cf37c5ddc0sm8933466wmi.22.2022.12.12.04.43.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 04:43:38 -0800 (PST)
Message-ID: <f88cceed-4df3-ff08-86d8-07807e48c9b0@redhat.com>
Date: Mon, 12 Dec 2022 13:43:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] tests/qtest/vhost-user-blk-test: don't abort all qtests
 on missing envar
Content-Language: en-US
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
Cc: Coiby Xu <coiby.xu@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <E1oybRD-0005D5-5r@lizzy.crudebyte.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <E1oybRD-0005D5-5r@lizzy.crudebyte.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 25/11/2022 16.58, Christian Schoenebeck wrote:
> This test requires environment variable QTEST_QEMU_STORAGE_DAEMON_BINARY
> to be defined for running. If not, it would immediately abort all qtests
> and prevent other, unrelated tests from running.
> 
> To fix that, just skip vhost-user-blk-test instead and log a message
> about missing environment variable.
> 
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
> 
>   I also tried g_test_skip(errmsg) from the setup handlers instead, but it
>   always caused the tests to abort with an error:
>   
>   ../tests/qtest/libqtest.c:179: kill_qemu() tried to terminate QEMU process
>   but encountered exit status 1 (expected 0)
>   
>   I haven't further investigated.
> 
>   tests/qtest/vhost-user-blk-test.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/tests/qtest/vhost-user-blk-test.c b/tests/qtest/vhost-user-blk-test.c
> index 07a4c2d500..dc37f5af4d 100644
> --- a/tests/qtest/vhost-user-blk-test.c
> +++ b/tests/qtest/vhost-user-blk-test.c
> @@ -983,6 +983,12 @@ static void register_vhost_user_blk_test(void)
>           .before = vhost_user_blk_test_setup,
>       };
>   
> +    if (!getenv("QTEST_QEMU_STORAGE_DAEMON_BINARY")) {
> +        g_test_message("QTEST_QEMU_STORAGE_DAEMON_BINARY not defined, "
> +                       "skipping vhost-user-blk-test");
> +        return;
> +    }
> +
>       /*
>        * tests for vhost-user-blk and vhost-user-blk-pci
>        * The tests are borrowed from tests/virtio-blk-test.c. But some tests

Thanks, queued to my testing-next branch now:

  https://gitlab.com/thuth/qemu/-/commits/testing-next/

  Thomas


