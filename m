Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25117626748
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Nov 2022 07:05:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otjdn-0004MX-4s; Sat, 12 Nov 2022 01:05:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otjdh-0004MA-Eh
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 01:05:13 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otjdg-0008GX-18
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 01:05:13 -0500
Received: by mail-pj1-x102c.google.com with SMTP id o7so6134953pjj.1
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 22:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FOnM2nrqKLq7YumsePqZYVq5CkNOmeEJdfZVUh0FMnQ=;
 b=VnTY4IE8bf8/O1J8Psjyzhcowqbcu685/Rx1XRVBkeTyMgET2RtPDQdrQxg4ovJnKX
 BPgCewzlN+h13CD81hw4FfHQgw42K75iY/BRzb83Egil7a007VNTNyJ8I8ceGBpmi3z6
 4ojp50NgCDyvZ80fDENIOc4/mzzkKjE8+cN2wflRCsP0Soq8Zrl2b41CwlqnoDboi0XE
 1pJ5Jan35RpOXlUkvvPrrIATMm5cG/qkyjEykZQSX2JvvWj+KJQskhitgHqrGZRKVUar
 PE343KjBbmA6z0yY6rVBSvDnKRDifbeqbirE46e4lctIvEbjNOken1OYdDOpuVmElkOC
 Disw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FOnM2nrqKLq7YumsePqZYVq5CkNOmeEJdfZVUh0FMnQ=;
 b=rhnOfSfHXx/vhF6dkeuqBAMQ846kgcGVk0y7R0/Yde5vWg7E284RK3nHk7Rd6cOSos
 kBFWiUNpCCn+IzhbAKwY+Y1VKNj8cvWgulPZV+5DgIBTUoHqjgka3qHjHtEnF9N7d4gO
 cjS0fyLxt+jmkZpwYjws6wX4fwSPwpvbT6Zmt9+UHlqL4UbO73/w5lvk2voh4rjjE1pK
 0EZdTZkpCxWfTGNa62/UfudJwWOlho3Q9xe98TUYaSWTILT/GJCE0/PnrGKyBiHZHyOL
 3q36HZxl+L2ofWjVr42uPPgH0rw6wVLYk/XB6nPXPDSot2oRACOzWMc//PyF5vvBJZxN
 FtfA==
X-Gm-Message-State: ANoB5pkT3Ji7LZVONJXfjOUvfPss4JsD5vpFK4o25Qa4kUz9iMZyyk/J
 J/JoM9f0sIg2vKvahvGh4tWOhQ==
X-Google-Smtp-Source: AA0mqf6vR5YuVv7oGRsUsXO5vtMZYKJnv3j1oAZV2rSD67Aa77wWY/Fv3RlnNd3k/CK8rGiw/kEnig==
X-Received: by 2002:a17:902:6b4a:b0:187:1a3f:d54b with SMTP id
 g10-20020a1709026b4a00b001871a3fd54bmr5882325plt.9.1668233110471; 
 Fri, 11 Nov 2022 22:05:10 -0800 (PST)
Received: from ?IPV6:2001:44b8:2176:c800:8228:b676:fb42:ee07?
 (2001-44b8-2176-c800-8228-b676-fb42-ee07.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:8228:b676:fb42:ee07])
 by smtp.gmail.com with ESMTPSA id
 h17-20020a170902f7d100b00186b86ed450sm2740543plw.156.2022.11.11.22.05.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 22:05:09 -0800 (PST)
Message-ID: <41bc7a2f-1f31-611c-29ab-8b60c4b085ef@linaro.org>
Date: Sat, 12 Nov 2022 16:05:03 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 20/20] include/hw: add commentary to current_cpu export
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
 <20221111182535.64844-21-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221111182535.64844-21-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/12/22 04:25, Alex Bennée wrote:
> Document the intended use of current_cpu and discourage its use in new
> HW emulation code. Once we have fully converted the tree we should
> probably move this extern to another header.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   include/hw/core/cpu.h | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

