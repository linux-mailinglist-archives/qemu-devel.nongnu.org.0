Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B9051B7FA
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 08:32:51 +0200 (CEST)
Received: from localhost ([::1]:48662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmV2f-0008Ju-Ha
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 02:32:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmUze-0007PS-Sr
 for qemu-devel@nongnu.org; Thu, 05 May 2022 02:29:42 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74]:31916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmUzb-0006am-8f
 for qemu-devel@nongnu.org; Thu, 05 May 2022 02:29:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651732176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NwueIcE8rn+UZ1R9CRxlkFtaza7X+UUsUVSRIty7iEg=;
 b=N3nEjf4Vn4908rF3b8YetjfUBIBncVjaQc0F5qj0IRPCYgBtblcbUUpf7cyFoMUP9PI9SJ
 5//4xhWDndq4d7t4RoheRmiWKeDcIup31HhVdA8jtlNjbPrZJtO2K8olsgzmUuAYZ4t01N
 eBYaCZaCxjoLTuWSnbYhE2JoCODxS/0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-328-bZFRgNoxN5CY_QXnuHMy1g-1; Thu, 05 May 2022 02:29:31 -0400
X-MC-Unique: bZFRgNoxN5CY_QXnuHMy1g-1
Received: by mail-ej1-f71.google.com with SMTP id
 nb10-20020a1709071c8a00b006e8f89863ceso2075562ejc.18
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 23:29:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NwueIcE8rn+UZ1R9CRxlkFtaza7X+UUsUVSRIty7iEg=;
 b=elTLTCZ8ZemRnZcQa0Ilo/9Wzb4zWviuY56V0ZkZaX892/Pj5s55jhipfyS+ifx981
 5QLbVMjgXyXqB1dhi5VG2kEdIjhH2xHut0OlSKtFQOFMkLPnt/f1qd3SKtUWzWCLaCZw
 XvVXzDcjHrCZQT7NsxMjvsElPM0aJYXSbWdNQK0s+SMdN83CEuJroO8uQX8FEb8hhEuz
 SAMDcuU/ZSF8ArDSVJI+PbuFe+0bddrvO1MVR1eqBeHE2X/XbVftokRUf814069QwsqF
 zKh6rqoM0rYl0YBrDHH4G1Pj7IjcVv61wObgP38hGTZAr1lAoTnm+7pOReeIIwguIxUn
 lubA==
X-Gm-Message-State: AOAM532OszlhJS54U+EuZzdBfWZzhQ3qKcm+wx5x1tkK/mA4GwwYdveB
 S1FfNmkEeQMPoEyzoYdUBJLNDFxrmjDzaPCxS8LOvn/neY/QD2DzZBTowZUJtjn1V+vYAhX9a6/
 bIqTDPBDVdSecgYY=
X-Received: by 2002:a17:907:338b:b0:6f4:6e1:ed66 with SMTP id
 zj11-20020a170907338b00b006f406e1ed66mr23986338ejb.341.1651732170625; 
 Wed, 04 May 2022 23:29:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyi5yHYppZN2TvI/tgcaB/YyPN7uXzuRSr+5DpDV+IAFa1ONP3cKipbW/XxJGpDHdzMRgIawg==
X-Received: by 2002:a17:907:338b:b0:6f4:6e1:ed66 with SMTP id
 zj11-20020a170907338b00b006f406e1ed66mr23986322ejb.341.1651732170397; 
 Wed, 04 May 2022 23:29:30 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-178-123.web.vodafone.de.
 [109.43.178.123]) by smtp.gmail.com with ESMTPSA id
 qx16-20020a170907b59000b006f3a8b81ff7sm391096ejc.3.2022.05.04.23.29.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 23:29:29 -0700 (PDT)
Message-ID: <177e1d2f-1f67-4921-a49c-413ac1488487@redhat.com>
Date: Thu, 5 May 2022 08:29:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 0/2] Upgrade mingw base packages
Content-Language: en-US
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-trivial@nongnu.org,
 Beraldo Leal <bleal@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <20220503200524.1868-1-luoyonggang@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220503200524.1868-1-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.74; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/05/2022 22.05, Yonggang Luo wrote:
> v1. upgrade both cirrus and gitlab-ci to the newest mingw base release
> 
> Yonggang Luo (2):
>    cirrus/win32: upgrade mingw base packages
>    gitlab-ci: Upgrade mingw base package.
> 
>   .cirrus.yml              | 2 +-
>   .gitlab-ci.d/windows.yml | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 

Tested-by: Thomas Huth <thuth@redhat.com>

I can take this through my next misc/testing pull request if nobody else 
wants to take it first.


