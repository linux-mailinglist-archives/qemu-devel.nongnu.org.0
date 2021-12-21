Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B5E47C878
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 21:57:36 +0100 (CET)
Received: from localhost ([::1]:54996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzmCV-000544-L2
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 15:57:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzmAh-0004M9-4c
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 15:55:45 -0500
Received: from [2607:f8b0:4864:20::630] (port=42550
 helo=mail-pl1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzmAV-0005qX-Qe
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 15:55:41 -0500
Received: by mail-pl1-x630.google.com with SMTP id u16so179402plg.9
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 12:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=1AAuRGhTyhXdEpQ7sbMmfQLdvMYbK/pDw2vVBh27wJA=;
 b=ZolNxtN9DUDlqwDeN4ZdiAMNNlN0F1FVMPdFMPFTIYOsKVUPwe2yqanhjjEhUU11fZ
 6jmazBdVRTUrCUYgN2IO7cMKWU9pbJm8p7/o6itxhuDqDjHyvqCaRg0qmOeLtJtiJMAF
 /Jq6Ium9E+JJChGhXXOqAFwDNVMREccX2kY+wtY+P/MLGYpCpwS7OoguLohMd+ml9a+d
 HA+UGC1V5mib9PVGx/mNUs8eVZjxezc7WiEGwwRvcjtRzWcePUnuuYSqZnyU1tlVxeE9
 /hnL3xIYki0Sl1nd4odxkBP+B7T8pB4YrQe2vvR4vLhLx4MgI70BjixSHx00I0fWfHoM
 jlSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1AAuRGhTyhXdEpQ7sbMmfQLdvMYbK/pDw2vVBh27wJA=;
 b=ZlocQ9gWkpW07IV+RUBaaKSKu9FmllWNnLqrv7mDs//BipJGoe19PthOdCmXoQgQFv
 gyCp7MwhyYZvx8OTdo5cbkx78JHVbGnzDzKeObjJe6rKNaTEe97gvGpj1BMCYVuDl+2t
 XGJWAnFz9VuViQ6FvZ36ZE/D2HEsJfNddbLb8SR/1cUnM4ErRaSYpTCbcbk/mSkOr7gQ
 orD+4dIDGF/T/HE1V+LQnPjBuJa1pwY8UkaqbC2XUS+sdI+AyG84Je7+4+qGovpJvs8z
 gl7g3bIWMBn4cZRK/3x48jo3N/0e0I/N75QAvqtJMj0vRxU/Z6HJu+1vKbJj8UDw28Zx
 VRlQ==
X-Gm-Message-State: AOAM531pxUnH5eCR4vBgjVHVU6ajDlWcSHMx359+Bt3mXjva/gz/MAsz
 +qaQnEbSlMrA9/+tjiFPBKGNmjNeS5dmGw==
X-Google-Smtp-Source: ABdhPJzN2ftMkBxT+FB7e6mAKvQL1fObN1XTufRll+HQilQRHAjX7Y3+GPwsKD4kZqG3hre+qJ0Suw==
X-Received: by 2002:a17:90b:3810:: with SMTP id
 mq16mr270402pjb.128.1640120129377; 
 Tue, 21 Dec 2021 12:55:29 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id y126sm13253pfy.40.2021.12.21.12.55.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 12:55:29 -0800 (PST)
Subject: Re: [PATCH 2/8] configure: do not set bsd_user/linux_user early
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211221110526.351709-1-pbonzini@redhat.com>
 <20211221110526.351709-3-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bab0de5d-a0cb-d7d2-9950-d285306b677e@linaro.org>
Date: Tue, 21 Dec 2021 12:55:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211221110526.351709-3-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::630
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.012,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 12/21/21 3:05 AM, Paolo Bonzini wrote:
> Similar to other optional features, leave the variables empty and compute
> the actual value later.  Use the existence of include or source directories
> to detect whether an OS or CPU supports respectively bsd-user and linux-user.
> 
> For now, BSD user-mode emulation is buildable even on TCI-only
> architectures.  This probably will change once safe signals are
> brought over from linux-user.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   configure | 28 +++++++++++++++++-----------
>   1 file changed, 17 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

