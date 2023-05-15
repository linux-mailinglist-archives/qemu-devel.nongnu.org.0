Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F602702E9A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 15:44:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyXzK-00029g-Bl; Mon, 15 May 2023 09:11:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyXzA-00020Q-FU
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:11:34 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyXz8-0002nK-M6
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:11:32 -0400
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-5307502146aso3504791a12.1
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 06:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684156288; x=1686748288;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IQf0Ti/07rY6Olo+O4wgjKx0G4y25i3ScRDglOGbjps=;
 b=r95u6NntDp0JfQ09EK3juQnS0N6Ap60TomuZTmvoSlp0sKgKdOKIKResmONlZ9Qir9
 xZrAayXfumokHiPKQEaBeaVpN+37R6X8DOM8sQjh6CJ9mDyKMHWRvAXHOfz+wEGIwgp/
 YZOT08JvLPLAuy8t7AvghR5Y6RBJymA0CrA8vcEFjRu5esV7tH7+pQLdzXhWqQA/5jem
 cPCxrkvS7jgpWtHR+N80H7Z7VnKRodRTU9/bRA7+XBPExjpG9kOGDeFo+1InGokI+F1p
 D2X8LINSy0FGoNdxQNFl7avW9zwJtcpowURqMICcBNUUsendaXV05BibCPlUR+J/auUB
 /zjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684156288; x=1686748288;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IQf0Ti/07rY6Olo+O4wgjKx0G4y25i3ScRDglOGbjps=;
 b=E/nFvqQs5VBziJ6SjXXaMQCtHg0zLxjHiCzAgfe0cSPC7TmebwuaL96YT8BkUGG4Xn
 ss3DjYjyFZmTn0PXUkXPKAlEkv1N4bW+UgCAzAzMbDEQpM1Jip5JSxUzQ4edehOMK4LX
 cF9sef8gt7KrMUNbyR/NynGVwp8tIUkoT0HzbMEvarIupx8YDg8EJGIPxxsrxYgBQ41f
 R5hwWbOmW40IDVW0IakFqe1CMLsy6VMM8+STgIi2kzQ9zuwiS9tDdaOdTHpuXWAsSrwG
 o4VqVMqTU3qtM3DgboHjeBpp78WgDAR0FdhuN06tzztMbR8R9ncp8WqZ6Ym9wZFyGSBI
 Yokg==
X-Gm-Message-State: AC+VfDzPgfGmiU9On3LRmqQmg+SFvgeC5a3o0kYymZYek9WYa9IwYAd+
 ZkuUTyxP6lncH+wt6Hgdf1clrw==
X-Google-Smtp-Source: ACHHUZ76MzwwGOhZbYX5W8fJcWE3Vux8uy8qel8h1JstbssLoCqduTWU+avNRT1K4KZK5i2QcArOGw==
X-Received: by 2002:a17:902:e549:b0:1ac:a661:a4b0 with SMTP id
 n9-20020a170902e54900b001aca661a4b0mr26216080plf.57.1684156288055; 
 Mon, 15 May 2023 06:11:28 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:9902:96ac:8d8c:4366?
 ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 j9-20020a17090276c900b001aaeaa27dd5sm13391317plt.252.2023.05.15.06.11.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 May 2023 06:11:27 -0700 (PDT)
Message-ID: <51c1ca8b-97e9-acfe-184b-fa5c26f8fd0c@linaro.org>
Date: Mon, 15 May 2023 06:11:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] target/loongarch: Fix LD/ST{LE/GT} instructions get wrong
 CSR_ERA and CSR_BADV
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, philmd@linaro.org, maobibo@loongson.cn,
 yangxiaojuan@loongson.cn
References: <20230515130042.2719712-1-gaosong@loongson.cn>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230515130042.2719712-1-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.811,
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

On 5/15/23 06:00, Song Gao wrote:
> 1.helper_asrtle_d/helper_asrtgt_d need use GETPC() to get PC;
> 2 LD/ST{LE/GT} need set CSR_BADV = gpr[rj];
> 3 ASRTLE.D/ASRTGT.D also write CSR_BADV, but this value is random
>    and has no reference value.
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   target/loongarch/cpu.c       | 2 +-
>   target/loongarch/op_helper.c | 6 ++++--
>   2 files changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

