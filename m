Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C989C39A917
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 19:23:38 +0200 (CEST)
Received: from localhost ([::1]:38186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lor4D-0005cn-R6
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 13:23:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lor3H-0004Hu-7A
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 13:22:40 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:40483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lor3D-0003Sf-R5
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 13:22:38 -0400
Received: by mail-pf1-x429.google.com with SMTP id q25so5397155pfh.7
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 10:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ObOQ88ZENvElt87YP59ZdHHbGRIDtzrqkXOmz+kr40c=;
 b=UGsT9J+61sOOgnVYZdzFtIaBtR03G0fNsMtKteaYLkUNBeDpvX2ktJ7vKsLXx/EPVy
 Ktz7/XqX+An1+39DtFWmN6IFWlqLl/JOmiHkkWn7pGqTVZTYrO9ISZPEjijwiHKt6zKD
 YNbk2rjdVdsBHCYTy+JorzCIUJRBP4GJUYAXE90qpu4loruX/Gy8pJPqV3/JikxqVxxv
 oA2pTGEyB7DfetNOAmUpufIVP7dImf5Y1ZVpy6rc5HURT0OQuR748QJxlWQ/we8pe58H
 hereFmFm5FioNFCPG9B5i1pHcmolLVkfXqse0hTT2t0vjUfTBtzSzCJGl2bzPxrspXu9
 f/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ObOQ88ZENvElt87YP59ZdHHbGRIDtzrqkXOmz+kr40c=;
 b=Xe22Xc6WO2Ey2HbsZApei94YagjmsWnZ9cbVghqNRm29JR67ak1pflRaHUZD2ef2Zl
 BSoLuoQGyhhgbBtJxWg5Ofp/fXFFHRZgxVDmWpqghZB5ran3AC+w7OdGa0mDXakMWwFy
 G7of3PObe4bt4YVPXCCh5PPgCKnOY8k9Weqm2NpL7CjGAkPByRyYGd6Soe5Nqt8dNg8x
 Uosi/LRy3Lal7vMsYBzYJBef0eHLBwmSd85mOkj6yMkuDZaNLnTLBHqH8pevBjYBIP3g
 LIe+a1jfoAsDbQ4KnJr4NHJuLnT83yT7ActJ4SxOXYV7wKi743Qr2rCYR2o2qOgw4n1D
 p1Rg==
X-Gm-Message-State: AOAM532SR/g+4iTYljWTxLXccs1n3S/LxoNDigyJEPxW28n8fvoKfc48
 TurTofxfKXohihVhOYrYBKOglQ==
X-Google-Smtp-Source: ABdhPJwoKlats3jmiqxcISm9RP6l7PKDt9g2LBnasoe3/Yi7TrVQSNleyIcfA8snhqCEU38fkXesGA==
X-Received: by 2002:a65:58cf:: with SMTP id e15mr497874pgu.269.1622740954474; 
 Thu, 03 Jun 2021 10:22:34 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 k9sm3228944pgq.27.2021.06.03.10.22.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 10:22:34 -0700 (PDT)
Subject: Re: [PATCH v2 07/26] s390x/tcg: Simplify vfma64() handling
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210517142739.38597-1-david@redhat.com>
 <20210517142739.38597-8-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <28b00dab-5189-479c-7850-196c93ddb81c@linaro.org>
Date: Thu, 3 Jun 2021 10:22:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517142739.38597-8-david@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.603,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 7:27 AM, David Hildenbrand wrote:
> Signed-off-by: David Hildenbrand<david@redhat.com>
> ---
>   target/s390x/helper.h           |  2 --
>   target/s390x/translate_vx.c.inc |  8 +++----
>   target/s390x/vec_fpu_helper.c   | 42 +++++++++++++--------------------
>   3 files changed, 20 insertions(+), 32 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

