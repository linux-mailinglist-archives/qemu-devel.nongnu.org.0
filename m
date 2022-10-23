Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FBF6098A0
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 05:17:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omnKJ-00065k-Hu; Sun, 23 Oct 2022 22:36:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omi4e-00064J-F5
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 17:00:00 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omi4c-0001rQ-Tg
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 17:00:00 -0400
Received: by mail-wr1-x42c.google.com with SMTP id k8so4368481wrh.1
 for <qemu-devel@nongnu.org>; Sun, 23 Oct 2022 13:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2e0w90H2XQKQ+WXz2jkqUkABdnDjpAoW1P9eJ/+HlmA=;
 b=UePeC4EAeVbMMOd4ubnXitXcGBRnVYBHjnyWubX1FMkeM2A0oU1RVpVvRq5x5TQaAD
 FYRuGpDPFm/Rpw0eCmOMiuaXh6ibJ76WzC2nok8d8H6vip0tXLdL1XAFmxH8htbIJp+s
 ZcjV6jWaVbTXYGck3mUW0qZ48XTqsWBBWFjqqbloNRC5VCQzdraLhQ+7eAKbj0MtT42y
 Tw95HB4fCZEoJNmsiDA3j9Jy8geLUga6qDFD6JTcHUZVHf8Curhfuatvk5AiLpIYUar7
 xVIxE+yeFwpZ+zlwDz4vWzP0QiqIVQwlNb2aAl+HxIp8SKqqN15FWanu4vMILOT+siZF
 v73w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2e0w90H2XQKQ+WXz2jkqUkABdnDjpAoW1P9eJ/+HlmA=;
 b=3ar4PW9MlLM604bRFf5jMHXNI0b06tSTwqjprQ7XNSSgsk18yVvQC4GLPL0gyIjleq
 AgWvdHqrg8qpIbQ3WJYXglrxxH3bckZIoSGduapOTJdQ/NsjHi0rWuUNNpvB4fr+JGhW
 iPf5M441AFpjCLj0Wm53ykDVcRzl+FX2SelG0UrIBgmluUn+ehSktv1xbR9elplgVtPR
 AhABGF9HSrcYczUCqerHnhkLto3WUl/AeIgMaLUBtum4HG74YVxvgBzg+isJfnXT6vGF
 fg2URFLmqYT2FlphLaBnxO8xNFaxTciaOOHagWWzqdT8B+ew4bQML2O3cq1fK+1T/45X
 LW8A==
X-Gm-Message-State: ACrzQf3bFwuTKapgz4lWTKTcgbc6o5tro26Mhs+iHgaQ7TbOX/Yy7a9r
 Ul60uvE9/yvqwzTXM3DnMSZ5Mw==
X-Google-Smtp-Source: AMsMyM7wlPykLwpp/omQ6LhzopIAotnZcS+UNxTgqSJI2/T3NLYNbZwwjCnMZfzVMvOO0eSHqJ5Oow==
X-Received: by 2002:adf:aa8d:0:b0:236:588f:71f with SMTP id
 h13-20020adfaa8d000000b00236588f071fmr7459371wrc.205.1666558797361; 
 Sun, 23 Oct 2022 13:59:57 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 x6-20020a5d54c6000000b0022e2c38f8basm24417872wrv.14.2022.10.23.13.59.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Oct 2022 13:59:56 -0700 (PDT)
Message-ID: <83a2a20f-2a87-ac7a-3570-826d008f77e1@linaro.org>
Date: Sun, 23 Oct 2022 22:59:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [RFC PATCH] contrib/plugins: enable debug on CONFIG_DEBUG_TCG
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>, 
 Mahmoud Mandour <ma.mandourr@gmail.com>
References: <20221021155146.2729598-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221021155146.2729598-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 21/10/22 17:51, Alex Bennée wrote:
> We used to rely on QEMU_CFLAGS to expose the debug flags but now this
> is synthesised by meson and only available to the main build. Add our
> own flags if we detect the build has been enabled with
> CONFIG_DEBUG_TCG (which is the default for --enable-debug anyway).
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   contrib/plugins/Makefile | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
> index df3499f4f2..23e0396687 100644
> --- a/contrib/plugins/Makefile
> +++ b/contrib/plugins/Makefile
> @@ -29,6 +29,7 @@ SONAMES := $(addsuffix .so,$(addprefix lib,$(NAMES)))
>   CFLAGS = $(GLIB_CFLAGS)
>   CFLAGS += -fPIC -Wall $(filter -W%, $(QEMU_CFLAGS))
>   CFLAGS += $(if $(findstring no-psabi,$(QEMU_CFLAGS)),-Wpsabi)
> +CFLAGS += $(if $(CONFIG_DEBUG_TCG), -ggdb -O0)
>   CFLAGS += -I$(SRC_PATH)/include/qemu
>   
>   all: $(SONAMES)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


