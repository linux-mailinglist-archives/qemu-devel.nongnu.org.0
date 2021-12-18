Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B38B64797DD
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 01:41:51 +0100 (CET)
Received: from localhost ([::1]:38088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myNnK-0002Of-AY
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 19:41:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myNiK-0008QB-Oq
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 19:36:40 -0500
Received: from [2607:f8b0:4864:20::1035] (port=40899
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myNiJ-0004cP-9K
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 19:36:40 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 c22-20020a17090a109600b001b101f02dd1so7133321pja.5
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 16:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CvGqB2dTCs7VwI6A/VizJVg6tNTWYar7/7SM5W10z/E=;
 b=DHDXy4dyTqfPAYGWddMwA3voE5VLbdXSZAxOJkwNGcwXEyhYOZkYbI/lKv/FxfDg0E
 1s6LeaggN6L9m0PADILkCMP0hDOahGYZpAK5Yt4F1389Mnj1wwmMdpDbKQvM4EENxwkS
 NWeTioTgtBcC2nf5GJ3g/JdQ8AH9bNmz533H3fn1NDkH/INvnBYwycPYsMfbJ0TPtkEN
 Jk2VTKjIQjLXuopGFnTwg3obYvjmJA5DQ6OVyIkdoKsc+2ICM3s6zpHm3qlUXeku8JGg
 5FXiwDcZvPg1HJiKIDtPDfNYAW7MoyLYa6um3OP3LZXiWsJaeqk6o95Am2kKQXVipPNQ
 m/6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CvGqB2dTCs7VwI6A/VizJVg6tNTWYar7/7SM5W10z/E=;
 b=pJf5UW/Il3uNW285QgymXLAU9R+TX/KcLDFKzyGdmxaXcSAS+TZjLBloTmXQRz2DMQ
 bSJ+ihkpyv3OBqRSt4X4lminPOCfO3LfYrxxDbAeANuxFEUPTcU0mIu9VkHgQb/1PCEQ
 +81rx16+iXAe4/+WVAV6fiuXso7IL68RtbYS3tbzVJJUfIDd0+uDxGb7E2m7uh6vjZXq
 lfTaiUKyZvWiQ1SuJAgglz6XzKFF5IrA2OUFp6VXAhjXMEvNnNZCDv0D1Vvny7d5wzmJ
 3yFauNN64SzLHYFZ/olFNN30yMcXvZHkqI7Swwt3cxA/lFgPuzH9tkMUVupqmWsdNSN/
 LIMw==
X-Gm-Message-State: AOAM532DVV7Mt9elVIM4LWRYsI4xpIfk2+Kzmyn3W/BJHOcbnl4Dn3JR
 pFivBbV5ibqScYDbourbMSGKvg==
X-Google-Smtp-Source: ABdhPJyDYKvXh9WaGHnoHOk2o1sREu1ecEVvxGKWHTS/0PZyu4P7wVFtlkqzecnaZ0SosCoXxdosBA==
X-Received: by 2002:a17:90b:4a4d:: with SMTP id
 lb13mr14813845pjb.97.1639787797879; 
 Fri, 17 Dec 2021 16:36:37 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id rm1sm13062065pjb.3.2021.12.17.16.36.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 16:36:37 -0800 (PST)
Subject: Re: [PATCH] hw/scsi/megasas: Simplify using the ldst API
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211217231542.1461286-1-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <32549938-46c1-94d0-dc3a-3a722d4fc31d@linaro.org>
Date: Fri, 17 Dec 2021 16:36:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211217231542.1461286-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, qemu-trivial@nongnu.org,
 Hannes Reinecke <hare@suse.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/17/21 3:15 PM, Philippe Mathieu-Daudé wrote:
> -    cdb[3] = (len >> 8) & 0xff;
> -    cdb[4] = (len & 0xff);
> +    stw_be_p(&cdb[2], len);

Wrong offset.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

