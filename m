Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB99154B72C
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 19:02:55 +0200 (CEST)
Received: from localhost ([::1]:43184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o19wM-000402-RQ
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 13:02:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o19p3-0000Ug-Js
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 12:55:21 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:36822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o19p2-0003Uo-1w
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 12:55:21 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 k12-20020a17090a404c00b001eaabc1fe5dso6470325pjg.1
 for <qemu-devel@nongnu.org>; Tue, 14 Jun 2022 09:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=1xnFZJfY0TgWVX/hAB+vDeHs4Cakn4hMIHUb8/KliQg=;
 b=hqoggVFApi03Rwxcz+rU/GoF1mbGtJ85RzFriPiTUOTIqZR5a4KZsaRZ35Nc+EALv/
 4lBbc/o6I2GVekQsJWrOeqSlNMz73ZyE163EJ0oLPEdWmLSx+9YWn2Vps59bz/C9w6SN
 qRKnwnEj80ksPyI/tV2Fe7HI40WswhWqGtN9Tedw2NYFs5alPIYmLpTiUNa65D04FKWK
 ksNcuK/ny41PgKQBK2QKMNqcPQAwmLtn0s+wevWNxdN19Gj19xJFp0EAwf03KmwpyN+K
 vR9jO+btlKSjeqFsFPJg/DSTGEJlOZ5N7+DwZa52usKNCjzSB1rryhQXLm+I0CXhacnm
 QCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1xnFZJfY0TgWVX/hAB+vDeHs4Cakn4hMIHUb8/KliQg=;
 b=NcNg+6vWYITg+6bzaFf2Z0IxPdg7h9cJqi0NKJQlRoSIxtVe+VY5bFCKrTheIpYVof
 oFitc+JduA0GaZvqArSX1lGrCrUwfSdRmiDsfIC572/9ZcZ5C8abmvfqnFllK9PwPjRA
 aCbOvdPppvXM3vErySIFLcsCAn1kfAnQXOWBa3WdlVqik4O0RkQg43yl+CFfyApcc/Yz
 6iDVkfveaWRpFRALJ7K9eW3djovdklm/PUArlWmIfmIoHRQaqrIEkX1nXe1y+tsiCw+1
 3lU9AJEX7Bu+XPkkU0icM2nMC0NhQian0+DeLZXWG1/tFRNhS88i+vVxGux20T4v5wL0
 8BzA==
X-Gm-Message-State: AJIora9ZHsHSQljEmWxPTCL9wdjAgE+8xUtAs2s8ZsVUqTA9dTBWcvz0
 lAix4YesWIkAB7jHtfoLk++wcw==
X-Google-Smtp-Source: AGRyM1v2Qw4j6AMavPD/B9OV17/apKn67gisG9fnhDAACvUbL9PcTegMwvNVkBgppCaVrVJeVCyKvA==
X-Received: by 2002:a17:902:d3c2:b0:168:b6e2:9fdd with SMTP id
 w2-20020a170902d3c200b00168b6e29fddmr5270995plb.96.1655225718385; 
 Tue, 14 Jun 2022 09:55:18 -0700 (PDT)
Received: from ?IPV6:2607:fb90:806a:4827:adb5:6bfe:ffa:b215?
 ([2607:fb90:806a:4827:adb5:6bfe:ffa:b215])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a637c4d000000b003fc5fd21752sm8046929pgn.50.2022.06.14.09.55.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 09:55:17 -0700 (PDT)
Message-ID: <f4cd453c-f6e1-1f7a-d688-54bc1535f5ea@linaro.org>
Date: Tue, 14 Jun 2022 09:55:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] configure: cleanup -fno-pie detection
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220614145031.1766976-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220614145031.1766976-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

On 6/14/22 07:50, Paolo Bonzini wrote:
> Place it only inside the 'if test "$pie" = "no"' conditional.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   configure | 13 ++++---------
>   1 file changed, 4 insertions(+), 9 deletions(-)

Worth mentioning 43924d1e53f, which obviated...

> -# Check we support -fno-pie and -no-pie first; we will need the former for
> -# building ROMs, and both for everything if --disable-pie is passed.

... this comment.

Either "Fixes:" or just in the text, "Since XXX, we no longer require this probe for 
building ROMs".

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

