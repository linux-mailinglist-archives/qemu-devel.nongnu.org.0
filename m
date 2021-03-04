Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF4832DD6E
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 23:55:36 +0100 (CET)
Received: from localhost ([::1]:49212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHwsZ-0004Ux-BY
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 17:55:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHwUu-0000zF-I8
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 17:31:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHwUs-0005ql-GJ
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 17:31:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614897064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1Yq38rH+APgXZN+1DTn4PcnrpUxOi5wJBsCVN4Br9N8=;
 b=g2D0LslORqo6qPh92wmx45qGEgz8XspR+I3zt8OPif31la64ycit2YD4Xmt+6PXTyA7GBy
 Zp3etKxlfLS5dhD7Sqc1jyma0Pkq4fac3QxdxFl8JG8PlyYHHSseSUgo2CAhF4R7F1OFet
 wwrwh+u9r0SRnGp1C273OCMo+Ld0MJo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-qOMXBINkNCWaUYuwUulDUQ-1; Thu, 04 Mar 2021 17:31:01 -0500
X-MC-Unique: qOMXBINkNCWaUYuwUulDUQ-1
Received: by mail-wr1-f70.google.com with SMTP id l10so124850wry.16
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 14:31:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1Yq38rH+APgXZN+1DTn4PcnrpUxOi5wJBsCVN4Br9N8=;
 b=ClOD8mP9gu3eDmmgCJSq9YhKMma+G0lLuWWs/t7yOIE42+zOoryp99J2TrHS8DZeUf
 RWyWKDwMMwHRgiJLkTuTwf6RNz2L1fdz5nG3waOs0oRdgHDTdu9MO7A7uXGsI0xRTYQR
 xLzJP1P+kiIrr/U5pbX5AbRTJV9anXajSucJeYV3lyw/571Nal7KpY3qex5CNpLKUzXu
 g4wDUrrTnV/WY1nNFc8kIFoApauNBm6U/3eRMHEaq5ceZR1U9F6MqJjYX5Csq3F+qzkL
 /fWh+ONXE/+rStuS0dtMYa8HtacGVA9Yi6CDuSyNIqwcc0VWEQuBEA7lCwUNvXZLvpU3
 0nUg==
X-Gm-Message-State: AOAM532vzyYWu3fpGMWFbAe12UkaqP9gmGD1dTAQ0gQwMsEReDC6KamU
 Miyxere+vDMBfoBKIf0T6vLYz3vNDv+zJZJeQgNE1jH4ZeW4D14IGule/v4Os+NWmOiq1gugku/
 Hfmzj7az11OPOQpw=
X-Received: by 2002:adf:f90d:: with SMTP id b13mr6595454wrr.198.1614897060090; 
 Thu, 04 Mar 2021 14:31:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwgGVz3B2wuxwqQrlcAm8mWaUsXaEQkg5UoJRvGOb/qGmXO8Zso32/WjEBGlhmI8UPTC7gLyw==
X-Received: by 2002:adf:f90d:: with SMTP id b13mr6595439wrr.198.1614897059936; 
 Thu, 04 Mar 2021 14:30:59 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z13sm1005614wrh.65.2021.03.04.14.30.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 14:30:59 -0800 (PST)
Subject: Re: [PATCH v3 3/5] tests/acceptance/boot_linux_console: change URL
 for test_arm_orangepi_bionic_20_08
To: Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-devel@nongnu.org
References: <20210304203540.41614-1-nieklinnenbank@gmail.com>
 <20210304203540.41614-4-nieklinnenbank@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <447b9116-f035-70cc-6f0f-40276b22ea2c@redhat.com>
Date: Thu, 4 Mar 2021 23:30:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210304203540.41614-4-nieklinnenbank@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, thuth@redhat.com, berrange@redhat.com,
 f4bug@amsat.org, b.galvani@gmail.com, qemu-arm@nongnu.org,
 Pavel.Dovgaluk@ispras.ru, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/4/21 9:35 PM, Niek Linnenbank wrote:
> Update the download URL of the Armbian 20.08 Bionic image for
> test_arm_orangepi_bionic_20_08 of the orangepi-pc machine.
> 
> The archive.armbian.com URL contains more images and should keep stable
> for a longer period of time than dl.armbian.com.
> 
> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> ---
>  tests/acceptance/boot_linux_console.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>


