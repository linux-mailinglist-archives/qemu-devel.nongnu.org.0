Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCBD5A329F
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 01:29:55 +0200 (CEST)
Received: from localhost ([::1]:48694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRilu-0000wS-Dg
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 19:29:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRiaE-00047L-1G
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 19:17:50 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:35835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRiaB-0000CQ-H4
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 19:17:49 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 m10-20020a17090a730a00b001fa986fd8eeso9434356pjk.0
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 16:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=qnDL31xYKIB+XqZCnfUWMsZ3OGelDCSPAts+Fqhr2Q0=;
 b=xhWfJwS7CPMS4U2qMiwQddeYOPRdq0BsOET5WBogNNCe62HCPpJGNj7W8TX4gpk2xE
 Hz82hm0INOEZFJ1q2UcOTgYkmVFEUzzOnHq0964OQywUvuJwI8PfDQkRA8WmCnlplStg
 8TpNP3+dL2tTPK0tr7/lpd/ad/uqD68r9An84EB08BB5uefGAjAmWitc0qLzlWZTEi6v
 f39AFmU3FcSDsCnkyQ3IFc3bP8naR3gB2/vdZG4K/V0/fhvIaeheu42b+iDFyP92JUWe
 Z6ZKGipgiNqivUW+tB2/Tvd2+ocJxzQ+pbgEsxygdHHNXjFNoTA1YLKiEKz2qK9Gj/s7
 28ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=qnDL31xYKIB+XqZCnfUWMsZ3OGelDCSPAts+Fqhr2Q0=;
 b=zJVN/8KvrBjFSN/1Vi3wl8eHVm8ruOG6kfqknY0Ge2EqUv2iINO6vVHQK7Gqih7wFY
 BEIsWtD/sgUHLYQAKHhszNgbofaez/j4OFFEppbAFdwYjBBYfP0Ffv+J+odQxnzRJot2
 1vkS/NGSAbH9O0E2ESSOvBHvdia7rRjrG0IaD3y0mgZ4SXhij0JgQa16mYHgQt+FsR1k
 rn2XvAAb/rhG0wg0pTLoDK1LmcgZaxbf2WmxTHmswTyQFgiNBNHdRytdm154MdIGdRJB
 ZRBJcsqPPB4Dz/RgNH9dkDVEye+ApY9Ia47DT//TgyAJM3SSgP/oQpe7tn3AB5xBHSfT
 SEbA==
X-Gm-Message-State: ACgBeo0oKAMxt3Hce9NY+puJCkGAcpaMNtl7VLodY7+wawE6MXmgK/jy
 bM3i6cjjd1een+td9KFU0R5jAw==
X-Google-Smtp-Source: AA6agR7Z3ZxC8GRvzGEK5K5Crpoeioy0LJZZGWDbJpm6n0bpH6ERm9ViFJqQMTj5/+eeQp/dm24JRA==
X-Received: by 2002:a17:90b:3ec3:b0:1fa:a293:c511 with SMTP id
 rm3-20020a17090b3ec300b001faa293c511mr6734314pjb.156.1661555865313; 
 Fri, 26 Aug 2022 16:17:45 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:68d8:30f3:fbd7:6f7f?
 ([2602:47:d49d:ec01:68d8:30f3:fbd7:6f7f])
 by smtp.gmail.com with ESMTPSA id
 m8-20020a170902db0800b0016f1319d2aasm2191837plx.171.2022.08.26.16.17.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 16:17:44 -0700 (PDT)
Message-ID: <42f7c66a-3901-19fe-d0eb-424687f3de2b@linaro.org>
Date: Fri, 26 Aug 2022 16:17:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 02/23] i386: formatting fixes
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220826231204.201395-1-pbonzini@redhat.com>
 <20220826231204.201395-3-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220826231204.201395-3-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/26/22 16:11, Paolo Bonzini wrote:
> Extracted from a patch by Paul Brook<paul@nowt.org>.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/tcg/translate.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

