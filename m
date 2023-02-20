Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1E169D068
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 16:17:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU7uQ-0003Oo-EV; Mon, 20 Feb 2023 10:16:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pU7uM-0003L3-Dq
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:16:50 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pU7uK-0002WX-Ot
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:16:50 -0500
Received: by mail-wr1-x434.google.com with SMTP id v3so1498779wrp.2
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 07:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9L3EsWweD3/GwcvO2pDXIhbptQqetVb4gNrvCN0k2d0=;
 b=CqXSN2e335RuGBLhIbLzXQQTV1w6Sjzh4o2BtPI2P1yKpN40eQmRioEtP6256z55DF
 RQMCIbi1H1DCutNNQnLEenkp8wpvdKwe8f1qEMt8m5NT7rHnYiPa3xBjvzz94w5MYjmD
 zSmE0bwkjsJk8f7RKBQajY3l+Mfd99XACzcsJg0Zq06Cajzh03kTzucGHONfq8Uc9H+Q
 jD2LFd3st9QmCv4idIdZbzkBUn9bJNHexmPlnVUF0M9vK3q8PwiuTd8eMDXKism+gAYo
 CynmS/xtQWKdAQJE6Mi/ivPkoodNJZmhXpfdfkRxz/9go58iMN7KboqaDKS+aK/3dSe1
 jCNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9L3EsWweD3/GwcvO2pDXIhbptQqetVb4gNrvCN0k2d0=;
 b=IzyEUzFUJj1yF8tapd5M/RxbqhFUWIKg0jyOCn6rg2/w8Z2fBGQtD1YMvY03BL1NLE
 Hf5TJoHhIOkk2oJoc/hV1nY5qps5xGKMDjXaklDr8wuVktKpTB6VcHLBoVJ9bTGd2E0w
 W9S//Ou09POM50bSWZymfMNzjcLx/Wkxu33tAEfSEvH042yyEPwtPg7p288fDlaBhNgz
 mHmnRMd+LARM8qWnHkjCTWCBhFXH7zbgNaRohk/9kgkO1O9uAlJH1SUom8uYRgp806zk
 msfntaOUE/8uUsNIK5HaEgFP2Sb+cVIQEb+N7lLIOi9p7bPMsJJVicysPkcaEOeSdQxt
 a1Bw==
X-Gm-Message-State: AO0yUKUYDKmziOowDIgFTil1XHkMyBOmnmDYmbXHSmSUpZ7Mg4PzccI3
 3o5Vnez/ItvZF6a5HTK8DHVPgc1HPmWz9MsHiKI=
X-Google-Smtp-Source: AK7set9FNxoGaNPfye4GEFdNzEGpgfDvr+7NCYUGQPOoyZOeLT3MM68OXPmM35SewdTmJjlk8iEZ5Q==
X-Received: by 2002:a5d:5086:0:b0:2c6:e7f2:6e80 with SMTP id
 a6-20020a5d5086000000b002c6e7f26e80mr574795wrt.2.1676906206479; 
 Mon, 20 Feb 2023 07:16:46 -0800 (PST)
Received: from ?IPV6:2a01:e0a:5cc:caa0:de33:fc7:48d9:9d12?
 ([2a01:e0a:5cc:caa0:de33:fc7:48d9:9d12])
 by smtp.gmail.com with ESMTPSA id
 k2-20020adff282000000b002c6e8cb612fsm590098wro.92.2023.02.20.07.16.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 07:16:46 -0800 (PST)
Message-ID: <620eb853-1c95-532a-0d14-15396378160c@linaro.org>
Date: Mon, 20 Feb 2023 16:16:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v3 3/4] qga/vss-win32: fix warning for clang++-15
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 peter.maydell@linaro.org
References: <20230220111215.27471-1-pierrick.bouvier@linaro.org>
 <20230220111215.27471-4-pierrick.bouvier@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20230220111215.27471-4-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>

On 2/20/23 12:12, Pierrick Bouvier wrote:
> Reported when compiling with clang-windows-arm64.
> 
> ../qga/vss-win32/install.cpp:537:9: error: variable 'hr' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>      if (!(ControlService(service, SERVICE_CONTROL_STOP, NULL))) {
>          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../qga/vss-win32/install.cpp:545:12: note: uninitialized use occurs here
>      return hr;
>             ^~
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   qga/vss-win32/install.cpp | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qga/vss-win32/install.cpp b/qga/vss-win32/install.cpp
> index b57508fbe0..b8087e5baa 100644
> --- a/qga/vss-win32/install.cpp
> +++ b/qga/vss-win32/install.cpp
> @@ -518,7 +518,7 @@ namespace _com_util
>   /* Stop QGA VSS provider service using Winsvc API  */
>   STDAPI StopService(void)
>   {
> -    HRESULT hr;
> +    HRESULT hr = S_OK;
>       SC_HANDLE manager = OpenSCManager(NULL, NULL, SC_MANAGER_ALL_ACCESS);
>       SC_HANDLE service = NULL;
>   

