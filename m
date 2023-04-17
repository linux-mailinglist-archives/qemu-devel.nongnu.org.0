Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4FD6E413A
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 09:37:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poJPM-0005tZ-53; Mon, 17 Apr 2023 03:36:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1poJPK-0005tR-0w
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 03:36:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1poJPH-0001DS-EH
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 03:36:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681716967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TJKUuCN5ui6XbC0IGoXto0PvbPTatjG7byOhu9t8FSM=;
 b=FDLKLgutVravcOsRTQbac54X6kIRd2ZMyO0KQ+uVGdDXam6FarLkHw5/AT3w721s3apKhd
 W1LpqSvDFy4e9CrlCO/zGU+OFdtb7LSUmhukygmMkEa2aYcm2WHzNc2vLA3WF4lg+v8PIZ
 A91gwwLssttkRTgsvXL/z4riLygqmHM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-ywWWzZATNgWl6n0xZZSm0g-1; Mon, 17 Apr 2023 03:36:06 -0400
X-MC-Unique: ywWWzZATNgWl6n0xZZSm0g-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f171d201afso3801295e9.0
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 00:36:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681716965; x=1684308965;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TJKUuCN5ui6XbC0IGoXto0PvbPTatjG7byOhu9t8FSM=;
 b=BtqH4s35RRMhztWt9Oz/RKMm14fpKjzFFn0ESuJ92hKqYF64OXpz5wwaGdAtoxyfMw
 2gk4BmCOts82a5G6ODIgu/PWf5zsgdSL3e/fFZi+NMoRrc89CTQpkyhXcpRMrnRE466q
 Tu/0XffO50tvC1E1/ElLCpR2qYrBnRu2ZQykdu/HK/qmeafmMHZgi2TvgTv0IHVeoEEY
 pbl0RCWpIvLcjYjUvKNsslydVGs8F2ulu6BmZlJkHz0o26MTVpAtwje6jneZk41ZFzSp
 O53NWm+04djaeO4wVgfihrLqicTrJQUPupamB6EyrYx7pbP0jxgX3TUXmvC6p2qZi2aq
 jGig==
X-Gm-Message-State: AAQBX9cQ/xmdf1/X8fOnCBClU28ganTxvoF4nNE6CufpsWF2U5mWJBp0
 7rqW1z6ZO9DCIqw/SmErtTmXcFmpsvJRTWlMKijsPd6pgLYT6JbApbiZLs0mMbQWRAr+Y+I4Enf
 h0+Sa+FwEKFwsdhY=
X-Received: by 2002:a5d:4b4f:0:b0:2d8:81a9:4d75 with SMTP id
 w15-20020a5d4b4f000000b002d881a94d75mr4522148wrs.32.1681716965394; 
 Mon, 17 Apr 2023 00:36:05 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zdrgt3H1/u5DMQQ+ztjco8uvNrO5vBuiqEvraln9exdmjdKWck2czNjExd7PrWVZ4GONjVfw==
X-Received: by 2002:a5d:4b4f:0:b0:2d8:81a9:4d75 with SMTP id
 w15-20020a5d4b4f000000b002d881a94d75mr4522133wrs.32.1681716965053; 
 Mon, 17 Apr 2023 00:36:05 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-177-194.web.vodafone.de.
 [109.43.177.194]) by smtp.gmail.com with ESMTPSA id
 x13-20020a5d60cd000000b002c54c9bd71fsm9712400wrt.93.2023.04.17.00.36.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Apr 2023 00:36:04 -0700 (PDT)
Message-ID: <2be2ca90-15bd-9ac8-5dba-68740386e1b5@redhat.com>
Date: Mon, 17 Apr 2023 09:36:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] travis.yml: Add missing clang-10 package to the
 'Clang (disable-tcg)' job
To: Vaibhav Jain <vaibhav@linux.ibm.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20230414210645.820204-1-vaibhav@linux.ibm.com>
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230414210645.820204-1-vaibhav@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.976, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 14/04/2023 23.06, Vaibhav Jain wrote:
> Since commit 74a1b256d775("configure: Bump minimum Clang version to 10.0") qemu
> needs Clang version 10.0 as the minimum version to build qemu with
> Clang. However 'focal' ships by default with Clang version 7.0.0 which causes an
> error while executing the 'Clang (disable-tcg)' travis job of the form below:
> 
> <snip>
> $clang --version
> 
> clang version 7.0.0 (tags/RELEASE_700/final)
> 
> <snip>
>   ERROR: You need at least GCC v7.4 or Clang v10.0 (or XCode Clang v12.0)
> 
>   # QEMU configure log Fri 14 Apr 2023 03:48:22 PM UTC
> 
>   # Configured with: '../configure' '--disable-docs' '--disable-tools'
>   '--disable-containers' '--disable-tcg' '--enable-kvm' '--disable-tools'
>   '--enable-fdt=system' '--host-cc=clang' '--cxx=clang++'
> 
> Fix this by adding 'clang-10' to the 'apt_packages' section of the "[s390x]
> Clang (disable-tcg)" job and updating the compiler to 'clang-10'.
> 
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---
>   .travis.yml | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/.travis.yml b/.travis.yml
> index cf088ba4cf..11894eb810 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -243,7 +243,7 @@ jobs:
>       - name: "[s390x] Clang (disable-tcg)"
>         arch: s390x
>         dist: focal
> -      compiler: clang
> +      compiler: clang-10
>         addons:
>           apt_packages:
>             - libaio-dev
> @@ -269,6 +269,7 @@ jobs:
>             - libvdeplug-dev
>             - libvte-2.91-dev
>             - ninja-build
> +          - clang-10

Are you sure about this one? It works for me:

  https://app.travis-ci.com/github/huth/qemu/jobs/600292740

Also, Clang v10 seems to be the default version in Focal:

  https://packages.ubuntu.com/focal/clang

So how did you end up with Clang v7.0 in your run?

  Thomas


PS: We should maybe rather update the Travis jobs to Jammy nowadays instead.


