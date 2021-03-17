Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D397E33F138
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 14:34:39 +0100 (CET)
Received: from localhost ([::1]:37006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMWJq-0003kk-Am
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 09:34:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMWIF-0002i9-4y
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 09:32:59 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:37588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMWID-0001pI-Fl
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 09:32:58 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 f22-20020a7bc8d60000b029010c024a1407so3401913wml.2
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 06:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SwKB6JcivXppjRR5wiiZPWBgGoz0ZW274heYRA8m9zE=;
 b=iygEMV64XcTQPI7jCGiz+q4PDsdlLxeAAizNXXfmw1i5RUTjjwcUygkbajp+Dw/UwO
 3BOsGIVJBsC2n1bDDY0h+cV0q43TXKYtMjUkMigfLGtL/c5o8IDqqCwXpK4YB0dFJ3i6
 d/Ihe/XAAP2ORFAQBEHxgmUL/CJRSzHtMCA46tVZMYwAqIYlRcKRCpbVWSf8AL07lnAe
 i13jZMCPNzj+eerxlMDArWfTgewNgn0i8doWGlrR5JwurJvUT87T/ZfUSctLHuPMqKdM
 eitEwrpJztN1w34uai7pk3jiElqmyvVS4hNYWp41r0EXtyMBNQrwF0Ly32z/JUn6yhBA
 /AOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SwKB6JcivXppjRR5wiiZPWBgGoz0ZW274heYRA8m9zE=;
 b=ADVXgCpP9mgEdgXaOZKfn0Z1hQ4SrKBM1nvTmAu7qRz5vkfu56p726knaf5lSvoHCY
 oSFYwXyTy/nEBmkexA0VKPHw/d3fmerJINYGnVkoOVfBu3LCGJHPIHkW0H4deW7wChQ8
 7B2Ik5uewEfEcTVuMO+1CNSujDazcDxDfpG65n6GiaRTgP14P4iYDTNO9QjudyWuvUpF
 ZVxfIIn/gG8MzFQFRLt0tF72VJIODRIH0kPVVSBCzhJkl6mvTRJOnUQxkaqHt4rXdmGO
 gSKGxaY1xZAmSDfM01DjuQfOkY8jt4EY0OvWc7rkiA2lqucsNXHJ7BTMMtQtzpUAIrfU
 bmSA==
X-Gm-Message-State: AOAM532S3co1gMP2GVDKboYbxCQc1PE1eJJZkxXgY4W2/8EQO2/14OZN
 8JROxu4QJuWMb1/hKxsWGPY=
X-Google-Smtp-Source: ABdhPJx8XCyw0MivZQc5aPS5FUFzwBW/+rjseIu4npGX7ra5DAsKiMTJZ+jCU4a5FGBdEcfQu6l1RA==
X-Received: by 2002:a1c:7e45:: with SMTP id z66mr3712177wmc.126.1615987975850; 
 Wed, 17 Mar 2021 06:32:55 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id b80sm1899259wmb.40.2021.03.17.06.32.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Mar 2021 06:32:54 -0700 (PDT)
Subject: Re: [PATCH 1/5] tcg: Decode the operand to INDEX_op_mb in dumps
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210316220735.2048137-1-richard.henderson@linaro.org>
 <20210316220735.2048137-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <42b607d2-e316-7d27-31e7-25f3a7c275aa@amsat.org>
Date: Wed, 17 Mar 2021 14:32:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210316220735.2048137-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/16/21 11:07 PM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tcg.c | 79 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 79 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

