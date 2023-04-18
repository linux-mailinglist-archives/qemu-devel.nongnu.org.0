Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D59816E596C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 08:29:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poepe-0002Hj-0z; Tue, 18 Apr 2023 02:28:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1poepZ-0002HN-JK
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 02:28:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1poepX-00014e-Ku
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 02:28:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681799322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nMVxn0bFT0k3t2w4TW4I3jvDi1HhlMA7ZkFcRJl01Ig=;
 b=BKCns74tPCxQhACbAhGODnByxSn1un3OgzcYf7vuzoazJED3ygbkwLKOFOigINHOv/WwV/
 oLRP8Aqm6mCh8WL4r99h8enlmAicbFYcW959qhJM1eIi/YAduTgXNNqDds6W3vL+G1mQqr
 xsBUBZjhG4mOKKxqMGN1S0dboHCbmDs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-235-s7sHZOKIOtS0-2r1_tcEcg-1; Tue, 18 Apr 2023 02:28:41 -0400
X-MC-Unique: s7sHZOKIOtS0-2r1_tcEcg-1
Received: by mail-wm1-f72.google.com with SMTP id
 hg16-20020a05600c539000b003f09d1918aaso8683456wmb.4
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 23:28:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681799320; x=1684391320;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nMVxn0bFT0k3t2w4TW4I3jvDi1HhlMA7ZkFcRJl01Ig=;
 b=OEdSr6AOaa2HWbaQLNmLKoFt6cT0T+Jx2qh62CmETsGuvKZnN6IQ6WdjXPanqxkCGa
 xvdXmJeNq+ESWDLsTBCKYu+cnJZ7VYQ3ph95z/pgfwVik6aCpPEMSqfzg+55kYkgfZ74
 zUQsX4ayRKNE8qn+rMw1ti9sSFoTlMGv/fP/ccWXHuS4iDmHy8K+PyH8HSKUf/c4J8Qk
 GFI1PEIMqpXaClRxkgdupPmH7fHse+a8KUuaTPQYZW0454YKp4AZpadbdK3visb1Yhie
 aiZR+Yv5zNYR16JIcoGCARg+ZYWolTTZ0q7NK73o6L4Ie2Fz8CAb6QTtdG9DKH+pcHmo
 DmXw==
X-Gm-Message-State: AAQBX9fPvuWGCDISuqrzZ9yNSWghp1bfFLtp80Voxw9+SwBEd6Mqft25
 FeRnoTe/nrkt+V72tDj8MsL4Yx6IZUjOBjF7a7wxU9TOC8R2R1nxiat+WNqGo+1xb3FPsG0gqVn
 P5/p1HRg5ScapA14=
X-Received: by 2002:a05:600c:2351:b0:3f1:7b48:87b4 with SMTP id
 17-20020a05600c235100b003f17b4887b4mr14120wmq.32.1681799320420; 
 Mon, 17 Apr 2023 23:28:40 -0700 (PDT)
X-Google-Smtp-Source: AKy350a8gJ/val0vHZ8wVAN8qvaqNYv8XpeLC17AQ+deleAOYMpRX9kuIhfCUu5E47hRVlMBvVyB1w==
X-Received: by 2002:a05:600c:2351:b0:3f1:7b48:87b4 with SMTP id
 17-20020a05600c235100b003f17b4887b4mr14105wmq.32.1681799320101; 
 Mon, 17 Apr 2023 23:28:40 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-176-59.web.vodafone.de.
 [109.43.176.59]) by smtp.gmail.com with ESMTPSA id
 v21-20020a05600c471500b003ef5bb63f13sm17538846wmo.10.2023.04.17.23.28.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Apr 2023 23:28:39 -0700 (PDT)
Message-ID: <62a087a3-e5b5-e72c-a0cd-c09dde2229a3@redhat.com>
Date: Tue, 18 Apr 2023 08:28:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2] travis.yml: Add missing 'flex','bison' packages to
 'GCC (user)' job
To: Vaibhav Jain <vaibhav@linux.ibm.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20230417162354.186678-1-vaibhav@linux.ibm.com>
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230417162354.186678-1-vaibhav@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.284, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 17/04/2023 18.23, Vaibhav Jain wrote:
> Since commit fd8171fe52b5e("target/hexagon: import lexer for idef-parser") the
> hexagon target uses 'flex', 'bison' to generate idef-parser. However default
> travis builder image for 'focal' may not have these pre-installed, consequently
> following error is seen with travis when trying to execute the 'GCC (user)' job
> that also tries to build hexagon user binary:
> 
> <snip>
> export CONFIG="--disable-containers --disable-system"
> <snip>
>   Program flex found: NO
> 
> ../target/hexagon/meson.build:179:4: ERROR: Program 'flex' not found or not
> executable
> <snip>
> 
> Fix this by explicitly add 'flex' and 'bison' to the list of addon apt-packages
> for the 'GCC (user)' job.
> 
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---
> Changelog:
> 
> Since v1:
> Link: https://lore.kernel.org/qemu-devel/20230414210645.820204-2-vaibhav@linux.ibm.com/
> 
> - Added 'bison' also to the addon package list (Thomas)
> - Updated the patch description
> ---
>   .travis.yml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/.travis.yml b/.travis.yml
> index 11894eb810..b958eca5de 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -237,6 +237,8 @@ jobs:
>             - libglib2.0-dev
>             - libgnutls28-dev
>             - ninja-build
> +          - flex
> +          - bison
>         env:
>           - CONFIG="--disable-containers --disable-system"

Reviewed-by: Thomas Huth <thuth@redhat.com>

Thanks, queued it for my next pull request.

  Thomas


