Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 506184EEB88
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 12:37:54 +0200 (CEST)
Received: from localhost ([::1]:42828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naEfA-0002jH-RP
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 06:37:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1naEdm-0001xH-BG
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 06:36:26 -0400
Received: from [2a00:1450:4864:20::429] (port=39631
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1naEdk-0002a1-4Q
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 06:36:26 -0400
Received: by mail-wr1-x429.google.com with SMTP id j18so3608323wrd.6
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 03:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=+2C3W4xm+9dbx9bV5jEA8Lc+VsmC3YlPxpTKkX6DY5Q=;
 b=hqGuyObx8taiKSIbDTyNEvXwGaOnt0RFnqqEriQspljU2uKJ1GZn31dlWggUJiwKS+
 4d/joDE79C8Dzb8lLt1eIe2440DlcDa4IYdqDv4TyU6poX9PCJIzEeudfTdxOo4603Y4
 rp9wkonTP1ZjHgonaK2fnskAppNiDeuxl25xOVdErDMo/C16J157GxCcAXuxGFidU0Ii
 Bus+q3oC2L4TqE4jjU1QD7SsZqHp7TCElFhF08AL2DcuX7dPDuCtEMmz1eaTgY4DJo78
 7i8OQqVjy9HIhjiQA4yWfoPgH1x4mmXgkjFv15j7tkPlyHZ+kR/EMKh5Gqg4xw2kUkQ5
 w44g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+2C3W4xm+9dbx9bV5jEA8Lc+VsmC3YlPxpTKkX6DY5Q=;
 b=UxcwFsXAAwdlctL5+W+KWrqo3+Fi/2z2lf0J+NCqOT/pQT3lXOF+r1kw1CP92/RV7p
 V2YLzgHIiu+3dj6HIfAQWFvvrDAs24JEU6A+3/+9yxg14qA5bdYK5h5VCKCiNzo0xSpH
 UiU/HvW4rIlqSbm+SwJgp9nMTfA1NZ9AaM2vbT93/HJAqqo6IUv2+eq6vsRgFLhU3aji
 Bw1wkCS3nShIm3wGBJ3zX8yWKO1rlzv0FHKNIm5mGWWAHavw1mEpm52/aJRlA3ErEGge
 jztsYstkFsJ003UfM4Tlxa440iy6FMPhOD5qnoVjWcCuO5KdBr/Jp7egc4YqCWPsdr9v
 gF1w==
X-Gm-Message-State: AOAM533rpPkr9rpINjtglJ2dqzx3gOGMCnA5t4tcfSXQ/dXFULzMRRbQ
 sHyPL1UDAlUWgApfCBvSKpw=
X-Google-Smtp-Source: ABdhPJxaKofaD3mOsTFbvUVFYNMv3IxMEuhsgBAjlsttd51YXHCXd39xiYI3Zwohctc6KxqVuUMuSw==
X-Received: by 2002:adf:f943:0:b0:203:e832:129 with SMTP id
 q3-20020adff943000000b00203e8320129mr7263064wrr.626.1648809382213; 
 Fri, 01 Apr 2022 03:36:22 -0700 (PDT)
Received: from ?IPV6:2600:70ff:f07f:0:f49c:562:b5cb:b2b5?
 ([2600:70ff:f07f:0:f49c:562:b5cb:b2b5])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a7bcb84000000b00389efb7a5b4sm9399171wmi.17.2022.04.01.03.36.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Apr 2022 03:36:21 -0700 (PDT)
Message-ID: <86f9c4c9-1b7f-7c55-3379-cb93c4456f29@gmail.com>
Date: Fri, 1 Apr 2022 12:36:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 2/3] i386: factor out x86_firmware_configure()
Content-Language: en-US
To: Xiaoyao Li <xiaoyao.li@intel.com>, Gerd Hoffmann <kraxel@redhat.com>
References: <20220331083549.749566-1-kraxel@redhat.com>
 <20220331083549.749566-3-kraxel@redhat.com>
 <73f3b878-1b3d-c292-d124-410a20acfa62@gmail.com>
 <20220401050818.hbj4qkebwggvc6x3@sirius.home.kraxel.org>
 <af45db70-0d65-a4f2-89da-2bd86dfab5a8@intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <af45db70-0d65-a4f2-89da-2bd86dfab5a8@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/4/22 07:28, Xiaoyao Li wrote:
> On 4/1/2022 1:08 PM, Gerd Hoffmann wrote:
>>>>                if (sev_enabled()) {
>>>
>>>                      ^^^
>>
>>> Can we remove the SEV check ...
>>
>>>> +    pc_system_parse_ovmf_flash(ptr, size);
>>>> +
>>>> +    if (sev_enabled()) {
>>>
>>> ... because we are still checking SEV here.
>>
>> Well, the two checks have slightly different purposes.  The first check
>> will probably become "if (sev || tdx)" soon, 
> 
> Not soon for TDX since the hacky pflash interface to load TDVF is rejected.

You can still convince us you need a pflash for TDX, and particularly
"a pflash that doesn't behave like pflash". Also, see the comment in
the next patch of this series:

+         * [...] there is no need to register
+         * the firmware as rom to properly re-initialize on reset.
+         * Just go for a straight file load instead.
+         */

>> whereas the second will
>> become "if (sev) { ... } if (tdx) { ... }".
>>
>> We could remove the first.  pc_system_parse_ovmf_flash() would run
>> unconditionally then.  Not needed, but should not have any bad side
>> effects.

OK, then:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>



