Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1006DCF5B
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 03:32:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pm2s1-0001UP-JJ; Mon, 10 Apr 2023 21:32:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2s0-0001SX-5k
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:32:28 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2ry-0007lF-Lh
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:32:27 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 60-20020a17090a09c200b0023fcc8ce113so9263231pjo.4
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 18:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681176745;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=r33iDXAuJUh61qHj6YYtdfvwz4P2IQnk528cf4lWEHc=;
 b=AnIqcyeQPvdOHoFOyRR/YtCSglHtd6D3pnYYzlBjQgPQ1NC54YfmcVRlhXbdiVJQqi
 MtnBMb1hbtizyn464BLAvRsFMHf5SQExPGaTKc9t074/Fk6TQEWYRVBhjdeQEZw5e7AK
 EfzHN/181d1glMXEoghzBzb9jzY2Ij5S4H/c2gplJ3w5SCLjBQhAfwSbWAbGDt4Mjgaq
 oEJMjIwouvYJeDdC5uhrg/Yb7kUMhSOUSivBdUtsV2CeN6xR/Z8V2NyuDy+M6b5CfaBa
 yavsIEsXDW2AEUQST+GI/NxCvPQ33M0cDoCWhlYxMO7I+qdVVJpUiJ6VBQSyOfUZ0oZV
 C58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681176745;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r33iDXAuJUh61qHj6YYtdfvwz4P2IQnk528cf4lWEHc=;
 b=RU2DkE/ZCuJUk3pNpw7vmfCPW+pJNFnfT+0b9G7j2Zg1iC8tn1kuSNPfxPuhqwzJvr
 mpSA6ykkuu5fxChR5OXiLgLANz+GkXPEHhEQt0miIz97sb7gr7XzyV+7OvQt8UeRUJTo
 7xQL7AMH4iIg4bOpilYrkOo7Q4eqBK8hnwfiS4/1EC2UXhtNaENrjefiYs1qssJh+9Ka
 EcWQBeeQNmzH4/RgImRvOEdXNPSe50bWsNkSoeVzUioNpK/cYZPHL/dAlqWEru20asdi
 Xdggg6VzRvj1zOGTQezBfzSrOmdu4Cz4u8uop1sdixFkU2/MPE+hAxxALIXb4AVH4Qqn
 sgVQ==
X-Gm-Message-State: AAQBX9fBra3NQAiE643yFVzYnf4wuFKwZBUdn/3rcdFBPDn4R30xIkNF
 T8mR9lY8ABKeA4VLwutxT8hW4w==
X-Google-Smtp-Source: AKy350bI3u3/mT5YYzgmMDhh6I51BP4xvNCL3Rgz6ZLpWa8q3O0myq8QTzT3j2Z2H+IUgls3AHRMPQ==
X-Received: by 2002:a17:902:e807:b0:19f:8ad5:4331 with SMTP id
 u7-20020a170902e80700b0019f8ad54331mr17903061plg.38.1681176745157; 
 Mon, 10 Apr 2023 18:32:25 -0700 (PDT)
Received: from [10.1.0.142] (h146.238.133.40.static.ip.windstream.net.
 [40.133.238.146]) by smtp.gmail.com with ESMTPSA id
 p19-20020a634f53000000b0050be8e0b94csm7458158pgl.90.2023.04.10.18.32.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Apr 2023 18:32:24 -0700 (PDT)
Message-ID: <3401892d-b2a6-0956-701b-7f4ad913854a@linaro.org>
Date: Mon, 10 Apr 2023 18:32:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 17/19] bsd-user: Remove host-os.h
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: jrtc27@jrtc27.com, riastradh@netbsd.org, Kyle Evans <kevans@freebsd.org>, 
 Ryo ONODERA <ryoon@netbsd.org>, Brad Smith <brad@comstyle.com>,
 reinoud@netbsd.org
References: <20230410182056.320-1-imp@bsdimp.com>
 <20230410182056.320-18-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230410182056.320-18-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.246,
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

On 4/10/23 11:20, Warner Losh wrote:
> It only defines the default system call scheme to use. However, that
> feature was removed in a941a16f6f52.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/freebsd/host-os.h | 25 -------------------------
>   bsd-user/main.c            |  1 -
>   bsd-user/netbsd/host-os.h  | 25 -------------------------
>   bsd-user/openbsd/host-os.h | 25 -------------------------
>   4 files changed, 76 deletions(-)
>   delete mode 100644 bsd-user/freebsd/host-os.h
>   delete mode 100644 bsd-user/netbsd/host-os.h
>   delete mode 100644 bsd-user/openbsd/host-os.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

