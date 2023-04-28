Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F13376F2488
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Apr 2023 14:16:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psjTh-0002qM-0h; Sat, 29 Apr 2023 08:15:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1psjTf-0002qD-D9
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:14:59 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1psjTd-0004CL-Ul
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:14:59 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-2f95231618aso406731f8f.1
 for <qemu-devel@nongnu.org>; Sat, 29 Apr 2023 05:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682770492; x=1685362492;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=P3GXzbxNNLY15H4o0hYi760bg2jIIF0rvGYGuBPwED4=;
 b=RUZsboF7kpKCEEJycYf7ZjhygmB+t1U9SACPHso/HR/1UpvlSxJ+1F1ICyYY9BT1hG
 3b9aFe2W4J9vY5DuL+pyCpVU9M/VHvudJZnpWaCccl7fHiKO0mWbiupSLolR7/P7RSIY
 DdW+SzqSb1T7qoc0jYo3owraRbQLqSmVkLb8YBwkEK3syzJGZ40q1O0g7w+N+7UTMVQ/
 pws/vxEwlfoBZO9gHE6yHUFKxsytvGrS8/HTlfZa+34Ze1Ag+P86IB7BdYHETgikqFR1
 /UsW6a6DNhRl4m/tTP1osxYJFUCMOXJdWVgcPMbPOhe2MvW3rRivXv/dFdFyOwjAVOR9
 aDaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682770492; x=1685362492;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P3GXzbxNNLY15H4o0hYi760bg2jIIF0rvGYGuBPwED4=;
 b=Ze1Ay0vWhrqAGbdv2NVXpiLfq8lBrZTe6hagKCqcmWQ6qh55SXediq9YCdk7bfopQn
 L0rM+zd15ZJKk4nN8VHhYV+EaUM7dBAnqT4P2ZTTyK76ERNHMNQmx2SnbIlE3mnxNohs
 oFEbCKD2B7jF4ip1P8EYqP3vv67PDWVMqftaMt2+MuMeVx+ticnQQipxjAX7AUjISwZV
 diMs0/6vCZaT06WNvzTfVZCRDl+ElXW21mciqqNxke45JS50t29ofdSWAYfBVECd81EM
 YWfOkwc10hErthNbMeAKoSVU4jLNyTj7a/tHlZGncTCVnKTlf8l4WUChl7B8tNgL4qWE
 VUtw==
X-Gm-Message-State: AC+VfDzO6FgImzWqXDKrvQVE4koXOhQHISdSH6lOPMQCQPcnj2aCDx3H
 +GtzJpK35278TUqXdmfrNvp9tA==
X-Google-Smtp-Source: ACHHUZ6Lzti9Y4G46Nm7tLqHjvFqPIhtMpGTDIdWUuXMP8REkM0AnBwVBtRHzJAlTUMLz6iYMbjNHw==
X-Received: by 2002:a5d:60c8:0:b0:2f1:dae:100c with SMTP id
 x8-20020a5d60c8000000b002f10dae100cmr5559137wrt.5.1682770492541; 
 Sat, 29 Apr 2023 05:14:52 -0700 (PDT)
Received: from [192.168.212.175] (7.red-88-29-166.dynamicip.rima-tde.net.
 [88.29.166.7]) by smtp.gmail.com with ESMTPSA id
 q9-20020a05600000c900b002c8476dde7asm23343546wrx.114.2023.04.29.05.14.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Apr 2023 05:14:52 -0700 (PDT)
Message-ID: <b80b77fc-71b7-9b83-1dd1-b371e0bda6d6@linaro.org>
Date: Sat, 29 Apr 2023 00:05:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v3 1/2] cpu: expose qemu_cpu_list_lock for lock-guard use
Content-Language: en-US
To: Jamie Iles <quic_jiles@quicinc.com>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, pbonzini@redhat.com, peter.maydell@linaro.org
References: <20230427020925.51003-1-quic_jiles@quicinc.com>
 <20230427020925.51003-2-quic_jiles@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230427020925.51003-2-quic_jiles@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 27/4/23 04:09, Jamie Iles wrote:
> Expose qemu_cpu_list_lock globally so that we can use
> WITH_QEMU_LOCK_GUARD and QEMU_LOCK_GUARD to simplify a few code paths
> now and in future.
> 
> Signed-off-by: Jamie Iles <quic_jiles@quicinc.com>
> ---
>   cpus-common.c             |  2 +-
>   include/exec/cpu-common.h |  1 +
>   linux-user/elfload.c      | 12 ++++++------
>   migration/dirtyrate.c     | 26 +++++++++++++-------------
>   trace/control-target.c    |  9 ++++-----
>   5 files changed, 25 insertions(+), 25 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


