Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0342C2EAD
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 18:35:03 +0100 (CET)
Received: from localhost ([::1]:45514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khcDV-0004m2-0q
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 12:35:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khcB7-0002yy-At
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 12:32:33 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:42006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khcB5-0004Mr-PM
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 12:32:32 -0500
Received: by mail-pg1-x542.google.com with SMTP id w16so5708955pga.9
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 09:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gxH0fpJKOARU5HSaIW7OizQDiR8DAYKwxBA6MM9aVzU=;
 b=U1AzdrTEDS8f+7mMOfFfUXGLZuW2tOuRaqGWBI0in5AfgQv8Ya4UiSA5p6DdaV9Nbs
 aQR33VdED7/fGzadBJPIjGLt8x146L52d69D6Fu9h6X8em2PDQtGHwjgVBDhkcL6EA2k
 PT2D9Gao27omqoVyA+Kdo3nd3lTlwOn5+NraO6T4wBZ/z/0JNCUIMCgbMqF+R/XttWMM
 Ony+NztgJD9A5VuDS4LW1IG8tKAIzp834SJPnvwdYEHwhuDz1zMTX7z9G9bMDef/S1Zj
 Gly79mDznKBFs+rqYGcH3tdKBIReR8cFdBPfdjl8WZIyH1JP9jsfFIeLMzFN+wYQZuP2
 0uHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gxH0fpJKOARU5HSaIW7OizQDiR8DAYKwxBA6MM9aVzU=;
 b=ufx1lKthk59VsGgtA9VNI6ziB4kH4z517friw96o/iixpSE1h7t4g5OQsDIasteoOR
 Q+SHmLoZRHkTOhZRqdQhaA2lY+0+oOiNf7bf2ManMlUE3p69a2GzXbqh0oLu4pgz9V6q
 rRPZwUQnyaz/KYS9LrHXQjf9CbXie2uZcoBY6mwEF6hSq0eBLJjVTPaqH8I/vJrU2f9G
 06t/xjKFbCOdUVnKyJUMAXZOnxlHU4dYTJWG4ZmPd8+WEKtW1OiQk63T7bp8I0qgYiKs
 vkoIIlbVD0DjqksgNRfUi3DIMnWNabTEDSauuOqlZuiNt3TjfTosmC/bTcd+SrTNOKlx
 PS3w==
X-Gm-Message-State: AOAM532T9P9SV/xXA+Zx72UY5k9hpi2XYwh2FG/JcKBfmeyrl3a+J+rK
 cIFj3g5b5rTEOcNvG/Y1iwru815f9jcv9Q==
X-Google-Smtp-Source: ABdhPJxEag57DJZ/0thdCM3Otdx9PIFq0tAMrPM5ScjrS7kzNmYMPWfxVXCrLpFGVNHJW0VCemh7NA==
X-Received: by 2002:aa7:9635:0:b029:197:f590:8563 with SMTP id
 r21-20020aa796350000b0290197f5908563mr4873340pfg.58.1606239150493; 
 Tue, 24 Nov 2020 09:32:30 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id m13sm5355957pfa.115.2020.11.24.09.32.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2020 09:32:29 -0800 (PST)
Subject: Re: [PATCH] linux-user/elfload: Fix handling of pure BSS segments
To: Stephen Long <steplong@quicinc.com>, qemu-devel@nongnu.org
References: <20201118165206.2826-1-steplong@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d05e39ce-f7ce-df0e-61c9-208ffd4f4977@linaro.org>
Date: Tue, 24 Nov 2020 09:32:27 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201118165206.2826-1-steplong@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: ben@decadent.org.uk, mjt@tls.msk.ru, philippe.mathieu.daude@gmail.com,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/20 8:52 AM, Stephen Long wrote:
> qemu-user fails to load ELFs with only BSS and no data section
> 
> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> Signed-off-by: Stephen Long <steplong@quicinc.com>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

