Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0772D562885
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 03:44:31 +0200 (CEST)
Received: from localhost ([::1]:43966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o75ht-0006Wh-MC
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 21:44:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o75ea-0004yv-Dn
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 21:41:04 -0400
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a]:45806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o75eY-0003o1-T6
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 21:41:04 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-1048b8a38bbso1630861fac.12
 for <qemu-devel@nongnu.org>; Thu, 30 Jun 2022 18:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=x0aAPskzMKBvohxU9qA8wEoAPLRjgGghQHsNhcURgw4=;
 b=lT2GVdLs9Gin/wNP3OORBOQGw/kzzUrSGXTzfSjOGgfaua2k3MlRg5KiyaJYxPflOP
 CKY7Apubl0/oAfTlYBwCIlQdUNMPr6aahFkZZfdUMjujYAj72GaP0Q8DTuYRBb+Hlq0A
 wfcRBENfXUxL5m9RPpGFDJS6+5gP4+MNz8fiXrgSSHv/nia2jjltLwE7kLJZcHbddVzk
 RofCqQJuKYek95fIUurb7+u7dIAT8B9RKnXWroGg1h58QeIxDW2gK6o/ojggPgbgvcPO
 ozTLMy1Bk5mprV7bp9roJ1EWaOCvSSl4empdh0XOZcbEKIAHVpfXKh9FFbEoCAUJbP0N
 2B7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=x0aAPskzMKBvohxU9qA8wEoAPLRjgGghQHsNhcURgw4=;
 b=wMA4CHtIntT5i/76nc4eM1WIlYIXf2blbWg5D3NqjssrBSc0Dbf5M8ONTGUx4jjz7r
 7QCCYDJcpEfrMAQCQnlmreZbFIIp+V6zFFJH3GLSvL++bxsd2JZ5iYD/JzVmvFBMMHGR
 mh7sIpiXatGcuoPK3QdRb6mhgAt7HWLMb+/Fou9cTH316Cygby6vKJsxTgxrTXBmbVWX
 uLl8CIAFDZS6mrGIWGfFLBzZgjH4q86U1qEbW8paZ5KoePEAlleL740jGUFjV+ryItcd
 V1CKWd2cuw/DxxpqOqCn9qtqYX1mLH3zlTbNkcaTRCxsLkg9q6mECLqsfQaoZBcVeFyA
 bNng==
X-Gm-Message-State: AJIora/P+6DHbMPTh1Bz2XEk37AJst/xL1tJAiS8GG5Yfscerd2giaUU
 yg8BD0l48I118iwsl4nLH+oqYg==
X-Google-Smtp-Source: AGRyM1v3HrQvHl1LJT7AX73S7LxlTOrZ4y0qUkH2B2goIL/nV2JPT6Q7SnxTgoz6q7mJlpY3IxwL1Q==
X-Received: by 2002:a05:6870:ea8e:b0:fe:251a:3c3d with SMTP id
 s14-20020a056870ea8e00b000fe251a3c3dmr8198702oap.62.1656639661730; 
 Thu, 30 Jun 2022 18:41:01 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80e8:1685:38ec:3484:7cff:725b?
 ([2605:ef80:80e8:1685:38ec:3484:7cff:725b])
 by smtp.gmail.com with ESMTPSA id
 o63-20020a4a4442000000b00425806a20f5sm11569212ooa.3.2022.06.30.18.40.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jun 2022 18:41:00 -0700 (PDT)
Message-ID: <16b502f8-b3b1-612e-f4ad-01b7219678fe@linaro.org>
Date: Fri, 1 Jul 2022 07:10:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/3] gitlab: normalize indentation in edk2/opensbi rules
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Bin Meng <bmeng.cn@gmail.com>, Beraldo Leal <bleal@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20220629170638.520630-1-berrange@redhat.com>
 <20220629170638.520630-2-berrange@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220629170638.520630-2-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/29/22 22:36, Daniel P. Berrangé wrote:
> The edk2/opensbi gitlab CI config was using single space indents
> which is not consistent with the rest of the gitlab CI config
> files.
> 
> Signed-off-by: Daniel P. Berrangé<berrange@redhat.com>
> ---
>   .gitlab-ci.d/edk2.yml    | 108 +++++++++++++++++++-------------------
>   .gitlab-ci.d/opensbi.yml | 110 +++++++++++++++++++--------------------
>   2 files changed, 109 insertions(+), 109 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

