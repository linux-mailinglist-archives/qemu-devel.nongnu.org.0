Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F9D68D90D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 14:15:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPNo7-0000X1-Ky; Tue, 07 Feb 2023 08:14:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPNo4-0000Wm-Ml
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 08:14:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPNo3-0001jM-8o
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 08:14:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675775682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/qZeBx2G9mQj/fts9n7GeTo70HPDob8E1VOW4qdpWl8=;
 b=Ts2/ZbFpm8A3a7cAx7eEPTKAe0fnxnVQOYb3Rqjuz0pTz5JxncYgD6wP1Iy+u1eML70VRb
 qcaVtyZL5saybNNAQZubJnncHAnjish11iPeZS7QocrRycHUVOOvXDVgKam4kfsfQSA8PX
 n+FgvbZnB7o3fKdXfLny5HQuFZqdtIM=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-324-eGtXEAedPWCSiciVWTwCdw-1; Tue, 07 Feb 2023 08:14:41 -0500
X-MC-Unique: eGtXEAedPWCSiciVWTwCdw-1
Received: by mail-qk1-f199.google.com with SMTP id
 q21-20020a05620a0d9500b0070572ccdbf9so9786261qkl.10
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 05:14:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/qZeBx2G9mQj/fts9n7GeTo70HPDob8E1VOW4qdpWl8=;
 b=aOnCM7XSeEEXJpNLskjiAYOnl/clgjHB/noZvwFE+vVgO6Ks/CY/aKXZun3N2l1wEH
 HNzLNsAQLpHCg464d8TZAmd40VR+oHC2HSvcMNAiImhw9Yc2G6rkGl3IWwANfLpbPOz8
 HbIoVxnCBdHbSpWiHpRsUR19otQEn6JboMdEGfAY174DSEBSyF0LYQH681/aDmOpUN9F
 a4ML1EqNrzw+NffxNQvl+FL2HAwYgggC7EbfOS5wrO+9aRZwxEGVzQnr7jJsYLJpCaA8
 EGAAW6RfxrTnsbJZqY72lqQ/u7+msSYrh5yzZA/QsqTMItWlxU1AtPDu5BSxff84ixvn
 A70Q==
X-Gm-Message-State: AO0yUKWX2PiZfGydLCq02nZcxzQYv62T/chU8FIlYqY1eYYZ6RNGkdcn
 Kzp45rHpx5NplcLyJUat1JJAkkacWo5p6rlOV7la1IJyiL88yPumqreZ9R83BPgdogGOM5QrRyS
 9TENzqsrBRHL9Coc=
X-Received: by 2002:a05:622a:5c9a:b0:3b9:bc8c:c1fa with SMTP id
 ge26-20020a05622a5c9a00b003b9bc8cc1famr24217243qtb.5.1675775680985; 
 Tue, 07 Feb 2023 05:14:40 -0800 (PST)
X-Google-Smtp-Source: AK7set/rfGB4Yv30yQ/SI2dCTv4gfj1swNj3NjVh0DHUJg043A1dG3yBEDqDffbVcaPFsFjrbEdaPA==
X-Received: by 2002:a05:622a:5c9a:b0:3b9:bc8c:c1fa with SMTP id
 ge26-20020a05622a5c9a00b003b9bc8cc1famr24217232qtb.5.1675775680763; 
 Tue, 07 Feb 2023 05:14:40 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-120.web.vodafone.de.
 [109.43.176.120]) by smtp.gmail.com with ESMTPSA id
 b3-20020a05620a0cc300b0071f97a571e7sm9330017qkj.65.2023.02.07.05.14.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 05:14:36 -0800 (PST)
Message-ID: <2ad42008-ad4f-32e1-7adb-19f8882576f4@redhat.com>
Date: Tue, 7 Feb 2023 14:14:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 01/12] tests/qtest: Skip PXE tests for missing devices
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230206150416.4604-1-farosas@suse.de>
 <20230206150416.4604-2-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230206150416.4604-2-farosas@suse.de>
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
> Check if the devices we're trying to add are present in the QEMU
> binary. They could have been removed from the build via Kconfig or the
> --without-default-devices option.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   tests/qtest/pxe-test.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/tests/qtest/pxe-test.c b/tests/qtest/pxe-test.c
> index 52f0b5c67c..62b6eef464 100644
> --- a/tests/qtest/pxe-test.c
> +++ b/tests/qtest/pxe-test.c
> @@ -108,6 +108,10 @@ static void test_batch(const testdef_t *tests, bool ipv6)
>           const testdef_t *test = &tests[i];
>           char *testname;
>   
> +        if (!qtest_has_device(test->model)) {
> +            continue;
> +        }

Reviewed-by: Thomas Huth <thuth@redhat.com>


