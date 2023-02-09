Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F224690B0E
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 14:55:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ7Oq-0003XU-3t; Thu, 09 Feb 2023 08:55:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pQ7Oo-0003RH-9e
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 08:55:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pQ7Ok-000685-4s
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 08:55:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675950936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w4zc5PCCJvTHSl2VZFoHUl6qHVjVz+88ncNrPHJG39A=;
 b=hC0GE6KIsS2P8wjdpNsSrb8+gnKNyUmq65EW6ITOJcAne8bF//8nHii+7BDX1lEHk5OxOD
 MiMY1sD7mNxmCa1QBzEBiAGmwweslGnR/IQlsYLpfZq5A/LPpe/cAcyHtGCB0o0o8W3Ldb
 D/HxUB7IhQHV5NkDfA+qHyhTzJMclsw=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-477-60udFrkhMhuTfpnE1DePLQ-1; Thu, 09 Feb 2023 08:55:35 -0500
X-MC-Unique: 60udFrkhMhuTfpnE1DePLQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 x17-20020a05620a449100b00731b7a45b7fso1265566qkp.2
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 05:55:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w4zc5PCCJvTHSl2VZFoHUl6qHVjVz+88ncNrPHJG39A=;
 b=1MkR6Yj9EOfrptHdLXQHXH3dbwLv73xBATs2XxzC2tv94Sq7NbtzI6ckjzMpyVaWkt
 /fMYY1XBs71juCzGetjp+FOShouh2RNoXqV+X/OETdkdjv8/y8ZdPaaUJziCpuOFLtQ7
 WGZmAldcj93EsOvjn5jjgyNImrMlrBBhAO6D29dzq1UjZsmi+CPuBdqwod1000hCSu0L
 yh2mCgeH57b7CoxvmLTJ2yT04b6wXNYvfNkXvKe5cfwSRYFSl4I4tyXEvKjJJiOutisf
 k0UfrFTlRKdc8HaXscdYUnn8QuI0TfSJI+9/6PU67QBlyj1M07hxMj7ihJ3b+cCUtVyr
 1lNw==
X-Gm-Message-State: AO0yUKWuTb4VsiQszj4JGynBI+qlQ5Ft1Oh4cSsE4a1EAR0cV9GMMJnT
 v4n9CJP6SlsxmRX0w8ADJDRzGKVgZt67kI8GIi88G8TOMVvmTI/4uAPCGeeLm3lQi8yee6HcFen
 vDvFnPkCKgQgK6yk=
X-Received: by 2002:a05:622a:1052:b0:3b6:313a:e27a with SMTP id
 f18-20020a05622a105200b003b6313ae27amr19666154qte.40.1675950935184; 
 Thu, 09 Feb 2023 05:55:35 -0800 (PST)
X-Google-Smtp-Source: AK7set9sQpVcC+ry93i8fc1bIHYgCXfj2+QsgVsGRTt1mjCrCN05M+qIvljF3RyWxLERhrMkzYIL5g==
X-Received: by 2002:a05:622a:1052:b0:3b6:313a:e27a with SMTP id
 f18-20020a05622a105200b003b6313ae27amr19666129qte.40.1675950934945; 
 Thu, 09 Feb 2023 05:55:34 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-209.web.vodafone.de.
 [109.43.176.209]) by smtp.gmail.com with ESMTPSA id
 o13-20020ac8698d000000b003ba19e53e43sm1290260qtq.25.2023.02.09.05.55.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 05:55:34 -0800 (PST)
Message-ID: <f2082d0a-0064-958f-e67f-bd92a9a23a5a@redhat.com>
Date: Thu, 9 Feb 2023 14:55:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] tests/qtest/npcm7xx_pwm-test: Be less verbose unless V=2
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Havard Skinnemoen <hskinnemoen@google.com>,
 Tyrone Ting <kfting@nuvoton.com>
References: <20230209135047.1753081-1-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230209135047.1753081-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

On 09/02/2023 14.50, Peter Maydell wrote:
> The npcm7xx_pwm-test produces a lot of output at V=1, which
> means that on our CI tests the log files exceed the gitlab
> 500KB limit. Suppress the messages about exactly what is
> being tested unless at V=2 and above.
> 
> This follows the pattern we use with qom-test.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> An example job log that got truncated because of this is:
> https://gitlab.com/qemu-project/qemu/-/jobs/3742560168

Reviewed-by: Thomas Huth <thuth@redhat.com>


