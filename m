Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A67831B218
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 19:49:03 +0100 (CET)
Received: from localhost ([::1]:35730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBMS6-0006hd-Jh
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 13:49:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLy7-0002dU-NI
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:18:03 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:34412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLy6-0006Pt-9H
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:18:03 -0500
Received: by mail-wm1-x336.google.com with SMTP id o10so3381402wmc.1
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 10:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/vD6myRzXkaxxXEn2BsNB/EFmOW1u0P0IxWvUsm+n1w=;
 b=DWx6poG5eUCD4KUtQ5GHJQtvay79mb/IPkYhNtezIE9Skza5gZBASzYllH02/t9fO7
 VXXVi09ZJ5Wn254BJv26db/sew9yiyT1En+9saXqrpW4MnUx8Igse7JYy6JYDugE+tY6
 2BwF3TWAsfcrJx6KIxrNuMUdb8j5rYHU+RGcB7VtQRqqrt9H8S5ZrfZi+FPvBCkodHLL
 c4B73fhWmEKUEQ2jqXrYwib4AWMQJVS46vAx4W6qEQ1JtZBNm29FjPaPw9LALXm+oH3P
 fCio7cWFMa2IFl2t1VHiF719s/PFqgsVR3Ri6Bd8pAlMuNFIyb5udyhl/onjt2f+7X8b
 rADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/vD6myRzXkaxxXEn2BsNB/EFmOW1u0P0IxWvUsm+n1w=;
 b=mDE0h47BkGxUzynRpLm9ata1AKutq1BbQ8Vgwry7k11+PBuCjwJMUd22iGqpt8BM61
 AVmSdNNR7PKag3haCvim2Jf79Ru5rZStw7ZpzClrwXAdyYcu61gtGQy0e4g1psl3jkZd
 HCQOWUB+L/8gd7MrwyTxkVHZ2Go154gfiRnOXMhNKvvZqW6EKGG0khgcmXJkm7sd+bVg
 jawTXRrCU6H8t5bRYiKqqwchCJL7Ry2y3yDt9YjDaPgXL+gwF/sxRolcnjQ7nvsS+esW
 ClwWeUcYcCtA+VLYpYWb9yxjnpEyJ95OjTKUXlNRcGmSiTu7YXEtBUZKKTqEE5FAkXHr
 qNiQ==
X-Gm-Message-State: AOAM531vQm2fxgL15kylI0HoMDeb7XTOLHBkr4vfZNeuI68KVuh6n9so
 o0VrytcrgPE2DKmh0IFe01w=
X-Google-Smtp-Source: ABdhPJwuZGLODfFnbOOS4i92JwDOTIoSuifV8pbxMqSuyTFq4NXBDjk1JI8UdxyLfQ4TfO1S0kygeA==
X-Received: by 2002:a05:600c:33a7:: with SMTP id
 o39mr11178073wmp.10.1613326680275; 
 Sun, 14 Feb 2021 10:18:00 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id a17sm25507962wrx.63.2021.02.14.10.17.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Feb 2021 10:17:59 -0800 (PST)
Subject: Re: [RFC PATCH 02/15] qemu/int128: Add int128_clz, int128_ctz
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201021045149.1582203-1-richard.henderson@linaro.org>
 <20201021045149.1582203-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <09583418-c321-a267-bc4c-8643f1c0a974@amsat.org>
Date: Sun, 14 Feb 2021 19:17:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20201021045149.1582203-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/20 6:51 AM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/qemu/int128.h | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

