Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 974D76F84E1
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 16:31:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puwSr-0000yb-PD; Fri, 05 May 2023 10:31:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1puwSp-0000xi-A9
 for qemu-devel@nongnu.org; Fri, 05 May 2023 10:31:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1puwSm-00066L-SF
 for qemu-devel@nongnu.org; Fri, 05 May 2023 10:31:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683297072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7IAmzZAVl9Ma5GdYJJCNFIlhk3LLvI5uITg9ilAzfT4=;
 b=ZH2YD47p+wQLW9H5OkQ/sYulqSxo47s54cG5XmD4fkm9yI5u6lH6lqQ303E9/eDfVgrG83
 rF6BwhITcyrYBwo6Tgsdpy6SxC0i3f0MUXZeMl92WKTf8mb7ezum1VU268LFgRryvnHlDG
 cGy9bOZvAdso3MaoAVhGJCvaHfvRJIU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-106-3Il-K03vO1mpfLTKJah93Q-1; Fri, 05 May 2023 10:31:10 -0400
X-MC-Unique: 3Il-K03vO1mpfLTKJah93Q-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-9532170e7d3so176698866b.0
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 07:31:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683297069; x=1685889069;
 h=content-transfer-encoding:in-reply-to:subject:from:content-language
 :references:cc:to:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7IAmzZAVl9Ma5GdYJJCNFIlhk3LLvI5uITg9ilAzfT4=;
 b=HYSKz8xyS8RQJ8RbndMgfaR17xzzKUM0UlDZ9EQwCV4pabrZLvR4Ri2QqDNCpVdho4
 vAUxMgBta77OCfI2Paja0S7WceZTER4dNmOAFO3/n/ELQLJVSv645oICtF4PZLbBXLlW
 T+MiENAzA8kAu880ITpaC/VxLWpvxefsmD7uqXAH5Akn6gE5Li1wrjioGW829K3DRFb8
 7+bqltX6D3hN67/LIkxRr5wwKpvzYQp+8lUqWAJx6T1F6D/+Aef1duEvSKfW6m65cgk/
 b3gooKCw+XwFabwBHYKnbEi13MY2ltw6Qheg7KhYhLXnsX+RMz4WIKXPo2/s/lRiNg6g
 zmrA==
X-Gm-Message-State: AC+VfDzqOBF6nMRrRVYWlyRML6KgohiKuECJRs2deZZL9klRXIfm6C1i
 //BxBShOLFvYT/xe+AebGMvdIWIlCK3WuWwwZP6egj0ANDVWYTY2U0C4FDq8hV0+w9BO4169igg
 qMalkzf35QtG7dMs=
X-Received: by 2002:a17:907:da1:b0:94f:6ca2:e34 with SMTP id
 go33-20020a1709070da100b0094f6ca20e34mr1523527ejc.66.1683297069162; 
 Fri, 05 May 2023 07:31:09 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4bYfNkJd39hcw9H7Ek0BEw1gXffqe/BDvFHlu0WGATa6KfUXbBAOP4ceJqP1uz27nsPcWt+Q==
X-Received: by 2002:a17:907:da1:b0:94f:6ca2:e34 with SMTP id
 go33-20020a1709070da100b0094f6ca20e34mr1523495ejc.66.1683297068868; 
 Fri, 05 May 2023 07:31:08 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-91.web.vodafone.de.
 [109.43.179.91]) by smtp.gmail.com with ESMTPSA id
 gz5-20020a170907a04500b0094f663bced2sm1020093ejc.33.2023.05.05.07.31.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 May 2023 07:31:08 -0700 (PDT)
Message-ID: <5554d26d-b932-c3be-7333-a2e385066ef3@redhat.com>
Date: Fri, 5 May 2023 16:31:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20230505123524.23401-1-farosas@suse.de>
 <20230505123524.23401-4-farosas@suse.de>
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 3/3] tests/qtest: Don't run cdrom tests if no
 accelerator is present
In-Reply-To: <20230505123524.23401-4-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.28, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 05/05/2023 14.35, Fabiano Rosas wrote:
> On a build configured with: --disable-tcg --enable-xen it is possible
> to produce a QEMU binary with no TCG nor KVM support. Skip the test if
> that's the case.
> 
> Fixes: 0c1ae3ff9d ("tests/qtest: Fix tests when no KVM or TCG are present")
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   tests/qtest/cdrom-test.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/tests/qtest/cdrom-test.c b/tests/qtest/cdrom-test.c
> index 26a2400181..09655e6ff0 100644
> --- a/tests/qtest/cdrom-test.c
> +++ b/tests/qtest/cdrom-test.c
> @@ -205,6 +205,11 @@ int main(int argc, char **argv)
>   
>       g_test_init(&argc, &argv, NULL);
>   
> +    if (!qtest_has_accel("tcg") && !qtest_has_accel("kvm")) {
> +        g_test_skip("No KVM or TCG accelerator available");
> +        return 0;
> +    }

You only nee to skip the test if running with x86 or s390x, all other 
targets use only "-accel qtest" IIRC, so those shoul be fine.

  Thomas


