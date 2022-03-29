Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3327F4EB237
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 18:49:53 +0200 (CEST)
Received: from localhost ([::1]:34714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZF2W-0000uE-Aa
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 12:49:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZF11-0008Li-Ct
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 12:48:19 -0400
Received: from [2607:f8b0:4864:20::230] (port=43901
 helo=mail-oi1-x230.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZF0y-0005H1-4g
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 12:48:18 -0400
Received: by mail-oi1-x230.google.com with SMTP id w127so19597025oig.10
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 09:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=c6lUCFDUBKmP/ReG0IcacbvM5U3J9ShZR+8KCQkeE74=;
 b=AEA0jWzUqg5wdRhOYXUjckdpeRpPmofgSCJEVY/hweA6iFSuo3MHabn0UV7zn8qohA
 H6PE2tqVUnHG6XQrlTzoRvcrWw/7bQ18uCexuCqUCIzncDo7af2VyEQV3VBzVja0Ktxg
 f89JxDHOA31bwa9YdXxORqsaMFf+rPJUV3uoF1nsS69THpj/zihogJSUcOuLPDG2rF1l
 0905GdmeeBPHMCToy+vuU2KXZ8vtabFgFNFVzOFzOkf9sh59F6r2u1LZuHovC2AF6lzZ
 0oyXMm22WUhwyUeqEjilAK07HDq68Hza2CHoB05y2Et0S1Zzou2+RybnUsCJCqac+wsr
 LDiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=c6lUCFDUBKmP/ReG0IcacbvM5U3J9ShZR+8KCQkeE74=;
 b=mjzJDb0WzFVr/iDZhbkJlokKIlcyMoFoCCjZyBRK9LpXhlh1Oh4Tg3xrLqAaNQYtlA
 EhBOMjY5u0u/bjancG5JkYU2HKi8FH5h4a9wNmwHqiqcmymuCkQ/pHOUcQjxh2ldfmVj
 Ax+egqe2QOHY8Ewwee2tTlF3hKtJzMfFOjIMFsqzNfdUcUlN4UpOPgfXrwAcdH6K8gbf
 sbCHTfmbndd0+Gj+19SjRsgwt8htqACDshNBbUU9AnrX/dokKHAhSR70nHzPd9qB880U
 W0VAsf1QpF8cdoZk2g9F5Y9+MAHycQy/kWLH7Dnqst8d58HUgCfNgvOmfHUVB/gdmdOm
 5OxA==
X-Gm-Message-State: AOAM533z/1NEAriphRBcHkGgrE4qq7CvIlC7TTdkiQuBcdQZ5zfExRHL
 wa6Ezj9RQCop3nnz5aOWg27a0A==
X-Google-Smtp-Source: ABdhPJzPMpAjWw3CGapSTleY7IQLwLx4nX6vXQPVNuLQ+XMBOpOreZoRsboV3D7DlPHVsPvWM5jIyw==
X-Received: by 2002:a05:6808:140f:b0:2da:3781:da4a with SMTP id
 w15-20020a056808140f00b002da3781da4amr12485oiv.223.1648572494757; 
 Tue, 29 Mar 2022 09:48:14 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 d12-20020a056871040c00b000d9eed0f8fdsm8469703oag.14.2022.03.29.09.48.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 09:48:14 -0700 (PDT)
Message-ID: <e13ea8a7-5002-b7ff-b5a0-533c5ffcf8c7@linaro.org>
Date: Tue, 29 Mar 2022 10:48:11 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] target/sh4: Remove old README.sh4 file
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20220329151955.472306-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220329151955.472306-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::230
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x230.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/29/22 09:19, Thomas Huth wrote:
> This file didn't have any non-trivial update since it was initially
> added in 2006, and looking at the content, it seems incredibly outdated,
> saying e.g. "The sh4 target is not ready at all yet for integration in
> qemu" or "A sh4 user-mode has also somewhat started but will be worked
> on afterwards"... Sounds like nobody is interested in this README file
> anymore, so let's simply remove it now.
> 
> Signed-off-by: Thomas Huth<thuth@redhat.com>
> ---
>   target/sh4/README.sh4 | 150 ------------------------------------------
>   1 file changed, 150 deletions(-)
>   delete mode 100644 target/sh4/README.sh4

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

