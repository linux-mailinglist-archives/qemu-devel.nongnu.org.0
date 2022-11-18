Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A14AB62EE1F
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 08:12:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovvXJ-00085p-5A; Fri, 18 Nov 2022 02:11:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ovvXG-00084A-9n
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 02:11:38 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ovvXB-000371-BX
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 02:11:37 -0500
Received: by mail-wr1-x42e.google.com with SMTP id i12so3996078wrb.0
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 23:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bJIqldr9vCQw100oCPzwTEAqCnScBO8Xj+5AbL6zT0M=;
 b=UH+F1Wf2QGwyKogYmeaLjQotIb2vHiJYaFzzhmZ8NmuJWz+rwSYbcIRUSFI47XauYJ
 UZhOA59gQEO/kg/7TkN9j6up6M2r6UsAyffRxr5KLwGxEqClvhdqafqe41UejQdUN9aE
 QxcWO2i0VWhNLc5OjML+p5EDkIbRyqugdDmCmPvkKkI88cBotPx29WbSvh3UXTCjQ+Yw
 v9HEkkqnHt1GXa/JxTrPNQCq9chcTRtGLvX/+d3QDifquOsOnXQBMCgxfvseE2pjt9Wg
 HEBtUFKA7wfQyu8oRyEBgkMqfYniDDqkHZis8RQNsZNQA6WMijBROZwjjbqWHRdT2Oiv
 ZmZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bJIqldr9vCQw100oCPzwTEAqCnScBO8Xj+5AbL6zT0M=;
 b=58VKgFl8JjyVgI0UV6JyhzV97lSCzU5O6MLH92gbR51wJYSXfBsX+vL0qrPvEoV5i6
 sPuJ73NG0OHc8JWmXfSiXWjbG9OsR6fZklFuGZtipMKNmlfO+RvGCdFECb490eezpZWp
 fODHod5QGFTkrXHvEqjR07jPLK35zt1RGJfOacEjkLONlhkT6fASBUgz5k6R809xuNa3
 5/y6wOFwi1on+IWw7k1LiLaeY11YVvei6HGLTfr2UATM4WHNf+3cWoV1RUIVO30YiUwl
 mH0U4e87bHPUeNlvHCg+DZfGzWW6F2E9ZiWVXPoI7Zizrc5Tf+3Y2FDOzTIOqvtZ97Ax
 eNNA==
X-Gm-Message-State: ANoB5plyP0H+cb0djPQ7VBXq3aQ+zTlkP7rl18IWHnUyDZKFzlLijT2M
 Aup5zMUG8JcaLWJYbH5TKmX2nQ==
X-Google-Smtp-Source: AA0mqf4opOp1w8wDTSmcww646PtZr/L2Kkm1RXJZYIkFj+hMwGEuRVsr4Y+TAIsUVlyKT01ilgH6ZA==
X-Received: by 2002:adf:f90d:0:b0:236:6efd:ed6a with SMTP id
 b13-20020adff90d000000b002366efded6amr3687016wrr.32.1668755491518; 
 Thu, 17 Nov 2022 23:11:31 -0800 (PST)
Received: from [192.168.230.175] (34.red-88-29-175.dynamicip.rima-tde.net.
 [88.29.175.34]) by smtp.gmail.com with ESMTPSA id
 b6-20020a5d45c6000000b0022e3538d305sm3408351wrs.117.2022.11.17.23.11.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 23:11:30 -0800 (PST)
Message-ID: <adeae784-ad13-7a8a-d474-0d7b47057c80@linaro.org>
Date: Fri, 18 Nov 2022 08:11:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v1 1/2] virtio-gpu: Provide position info (x, y) to the
 Guest
Content-Language: en-US
To: Vivek Kasireddy <vivek.kasireddy@intel.com>, qemu-devel@nongnu.org
Cc: Dongwon Kim <dongwon.kim@intel.com>, Gerd Hoffmann <kraxel@redhat.com>
References: <20221118013723.182424-1-vivek.kasireddy@intel.com>
 <20221118013723.182424-2-vivek.kasireddy@intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221118013723.182424-2-vivek.kasireddy@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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

On 18/11/22 02:37, Vivek Kasireddy wrote:
> While filling out the display info such as width, height to
> be provided to the Guest, make sure that the position information
> (x, y) is also included. This position info corresponds with the
> x and y fields mentioned in the spec:
> https://github.com/oasis-tcs/virtio-spec/blob/master/virtio-gpu.tex#L343
> 
> Cc: Dongwon Kim <dongwon.kim@intel.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>   hw/display/virtio-gpu-base.c | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


