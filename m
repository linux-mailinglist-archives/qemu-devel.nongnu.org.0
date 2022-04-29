Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 944DA51535D
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 20:07:56 +0200 (CEST)
Received: from localhost ([::1]:37512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkV23-00007F-7Q
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 14:07:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkV0e-0007Xc-Ur
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 14:06:29 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:40465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkV0d-0006L3-Bk
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 14:06:28 -0400
Received: by mail-pf1-x42a.google.com with SMTP id i24so7552356pfa.7
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 11:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=9pDj1mxizGcS/INj2rkHoqC7vf0kkvUVAue+SZF6PDU=;
 b=cai5VKQSdT46aRWoNJU2wzgqkHPfdX0RojAp/+cki877eiKR0bPEWz7ZxdwczGq9QO
 EM7EwpBpGPqzsB8DWqIwLzrAn3QP5CXlLCETy1/83BVfbjOQhT5FHqZb8RmCsc5hNZN1
 /Z2Wf90kiXru5dix5vr+YXzCpnuzMjfzD129h8xsjoPAK7NYIBpxryv94n6v2DU5H7Nt
 FT7xErob4h0EMtBC9BwnXgyqD/JOxJ0jG+rB0MosEWj0DWD4lI1JqQNhyG8OeMMBhD3i
 yPmJp1upd1Jj72PcMrt9NSh1m4ZoKIbhWWv8i1iekM/JPfR1JPXCxeJMqeYfRPKythRL
 wROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9pDj1mxizGcS/INj2rkHoqC7vf0kkvUVAue+SZF6PDU=;
 b=dZjKFEQbYU+6s46WIVB68MZheB+Iupp5irJ1jKM9Cpfxyu3pl19T2ZcwMkueeeoDxd
 C9SrcAQz/+DxsQcxyqW+KRuOpxWVHYCHAUAsFv0r+Ru9eIzFaK9A9oGp0T/tcev5MrWt
 zl12t1c1TzYlG/yHUEOWODuUySQFCrYZ0q7rLAvW+mT4r0jMeeSKcg50jRLBbRUYfl/J
 wkUK9sS0i1v6umRVQ6DSAJ9nwgzbkvnMyepQHX5Ea8CPH6VYvR1wqAM6SBTZ4Tsc16xJ
 Y86dKsFaLrNt71Mblx3AHrPiI/5vrB1PD6SeS1drj/spSEZgwLibOk76MBcIunxleJeX
 SdOA==
X-Gm-Message-State: AOAM530YD+Qt0HHyh3rBINRku3u5T3vs6OOSayQjl1r6rY0thO1Jow+k
 8Evx/3pmyf3lZqFr68fON/ce4w==
X-Google-Smtp-Source: ABdhPJw3SBelRFAMrv4FWP6HXs0wkFXVmmht1d/SYwHkYBhlBherK3i+CHlE1t84MfNYCb5Lfpezkg==
X-Received: by 2002:a63:3f4e:0:b0:3aa:193b:8c5d with SMTP id
 m75-20020a633f4e000000b003aa193b8c5dmr469811pga.624.1651255585400; 
 Fri, 29 Apr 2022 11:06:25 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 c5-20020a17090a1d0500b001cd4989ff69sm10709924pjd.48.2022.04.29.11.06.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 11:06:24 -0700 (PDT)
Message-ID: <9a9e8adc-32b3-dc39-6cac-d37a2e5a8a7f@linaro.org>
Date: Fri, 29 Apr 2022 11:06:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 56/60] target/arm: Enable FEAT_CSV2_2 for -cpu max
Content-Language: en-US
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-57-richard.henderson@linaro.org>
 <9c515174-a203-ecbd-1fd3-c8aa1913be4c@greensocs.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <9c515174-a203-ecbd-1fd3-c8aa1913be4c@greensocs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/29/22 02:52, Damien Hedde wrote:
> The following checks are missing:
>     + for HFG[W/R]TR_EL2.SCXTNUM_EL0/1

We do not yet support FEAT_FGT.

>     + HCR_EL2.<NV2,NV1,NV> when accessing SCXTNUM_EL1, but maybe these are always 
> guaranteed to fail because we don't support the features ?
>     + HCR_EL2.NV when accessing SCXTNUM_EL2

We do not yet support FEAT_NV or FEAT_NV2.

>> +            if (arm_is_el2_enabled(env) && !(hcr & HCR_ENSCXT)) {
> This case is also present when accessing SCXTNUM_EL0 from el1 (but without "(hcr & 
> (HCR_TGE | HCR_E2H)) != (HCR_TGE | HCR_E2H)" precondition)

Quite right.  Will fix.


r~

