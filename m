Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3005F60AD84
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 16:26:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omxKU-0007Nq-F9; Mon, 24 Oct 2022 09:17:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omxKL-0007Mi-TZ
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:17:14 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omxKK-00023Z-Br
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:17:13 -0400
Received: by mail-wr1-x432.google.com with SMTP id o4so7933619wrq.6
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 06:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w7Kfh1xjWQlZq8pjVFJDeb2BWkPlKXeqTsVmjZ3LG84=;
 b=QQpc8zy2DYl9djNYD+tJjvr+YhWHSgRohfJe0LD7mkpCzcfYIwkR8/F0H0nJXcBhVl
 0k0v8U/eo1xzlXUB4HqLZwc1jaC+QzZRuF4oNNcbNCh9e3N7r8TSzKvs5HOs6lGkyvTT
 pjQxH09U4mTh5/6T/LO/6Hzg4rAv33ob8RRFEjsIB5lFHM+7zd2FnVS3G2aQSdm5qcF1
 S6Gx8pIrnP3lvASpsGwSlI5cP5e4SUURTbtyppfF7G5aCqsVOq7uVCFCo+QMF8cGwh+5
 h08COOdldLAPtb0JNUxpHYaasxCJon6dk48sLSw1maPdRL9CCeQ2JljdIltnz/forlai
 aKIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w7Kfh1xjWQlZq8pjVFJDeb2BWkPlKXeqTsVmjZ3LG84=;
 b=h6/GpeL3wjmzvzrQqQii+plT9xyW1WWReZPVZYUWVNyaP+iruPkLZ5/1HnBy5qYbQc
 RYqLmUj5Vv9C45GfYLkPy0aOOY8BEH9zUNp03w/dPdzh3Xqywbidn2uBttEgvZ98e/P6
 XBpzdlB47q/O//hlmmXQV0xvIo9pPGATSCeo4MaGScjvweb9U/5kvWx9haRSC6z7/Zl8
 tfAodcb1HZHN8SNfoxNjyKGP248pAfUKMhiamcc6nhHYohPvMfy5eQ5J70GjVElO/AEZ
 wbn1MO5scHqcj1/+8VlKRVkFoo5i5UdsXM4nG62nKpjtsUc13EV6gO8MCD7UUuAmZlBJ
 mdsg==
X-Gm-Message-State: ACrzQf0vxwZFrMpU7kM9N9rvECd1buh1xVvAVuLOShPbi+BjGS9FFr7b
 YL7tMQF9oQXXTYGq7+g6m9m/HA==
X-Google-Smtp-Source: AMsMyM4YqmB84jJ56+GimhEE7n6qQq/41aQ8sBTT9yA96AGXkzxsWax1XBIIn1AQisUzZwQ9pHwCDw==
X-Received: by 2002:a5d:5111:0:b0:235:849f:f132 with SMTP id
 s17-20020a5d5111000000b00235849ff132mr15524164wrt.5.1666617430490; 
 Mon, 24 Oct 2022 06:17:10 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 bs14-20020a056000070e00b00236545edc91sm9148567wrb.76.2022.10.24.06.17.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 06:17:10 -0700 (PDT)
Message-ID: <0bc4908a-8373-ea69-c7ee-d6fb800ddcaa@linaro.org>
Date: Mon, 24 Oct 2022 15:17:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH 4/9] target/s390x: Use Int128 for return from CKSM
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
References: <20221021073006.2398819-1-richard.henderson@linaro.org>
 <20221021073006.2398819-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221021073006.2398819-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 21/10/22 09:30, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/s390x/helper.h         | 2 +-
>   target/s390x/tcg/mem_helper.c | 7 +++----
>   target/s390x/tcg/translate.c  | 6 ++++--
>   3 files changed, 8 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


