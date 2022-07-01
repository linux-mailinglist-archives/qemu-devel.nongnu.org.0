Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6434956288A
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 03:48:23 +0200 (CEST)
Received: from localhost ([::1]:48542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o75le-0001Tf-E3
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 21:48:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o75hR-0006sq-BL
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 21:44:02 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e]:36418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o75hP-0004P2-R1
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 21:44:01 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-101ec2d6087so1714083fac.3
 for <qemu-devel@nongnu.org>; Thu, 30 Jun 2022 18:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=njmDv+TvhFd7PgRCWO9ih4cZReTvi/H8YTxvh66aTrg=;
 b=oW6ReyxAoGVpNu4Ond1JW3MF/dLZ+zvwbBxP7QZbqQFZrMreGtid26kAf5XQtRLETL
 Pyj8INt8rhc+KJOLoycmROvWijXe2vv/ZPOwIJMvcsupVsv+OvAOK3LAeSAjr1laAQr3
 s1E1gn3nhMIcOTKzkAbfHTH3zq8Kk0nR0vL6dcptCWbL2IZKjQIjx6TXLhJfSeW3iDFV
 +Lhshhose41mLWHKi1ysdMA9luVkG8Qlz7Ltgk0h8H1Xw9lghA9u/c8dCyHaiNMY9ObG
 z/z7bl5zppwpAuF8GUmrGUNe1LE03i3y1v2bSBH1IRZbqBuHFFkieenIh7gLuA3uSOw2
 4Mxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=njmDv+TvhFd7PgRCWO9ih4cZReTvi/H8YTxvh66aTrg=;
 b=b0t38UC8Am21MV4rNK8giIkw13dYoq4nUEIQ1CJJOKoOmVkgIDhMpmxWX+ZRziBbFd
 r3o8hqwaemf7uhzd9I+4PQ9oqbKohSD0tqcaAmryJPcoL9IBsJQg8yqtqyxeT/Xex7W+
 wELa9XcKVolMIeI/bYQGirkwinevYExF17RFH1t+HMRpTItaYKZDZbfCaa2xd/SZheYY
 faWdraGef/8vJuN+D4jqQlInXBvvdoVoSH2iFhFHRSBtjferQxqJkbHqfH3wF3Reo+kg
 6LtGFsImtVDXTGkw/0VLYhIfzpKsZNXghvkyCxkfHSfddxPgums+6onz84w/8oRDvQ0S
 k2Kw==
X-Gm-Message-State: AJIora/28zjnSxDkFnpMoI2F9pRWSj6swxxLRQ3xS09twuYsIqVPwFQE
 hIub964W0vadymqOH3OsGOk4mw==
X-Google-Smtp-Source: AGRyM1vZd7FApxP937WU2zUmYHZ7vDpLKPFCQrJu+I7b5qjDjnx9t8dGMnghbT2ZhEDaBXkxqBxwZQ==
X-Received: by 2002:a05:6870:4248:b0:101:fd04:50fa with SMTP id
 v8-20020a056870424800b00101fd0450famr7109215oac.246.1656639837888; 
 Thu, 30 Jun 2022 18:43:57 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80e8:1685:38ec:3484:7cff:725b?
 ([2605:ef80:80e8:1685:38ec:3484:7cff:725b])
 by smtp.gmail.com with ESMTPSA id
 t24-20020a9d7298000000b0061691db3807sm10096841otj.23.2022.06.30.18.43.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jun 2022 18:43:56 -0700 (PDT)
Message-ID: <a01795c0-f033-618e-2470-4b6b04eca68c@linaro.org>
Date: Fri, 1 Jul 2022 07:13:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/3] gitlab: honour QEMU_CI variable in edk2/opensbi jobs
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
 <20220629170638.520630-4-berrange@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220629170638.520630-4-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2e.google.com
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
> +    # In forks, if QEMU_CI=1 is set, then create manual job
> +    # if the branch/tag starts with 'edk2'
> +    - if: '$QEMU_CI == "1" && $CI_PROJECT_NAMESPACE != "qemu-project" && $CI_COMMIT_REF_NAME =~ /^edk2/'
> +      when: manual
> +
> +    # In forks, if QEMU_CI=1 is set, then create manual job
> +    # if last commit msg contains 'EDK2' (case insensitive)
> +    - if: '$QEMU_CI == "1" && $CI_PROJECT_NAMESPACE != "qemu-project" && $CI_COMMIT_MESSAGE =~ /edk2/i'
> +      when: on_success

manual on last line?


r~

