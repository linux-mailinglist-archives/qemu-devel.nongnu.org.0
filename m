Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E05006FF0FE
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 14:02:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px4z3-0003Su-FR; Thu, 11 May 2023 08:01:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1px4yx-0003PU-1f
 for qemu-devel@nongnu.org; Thu, 11 May 2023 08:01:15 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1px4yt-0001Jz-Da
 for qemu-devel@nongnu.org; Thu, 11 May 2023 08:01:14 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-30771c68a9eso7773988f8f.2
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 05:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683806469; x=1686398469;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Cs0n30wa/Y79HOEjY3ARGAV1hWFGb0yfb3MXkz0ZTXo=;
 b=ZbZIfYQ9WkatEGQgBctgB9x5hOSZj39LCEA3E5M3bGQvG2NgHk93LkuJW9blW1Bpvo
 336hHP6vK2Se2VhsQ+++IP8I1oogegDZiPDmCJA9fT7SCXwtfZB0OwjR5A4pbQcTBVdb
 47b+eCJlRKb64640lLaQh2kBTOvzllCNLEc52nm4DAQjdjKC7mom6H9OGRbgsNPZukFz
 qx/BGbakLUfiwg/dLBBo39TeqnrH6khB9vk04Nb+h3oA9RKo1yKqSvaYH+xDrz+iel+I
 acLiUseUgzpOavEUX6f4nnrkdJN4YGZZ9+P9JZaKSq8cPnocjxcndcmIdre+pG2bM6ra
 Sp5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683806469; x=1686398469;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Cs0n30wa/Y79HOEjY3ARGAV1hWFGb0yfb3MXkz0ZTXo=;
 b=jrlLl6b6bg/8RYCCNdzLMrZPbSgIAfYUb/nrtSbnSeh9TE+Bpdto2K1yBcXB+2J0Gq
 ASKQQokZ3+EIKtm9RYv761gxlIKTgoLFdXldHQzjE4zptmF9VgBTqGaIJKqsDDmf98TS
 sMmy34GECpBPB/jAGCl/uU0h03ZCxqxShQfMosTqR2e8JIZD83kGpi3iSep3qQo07wnE
 vV0rzj1Prk1O1VAhTKzQKhd1dIKLACQoOQSvG5fqHe4f6LfHE+ak+8PLwKV4Nz9s8XbS
 iJHQQh6DYJVAfjvuA8WKkAn+ZaVOgP7xbJKpOvNtJBb23ZpBoKPuI+Zt7H4VdKPEW7M4
 aIhg==
X-Gm-Message-State: AC+VfDxhECO3G3AHDv/hvARd2ORpzRcsd20zWtaEyRtK8rqU6C4MAGCz
 dSIx0ceWfqotAqstGWtuMzh8ZQ==
X-Google-Smtp-Source: ACHHUZ59x2+5IGezCtWM6iDEZ6jDjl4joG92I9oLiBhLrho8hxjrI7wmFwp58m2/cKLHk2ltwp5wTg==
X-Received: by 2002:a5d:6049:0:b0:307:a7c6:7875 with SMTP id
 j9-20020a5d6049000000b00307a7c67875mr6181588wrt.56.1683806469332; 
 Thu, 11 May 2023 05:01:09 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.152.186])
 by smtp.gmail.com with ESMTPSA id
 e15-20020a5d4e8f000000b0030629536e64sm20311929wru.30.2023.05.11.05.01.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 May 2023 05:01:08 -0700 (PDT)
Message-ID: <fff4769a-41e3-7d68-100c-dd2734cb95de@linaro.org>
Date: Thu, 11 May 2023 14:01:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH 2/3] migration: Teach dirtyrate about
 qemu_target_page_bits()
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Andrei Gudkov <gudkov.andrei@huawei.com>,
 Leonardo Bras <leobras@redhat.com>, Chuan Zheng <zhengchuan@huawei.com>,
 Peter Xu <peterx@redhat.com>, Zhenzhong Duan <zhenzhong.duan@intel.com>
References: <20230511092239.14607-1-quintela@redhat.com>
 <20230511092239.14607-3-quintela@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230511092239.14607-3-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.124,
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

On 11/5/23 11:22, Juan Quintela wrote:
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>   migration/dirtyrate.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


