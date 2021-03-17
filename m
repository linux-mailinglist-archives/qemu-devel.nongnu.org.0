Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C85A433F81D
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 19:29:32 +0100 (CET)
Received: from localhost ([::1]:49616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMavD-0002M7-Re
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 14:29:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMapO-00077F-H7; Wed, 17 Mar 2021 14:23:30 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:37697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMapM-0004la-Rx; Wed, 17 Mar 2021 14:23:30 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 f22-20020a7bc8d60000b029010c024a1407so3957811wml.2; 
 Wed, 17 Mar 2021 11:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=62eVYyPwPkREiTEZr7h6eZ5ODrf5Qol3dUbwVA+/I9c=;
 b=hcURgpzG2fHOmYkbySwmELKNymGWz1WnVngcXeOCDpRMuk00GB7fUyGdFGSAwPJKQY
 hDsxPGOPhPbhPi3v3MTbCPobveUXljb+PwbmmAt4R9IsSrsdx2pCP9HNANtRwc9/OEi9
 qHvBs7dIkdGD4Y/k3I9OQ1+p4DNcRv+y57ntCFZ8h9i5Z14mmcVNQPm42DjkxFdxOupS
 B2nr9sUDKZ61rIacwwFWyGrEYOn/hJAJiPH8+c1ytiJ36DsxqgsJZxTICuSA76woDiwC
 u6k8Gd+2puXNzq59RagSLh8CA9K4W6EY3Z2oiHLycxFHMTkia1J3SREKw2NdrmTwSXnD
 i+RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=62eVYyPwPkREiTEZr7h6eZ5ODrf5Qol3dUbwVA+/I9c=;
 b=PIzQML/Fzc4CtRrHUr2oaaf8W9VW5dLwXSt4H0diqZBUkIdcJi3VSfCgrBWrOTG1oH
 PpnHs7i6A4oS+OUPx4SYHYh43QvMSE64PgdF2UyIuzQcCt8/TStCu0B84l+57Gz5TRnm
 FxpsPr6KqPYIz9IpGw4Lk2bKhlq39oeclLnY/bUngEAV/YvBJ9yPdP0c4J+qBwEMfLqi
 bzP4e6NQNycnQ8fMCsoKWmOKHQiqSVD6Gw8jT4N2YOOQYUZzznZ4Q9U6eMrOwhwMgS/e
 P1txb0ck8LKpD8Ohmf6X7AWyGANFBcbn2bn2ozi8AH9hrkOe5U1ssL0zoZwSJnGIkHgy
 x6sg==
X-Gm-Message-State: AOAM532iFDUyqVvRq+LjBmo28oVcas49P+Fx/a9MKRySG/MKwhdhhCkb
 Y8hcKsnm2pFD33CQCdYqaug=
X-Google-Smtp-Source: ABdhPJyzaIZFC21Rs3i4s8yJ6lyVQeigzV+XxNckIYM6fPU1Ibx+7c/Rt5NZA2cZQO2XPhTlJvXbrQ==
X-Received: by 2002:a1c:7704:: with SMTP id t4mr94741wmi.159.1616005406677;
 Wed, 17 Mar 2021 11:23:26 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id q9sm2968034wrp.79.2021.03.17.11.23.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Mar 2021 11:23:26 -0700 (PDT)
Subject: Re: [PATCH v10 3/7] vt82c686: Introduce abstract TYPE_VIA_ISA and
 base vt82c686b_isa on it
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1615943871.git.balaton@eik.bme.hu>
 <e5b92a771d811a46faf64ff56b2c07e6796eaf71.1615943871.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <67bc4257-7b46-628c-6e46-916eff4206be@amsat.org>
Date: Wed, 17 Mar 2021 19:23:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <e5b92a771d811a46faf64ff56b2c07e6796eaf71.1615943871.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/17/21 2:17 AM, BALATON Zoltan wrote:
> To allow reusing ISA bridge emulation for vt8231_isa move the device
> state of vt82c686b_isa emulation in an abstract via_isa class. This
> change breaks migration back compatibility but this is not an issue
> for Fuloong2E machine which is not versioned or migration supported.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/isa/vt82c686.c        | 70 ++++++++++++++++++++++------------------
>  include/hw/pci/pci_ids.h |  2 +-
>  2 files changed, 40 insertions(+), 32 deletions(-)

Now than "hw/usb: Extract VT82C686 UHCI PCI function into a new unit"
is merged as commit 6f2bcd5fc84, this is acceptable IMHO, so:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

