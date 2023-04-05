Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A4F6D7EAD
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 16:10:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk3or-0003N3-Bz; Wed, 05 Apr 2023 10:09:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk3oo-0003Md-LY
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 10:08:58 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk3on-0004QR-6E
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 10:08:58 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 j18-20020a05600c1c1200b003ee5157346cso23821858wms.1
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 07:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680703735;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/wEb1PhYoL1aZYvZh+kVqLs208DUU2mxpzWlQJBt33k=;
 b=SSwCCWFydVO2f0i0oPq55jIENfczj4tjz0y18kjNXuVJbwQwp9cMk/JxdzVdBcrUwO
 nKUF7klf6hccMtptfJGZGxuBgctL8MzcbaZTMAK/+/mnU/cK6vsQEvr7tuEqyZm9mCnf
 oLVyyHaIY0GwEkdjuAKh6rDREoTGMMFbIzqb533ExtGv17aA2RO6oY8bh7a8Etp6B50N
 52n39Q/1gBbhGASNI1s5zKH3qaf7r2yWLSNu5nYNhtEj7O2jpkqwSsXacLDKl39ZcpI/
 LudiWY54I4eisg6GbLBSbujpMlli1sbAST1zYRbH1X8u+vJyIdM4wmhqg8AnniPaXxny
 Vn0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680703735;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/wEb1PhYoL1aZYvZh+kVqLs208DUU2mxpzWlQJBt33k=;
 b=ndr6GEuPNKyyYQN1y1R8k3UWvW3UNyTFIKO17TYXGYE7OmTJxo0kuDjyaLKtdHKgtm
 wqWDruenWgapnBixdHu/9S8qcy4QKCQyULBL5DjHAbvLvCmjNuf2JbvqTf25Xk5K1Tva
 TU38H8jifX2izYNH6ar+Mfj9YU7ugxGsFjinU8hk7LiwjsjqhsGr4Xeha/Gixkhbb1qd
 HC6gF0R9HqC9QEF/cjoMtB7jd89hlKqBVd/tswUqgm2avas42hkBAfdF5kI4PQhcQzmR
 U7hBxX4cwFjyIYL0CeqV7s011XQAadu5QvcVt+jCYJzqNi9OdfEtrKtg5K7Ezmzt6A2Z
 p+mQ==
X-Gm-Message-State: AAQBX9fklcbXKpcQ/M30L5Gr9Nx6rv5Bst+Zbvg5mAxg1TvltmXm3FhN
 yhHNTmWtnvZUfMJF2C2asIK3b70ZEm3EStoYIyw=
X-Google-Smtp-Source: AKy350abpb7yq5zUwCkfQ9EQWF7uWNE0d7giInNyHnv5dvjMUfr+rGi2E3Hr4rvyTZ3ii1hegdk0Tw==
X-Received: by 2002:a05:600c:24ce:b0:3ef:d8c6:4bc3 with SMTP id
 14-20020a05600c24ce00b003efd8c64bc3mr4640811wmu.24.1680703735478; 
 Wed, 05 Apr 2023 07:08:55 -0700 (PDT)
Received: from [192.168.69.115] (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr.
 [176.184.52.81]) by smtp.gmail.com with ESMTPSA id
 r15-20020a05600c458f00b003f03d483966sm2358543wmo.44.2023.04.05.07.08.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Apr 2023 07:08:55 -0700 (PDT)
Message-ID: <820a5f72-6468-e077-a823-d375dde5fe4a@linaro.org>
Date: Wed, 5 Apr 2023 16:08:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH trivial] block.c: add newline for "Detected format" warning
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20230405133404.50376-1-mjt@msgid.tls.msk.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230405133404.50376-1-mjt@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.355,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 5/4/23 15:34, Michael Tokarev wrote:
> Add the forgotten trailing newline.
> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>   block.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


