Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BAC649E6B
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 13:07:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4hZq-0003qe-OA; Mon, 12 Dec 2022 07:06:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p4hZe-0003i5-34
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 07:06:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p4hZa-0001Uo-B6
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 07:06:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670846777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=INN/4ye0+SyADzW43Uhvr4PApGdw3RuykmVWPjxpxl8=;
 b=f7yJP+vU/p9jmWgoOOR32EvrirpjxRGBtmgvOu8OpwWvznN6QjKHV4WF7E25rnByXry3Iu
 2ubm+93aujSQBFhu69rfqKgOP/alEuXAg02J+iOvAWz7f3b/cDC51SzEn6+IjFj9JAmOE1
 0/p8TIOuKBWtjVdEsZhnph7ouovypgI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-261-CQMh7ETlO8-oj8S3EqfCCA-1; Mon, 12 Dec 2022 07:06:14 -0500
X-MC-Unique: CQMh7ETlO8-oj8S3EqfCCA-1
Received: by mail-wr1-f72.google.com with SMTP id
 r6-20020adfbb06000000b002455227c5c5so2138996wrg.20
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 04:06:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=INN/4ye0+SyADzW43Uhvr4PApGdw3RuykmVWPjxpxl8=;
 b=12pfGeH7FPNFYjL+9kn7yEm32UnhhmXtpJeleDhJ8wP90wv5wyr7h249gDDdf83YVi
 yeHoZQ+5viRjBqIbe7twvjjWAwS6veqsvQFBzXxD2TMeCe4cP8e6hUP03UQ5UPlb8XnG
 BqMlXoR7swCYAKeiSfHcuPYKLzh31wzxbTBsHPEw1y1XCt3/MalXHYMkrqcpodS/j3HC
 miG8+Fap4mIvwJhTjdDxRi7MrFppgASje+sNb4mNAg//wcMCdWkvrituuRjTGBFjTxgo
 6itA8R/25FaVnj37kYMpNP6fLl01nSHBXKk5EnWFWzJPCOkGLDmb6DDT+dMvXe+87/0Y
 vFxg==
X-Gm-Message-State: ANoB5plOzHnmCwnpLkor/LBSTn/E6C4hTIUbGNKUucjOowE/l9+jQF9W
 HnkkQGXsQvr0s2eRtbAMrwcWCSzfT9Dz5ZBWJKPC62PWMjNbAqHcA4fLg0X9pwMBcTu9iWxz1sq
 ZS0eOscUoULFMFsQ=
X-Received: by 2002:a05:600c:5010:b0:3d0:71d1:7931 with SMTP id
 n16-20020a05600c501000b003d071d17931mr12787544wmr.8.1670846773657; 
 Mon, 12 Dec 2022 04:06:13 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7kkeqUCN+19ZEQnq6gD357eDhUfNtS+eV/Gq+P3g7zsq0TJRV1u1abnC64pCyalrSGR1Jy3g==
X-Received: by 2002:a05:600c:5010:b0:3d0:71d1:7931 with SMTP id
 n16-20020a05600c501000b003d071d17931mr12787532wmr.8.1670846773449; 
 Mon, 12 Dec 2022 04:06:13 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-178-127.web.vodafone.de.
 [109.43.178.127]) by smtp.gmail.com with ESMTPSA id
 l41-20020a05600c1d2900b003c6b874a0dfsm11714025wms.14.2022.12.12.04.06.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 04:06:12 -0800 (PST)
Message-ID: <d800dcf7-e442-62e0-f61a-c5684414fe3d@redhat.com>
Date: Mon, 12 Dec 2022 13:06:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 4/4] tests/qtest: Enable qtest build on Windows
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20221125114100.3184790-1-bmeng.cn@gmail.com>
 <20221125114100.3184790-4-bmeng.cn@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221125114100.3184790-4-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

On 25/11/2022 12.41, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Now that we have fixed various test case issues as seen when running
> on Windows, let's enable the qtest build on Windows.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
> 
> (no changes since v1)
> 
>   tests/qtest/meson.build | 6 ------
>   1 file changed, 6 deletions(-)
> 
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index c07a5b1a5f..f0ebb5fac6 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -1,9 +1,3 @@
> -# All QTests for now are POSIX-only, but the dependencies are
> -# really in libqtest, not in the testcases themselves.
> -if not config_host.has_key('CONFIG_POSIX')
> -  subdir_done()
> -endif
> -
>   slow_qtests = {
>     'ahci-test' : 60,
>     'bios-tables-test' : 120,

Thanks, all four patches queued to my testing-next branch now:

  https://gitlab.com/thuth/qemu/-/commits/testing-next/

  Thomas


