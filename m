Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B18B6AD0A3
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 22:35:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZIUd-0008FE-NX; Mon, 06 Mar 2023 16:35:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZIUV-0008Es-Am
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 16:35:31 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZIUT-0001qX-QF
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 16:35:31 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 bg16-20020a05600c3c9000b003eb34e21bdfso9203542wmb.0
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 13:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678138527;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gdv5gPS5OnXCLiSqKdpHumw6UVwlD4JcUbBc7HpQvAE=;
 b=hmHvu/Hy0u07bXENZdkQDQmNODrjWTWB6eLHBVFI1zhoy44bt1I4TDCrXmPv9JaN+0
 CFYECiUHmxRBaPvrTYYFToWssv+OxV6Niuqs8MBAscy+2tWZCtEe/5cNI7khXxt+F5Iv
 ewEunPDY0K/TybCfHl9fHlFVdNW+BQNN6f2xPfD9SxLP9ohhnauwCZQm89wkyNk0+TGg
 OoozkQly5zz+yeoQEhZKxPokyyvtMpre7raNqC8pf9iKMSvDQK1bV+9jx22NaIDphsR0
 J5z9hvXr7QUv/NWDE9wqg2CrhUMO4rbHlKw+OTgEPBgplti9/5v1vvP5unMAY8+VBoVj
 i8Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678138527;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gdv5gPS5OnXCLiSqKdpHumw6UVwlD4JcUbBc7HpQvAE=;
 b=v0w3xIxZWJD8pmWS7UYwyAjgKnzWTlNICyHg+KPe8gILFLZt0o2HHXvZSe1ViT9E+G
 b/jUWJUVPmdUFnOQez5Bae6hjazvsNpIZ/ifwbndP/dI5VKb0kHDKg6nRM1grdVaLGzV
 XkusKverxdiKBeBMJIblflhfoX/YJZvZKTK2JoYBOwtpnj+MpUWchCEzqD4bpiH11tk+
 NZzgFykGtXoPSpW3X6rJtu8bjJ8f2yduIBvv04v1hKFVw2J9QQmGOCnfyUBbX9bfqhUy
 9F7OBDbfrcQtvE9GLUBzpPGr0uIR/18qKrpWDLPITZjnyssXi4Du9SrSDKx2CQwbI/zl
 eYPw==
X-Gm-Message-State: AO0yUKUfCxScNog/CMcdTTUcncsLeIE1k9DPCnV7luGVgLonsKaD/MjH
 TRQBZNRhTLPHbSiGMvUlzICNNQ==
X-Google-Smtp-Source: AK7set+OpAT+UN8xNNNLspBOiztH7z3qu4CCFkiV23qudRE+nVDEbFI1bCw8nUIs9kMDaiCr/9bjdQ==
X-Received: by 2002:a05:600c:4e8c:b0:3e2:dba:7155 with SMTP id
 f12-20020a05600c4e8c00b003e20dba7155mr9954618wmq.20.1678138527319; 
 Mon, 06 Mar 2023 13:35:27 -0800 (PST)
Received: from [192.168.1.115] (92.red-88-28-30.dynamicip.rima-tde.net.
 [88.28.30.92]) by smtp.gmail.com with ESMTPSA id
 d42-20020a05600c4c2a00b003e6efc0f91csm10910772wmp.42.2023.03.06.13.35.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 13:35:26 -0800 (PST)
Message-ID: <4cdb1324-4a8b-6ffc-5e15-2548125f7e2d@linaro.org>
Date: Mon, 6 Mar 2023 22:35:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] vhost: Drop unused eventfd_add|del hooks
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, longpeng2@huawei.com,
 "Michael S . Tsirkin" <mst@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230306193209.516011-1-peterx@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230306193209.516011-1-peterx@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

On 6/3/23 20:32, Peter Xu wrote:
> These hooks were introduced in:
> 
> 80a1ea3748 ("memory: move ioeventfd ops to MemoryListener", 2012-02-29)
> 
> But they seem to be never used.  Drop them.

Similar to bf83601fdd ("xen: drop no-op MemoryListener callbacks") few
months later...

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Cc: Richard Henderson <rth@twiddle.net>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>   hw/virtio/vhost.c | 14 --------------
>   1 file changed, 14 deletions(-)


