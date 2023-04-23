Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2BA6EBE3B
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 11:15:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqVo5-0007EQ-K4; Sun, 23 Apr 2023 05:14:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqVo3-0007EI-LL
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 05:14:51 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqVo1-0001MK-Rh
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 05:14:51 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-2f86ee42669so3203810f8f.2
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 02:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682241288; x=1684833288;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ay6hR0PPIsoHb6jQyecAFHoRR/vs1KWt6KRc/8xGmTQ=;
 b=ck8QzP3iO4n7gVpn6dLxFGId1BVTWQDUnsycxLIC2BEqLqnjgwoiwNDchiaNEev5xj
 lJ72345qxLdU1oa5I3rpa4pbJyTJug8hXAcsDOy3MLesFR11CuqZmBu5IQTEqZEaHP62
 RLUanM9P43I6MJFIjosoJU0aWIKh8EYHJB8BOxMAUyr09fUmvNTy4ZjPtnaFbeYOxv6R
 5VqNMmyArRZc01LoKKxKLHVlBXtb9AE9qGuhBThw4RChhitbk+ozAXrY+x2yGlGD8CqU
 i4J3Y7u9pf+RvVe4W/00juuQXqUzaQBlU/Ycpiz9sCm6AdjnlL+t8AxfwUg2m48CUN/Q
 4Hsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682241288; x=1684833288;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ay6hR0PPIsoHb6jQyecAFHoRR/vs1KWt6KRc/8xGmTQ=;
 b=Ld9Mt9oCipRamWxUR8GEIunt3j4HP1JXLuU5ouzzDVY1MRASupLM1He5IMmdylgwXt
 7TZjKtkjiqXkL0ZkwPgmRm42BRPtDYOlNPdIawykhQuUZhHUsEGgUL5frDgcAsE8JePd
 0Bs+mvYmB1AtG35KjON+ImbGKAjaFCqhKUChiysezn32XMxzJwIkywaT3CEYLCF7KdGL
 +0SLo3RbQUEaDZu2TbOfJ3s6ywEE8o03a4GiWMsPsYsSBNCh1zw1gMtflgcEx+lsK/I3
 PnQ+DQaYzbM2Z7tcBCeS8JibZx1JfkqkPXutXOmlJLhH2/XP/Fd2uYynByUPEJz0A4RT
 TEYw==
X-Gm-Message-State: AAQBX9eXXkINIhi/rSFqsCG1PHJ0opBYMH+RxMQsRbgvCFrGId84eYTQ
 N20np8u3twDp3b5TG3DpfqfV0w==
X-Google-Smtp-Source: AKy350ZytY8EbPIgglO0VzYv1ewiNm3sBdf8e3/WbsvtNlatKYDtC/ydlD53KRc0P6lWae2sp/8Ijg==
X-Received: by 2002:a5d:6808:0:b0:2fa:26cc:71f0 with SMTP id
 w8-20020a5d6808000000b002fa26cc71f0mr8353688wru.10.1682241287780; 
 Sun, 23 Apr 2023 02:14:47 -0700 (PDT)
Received: from [10.43.4.99] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 h15-20020a5d688f000000b003046c216c18sm2898986wru.30.2023.04.23.02.14.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 02:14:47 -0700 (PDT)
Message-ID: <19f888bd-f0f4-2307-90c1-744f16ca77c2@linaro.org>
Date: Sun, 23 Apr 2023 10:14:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 7/8] cpu: Replace target_ulong with vaddr in
 tb_invalidate_phys_addr()
Content-Language: en-US
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: ale@rev.ng, pbonzini@redhat.com, eduardo@habkost.net, philmd@linaro.org,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com
References: <20230420212850.20400-1-anjo@rev.ng>
 <20230420212850.20400-8-anjo@rev.ng>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230420212850.20400-8-anjo@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.047,
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

On 4/20/23 22:28, Anton Johansson wrote:
> -void tb_invalidate_phys_addr(target_ulong addr)
> +void tb_invalidate_phys_addr(vaddr addr)

Hmm.  This isn't a virtual address, so 'vaddr' isn't right.
I'm sure we have something more appropriate.


r~

