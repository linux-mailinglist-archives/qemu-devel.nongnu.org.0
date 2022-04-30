Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5492515F5E
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 18:59:27 +0200 (CEST)
Received: from localhost ([::1]:58696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkqRK-0005F5-94
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 12:59:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkqPt-0004QM-7K
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 12:57:57 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:41814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkqPr-0000SX-LA
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 12:57:56 -0400
Received: by mail-pg1-x535.google.com with SMTP id t13so8739993pgn.8
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 09:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=s6Zl4TuFC7XMKDH9QYuJBDjEmIQA8fyP+IFb1YmFD0g=;
 b=MJpOtJ2w+zhoDTMvNYhfUIRozWONpd/a4bUqZ3fLWhAJOhAXAjK/3OfBdsXEhNKxt8
 8ayNYuB4mNmJl07+xQC0Vl+bVXFmb8qwsygMc0fov5GHZHvMtjRTvfbPHgKduVlL/oyJ
 Aj93Ziao0b7Qj7hc/tf+1ISb3AnDwvnUOpPhKqq/nG9P6KmCLQv2fuLzYouP/MavV2ev
 VXFXkg7aG6Y+blwkBJJ1S2XQABtFEm956ATgKi1ZOJhSE17o3AsD08AKsNTUGvP6SYyH
 jzgUh4CWKHL1Ssb5pe7g7foROpRpnX/t2OPGumJ7pRTJRg8gEzWwcINtPsFXz1uD6SJX
 LQrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=s6Zl4TuFC7XMKDH9QYuJBDjEmIQA8fyP+IFb1YmFD0g=;
 b=qoHoYRo/Uh1EoskDgN2eNC6GeJwZ7hDB1L7Rujwnxd4ywmKhgaYxg3Qx1UTX7I61Ra
 eOx7OZM29BeR9eLAzLOXJBTELrhIR5ME7sREIOvKeoQYUVnqT9Gop6g6PZuuxUF44xd0
 dFFfZG2sVW8xTpZNM9oInrTfDPiU9LV5VEw5QU4HUtYNP0cunC7/E/9GwJWvAsRy07jq
 gCBeD42E+BoUbePRhxpOzrHT+VTST3aLJk7fm3/efvp1wa1dvBNhJnw3iF1o/zJ8IAJ4
 XOQK3OxS/92u6mwl57FHUgSJjogXh0r9n7AzKOJGLxtBTRGpzs+zU9rI8DMbF3BXRbVx
 gUBA==
X-Gm-Message-State: AOAM533ykvSEd1aZioxzMQtrgXy/AkETvEyd0IJafEPiFMBBN81F4P9e
 Yg7/YK49yHN9AVvP/JDlhRC7PdYe3TFH8Q==
X-Google-Smtp-Source: ABdhPJyDDVhrhD2aVXv8Jo/nxNYQPdpEwl/V4H/Ax6X8NxHWroC0XzdV71tvzeqLpt/XQtCzEQrPsQ==
X-Received: by 2002:a63:e952:0:b0:382:65eb:257 with SMTP id
 q18-20020a63e952000000b0038265eb0257mr3641358pgj.465.1651337873700; 
 Sat, 30 Apr 2022 09:57:53 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 m67-20020a632646000000b003c14af505f1sm8752396pgm.9.2022.04.30.09.57.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 09:57:53 -0700 (PDT)
Message-ID: <61fb585e-3ca6-b218-750c-9e833edd9f3f@linaro.org>
Date: Sat, 30 Apr 2022 09:57:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Building tools on unsupported cpu/arch
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>
References: <31fb2fcb-6ad0-b769-9ec9-94fba0679065@msgid.tls.msk.ru>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <31fb2fcb-6ad0-b769-9ec9-94fba0679065@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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

On 4/30/22 07:11, Michael Tokarev wrote:
> Hello!
> 
> Previously, it was possible to build qemu tools (such as qemu-img, or qemu-ga)
> on an unsupported cpu/architecture.  In a hackish way, by specifying
> --enable-tcg-interpreter on the ./configure line.
> 
> Today (with 7.0), it does not work anymore, with the following error
> during configure:
> 
>   common-user/meson.build:1:0: ERROR: Include dir host/unknown does not exist.
> 
> This is with --disable-system --disable-linux-user --disable-user.
> 
> And without --enable-tcg-interpreter, it gives:
> 
>   meson.build:390:6: ERROR: Problem encountered: Unsupported CPU m68k, try 
> --enable-tcg-interpreter
> 
> What's the way to build tools on an unsupported architecture these days?

Hmm, well, there isn't a way.  This seems like a bug in common-user/meson.build.
We should not add this include directory if neither linux-user and bsd-user are enabled.


r~

