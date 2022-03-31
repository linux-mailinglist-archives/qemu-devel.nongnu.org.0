Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9444EE2E0
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 22:47:36 +0200 (CEST)
Received: from localhost ([::1]:53860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na1hf-0000ec-2c
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 16:47:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1na1fO-0006tR-UO
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 16:45:19 -0400
Received: from [2607:f8b0:4864:20::102a] (port=39775
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1na1fN-0007gT-E2
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 16:45:14 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 mr5-20020a17090b238500b001c67366ae93so3397853pjb.4
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 13:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=VfurfFfai8IE9cebxXbiORGkn0p6QUHqCq0CCDNIxiY=;
 b=MM2EoXY0mAScJKz6++HfWTNedIY8mKAWAt1ZzRGbzmOozgPK3k8BXfEi9b+Eqhw67Q
 PZqBIS6CmlQ7twFB/jv5F9zS2NnGKfVNibQoQNNmt5d83tOGJUHCasr/RWN4wz5qZOk4
 Nk3ego6a0SCIAdPfvds3pMx7ELCbQOVXdVYtQ6uKB8qCWZXKjBGpHnw/lA/Xldhs/fRB
 VsnQCoHA7R4rNMFSIF3YuVG9oXWizAYmjtL56Z7te0duaW0f7/h/dyXn19A55znOKixc
 hUus1unjp2HuT3G7nYA9lI3f/NU+v0riDEK5Q/RfspwETmwNg9O+Sr7Le6SWDzvHfBXL
 7hJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VfurfFfai8IE9cebxXbiORGkn0p6QUHqCq0CCDNIxiY=;
 b=EZFQELAOM8NZGljYl4n/8lJCSEMy70hJMvrqaSSRaCvqikJNMtyYQMKB6PZ9fVPF2n
 1h7tnCPZ9CnONybZIF3WOVfUDpPip6bFAE0elAwBWh6XZt81KTcLFa8s1TBK2MX38r/E
 8z3dWbEWQWYRVO7YwDY8mDG3SeBQAQv+GpU896OZKYqSoZwz5ii3g76vydRQMCrb6D6O
 UrdfNkLvpheKhSkFnCq3Aaa/vuo9ilGYOvprqllQIFHn/zFfW4z0M967txdiGqjpwhrZ
 RzIaX4QGoK74Y7FJ/j8D1fEBWsfpmfmD/3LLTHY+rTSs0U3cpbS9a8QHkvCz4sc+Hyl1
 WnTA==
X-Gm-Message-State: AOAM532Ow3RvIPYxaU64NfBT8uvyTdCdG0EdqQcOxh8wTPS1OcH+XkYu
 uoPXfAoFm+HPLcQxdKerXhk=
X-Google-Smtp-Source: ABdhPJz5ZpgBrfYO3/ouYoevva8m/Cd9dKw6cKJj/RuICKYMSfkmP4rZlLdR54TcHR/k8VhDfIMLWg==
X-Received: by 2002:a17:90b:3850:b0:1c6:572e:f39a with SMTP id
 nl16-20020a17090b385000b001c6572ef39amr8061099pjb.233.1648759511994; 
 Thu, 31 Mar 2022 13:45:11 -0700 (PDT)
Received: from ?IPV6:2600:70ff:f07f:0:f49c:562:b5cb:b2b5?
 ([2600:70ff:f07f:0:f49c:562:b5cb:b2b5])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a056a001acc00b004fb37ecc6b2sm363386pfv.29.2022.03.31.13.45.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 13:45:11 -0700 (PDT)
Message-ID: <1293e5f0-58f5-9bbe-cdf3-2ca39b05d888@gmail.com>
Date: Thu, 31 Mar 2022 22:45:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 1/3] i386: move bios load error message
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20220331083549.749566-1-kraxel@redhat.com>
 <20220331083549.749566-2-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220331083549.749566-2-kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Xiaoyao Li <xiaoyao.li@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 31/3/22 10:35, Gerd Hoffmann wrote:
> Switch to usual goto-end-of-function error handling style.
> No functional change.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Tested-by: Xiaoyao Li <xiaoyao.li@intel.com>
> ---
>   hw/i386/x86.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

