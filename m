Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C156EE4F1
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 17:47:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prKrr-0003ug-AL; Tue, 25 Apr 2023 11:46:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prKro-0003ty-Te
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 11:46:08 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prKrn-0006JB-4Z
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 11:46:08 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f1958d3a53so45222285e9.0
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 08:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682437565; x=1685029565;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=owTRAImrSSJ5pHEuNd25GTEw/B+rmHU6gF1l4I84TX8=;
 b=AW46F8a5hCuq88kBXE4jTU+FtcjoTdfctqwSRIM57UV6Uwtoib0XGzN0277utYsugC
 QI7IbOTpqFntTL6ofIMtmnRIyUpa2WuNhRo92Kyq/KELyWQOh6wmAuyZif/9HCXKJWdg
 Ybghd3K0nXOjxm9zozRSmeYGNYNiyfxVvMajcXOzLulw8q6yMAOl5B9YFLBueJKgdCvP
 rabZKXakCs41IpIJQNTLy9Xbb0IhgiL4vN4PMZNuGCjSBxrwSIRCUqr1wwmQq+Lqfwcq
 z6XmeXq+61oHHShMMk3UJxQahvexHROyBye35PhpcTKTYZ3VOABd3yBExo/N3xSPT1Cz
 LHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682437565; x=1685029565;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=owTRAImrSSJ5pHEuNd25GTEw/B+rmHU6gF1l4I84TX8=;
 b=fekcVAHruF1EK42vO503MXfDHHqmQofm5E9SH4mrBRJ9D10aYYZjRy2rVduLYaeZIE
 Cwnk7IivQFk/HcyRF1o7mqh5lrlgTQz0p9bDXo9Jvc3lF6UbCROEaBuVWFpJEwGbx+FY
 pz7TdLenAze78Pl6aPWmdNOyde8qQov0D/+c2od/Pnspj+PXkBSOw01VMg6yftDXFc8v
 ggs+fhl3/qPxhNzrmbLloqOULs4KLbhoNnc/uSS4wMAJltXz1He9xoe4B1PMpRPz9AiE
 FawOWR7g1e2RK6BCzrR92Gr0amToJYiHr6H6wTocibtgF9EI6Qbs0hKdIaLM7DsSV1NR
 o1cg==
X-Gm-Message-State: AAQBX9e3sGcyrVKPY2W8cYaen0ze7Hr0PQXoj2X7xxg6vBrw3k0w9p6/
 2LKw3+JmogSIWAG2ayB9nsGLHw==
X-Google-Smtp-Source: AKy350bb5kuzKrQaezzvawfv0pq19YI71L8GfGhjw5K+jZeit7x5qDJ8YVMLIhrUmuIg1pCnakSdfg==
X-Received: by 2002:a1c:7713:0:b0:3ea:d620:57a7 with SMTP id
 t19-20020a1c7713000000b003ead62057a7mr11552782wmi.8.1682437565604; 
 Tue, 25 Apr 2023 08:46:05 -0700 (PDT)
Received: from [172.27.248.56] ([212.187.182.164])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c444900b003f173be2ccfsm24743883wmn.2.2023.04.25.08.46.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 08:46:05 -0700 (PDT)
Message-ID: <6f8f1a49-8b93-db34-3e07-b4e9fdd43c06@linaro.org>
Date: Tue, 25 Apr 2023 16:46:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH 1/2] hw/sd/allwinner-sdhost: Correctly byteswap descriptor
 fields
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, qemu-stable@nongnu.org
References: <20230424165053.1428857-1-peter.maydell@linaro.org>
 <20230424165053.1428857-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230424165053.1428857-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 24/4/23 18:50, Peter Maydell wrote:
> In allwinner_sdhost_process_desc() we just read directly from
> guest memory into a host TransferDescriptor struct and back.
> This only works on little-endian hosts. Abstract the reading
> and writing of descriptors into functions that handle the
> byte-swapping so that TransferDescriptor structs as seen by
> the rest of the code are always in host-order.
> 
> This fixes a failure of one of the avocado tests on s390.
> 
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/sd/allwinner-sdhost.c | 31 ++++++++++++++++++++++++++-----
>   1 file changed, 26 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


