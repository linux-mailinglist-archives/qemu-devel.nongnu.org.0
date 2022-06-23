Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F4A5587D1
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 20:52:48 +0200 (CEST)
Received: from localhost ([::1]:52172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4Rwd-0007g0-Ej
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 14:52:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o4Ruf-0006mh-La
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 14:50:45 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:42782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o4Rud-0006sR-VQ
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 14:50:45 -0400
Received: by mail-pg1-x52a.google.com with SMTP id d129so255593pgc.9
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 11:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ByZKCbnBE6RDKsenA5wYPB70ai7posHhz7qff4I50GI=;
 b=m+D+UKe1KYDk52OB9odWh5dVKAxKCpC5VNNAb9/aMLjl5OC/0fKkW1BarGmOnUql8e
 V/c+euNvBDD2/iOmG+l0p4rh+FWXkfADCwQfnxZZSay9JKG8vcN7bQK082LePVqLPq2J
 hPpFRVOzuVi1U13KRMTC1Iz/76n2yE2h8a1D6ogpZf4eSFCp1w0FOR2+i42EtjdArCtR
 og9ak0R6Tqv1rqn8IVDGrQV4aQX8nLeRu57+p0vgSYj1mqjTNF8fZJltHT201Ci5wR/N
 2hpK59GkIMz7bdyiyKrgV/gDKNQYs5/gaewIrUr/ArwAcD2POWXzDwjt1oGNLrmdwRA5
 QJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ByZKCbnBE6RDKsenA5wYPB70ai7posHhz7qff4I50GI=;
 b=AiZ1b5IDey+DVjqobq8sLj5+ongPToH9uUOUywrI/aMeG2qpl1kDYly7foNyOHN8MS
 wG1giABIHox399ftU/HujoHT6LjdDTVgdyZTRjOhj9uXI85AjVwHHbk/CkMLCi8jYt01
 xTxOwCdKl21JBhPVoUmzPMUrfVg9YIEcNeHIF97Zl+S3ugHKZDk/AXPrt/zzzx5h7JHV
 kzbMaB4Fb/HK7SNmhI7K6+mWoae26ujw35V1PXZpx9J1PN8J69X/DbFSdQDOrrHTs9Mu
 74tN8kmRQicJDIVcuJXNGt7OgJBHYSwgEY43Qed91h0ClaEEt1m4UamdrKqPhi/3GCgI
 O7fw==
X-Gm-Message-State: AJIora9MrTycpdmC9UC/evgAwQs5CiZkHa9J8pHoR7pUTXZqeFVyuThc
 GCUIxifOZH6BkleoFRvmGf/qfw==
X-Google-Smtp-Source: AGRyM1vQL+R8u6ncOY/fjBHcARrD7TCvjmnh0k+XJwo1fNGry5Zj6KSXAyTc3JbJB2TAzlnT7Niu9w==
X-Received: by 2002:a63:e114:0:b0:3fd:97a1:7a5 with SMTP id
 z20-20020a63e114000000b003fd97a107a5mr8465893pgh.178.1656010242330; 
 Thu, 23 Jun 2022 11:50:42 -0700 (PDT)
Received: from ?IPV6:2602:ae:1543:f001:393f:6246:99c5:ff8a?
 ([2602:ae:1543:f001:393f:6246:99c5:ff8a])
 by smtp.gmail.com with ESMTPSA id
 jj4-20020a170903048400b0016a2b68823esm133817plb.141.2022.06.23.11.50.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jun 2022 11:50:41 -0700 (PDT)
Message-ID: <e8e1e525-88f3-8e9d-ed97-308bc1a00be6@linaro.org>
Date: Thu, 23 Jun 2022 11:50:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] meson.build: Require a recent version of libpng
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 kraxel@redhat.com, Kshitij Suri <kshitij.suri@nutanix.com>
References: <20220623174941.531196-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220623174941.531196-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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

On 6/23/22 10:49, Thomas Huth wrote:
> According to https://gitlab.com/qemu-project/qemu/-/issues/1080#note_998088246
> QEMU does not compile with older versions of libpng, so we should check
> for a good version in meson.build. According to repology.org, our supported
> host target operating systems ship these versions:
> 
>               Fedora 35: 1.6.37
>       CentOS 8 (RHEL-8): 1.6.34
>               Debian 11: 1.6.37
>      OpenSUSE Leap 15.3: 1.6.34
>        Ubuntu LTS 20.04: 1.6.37
>           FreeBSD Ports: 1.6.37
>           NetBSD pkgsrc: 1.6.37
>           OpenBSD Ports: 1.6.37
>                Homebrew: 1.6.37
>             MSYS2 mingw: 1.6.37
> 
> So it seem reasonable to require at least libpng version 1.6.34 for
> our builds.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1080
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

