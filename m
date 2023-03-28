Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FC66CC10E
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 15:35:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph9TL-0003xC-Q6; Tue, 28 Mar 2023 09:34:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ph9TG-0003v7-VJ
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 09:34:42 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ph9TE-0006Xv-Ub
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 09:34:42 -0400
Received: by mail-wr1-x42d.google.com with SMTP id h17so12222631wrt.8
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 06:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680010479;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cUIMeveGveDhVgF8dGEcZIq5175WXPAyVAy4dOKhOvM=;
 b=upulDPLTwAoYUl0JegwgyqJFBhgJSrBWdpB4NT4/zNSgRHFimAztpanHKQApOw4Bn9
 zyfU9uLa4NGUuH6IEjo9G1n2lKxoE6B+tWbOzzs7dIG6VVSsr5A8PcGUldlNOZZZYAmb
 bQBwA1dwe3OmJD3UuNpEOifEQh48berhRu9941atBKeb6G1xgxSZTEWAminPN+JeqtKQ
 v3DNvTUTlnNxFUpliyzpkSD9oOvV2X6KFFhKH+OHbf9ON94Z028AM4XJa5OoaBjC2fnD
 oet6ZItfXaZ0ev0A4X031H43/9wxsjmILyM+zNDrTBRUVOLvWWVjQfyWpVra83T3dnnK
 A+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680010479;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cUIMeveGveDhVgF8dGEcZIq5175WXPAyVAy4dOKhOvM=;
 b=XTWwITBkDfIToL7gDXFHwbF+9laAdMQSNoihlyW0G7C30wopCcqJ+doOc8xyHT39c9
 aa+FPh/AM9i0FIVE0vClNsC2NcczyY7U8BhQbCW0rzjaA+Fu+rchYBcRemP1WKScw+mK
 W9ffWsAfZQkklMqALFT8fJdvF9h3T7/sQDjSBKv9cRmJjsUkc81e0PstgmNAm1dKOAS3
 FB2C4frZrks5dGi+5E8I3IG5QZZp7HVazSpLES3f0wwFE3rjnYQ1uUymj8nabZPRBnsK
 QSUdXRkNHwJlXR8UiT+olh/tl6tG1mHTfbBYIqq/NIStWzyDjBBBS0bbHCbsj+31QsbV
 04Bg==
X-Gm-Message-State: AAQBX9eHKNFf7Lgd+UrXE8n2WdvKji1oyTdDeo4s8UsFfmKbyGMgPIjw
 NDGQhijxZkNFd1QTF4wlnDoek/QVrMpyZMYb6Ns=
X-Google-Smtp-Source: AKy350YXVHgHxgeWXTqGhDWIvlwHI/jNCe29KkhVPL5j+gI3VaFFhUOmQr43UhN+g4j3TGB6yNHrWg==
X-Received: by 2002:adf:df92:0:b0:2cf:3a99:9c1e with SMTP id
 z18-20020adfdf92000000b002cf3a999c1emr12178259wrl.49.1680010479327; 
 Tue, 28 Mar 2023 06:34:39 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.210.212])
 by smtp.gmail.com with ESMTPSA id
 x12-20020a5d650c000000b002c5544b3a69sm27661633wru.89.2023.03.28.06.34.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 06:34:39 -0700 (PDT)
Message-ID: <441e78f2-962f-6b46-4bf9-09e8ef75fbe4@linaro.org>
Date: Tue, 28 Mar 2023 15:34:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH-for-8.0 1/2] target/arm/gdbstub: Restrict
 aarch64_gdb_get_pauth_reg() to CONFIG_TCG
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas
 <farosas@suse.de>, Claudio Fontana <cfontana@suse.de>, qemu-arm@nongnu.org
References: <20230322142902.69511-1-philmd@linaro.org>
 <20230322142902.69511-2-philmd@linaro.org>
 <f4d1705b-6163-37d0-8516-637aaf7cc796@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <f4d1705b-6163-37d0-8516-637aaf7cc796@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 22/3/23 16:15, Richard Henderson wrote:
> On 3/22/23 07:29, Philippe Mathieu-Daudé wrote:
>> aarch64_gdb_get_pauth_reg() -- although disabled since commit
>> 5787d17a42 ("target/arm: Don't advertise aarch64-pauth.xml to
>> gdb") is still compiled in. It calls pauth_ptr_mask() which is
>> located in target/arm/tcg/pauth_helper.c, a TCG specific helper.
>>
>> Restrict aarch64_gdb_get_pauth_reg() to TCG to avoid a linking
>> error when TCG is not enabled:
>>
>>    Undefined symbols for architecture arm64:
>>      "_pauth_ptr_mask", referenced from:
>>          _aarch64_gdb_get_pauth_reg in target_arm_gdbstub64.c.o
>>    ld: symbol(s) not found for architecture arm64
>>    clang: error: linker command failed with exit code 1 (use -v to see 
>> invocation)
> 
> I guess we should move this function somewhere else, because KVM can 
> certainly use pauth, and we do want to be able to produce nice 
> backtraces with gdb.

I ended inlining it (along with pauth_ptr_mask_internal,
renamed as pauth_param_mask):

https://lore.kernel.org/qemu-devel/20230328133054.6553-3-philmd@linaro.org/


