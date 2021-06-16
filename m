Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C15CD3AA205
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 19:03:39 +0200 (CEST)
Received: from localhost ([::1]:53024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltYx0-00063s-NU
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 13:03:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltYp6-0004Jt-UJ
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 12:55:29 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:35802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltYp3-0006gI-D3
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 12:55:28 -0400
Received: by mail-pf1-x432.google.com with SMTP id h12so2707677pfe.2
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 09:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=46CfpEnFvd/89jDCVXKTK+ehKknYgSu7pZRCYW12wmY=;
 b=FB/NjMqPA1Yk3+6sx989+Z7wDXKZFi8cg1fkxqJ7Pz36i3aeuij+B4ua1ItBolrJCo
 rPga1366u/Stky3JyqCdYEg17nfViSdZco/OLVoUuOdNyUK3zHCeJJrXha90QMhdXMij
 rwpZJW/EcfmKSPpDYPZpI9hclVA98TCLRPjsk/VKVjmsiyASZaBb1A2tiWoetY8nKjX3
 GzWA5ql5gw7+dRz6NfDii0UQayjzdT9lJoyprGX3ZJSRd6JfsAkLdr/h2fPtU9ZgOWrI
 nL0xqSWSDEAdQJZ2CyxY526zjIBm0GYSVoPc/sl8tJrpphbCwiSJbQfqcaiF6PTX0pB8
 ueHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=46CfpEnFvd/89jDCVXKTK+ehKknYgSu7pZRCYW12wmY=;
 b=oPntHmwsdNchoN75FAx8nV0Oh08nE7l5iNkHOvepzp/RzII2EbxJ5ZjmDdbygpwfTG
 ghkvalPPsFWqYe2czWodaolMymblDXC7YiC+rh/OdcCYiR1evEcxnCXFIWyNLs5RSILK
 UAyp+OcUR63BM6FNnwEFWx74vdLUTXuI8Fc/5mmZ7r16xZoj9e839Za3y4YMP2nxpGcJ
 m0QegDmrA1XwnMchvQuJ12kUTyni9MhzGX9ksAK4HSCZGQhnL/dnavOebrXrI9rES6tF
 qmbksisHmp1Ijy0BsIX9AGDsMYB0XJ7ZDK2WxBzxreFQDY8PI2PKQ0g1aPiu0OL+6iFu
 rwig==
X-Gm-Message-State: AOAM531kwt2Ew/Mhkf1t+IZ8EKmB0iL3qaQ0CASnwUnz9VBVZacBdSBN
 SKx6qu+ok9aRMDk43ZotS2+/8yHZDMZ8ig==
X-Google-Smtp-Source: ABdhPJz0p/p1RCvw3yP/dKMtQXQ6PHNIAEGZJmcFQ390Sqd/J0eohmxPXaEEvVdlbqUhSrCaNbczcw==
X-Received: by 2002:a62:bd14:0:b029:2de:8bf7:2df8 with SMTP id
 a20-20020a62bd140000b02902de8bf72df8mr651488pff.60.1623862523946; 
 Wed, 16 Jun 2021 09:55:23 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 o14sm2764496pgk.82.2021.06.16.09.55.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 09:55:23 -0700 (PDT)
Subject: Re: [PATCH 3/4] alpha: Provide a PCI-ISA bridge device node for guest
 OS's that expect it
To: Jason Thorpe <thorpej@me.com>
References: <20210613211549.18094-1-thorpej@me.com>
 <20210613211549.18094-4-thorpej@me.com>
 <8346c497-f432-0d75-bc60-0fcceed3420f@linaro.org>
 <8DF0550D-3F5C-45E3-A246-D51A527B93DC@me.com>
 <B552BE81-9A14-40A3-834B-BA9A8A1A1D7C@me.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0520bb73-7954-56cb-08cd-9b5139729d9e@linaro.org>
Date: Wed, 16 Jun 2021 09:55:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <B552BE81-9A14-40A3-834B-BA9A8A1A1D7C@me.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/21 6:53 AM, Jason Thorpe wrote:
> Since you’ve already queued up the others...

To be clear, I have not queued patch 1, re the rtc.
I was hoping to get some additional feedback on that,
since it doesn't affect only alpha.


r~


