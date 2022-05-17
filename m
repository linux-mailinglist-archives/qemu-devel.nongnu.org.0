Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1472652A4F0
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 16:33:49 +0200 (CEST)
Received: from localhost ([::1]:34644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqyGi-0002CA-7A
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 10:33:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nqy9W-000076-Un; Tue, 17 May 2022 10:26:22 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:45825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nqy9U-0007ht-UW; Tue, 17 May 2022 10:26:22 -0400
Received: by mail-ed1-x533.google.com with SMTP id er5so9119975edb.12;
 Tue, 17 May 2022 07:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=apjWrVG2L+O0w2hO+bZ+o6W40AfUrP3a3cscrNL7hmA=;
 b=DZzw5S4BvvwmiEegA4c7dLglw9NtY+RpKveWAP/bW/dHFJDzAhxrytBMvwM2d6KG6Z
 GL9pO1IFiA+tk824JY0sXoaaUNsfTr6tkrQYCAItxI2JJxBy/FPkse4iJZiwWhJdTtMS
 42hSNVKsW3snN9HOUpBSP0sV6HPoKx3P+vSZnTMm5u6hpHF180TiNnwpWJCywBk+kczB
 1pphBXLK8lMPioUeJIDtJutK82XYAK1eVoQPYsNBU4x7nN9A7uAOeA33UB5lqzit5CkW
 YimeJfiJL6+9q0RFI6knE8CY59jYRMxhIyj+/9atOMdVUiO0pt6lSYV861IzahlLUeQc
 /AeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=apjWrVG2L+O0w2hO+bZ+o6W40AfUrP3a3cscrNL7hmA=;
 b=ETJ0btYcFM4rOeZJvPtbDg+ZHwFIjKjcXJvXuBv+uQQjryi6jLhUWAWjJ+lYdmyo47
 y2xYKajOb3+YID96YZ79Ghs9IZwqd0O7dZuQ7I529li8m9eyH5LzkLuYuPGLuQBFwnDj
 3Yt9UULSVSu/XZQdiEumEExJwxqpn0xv8nxXVpItcxsg1RWzb30V1bwLz01YLviLzMUm
 pBSXZD/rMD+6qGJKbNz4WOl+Nnb6hMQTgiTI+Z5hzAjsS0uNNSwo6HkSlr2TSin7cCCZ
 9dEdpbjHVHW3jksCGFjxsKPrjYHr4fSLd9XOE+xpFn8stXPZ1XSb9sFnIQGQl2wwHAEa
 vYag==
X-Gm-Message-State: AOAM530HyrRxMFMlM/EY9/nYuYh/cwASEh6xXGtHRaDRcx1z8F+q+70G
 jgtpal1ST48QTnKdmvp5I4Jgkr1sf82BWg==
X-Google-Smtp-Source: ABdhPJw6DOZw/YjjKFHO4Mm4ZvkaJyKqbRnZtCbutxOtfRfNGpm/p5GJRNa3ZYrh2PBdRiWaHq/5GA==
X-Received: by 2002:a05:6402:26d3:b0:427:c571:86fe with SMTP id
 x19-20020a05640226d300b00427c57186femr19163849edd.133.1652797579141; 
 Tue, 17 May 2022 07:26:19 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 y17-20020a170906519100b006f3ef214e37sm1120791ejk.157.2022.05.17.07.26.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 07:26:18 -0700 (PDT)
Message-ID: <0d182c6b-2c07-3606-b751-1e3d09a5c31e@redhat.com>
Date: Tue, 17 May 2022 16:26:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 11/18] block: Add blk_co_pwrite_compressed()
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org
References: <20220517113524.197910-1-afaria@redhat.com>
 <20220517113837.199696-7-afaria@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220517113837.199696-7-afaria@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/22 13:38, Alberto Faria wrote:
> Also convert blk_pwrite_compressed() into a generated_co_wrapper.
> 
> Signed-off-by: Alberto Faria <afaria@redhat.com>

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

