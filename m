Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4052731583D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 22:04:48 +0100 (CET)
Received: from localhost ([::1]:54518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9aBi-0002yD-St
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 16:04:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9aAX-0002V0-Jo
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 16:03:33 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:33184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9aAS-0008B4-PX
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 16:03:31 -0500
Received: by mail-pf1-x42d.google.com with SMTP id z6so3571410pfq.0
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 13:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gfaeZJ1QOSErVy/D+pBFRA7TYHWVhGa6sWpQmrN3Z/Q=;
 b=kccY/RfapLtiPdxM9rNT8Od/6rS6e88rCdwWBVhpc/DSSavDqWjNHlQWXm/d6SCv3O
 +qBsTiGnutMU5ganKyuEv/VBpY69ZA+eBk/wMdh1u1ENYxpkPYwOv/DOz6VEe1uHkhID
 c+wS3dKSSRAZaYA+mVSEtZQa93ic/09Q9o9/KZ7KnEHxNUCIn2yI79m0NGEmVLf3XauI
 Vnkczcr+iH9O21Aw+KMo+fbsr4UNwDYrJXAwaS5ATMqKCyu45rLer0b+eN/vComQ10oJ
 mDWByIjmguvoUs3CoAA7ZEnZEE6igwBYyAjxAn1KX4jwijaCQqSTKmp8tn+cI8zncO5T
 FDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gfaeZJ1QOSErVy/D+pBFRA7TYHWVhGa6sWpQmrN3Z/Q=;
 b=jg1z2T53K1QgQgv/vLzXrmfSTP9TO1YA5LGjZSjQwgkbCO5r16umk720Xn3oBlt33y
 nobBzxNzI1Z3cz15d8nxavsVawrKvcI7u97Wg30E8wss4VU6wwBNJ96f0JjWYDiK8zkN
 god/sPaamjHYL0AqNDEr1HviIgqj8C2SN/i4bwosAF+1SZdSQqsloxccKJ8ev6s9Snl0
 WIqHII+CVEs1k1Uw3iQfHYZOTBt3uuVyuwZbuMJXYRspfBB5X8KM4yTZtLwrrkBXPVko
 za4lGSD4DB4peKV7nm1iUA9PxOYjNMdNqDCWD1xDVdROzjbFnVDy4X7mPdbrWw5gfKxQ
 H25g==
X-Gm-Message-State: AOAM532U6FUviw3q+AffuPQ7+lTMsn/ETuaB2Cyet7fSe7eFEI/rDHD9
 WXLwUgzBwCHsvlLF40FmeMVcIA==
X-Google-Smtp-Source: ABdhPJyj1mNj71y2ymxz14gDrH2obHHFeit274cyzQGr3eFo8udaVlQXCaZYJXdH4LfcJ7ki13OZoQ==
X-Received: by 2002:a62:7985:0:b029:1e1:1703:c2e7 with SMTP id
 u127-20020a6279850000b02901e11703c2e7mr6169419pfc.69.1612904607253; 
 Tue, 09 Feb 2021 13:03:27 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 n4sm21879051pgg.68.2021.02.09.13.03.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Feb 2021 13:03:26 -0800 (PST)
Subject: Re: [PATCH v1 10/12] accel/tcg: remove CF_NOCACHE and special cases
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210209182749.31323-1-alex.bennee@linaro.org>
 <20210209182749.31323-11-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <86d893dc-c079-dcba-173e-e7aad670639d@linaro.org>
Date: Tue, 9 Feb 2021 13:03:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210209182749.31323-11-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.265,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kuhn.chenqun@huawei.com, aaron@os.amperecomputing.com, cota@braap.org,
 robhenry@microsoft.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/9/21 10:27 AM, Alex Bennée wrote:
> Now we no longer generate CF_NOCACHE blocks we can remove a bunch of
> the special case handling for them. While we are at it we can remove
> the unused tb->orig_tb field and save a few bytes on the TB structure.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  include/exec/exec-all.h   |  3 ---
>  accel/tcg/translate-all.c | 51 ++++++++++++---------------------------
>  2 files changed, 15 insertions(+), 39 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

