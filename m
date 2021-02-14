Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A896331B21C
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 19:51:45 +0100 (CET)
Received: from localhost ([::1]:44418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBMUi-0001wN-M6
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 13:51:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLzs-0003yl-JS
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:19:54 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:41819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLzr-0006mC-5t
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:19:52 -0500
Received: by mail-wr1-x42f.google.com with SMTP id n6so6144178wrv.8
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 10:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0WikbbJPW7xsBmfFn8qIsV4ww3pWr51CLpGqd/H/Vxs=;
 b=SW3tKJeJl/VbFXm/2Xd+EXvNV65ltXxkAzL40NJKMqaNdq4mjZvkBqUV4r4g668gp4
 Ij2u5bIeXaqfBm5mNV1MhK5nhRs4YeQXfN1uNYu7VzCUg0mOLMuu6HMgqyr4lYbKpYGu
 rzRWtMtqnx0KpY33n3IDogtfGf6ajqr9VEsM0m9HsJ2MlSWJ6CfBl5Z+UoGwOVtXXkEa
 fALJM2QJDrVc74SWtEwOqhb1eoAF0Ji0s+Sh70+nH81mg/utyUxW6OjmSSIplrXqoeYW
 0PoOPgsg4TcPAr70Df5L8mFeHJWPspiCiyIJiLi8+JJ72kMK0HZOYyOYWxx2qH7CjOaf
 BKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0WikbbJPW7xsBmfFn8qIsV4ww3pWr51CLpGqd/H/Vxs=;
 b=JS0DT/3h6a/rHJK1vJeQH8eFN3xcgjC0Qc8LlLEtI892sTtUbx3JHbTQl3m0GE53Ud
 3T8/pElAHloRvPp5moXZvQTr1GxKpWEIeQ+Xh4sDV64VXQfXgdE77JtZu/gmfaDbWBaa
 ziPOaWa7Y5qMojPEAa0Sct/YUFgAM0wtPGs4VANydntY6lvt5I7COrwBN5phOsztFqN8
 i5ftoYtc/rfD6YRF1fIguNZ8gyMLLrSSYReG6qCLU/kYBk6NlMIlvUHBkRTQQlTyJ6GU
 2CyDu6XoKUnit2lg6EjnMtRvCOuTLwcpG3SfseRhcfYTSVrgbV64VFRa219toqeQzFUg
 uw0Q==
X-Gm-Message-State: AOAM532+cXyT9UDkVcio2gS35gZna8bqWI7UpfIt/avllNltpGcK5lou
 HM/1zM5zR87ml+zs9F/PV3c=
X-Google-Smtp-Source: ABdhPJz/poL2RD8nwbKjcnpyqMi0wEVx/P6oOwKdWWlxvhRJ1rtk3mVfRG666//VaCweypIQpqfqPw==
X-Received: by 2002:adf:fbce:: with SMTP id d14mr14310301wrs.44.1613326789773; 
 Sun, 14 Feb 2021 10:19:49 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id v15sm22351034wra.61.2021.02.14.10.19.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Feb 2021 10:19:48 -0800 (PST)
Subject: Re: [RFC PATCH 05/15] qemu/int128: Add int128_geu
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201021045149.1582203-1-richard.henderson@linaro.org>
 <20201021045149.1582203-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <83726bf8-03cb-ebaa-90c3-3ab9702e2dcc@amsat.org>
Date: Sun, 14 Feb 2021 19:19:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20201021045149.1582203-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
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
> Add an unsigned inequality operation.  Do not fill in all of
> the variations until we have a call for them.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/qemu/int128.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

