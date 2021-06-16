Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FD93AA404
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 21:11:20 +0200 (CEST)
Received: from localhost ([::1]:41456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltawZ-0007uO-NU
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 15:11:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltauj-0005qU-Ck
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 15:09:25 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:36382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltauh-00056U-Mp
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 15:09:25 -0400
Received: by mail-pf1-x42f.google.com with SMTP id d62so996186pfd.3
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 12:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SuKl1aCq6tTITfSncjFFuOaxWpg+WCzkqJLP80DTpKQ=;
 b=j8JjRow1rxOabBtDITY5oyfJHlLz0am4XucKwhYviGVxF74pY2YSxvClKNDAtGs2i6
 USssYs+5iKBRI53jI6gNGrcgAYubP7OY7tAJ91O1iH7J2EglTS9C4OXiY3ebc7LDFxDb
 VR5HDDpP/ES1NBaSqD/q4q5i0cz1QGLazAf+5oevcGog/7ypUa6rRi2pu7JC912YpVBu
 w/X0tHNcVz2oXh/QWFJtc58d8O/gzpNRmig0bkPrz+zxZ7IdFbyGOSG3Z5aKUV2o3Bvr
 NfA9iKA+R9trrts9OWoDmX+aLnAXirCVHF4541jlvbRXCSQd9PihQkJp2bbL222gO3ae
 5JtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SuKl1aCq6tTITfSncjFFuOaxWpg+WCzkqJLP80DTpKQ=;
 b=mXGCbMXY1ePvXqGjhT4NcpJFppOHZSI8NHOPNM23vWaExc8P9jCORrvR3y0vENRr6d
 fzLzBkM/4Dqh1sWjKdpbDDIVP2jKzY26IOJsQ2TvN0afBmEaPuqkD4NCGxk/e5eFnito
 xJJnR98scVA41UVdlQS6qrBykuA+rAtcvzgKMtRBq4YWvFtHl+VBPPLvWdFbTEoru2He
 XLZYZCu4KzSu7+FxPFH9xF0/djWP1JsKl6+8q9fni4Kxxhq+0+HsA3p3iEhAFnjzGqIs
 2EY3DHw5ulUQ8Yxu8snAk0cPFDUWkerWlr3gFyy5SYUhHTZyKpAAbfxdXsG3+I8MjWvO
 vuJA==
X-Gm-Message-State: AOAM533L0cQdkS9wZqKlKrb/XXfxZB0FDoa8fwXxLHysahNg7979WjPg
 3kSRzyFvR6ahxhjLhpNLl5w+6g==
X-Google-Smtp-Source: ABdhPJwdRf7wCiPkOgEBXkbcexO1CdBflxfyuIVt+aGm11b+2WyFahop7RZuIOJbxIozuHrv82DKIg==
X-Received: by 2002:aa7:978a:0:b029:2f6:c116:e5f5 with SMTP id
 o10-20020aa7978a0000b02902f6c116e5f5mr1252844pfp.21.1623870561658; 
 Wed, 16 Jun 2021 12:09:21 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 v8sm2831571pff.34.2021.06.16.12.09.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 12:09:21 -0700 (PDT)
Subject: Re: [PATCH v4 4/7] migration/tls: Use
 qcrypto_tls_creds_check_endpoint()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210616162225.2517463-1-philmd@redhat.com>
 <20210616162225.2517463-5-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <56e47a3f-04d6-1090-7e0a-f1f6463cfbaa@linaro.org>
Date: Wed, 16 Jun 2021 12:09:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210616162225.2517463-5-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.17,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/21 9:22 AM, Philippe Mathieu-Daudé wrote:
> Avoid accessing QCryptoTLSCreds internals by using
> the qcrypto_tls_creds_check_endpoint() helper.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
>   migration/tls.c | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

