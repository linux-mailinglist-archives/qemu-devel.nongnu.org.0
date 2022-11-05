Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AA161DC4B
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:08:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMea-0001z1-2E; Sat, 05 Nov 2022 13:08:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1orMeY-0001yj-Kq
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:08:18 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1orMeX-0006J3-4K
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:08:18 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 t25-20020a1c7719000000b003cfa34ea516so458495wmi.1
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wkSVijzMPf3Xr32bbOH7q/P+haXyZGCdnhQvCnD0X8U=;
 b=fNCyFjnJ0xcT1k7uVUbR3pwqTk3Yk2vOonxLISAyyRt5wehfWy3PRSn29hO51FIcMq
 O/Nx9g1TBiVxHleyz48fQW3U0Vje1m5W3E7cFw1JUPoox8KMnplaKFDwenkPCVE30EuZ
 N4lLPbSK7ol2TbFzJX0PUM13XS+2Dd+TryoRlc04ZOnceDwv7wdhHh5T2FScYH+nkq8J
 Lj27zk0KpG3puwMAL7m1w4065MxOHK+5OE6686Qzbeh2wXHvPzpg9+jgX9lygFos4e0a
 k1GPDkiS7FIx2RbdxwZuMwIvw9jRyrsXb9ZsBB4mzExi77xEy9awfYLVahPOKaxa9LQL
 Sl1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wkSVijzMPf3Xr32bbOH7q/P+haXyZGCdnhQvCnD0X8U=;
 b=z12oiCtYMB6tu+wK/xl12zXBgWGJQu2/9YkIYamXxuY21iPXJpVBCJ/kMcGGG/7pj5
 5e++PmDa4c+QF2A4iuWfDeYc6DaXDZXUotORzwul2W5rB3kMmKWbTCJrQLNjpVPrqPAF
 uDDmik0bmo9/5cG0R4ETal7BtZmCpAq8YJ1b+KPX/sjI2JYc4DlAAxAmLHV3u1XZBC4Y
 5e2+adRJtJB5yHuGwhCK5Gq1I6+oJxbHZu18FrfXuftPmn3qfD1KhtaBhvgdB7S/w/lm
 g7hoE5U8gKtHLcm/p36TNTLcV0e5kW9lYxqmKnPsUrbS/0FjYjBjf1KJ1BJOXeq4hYwy
 KM/A==
X-Gm-Message-State: ACrzQf0P6nWpWBurl/MWZOaVrQMcRsgOlHNhVnnd7KeyhnaXgBbNGJaK
 rB2gCMhTyDdEunqQYTw1kNVM9Q==
X-Google-Smtp-Source: AMsMyM6/BFd0A3v+Mep9YXzG5FpqAAOGQy5Ii/Bk5lRi/R4nkLSfTkJi31k7V5sn2XS+FzSsCUW20Q==
X-Received: by 2002:a05:600c:6885:b0:3bd:d782:623c with SMTP id
 fn5-20020a05600c688500b003bdd782623cmr27172139wmb.102.1667668095650; 
 Sat, 05 Nov 2022 10:08:15 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 i19-20020a05600c355300b003b49ab8ff53sm3314387wmq.8.2022.11.05.10.08.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Nov 2022 10:08:14 -0700 (PDT)
Message-ID: <09fa7cb5-fd6d-1741-d9c0-0729c8ec751a@linaro.org>
Date: Sat, 5 Nov 2022 18:08:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v3 22/30] qapi rocker: Elide redundant has_FOO in
 generated C
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: jsnow@redhat.com, eblake@redhat.com, michael.roth@amd.com,
 Jiri Pirko <jiri@resnulli.us>
References: <20221104160712.3005652-1-armbru@redhat.com>
 <20221104160712.3005652-23-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221104160712.3005652-23-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/11/22 17:07, Markus Armbruster wrote:
> The has_FOO for pointer-valued FOO are redundant, except for arrays.
> They are also a nuisance to work with.  Recent commit "qapi: Start to
> elide redundant has_FOO in generated C" provided the means to elide
> them step by step.  This is the step for qapi/rocker.json.
> 
> Said commit explains the transformation in more detail.  The invariant
> violations mentioned there do not occur here.
> 
> Cc: Jiri Pirko <jiri@resnulli.us>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   hw/net/rocker/rocker_of_dpa.c | 13 ++-----------
>   monitor/hmp-cmds.c            | 22 +++++++++++-----------
>   scripts/qapi/schema.py        |  1 -
>   3 files changed, 13 insertions(+), 23 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


