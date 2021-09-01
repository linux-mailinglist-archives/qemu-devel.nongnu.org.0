Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 117F73FE000
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 18:34:53 +0200 (CEST)
Received: from localhost ([::1]:50124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLTCO-0005nV-3t
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 12:34:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLS72-0004wK-KA
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:25:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLS6z-0001kc-Mk
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:25:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630509913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ToFGOS1/4HM40AQquohB88E7LjowD3oG771dWFIThSg=;
 b=cHeUIZS6ApFcUhWjLYVwglELi04+Ysinb2xZOKUxnJ7EP09NqgoKMWfmCryFOHNt0tNfGX
 Bs13C0padLMJdsQW66ukhEzz2FEFn3tPsJ5y+lBYQLG7bcRc6y8qCHh1sIxB95AScEmY/i
 4y3BxqeDumub0KJXWX5C0tECNA7CC1k=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-BeCdTPbCNoiF7xTozHigng-1; Wed, 01 Sep 2021 11:25:12 -0400
X-MC-Unique: BeCdTPbCNoiF7xTozHigng-1
Received: by mail-wm1-f72.google.com with SMTP id
 h1-20020a05600c350100b002e751bf6733so1163104wmq.8
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 08:25:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ToFGOS1/4HM40AQquohB88E7LjowD3oG771dWFIThSg=;
 b=buhtMfy2mWADvleW3QIaZn3GkE+ptE44waY9zMqAn+q4pSzpkPQQu+SlC7tb8bGl8U
 EhyRxPhrBjiZC6rkeMOvfmPMD727IiIG8gY2AGi6GwJDiFpBAEMi2dIUtcay2LMZ4oMk
 uPVw7oVziVdAqCQ2JdE343i0dzV7Ni9b/Xs7/nNs6mFqDAZHSNiG6hgOg0daJ1/7k7Or
 MvfQDWQDWd/SPkye63HQGX2FVKtwrCKik+v8AGEl2ORC2+31tAZRB+oTNzoSexc9NvYz
 P3h1NT5AKgysVIukLpALyzGdWHNVXWH0B3wVnXUO0L1I89rvC0U9qGjTH/GRJM2rUfAi
 ou9g==
X-Gm-Message-State: AOAM532jGbKH0tvVbJY0Z1NclVmex0KZTUwsFvKRFsQJSJyHrT+NUUfb
 GG4R/RTZrTQEREoMuS+NKuQxn2sznbq/vqIW1WllFzRhbij+V9RRNGU9duhlwFeuB/Ul6NcNkIz
 2lSV70WwKKjLDlRI=
X-Received: by 2002:adf:b78d:: with SMTP id s13mr21434931wre.344.1630509910834; 
 Wed, 01 Sep 2021 08:25:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVdB1Pl2RqBQoRqLRnHNDB25lZjfzssISIgZQnalEYnEp1rZdT8ZpXdDi1kU8go3xAgi0zqw==
X-Received: by 2002:adf:b78d:: with SMTP id s13mr21434913wre.344.1630509910648; 
 Wed, 01 Sep 2021 08:25:10 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id c14sm21484693wrr.58.2021.09.01.08.25.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 08:25:10 -0700 (PDT)
Subject: Re: [PATCH 1/2] elf2dmp: Check curl_easy_setopt() return value
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210901143910.17112-1-peter.maydell@linaro.org>
 <20210901143910.17112-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <59844a83-9058-3935-0228-e159eef5277e@redhat.com>
Date: Wed, 1 Sep 2021 17:25:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901143910.17112-2-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.029,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/1/21 4:39 PM, Peter Maydell wrote:
> Coverity points out that we aren't checking the return value
> from curl_easy_setopt().
> 
> Fixes: Coverity CID 1458895
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  contrib/elf2dmp/download.c | 28 +++++++++++++++++-----------
>  1 file changed, 17 insertions(+), 11 deletions(-)
> 
> diff --git a/contrib/elf2dmp/download.c b/contrib/elf2dmp/download.c
> index d09e607431f..01e4a7fc0dc 100644
> --- a/contrib/elf2dmp/download.c
> +++ b/contrib/elf2dmp/download.c
> @@ -21,21 +21,19 @@ int download_url(const char *name, const char *url)
>  
>      file = fopen(name, "wb");
>      if (!file) {
> -        err = 1;
> -        goto out_curl;
> +        goto fail;
>      }
>  
> -    curl_easy_setopt(curl, CURLOPT_URL, url);
> -    curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, NULL);
> -    curl_easy_setopt(curl, CURLOPT_WRITEDATA, file);
> -    curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1);
> -    curl_easy_setopt(curl, CURLOPT_NOPROGRESS, 0);
> +    if (curl_easy_setopt(curl, CURLOPT_URL, url) != CURLE_OK ||
> +        curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, NULL) != CURLE_OK ||
> +        curl_easy_setopt(curl, CURLOPT_WRITEDATA, file) != CURLE_OK ||
> +        curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1) != CURLE_OK ||
> +        curl_easy_setopt(curl, CURLOPT_NOPROGRESS, 0) != CURLE_OK) {
> +        goto fail;
> +    }
>  
>      if (curl_easy_perform(curl) != CURLE_OK) {
> -        err = 1;
> -        fclose(file);
> -        unlink(name);
> -        goto out_curl;
> +        goto fail;
>      }
>  
>      err = fclose(file);
> @@ -44,4 +42,12 @@ out_curl:
>      curl_easy_cleanup(curl);
>  
>      return err;
> +
> +fail:
> +    err = 1;
> +    if (file) {
> +        fclose(file);
> +        unlink(name);
> +    }
> +    goto out_curl;
>  }
> 

Counter proposal without goto and less ifs:

-- >8 --
@@ -25,21 +25,19 @@ int download_url(const char *name, const char *url)
         goto out_curl;
     }

-    curl_easy_setopt(curl, CURLOPT_URL, url);
-    curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, NULL);
-    curl_easy_setopt(curl, CURLOPT_WRITEDATA, file);
-    curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1);
-    curl_easy_setopt(curl, CURLOPT_NOPROGRESS, 0);
-
-    if (curl_easy_perform(curl) != CURLE_OK) {
-        err = 1;
-        fclose(file);
+    if (curl_easy_setopt(curl, CURLOPT_URL, url) != CURLE_OK
+            || curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, NULL) !=
CURLE_OK
+            || curl_easy_setopt(curl, CURLOPT_WRITEDATA, file) != CURLE_OK
+            || curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1) !=
CURLE_OK
+            || curl_easy_setopt(curl, CURLOPT_NOPROGRESS, 0) != CURLE_OK
+            || curl_easy_perform(curl) != CURLE_OK) {
         unlink(name);
-        goto out_curl;
+        fclose(file);
+        err = 1;
+    } else {
+        err = fclose(file);
     }

-    err = fclose(file);
-
 out_curl:
     curl_easy_cleanup(curl);

---


