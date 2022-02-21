Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB804BDB4A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 18:29:28 +0100 (CET)
Received: from localhost ([::1]:59720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMCV5-0006rn-JQ
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 12:29:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nMCMR-0003D2-RC
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 12:20:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nMCMO-0007Dj-Pi
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 12:20:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645464027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wqUe/unLsq6PlninggDMqYcPk4Pz6ySYa/B0Wp3cDzY=;
 b=b0CWahPitC95yCkAOcxfFsQUAJxH2p5b87XJh65JODVM2gx7lOjVdLAbZHwLDK08fFGa/D
 ut2PJCbJVOLT6COTu05tazrf6WPAWYmzLHkHE6X4udsEv4QqwSttJmpmjvVypLONiBVSpN
 uQ9BS0Zl7J4DBlvJQapTtv5J/tTSoXI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-287-WgVVgPTONVGYS3BxEK4eBA-1; Mon, 21 Feb 2022 12:20:26 -0500
X-MC-Unique: WgVVgPTONVGYS3BxEK4eBA-1
Received: by mail-wr1-f72.google.com with SMTP id
 q21-20020adfab15000000b001e57c9a342aso7685326wrc.6
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 09:20:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wqUe/unLsq6PlninggDMqYcPk4Pz6ySYa/B0Wp3cDzY=;
 b=IG2XEIoyr+0Es1J0Y1DAgJBFK6TxVP49Q6UVEEUniq2bxRaOGU0Sq8TquwzqdTLMiL
 eUeKB+ENR9xRib1t8R2wbmLN0JAW2J/FKPo7oRfN1p7TENszMexf1ZfpZ8kbffFI8LjO
 2+ukj+VmDHyOF/l8jSFiAVXkSK/e9x3XxaSVOls5yCyVRQlPkNKbzLmjbRSxcqBKGXS7
 SMMtaD7HwiQyMFrB4jq476tBTe0RMM3TroIANJCSUiA2M1gBTESismyVTuDqK8fzZKgG
 YRzd1dSMsM5bv/MiTBVx22kG6xlM2V1J+G106qGvzXbBssOcz77wfghJBQGSpn37cZnX
 tRtA==
X-Gm-Message-State: AOAM532Ie9TBcrf50i9O65ffAkWyHNElfdLaTI2/OdTOomICQuTCF2u8
 yri4/Wgxu15PkArNkGn0nGwc2sdUMVc7vfuXpsCptsm1mvmAfFwPP8S0YAo9ES1Rt6SDHJ/dj9Z
 c52rW9TGM1Kwme6A=
X-Received: by 2002:a05:600c:500a:b0:37b:ec27:1a2c with SMTP id
 n10-20020a05600c500a00b0037bec271a2cmr18453544wmr.179.1645464025356; 
 Mon, 21 Feb 2022 09:20:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJya8W7fPqANB9zkHUAFqDW1ioAKN6B8f12YcttMVGqIWG1aArzhQcugAhMsAqTIjpUiS7bFYQ==
X-Received: by 2002:a05:600c:500a:b0:37b:ec27:1a2c with SMTP id
 n10-20020a05600c500a00b0037bec271a2cmr18453531wmr.179.1645464025164; 
 Mon, 21 Feb 2022 09:20:25 -0800 (PST)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218])
 by smtp.gmail.com with ESMTPSA id x18sm50580325wrw.17.2022.02.21.09.20.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 09:20:24 -0800 (PST)
Message-ID: <0713e6e9-5e38-9fb6-1e55-45e6288a60a5@redhat.com>
Date: Mon, 21 Feb 2022 18:20:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] iotests/065: Check for zstd support
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
References: <20220221170845.628429-1-hreitz@redhat.com>
 <20220221170845.628429-2-hreitz@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220221170845.628429-2-hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/02/2022 18.08, Hanna Reitz wrote:
> Some test cases run in iotest 065 require zstd support.  Skip them if
> qemu-img reports it not to be available.
> 
> Reported-by: Thomas Huth <thuth@redhat.com>
> Fixes: 12a936171d71f839dc907ff ("iotest 065: explicit compression type")
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>   tests/qemu-iotests/065 | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/qemu-iotests/065 b/tests/qemu-iotests/065
> index f7c1b68dad..b68df84642 100755
> --- a/tests/qemu-iotests/065
> +++ b/tests/qemu-iotests/065
> @@ -24,7 +24,7 @@ import os
>   import re
>   import json
>   import iotests
> -from iotests import qemu_img, qemu_img_pipe
> +from iotests import qemu_img_pipe, qemu_img_pipe_and_status
>   import unittest
>   
>   test_img = os.path.join(iotests.test_dir, 'test.img')
> @@ -35,8 +35,13 @@ class TestImageInfoSpecific(iotests.QMPTestCase):
>       def setUp(self):
>           if self.img_options is None:
>               self.skipTest('Skipping abstract test class')
> -        qemu_img('create', '-f', iotests.imgfmt, '-o', self.img_options,
> -                 test_img, '128K')
> +        output, status = qemu_img_pipe_and_status('create',
> +                                                  '-f', iotests.imgfmt,
> +                                                  '-o', self.img_options,
> +                                                  test_img, '128K')
> +        if status == 1 and \
> +                "'compression-type' does not accept value 'zstd'" in output:
> +            self.case_skip('zstd compression not supported')
>   
>       def tearDown(self):
>           os.remove(test_img)

Thanks, that fixes 065 for me!

Tested-by: Thomas Huth <thuth@redhat.com>


