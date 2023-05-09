Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 282F66FC71F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 14:53:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwMpV-0005tn-Ni; Tue, 09 May 2023 08:52:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pwMpQ-0005tV-5Z
 for qemu-devel@nongnu.org; Tue, 09 May 2023 08:52:28 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pwMpM-00010O-Ri
 for qemu-devel@nongnu.org; Tue, 09 May 2023 08:52:27 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1aaf706768cso44448495ad.0
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 05:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1683636740; x=1686228740;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I7s8o5EEDmJ2uvUic8000AIZXZjFrkt/6VNUDVkNpWM=;
 b=kljUYj+C3OF/btYKzpS8exuMCKDZUyCSBK4g11ECGExZM5RTBdIv+vxLdN3bp6YFFv
 ebtjnjReyzibnlGaH+2NqMy8GOx3KE+pKTs7BWXD20hbF5OHnbwfZehaO8w8FgxOcGpY
 79t7UoNITrrasx2dX6tNXyTYtZUlouDthpXjd+iR79p0LzZc9UGpV4Aoc2QSr2UJqpWF
 IxCpBXBADqPz+zHz/NizoigwCRM+svQC9IdmhJFM7ZF6Rpqelhj4TJMWD1upAGkehA7i
 h5u/52N/5DVcfcLMePTtIVYDu9Du3cL0H9S5mUAtJB/6WQ2Qh4uNzvSXygGlmLx9lNdk
 2OrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683636740; x=1686228740;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I7s8o5EEDmJ2uvUic8000AIZXZjFrkt/6VNUDVkNpWM=;
 b=jpElK45xko6bhYcmgSCcogP3bbN4rk+iu+So4IEX5bU7yODRZlHR5gGy+XwOafB4Mw
 0KP8lATQHAFc6O0jk+YVm8NEnm/hQgR0b4pHLM8zPjH/qqqTAO1sC+lfNHpkCb7mZ1Bh
 Zxxo7XEFL7/Zv9D8rQEh8fwjALOU7uahhijA39Y/sQ4Dou51ohq6UtkGl2Czl1wl9w9g
 URnSyL0I6SSyftos9p6ygbWYAzuV264yWn08PsNLl2DjgLWboMAb5gJQJYYdRUjsIeZP
 7sYvvA3HKMD3DrN2KYpRhfufKFR54TXaAGTwctvg09XQiXlQ3FQNwQAp+h3lSNMTqdqv
 7DQg==
X-Gm-Message-State: AC+VfDxg94/gxPlkAcqY0EfpJN/X+RpLc6ojcy+wViGeEHyMsbzCht+Q
 9xUdweFCekVjyVkCiIQmfHGgIg==
X-Google-Smtp-Source: ACHHUZ61h1pqAKzjVAQZxE2g/rG8rqlQtlWIfYxQ5fzstgGA+S/ZZTtbbOX+Hga5ZfqpShIiKAK75g==
X-Received: by 2002:a17:902:d4d0:b0:1ab:c4e:de87 with SMTP id
 o16-20020a170902d4d000b001ab0c4ede87mr15960346plg.10.1683636739987; 
 Tue, 09 May 2023 05:52:19 -0700 (PDT)
Received: from [10.4.210.50] ([139.177.225.245])
 by smtp.gmail.com with ESMTPSA id
 bd8-20020a170902830800b001a967558656sm1482679plb.42.2023.05.09.05.52.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 05:52:19 -0700 (PDT)
Message-ID: <20b5cb57-aa5f-452d-2c51-0d1751931b49@bytedance.com>
Date: Tue, 9 May 2023 20:52:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] virtio-crypto: fix NULL pointer dereference in
 virtio_crypto_free_request
To: Mauro Matteo Cascella <mcascell@redhat.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, arei.gonglei@huawei.com, taoym@zju.edu.cn
References: <20230509075317.1132301-1-mcascell@redhat.com>
Content-Language: en-US
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <20230509075317.1132301-1-mcascell@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.421,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

LGTM. Thanks!

Reviewed-by: zhenwei pi<pizhenwei@bytedance.com>

On 5/9/23 15:53, Mauro Matteo Cascella wrote:
> Ensure op_info is not NULL in case of QCRYPTODEV_BACKEND_ALG_SYM algtype.
> 
> Fixes: 0e660a6f90a ("crypto: Introduce RSA algorithm")
> Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
> Reported-by: Yiming Tao <taoym@zju.edu.cn>
> ---
> v2:
> - updated 'Fixes:' tag
> 
>   hw/virtio/virtio-crypto.c | 20 +++++++++++---------
>   1 file changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
> index 2fe804510f..c729a1f79e 100644
> --- a/hw/virtio/virtio-crypto.c
> +++ b/hw/virtio/virtio-crypto.c
> @@ -476,15 +476,17 @@ static void virtio_crypto_free_request(VirtIOCryptoReq *req)
>           size_t max_len;
>           CryptoDevBackendSymOpInfo *op_info = req->op_info.u.sym_op_info;
>   
> -        max_len = op_info->iv_len +
> -                  op_info->aad_len +
> -                  op_info->src_len +
> -                  op_info->dst_len +
> -                  op_info->digest_result_len;
> -
> -        /* Zeroize and free request data structure */
> -        memset(op_info, 0, sizeof(*op_info) + max_len);
> -        g_free(op_info);
> +        if (op_info) {
> +            max_len = op_info->iv_len +
> +                      op_info->aad_len +
> +                      op_info->src_len +
> +                      op_info->dst_len +
> +                      op_info->digest_result_len;
> +
> +            /* Zeroize and free request data structure */
> +            memset(op_info, 0, sizeof(*op_info) + max_len);
> +            g_free(op_info);
> +        }
>       } else if (req->flags == QCRYPTODEV_BACKEND_ALG_ASYM) {
>           CryptoDevBackendAsymOpInfo *op_info = req->op_info.u.asym_op_info;
>           if (op_info) {

-- 
zhenwei pi

