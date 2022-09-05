Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E604E5AD80D
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 19:06:47 +0200 (CEST)
Received: from localhost ([::1]:38258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVFYc-0008Oa-IU
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 13:06:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVFWq-0006r3-Ay
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 13:04:56 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:33573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVFWo-0007GN-Dp
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 13:04:55 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 m3-20020a05600c3b0300b003a5e0557150so7226975wms.0
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 10:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=CodwDLGQCMkAeVs0dwOAB+NlE7RAeyY0kIEE/npAhsw=;
 b=EJ390OS32Z2aDaXgFaTEpPwe4OgGNmjz39RHhB7HrWrN5V79I2jCiM3DPy1Pzx+I2w
 F7LPoyIUGfbOAxyETkqPZHSsfEZ+jk6Lg0TuMJXqxXKElWw84Bnp+DUJMKuOahMDI1yW
 esTV2hsIkJpW/1LdyPfxszFDf031nGd7cMgED+awAh8v8ZbaHKhFHG6BJUEHhKxZyFUD
 QnA0oGDHkAzxQdfUqLqUtOkeZJLi0X/MJcI9WN+5v2Q1kIpKI1V2k0Tg0SxdZQJft2Or
 SP70d+BayyEMtG3/Nnaez9wMOpKhdROCPsJ84nP8elvyndve1eAeia4XUVRFb7f68ikM
 lKhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=CodwDLGQCMkAeVs0dwOAB+NlE7RAeyY0kIEE/npAhsw=;
 b=7qHl2/WBP2X+JBIxgaq9KV9WWAwxlmI1CVMcrdesuICGt6l+z0+YQRlOEzAHhnom3t
 teufg9OMv5G2i7a/rqEpH3DxFbbzlmuGQv0vXLni0/WXZGd+wzQflLq557ixQtls1dX1
 5PDjDTJFju5sZ5XMDaQpziHdpj/nLds4QUrJ0MCYKOGN9wNQPgRZV/eZXRsEWAWtJxd6
 KmwSJ49FpGyXE8VgKQ1swSGUVnASt1Zbz79hHreTxzOVe3kcaj5HZDXAbi0MEEyHU9kB
 j86pUgriGabZ+cICRyaT4ZkGIFH8U2ApIX1SmhGj/Mexw5ckx6kOJgdVQCKJOWGdmwq8
 NJVQ==
X-Gm-Message-State: ACgBeo3CselbHgpGyRpetB2yRRjwhQUJ0GzRIh8BtkMA6StAaXNhBIxS
 TPJxn45VZfR46gQL0AI91iXTgw==
X-Google-Smtp-Source: AA6agR6VWsTsfN5ApBQQJ3akGLQikQyJWzR2Qw3fHtRLPFUCW4MAa8d99vA853K4DweNbyAPx0uihQ==
X-Received: by 2002:a05:600c:20f:b0:3a6:8121:22e0 with SMTP id
 15-20020a05600c020f00b003a6812122e0mr11505233wmi.32.1662397492642; 
 Mon, 05 Sep 2022 10:04:52 -0700 (PDT)
Received: from ?IPV6:2a02:8084:a5c0:5a80:d0ad:82b5:d7a4:c0a9?
 ([2a02:8084:a5c0:5a80:d0ad:82b5:d7a4:c0a9])
 by smtp.gmail.com with ESMTPSA id
 c1-20020a5d4141000000b002258413c310sm9270773wrq.88.2022.09.05.10.04.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 10:04:52 -0700 (PDT)
Message-ID: <4eb3cfe9-a51e-58f8-9419-420a4a9b7dfe@linaro.org>
Date: Mon, 5 Sep 2022 18:04:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC] module: removed unused function argument "mayfail"
Content-Language: en-US
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, dinechin@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20220905155532.1824-1-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220905155532.1824-1-cfontana@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
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

On 9/5/22 16:55, Claudio Fontana wrote:
> mayfail is always passed as false for every invocation throughout the program.
> It controls whether to printf or not to printf an error on
> g_module_open failure.
> 
> Remove this unused argument.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> ---
>   include/qemu/module.h |  8 ++++----
>   softmmu/qtest.c       |  2 +-
>   util/module.c         | 20 +++++++++-----------
>   3 files changed, 14 insertions(+), 16 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

