Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 383826EE4F2
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 17:47:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prKrR-0003gJ-Ki; Tue, 25 Apr 2023 11:45:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prKrC-0003f5-2b
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 11:45:32 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prKr6-0006CG-GD
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 11:45:26 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-2f833bda191so3603613f8f.1
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 08:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682437519; x=1685029519;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4ZTpiSETY/gxfvYakifCyylKGxZlL086A5De6UCg9ew=;
 b=f685SAtxwvlvSOCa1aabkWQ6djKfej/ODDUD2jU9bcIL5/FQtqXSnFjymd67llKLlb
 Y67EZGRKyRPhxbD3/YWbPOwgN1uC1lOd/NuLi0aGVugcYusxeb0bZNyZR4qBA7WdKUbo
 QyP2yRMZOOOU8jSDHc4OrR75GjGlseTDyaojsXzc3o+Xbs9xTgFH7aQydWBwSOOkJAy/
 rCOpfHW1tXtkGQEsz3dyUzNRvfaJjzWIx7fKooO6CG9Jxb/y0z+F/qcJVjjXjGogmhLk
 o8Fnc+JG5++KBv6YmsPQG9TMRfER8N77LeoefhDOEQE1lZIZF2xl2wqk6+zNFTBtsRCZ
 wyLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682437519; x=1685029519;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4ZTpiSETY/gxfvYakifCyylKGxZlL086A5De6UCg9ew=;
 b=NsqWcwect0MgDwUZiZyDW0oU7lszUt7MCxwwedVyF+GqlZQR1B6MqKV6YG5ieV03Y0
 B97w2flwO0m+oAww+xLn31yy60erDCjtROFTG2T5E4+UjSddZ4mr+CEuZMew2vRqnTgj
 OGUoYU1uEQKopR8eOTU8sg9bKYfMno3De+Lu9PEuIwO+QleN5peLwfqfe+qKLVu005eR
 H0rVPomvYdLCKBAa9y8/wXGXLNyc+xiLkNr52SNaa3cZAPIH8N6HHX/yJ64tY3NwTcZB
 eWZ/OFpL6TAJJMA0pFc9GqzlSroXJ43CRurhSwG55W1AGjdvibHLaFcMBBG7EBEeUKDR
 2FRg==
X-Gm-Message-State: AAQBX9ffzuKShFgtVzxoAJRo5Mgxe1JPjvW4V4mt2kCAhyxfh9Kq44dI
 iN3dDIzbs2/T0pxnhiJGSqUSIA==
X-Google-Smtp-Source: AKy350Y1tQMut1bnytLS0TLN02VVIPzDtaoIIpceVqrGbu3xPRuTQVJlkkIA+JGQ0u6fkidsyK2ZKA==
X-Received: by 2002:a5d:6407:0:b0:2fe:fde1:23a2 with SMTP id
 z7-20020a5d6407000000b002fefde123a2mr13740077wru.50.1682437519419; 
 Tue, 25 Apr 2023 08:45:19 -0700 (PDT)
Received: from [172.27.248.56] ([212.187.182.164])
 by smtp.gmail.com with ESMTPSA id
 jb12-20020a05600c54ec00b003f17003e26esm18664538wmb.15.2023.04.25.08.45.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 08:45:19 -0700 (PDT)
Message-ID: <a1a0e5bc-bddf-51b8-9aab-2bb83a201888@linaro.org>
Date: Tue, 25 Apr 2023 16:45:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH 2/2] hw/net/allwinner-sun8i-emac: Correctly byteswap
 descriptor fields
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, qemu-stable@nongnu.org
References: <20230424165053.1428857-1-peter.maydell@linaro.org>
 <20230424165053.1428857-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230424165053.1428857-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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
> In allwinner-sun8i-emac we just read directly from guest memory into
> a host FrameDescriptor struct and back.  This only works on
> little-endian hosts.  Reading and writing of descriptors is already
> abstracted into functions; make those functions also handle the
> byte-swapping so that TransferDescriptor structs as seen by the rest
> of the code are always in host-order, and fix two places that were
> doing ad-hoc descriptor reading without using the functions.
> 
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/net/allwinner-sun8i-emac.c | 22 +++++++++++++++-------
>   1 file changed, 15 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


