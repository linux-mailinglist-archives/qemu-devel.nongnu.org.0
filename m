Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C6B68DA04
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 15:01:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPOVn-00017y-8F; Tue, 07 Feb 2023 08:59:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPOVm-00017n-0h
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 08:59:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPOVk-000187-IS
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 08:59:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675778392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cj9lpDvdlHSTXkSZJTsuM21/dgSN2myfL2vNsvaM9fk=;
 b=cC4UE8iBUttHyW0pQOJWrozhJYxwFNhjmfiGNqQaz3VBTh9KZXnnmhz5l10Yp+NDxP0pE6
 crQzjMQGFFx4blPK9nin8YIMeTQ4+ch8udXsvpujtotbrw0Yk3EYgDc0vkkVOE/vTixDSJ
 oGZ+1ocKxwcsC/obbClmr0wc4VUz1o8=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-386-DhEarB7ZOCSDWPi8XcgPKQ-1; Tue, 07 Feb 2023 08:59:50 -0500
X-MC-Unique: DhEarB7ZOCSDWPi8XcgPKQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 x7-20020a05620a098700b007242aa494ddso9843063qkx.19
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 05:59:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Cj9lpDvdlHSTXkSZJTsuM21/dgSN2myfL2vNsvaM9fk=;
 b=ZPPjC3CkSIf4hsZVA9YuE4Q3JRWB+IulbOv5tmAT3D1G+dV7YjiEfu3/G6PJ16jyJo
 sMPrVAkX62RnaI2TEi8oDd5peJVkwDcxlePV1IIQmgI83rkIHJwVqHAOiHx3bLSItXWU
 VtUJzpG80m/byKAChoV1A1c/GUu3VgZKrkCmph6ayG/rzUDMlGjes2tCmwfsJ1NzwT76
 pSHjGGRB91AWkYFDyCgB19UCk6JCriDkqkku8sYSMSCRhYSRfCm01w2G9kveNxVSlnWY
 IkQJ4qzLn5VB+WSQxiUi1wLxS6EWL/EZa7T7k9NpvAgGa9AWt54Dr0H1M8l472N+Mkzw
 lqRw==
X-Gm-Message-State: AO0yUKUX/huGZCfT4UehpGY18Z2FxZ+NdhyXuqHVc0OChGFZopBK1uST
 jdpOchjpd3G6tnOuLhTWgvWVJL45hnBmm9vmSvlLpuGywaa2aPqv5f9DepRRnldoDSx2Cj/+Xho
 UAQ+cWwFcPD5dGZw=
X-Received: by 2002:ac8:574a:0:b0:3b8:6d3c:a96e with SMTP id
 10-20020ac8574a000000b003b86d3ca96emr5680877qtx.28.1675778390392; 
 Tue, 07 Feb 2023 05:59:50 -0800 (PST)
X-Google-Smtp-Source: AK7set/k+nZ0lZ9dfgpLBuA58YP3pJqWGYrEyX9pmNpAYdpaEZTvFsN8afSYuyp6pM8ubZXPfegHjw==
X-Received: by 2002:ac8:574a:0:b0:3b8:6d3c:a96e with SMTP id
 10-20020ac8574a000000b003b86d3ca96emr5680850qtx.28.1675778390150; 
 Tue, 07 Feb 2023 05:59:50 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-120.web.vodafone.de.
 [109.43.176.120]) by smtp.gmail.com with ESMTPSA id
 j24-20020ac84058000000b003b635a5d56csm9495299qtl.30.2023.02.07.05.59.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 05:59:49 -0800 (PST)
Message-ID: <7d61db17-d0f1-3f9f-8bf6-bf9b0d33a063@redhat.com>
Date: Tue, 7 Feb 2023 14:59:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 06/12] tests/qtest: Skip unplug tests that use missing
 devices
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230206150416.4604-1-farosas@suse.de>
 <20230206150416.4604-7-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230206150416.4604-7-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 06/02/2023 16.04, Fabiano Rosas wrote:
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   tests/qtest/device-plug-test.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/tests/qtest/device-plug-test.c b/tests/qtest/device-plug-test.c
> index 5a6afa2b57..931acbdf50 100644
> --- a/tests/qtest/device-plug-test.c
> +++ b/tests/qtest/device-plug-test.c
> @@ -67,6 +67,11 @@ static void test_pci_unplug_request(void)
>       const char *arch = qtest_get_arch();
>       const char *machine_addition = "";
>   
> +    if (!qtest_has_device("virtio-mouse-pci")) {
> +        g_test_skip("Device virtio-mouse-pci not available");
> +        return;
> +    }
> +
>       if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
>           machine_addition = "-machine pc";
>       }
> @@ -81,6 +86,10 @@ static void test_pci_unplug_request(void)
>   
>   static void test_q35_pci_unplug_request(void)
>   {
> +    if (!qtest_has_device("virtio-mouse-pci")) {
> +        g_test_skip("Device virtio-mouse-pci not available");
> +        return;
> +    }
>   
>       QTestState *qtest = qtest_initf("-machine q35 "
>                                       "-device pcie-root-port,id=p1 "

This seems to break the QEMU coding style ("Mixed declarations (interleaving 
statements and declarations within blocks) are generally not allowed; 
declarations should be at the beginning
of blocks.") ... could you separate the declaration of qtest from its 
initialization now, please?

  Thomas


