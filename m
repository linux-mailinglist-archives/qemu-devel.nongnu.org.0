Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCA86D030E
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 13:24:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phqO7-00052T-4Y; Thu, 30 Mar 2023 07:24:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1phqO5-00051z-BE
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 07:24:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1phqO3-0006Dj-1h
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 07:24:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680175450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VPaykr/xj2oLc8qsIISK0pGJm888wbt9oTCToJLEbe4=;
 b=ADzQkOyWiwWUh/sLf2mb4Fhs58gq3epFWnAugh+rzxnBz8E10vu3lIesKHpTC1F5FD5IZs
 m4c6wPXAczZSzLsmhhadgYW7dxVtf5yqZtnWAXP+oZkzTcON5OLWIfNJHyt8XORoSu+eKb
 HQvMaD2TKx2RaJM/1gjw2zsthIW3Un8=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-235-_fJVgB6UP8CxkhiKMthcfg-1; Thu, 30 Mar 2023 07:24:08 -0400
X-MC-Unique: _fJVgB6UP8CxkhiKMthcfg-1
Received: by mail-qt1-f200.google.com with SMTP id
 r4-20020ac867c4000000b003bfefb6dd58so12300537qtp.2
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 04:24:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680175448;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VPaykr/xj2oLc8qsIISK0pGJm888wbt9oTCToJLEbe4=;
 b=fx6H3itial4G9mmJqvh42L75Y8UHkcChoUKVnNMxOyvujRHw4AEAemTpot3pON7Yx9
 WsB9r1yPrAEaa0OtdBt16g+FGXe25aHSmClZhNyQZlSTftyordYS+jHIJDbdzQo9TX7+
 9/ugllJCQlJVbTfJpmm4pqDcTylEEvV6AQkSULU1C/VrcNMbPCk7ltH7vJoJ1klvhw+L
 KWJNRae+x9goF/NI1ofLvhiFuDWAANfEwcWKY4LH0lFZkSYHFOcJP3y6SwwEcxJP3XnO
 bgkFjuPjFizSsjiM2ordAgCdg+E9i/UCUNxzVw5rWJMoGn3B1V+fXy6YzHhzolD6234r
 f9uw==
X-Gm-Message-State: AO0yUKX4wTTBvJgPYeHZOqGi52eSkWJp0vuuLmkatuHeUQaRpOUBhQfv
 L2IC2sQhgaC8idO8ioqQS75vkrfFrusYtTa5JZMc1jIAT844m7xGrX2d1dmu0cWzrHqqo+HzyeD
 VffAGI6lei7978GA=
X-Received: by 2002:ac8:59cd:0:b0:3bf:ce15:ff25 with SMTP id
 f13-20020ac859cd000000b003bfce15ff25mr39577073qtf.12.1680175448448; 
 Thu, 30 Mar 2023 04:24:08 -0700 (PDT)
X-Google-Smtp-Source: AK7set/WTJoTF9ssnO5x7PavlTcAchLPUMUViMNR3+lKphLpa3Jz7FhsWgXidtUCxUkfXTuz+e/LJA==
X-Received: by 2002:ac8:59cd:0:b0:3bf:ce15:ff25 with SMTP id
 f13-20020ac859cd000000b003bfce15ff25mr39577026qtf.12.1680175448098; 
 Thu, 30 Mar 2023 04:24:08 -0700 (PDT)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a05620a22e900b007486d9fa1ffsm2300257qki.9.2023.03.30.04.24.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 04:24:07 -0700 (PDT)
Message-ID: <d0e2a918-3336-67d2-ca5d-62f71e171cb5@redhat.com>
Date: Thu, 30 Mar 2023 13:24:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 03/11] MAINTAINERS: add a section for policy documents
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Ryo ONODERA <ryoon@netbsd.org>,
 Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
References: <20230330101141.30199-1-alex.bennee@linaro.org>
 <20230330101141.30199-4-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230330101141.30199-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 30/03/2023 12.11, Alex Bennée wrote:
> We don't update these often but if you are the sort of person who
> enjoys debating and tuning project policies you could now add yourself
> as a reviewer here so you don't miss the next debate over tabs vs
> spaces ;-)
> 
> Who's with me?
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Kashyap Chamarthy <kchamart@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
> Cc: Bernhard Beschow <shentey@gmail.com>
> 
> ---
> v2
>    - s/your/you are/
>    - add some willing victims
> ---
>   MAINTAINERS | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9e1a60ea24..2c173dbd96 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -64,6 +64,19 @@ L: qemu-devel@nongnu.org
>   F: *
>   F: */
>   
> +Project policy and developer guides
> +R: Alex Bennée <alex.bennee@linaro.org>
> +R: Daniel P. Berrangé <berrange@redhat.com>
> +R: Thomas Huth <thuth@redhat.com>
> +R: Markus Armbruster <armbru@redhat.com>
> +W: https://www.qemu.org/docs/master/devel/index.html
> +S: Odd Fixes
> +F: docs/devel/style.rst
> +F: docs/devel/code-of-conduct.rst
> +F: docs/devel/conflict-resolution.rst
> +F: docs/devel/submitting-a-patch.rst
> +F: docs/devel/submitting-a-pull-request.rst

Reviewed-by: Thomas Huth <thuth@redhat.com>


