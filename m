Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6195D6C80AE
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 16:04:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfi4J-0003px-Pb; Fri, 24 Mar 2023 10:06:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pfi4G-0003nn-QX
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 10:06:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pfi43-0002TV-QX
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 10:06:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679666795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=poZIPZA/Ab2+Vno8wlOeDKbjfyRt5vbbZZ+rp1inVZo=;
 b=RRHLXnr0LJSKi7LyOFMmWmtVSKdQpq3BP4fQqPXlDznrNZRwiCPKdMBR6qYBsbdy6YRVpQ
 KK+B6jn2OHy/XcDVxtaf4GoHPmw4aEtaFu+BD1p1xBXmIfJnBYMAKb3Gtih7p2BbdJ7uGV
 dBdTchQsabHTDBxWVXepcYPpwBBIxp0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-601-B97g0sNEOwmMO7ObUiE8fw-1; Fri, 24 Mar 2023 04:58:41 -0400
X-MC-Unique: B97g0sNEOwmMO7ObUiE8fw-1
Received: by mail-qt1-f199.google.com with SMTP id
 y10-20020a05622a164a00b003e38e0a3cc3so663085qtj.14
 for <qemu-devel@nongnu.org>; Fri, 24 Mar 2023 01:58:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679648321;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=poZIPZA/Ab2+Vno8wlOeDKbjfyRt5vbbZZ+rp1inVZo=;
 b=Xc25Q9AblIu1QWBvrMVbJLquZ/misLCsnByceeBek8RF0bHMDxtUQmkPZyfIRI1kZe
 dok67dzo9HgQWRio1OyfjaJwI/mf8Yw/53ddIzAu50PKy52oN5FVqBK8YCPid9bS/0y2
 oaFzm3SmZ0bY/A0KkWPGQRai7XYkMPpAWed2gT4uTy4ueQCs+vQ8RyxRNGGgECMIz0Kp
 u27zHYZLgapKYCrT2KxjVzmOmpKIVuRfrQkSI7peiovejbNb9EnlXyI3PsbkIbboePbe
 /AcOyJNBqK6kTxaV5f/19THM97RWdTP2UOMFt42tYEz44TLl84WAOBb5PmpmCvoXual/
 ReOQ==
X-Gm-Message-State: AAQBX9e/zYCr2aohVes7EttNlgMRhaLShiZxnS/Z9XpFnHmySfi8m9Vo
 dH4LueGjMfexW3Jhe5vAdcxc5QS6E5ZCq/RWfYPeDkgU2YWzs+Cz6LowobmDbdUv4r1x7Lua5vI
 aDoSuCivLCicU/rQ=
X-Received: by 2002:a05:6214:29ce:b0:57e:56f5:5410 with SMTP id
 gh14-20020a05621429ce00b0057e56f55410mr2780999qvb.39.1679648321063; 
 Fri, 24 Mar 2023 01:58:41 -0700 (PDT)
X-Google-Smtp-Source: AKy350bugUzYHUNfcjkJqX/yPpQ1BxS9BCGeA/dQ6vuI/5DBDVerkUU1aetfr3DXw5jEDcqgcgtQjw==
X-Received: by 2002:a05:6214:29ce:b0:57e:56f5:5410 with SMTP id
 gh14-20020a05621429ce00b0057e56f55410mr2780977qvb.39.1679648320724; 
 Fri, 24 Mar 2023 01:58:40 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-101.web.vodafone.de.
 [109.43.179.101]) by smtp.gmail.com with ESMTPSA id
 he2-20020a05622a600200b003b835e7e283sm12502861qtb.44.2023.03.24.01.58.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Mar 2023 01:58:40 -0700 (PDT)
Message-ID: <2c9856c5-8fdc-8dcd-bee4-22d4160fc6f2@redhat.com>
Date: Fri, 24 Mar 2023 09:58:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: jsnow@redhat.com, berrange@redhat.com, peter.maydell@linaro.org
References: <20230323084005.1032305-1-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [qemu-web PATCH v2] add post about plans for Python venvs
In-Reply-To: <20230323084005.1032305-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

On 23/03/2023 09.40, Paolo Bonzini wrote:
> This post details the design that John Snow and I are planning for QEMU 8.1.
> The purpose is to detect possible inconsistencies in the build environment,
> that could happen on enterprise distros once Python 3.6 support is dropped.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
> v1->v2: add CSS for asciicast
> 	note that sphinx is already checked for now-enough Python
> 	some more copy-editing
> 
>   _posts/2023-03-22-python.md | 223 ++++++++++++++++++++++++++++++++++++
>   assets/css/style.css        |   4 +
>   2 files changed, 227 insertions(+)
>   create mode 100644 _posts/2023-03-22-python.md
> 
> diff --git a/_posts/2023-03-22-python.md b/_posts/2023-03-22-python.md
> new file mode 100644
> index 0000000..d463847
> --- /dev/null
> +++ b/_posts/2023-03-22-python.md
> @@ -0,0 +1,222 @@
> +---
> +layout: post
> +title:  "Preparing a consistent Python environment"
> +date:   2023-03-22 13:30:00 +0000
> +categories: [build, python, developers]
> +---
> +Building QEMU is a complex task, split across several programs.
> +configure finds the host and cross compilers that are needed to build

s/configure/The `configure` script/ ?

> +emulators and firmware; Meson prepares the build environment for the
> +emulators; finally, Make and ninja actually perform the build, and

I'd either capitalize both, Make and Ninja, or use quotes: "make" and "ninja".

The remaining parts look fine to me.

Acked-by: Thomas Huth <thuth@redhat.com>


