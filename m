Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F765434A9
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 16:51:06 +0200 (CEST)
Received: from localhost ([::1]:44914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyx1S-0008Fc-VB
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 10:51:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nywre-0003eS-Td
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 10:40:56 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:44999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nywrd-0003b3-4h
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 10:40:54 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 gc3-20020a17090b310300b001e33092c737so18484661pjb.3
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 07:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=+jcT/IjzMHYGq3GxRAipvpamQCh7jVv1rhJIA+tZpZU=;
 b=dVoCZM2/hAmYf031aP7zNOfnwmkmEMatw7ebj3zpzJ03HnZs5GiTJ0eiaUK4fFqQ5V
 WhiwGi89W6Iwe+k06f2DlQcCqAT0PcZLblRPzvOGnhAbGg2XqNwpehajTyNE1oaECFMI
 WuNjy7GBs1GzzcJVY7LEJuNcIOIReIiybI6mLLyaf+A0smjcv7UxETvDOQjJG6Z3ua8h
 8uXQDqNP4zeJ+/IiNmzNKZiRv/LHs2VtYsspqCaA2uFZwvVLpOiYxBY7S2m0a71CXuXn
 pt5X55PNIhzFJIuW0OpscP4B7CMG8Tuni9fobNfsSfFpHa+FZ+zWd8tnjyAuBMOj/Z4h
 DPZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+jcT/IjzMHYGq3GxRAipvpamQCh7jVv1rhJIA+tZpZU=;
 b=34mvH6Nv0y2ffoqtGTOunuPNxqU1DYGXKRI7ObGWnS2+mHqmKzCtLVj7hHDNWYWKUn
 2UoRoOQbkpeXhIybzu20tUa+0+4hUgr4RtplCMF1Fz2iDN6AYPKha5PkIdP3e7IXsyph
 dCSzIFKRil9OgZbTA22IIsjkIcN2ikL0hpMy4CeHqGckpfz2iGHQYnk5DJxQmWThN8py
 HUq0qeCcYbFgOPV8ED2vl8LHDmfdfYo7xnB8BscBx0JYlMBgUoy0XS0Q9PHOXjOJLnlt
 +ZEFa1nXRenrDGhHFd0CVUKpfcsV8e4ltriT7Xz1P+bhj6clF7tzzewNovxdnMYUZHXM
 Ii4w==
X-Gm-Message-State: AOAM532s280y29RlOu0KLTka2SArAz91l6GH12RXCX36kH/qQMctAw9K
 3KTsXWHG3hNz+pSCcUrNfpmelA==
X-Google-Smtp-Source: ABdhPJyWOlKbiuIW6NRSUbNyzB9NUUpGuWU+JyKv4CVtDqLWdVcd5e4Yc8Y3Zjqa5WeezKLW7TPDtQ==
X-Received: by 2002:a17:90a:4414:b0:1df:9b8f:c3cc with SMTP id
 s20-20020a17090a441400b001df9b8fc3ccmr72658569pjg.56.1654699251447; 
 Wed, 08 Jun 2022 07:40:51 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:6812:d08e:b22c:43d7?
 ([2602:ae:1547:e101:6812:d08e:b22c:43d7])
 by smtp.gmail.com with ESMTPSA id
 t21-20020aa79475000000b0051bbe085f16sm13966960pfq.104.2022.06.08.07.40.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 07:40:50 -0700 (PDT)
Message-ID: <0fc46d21-9eba-51d3-1d94-fed7dc5aff24@linaro.org>
Date: Wed, 8 Jun 2022 07:40:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL v1 0/2] Merge tpm 2022/06/07 v1
Content-Language: en-US
To: Stefan Berger <stefanb@linux.ibm.com>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
References: <20220608010006.2122022-1-stefanb@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220608010006.2122022-1-stefanb@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

On 6/7/22 18:00, Stefan Berger wrote:
> Hi!
> 
> The patches in this PR resolve several Coverity issues and mark a memory
> region with TPM response data as dirty so that it does not get lost during
> migration.
> 
>     Stefan

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> The following changes since commit 7077fcb9b68f058809c9dd9fd1dacae1881e886c:
> 
>    Merge tag 'vmbus-maint-20220530' of https://github.com/maciejsszmigiero/qemu into staging (2022-05-30 12:40:36 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/stefanberger/qemu-tpm.git tags/pull-tpm-2022-06-07-1
> 
> for you to fetch changes up to e37a0ef4605e5d2041785ff3fc89ca6021faf7a0:
> 
>    tpm_crb: mark command buffer as dirty on request completion (2022-06-07 20:37:25 -0400)
> 
> Anthony PERARD (1):
>        tpm_crb: mark command buffer as dirty on request completion
> 
> Peter Maydell (1):
>        hw/tpm/tpm_tis_common.c: Assert that locty is in range
> 
>   hw/tpm/tpm_crb.c        | 1 +
>   hw/tpm/tpm_tis_common.c | 7 ++++++-
>   2 files changed, 7 insertions(+), 1 deletion(-)
> 


