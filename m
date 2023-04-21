Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBE16EA41D
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 08:51:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppkby-0007xk-CY; Fri, 21 Apr 2023 02:51:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppkbk-0007ra-Ny
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 02:51:01 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppkbj-0008GH-5M
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 02:51:00 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f173af665fso8921015e9.3
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 23:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682059857; x=1684651857;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p1sTwPyPVcFukLw03vGCbtJsCbhifAUGHFdn0E4OU6s=;
 b=bWEWX6Gi4POln+8cCQKDeZJfDVFIl5NJDPiHjaJYvG5Fodfronk1qVdoaJVAfwA+RC
 gIjRhmoA9aBfWsaRxYBJYqWSv82PvadE60bqYNClTdh+F/l8vhV4dVgttCArgVFX+5y6
 ArPPo5EqsETNC7MZlKyYmQ0fQKLOFhciZP+NxZnOPGapOwTbUGIp8aRkD8/r4CIxWwvb
 e+lT5afLe8hMTlJsRbcsvHS7l2+hCmEOyzM5pUbVxmuwOBDSOC7SH6NeWw14E05QV+3f
 4MUbWj8cIIDeTn8fUcoBLZaTrzjtyNUZNpCoNcO0uG87j5THEL/DbOcjeV3O0OiqJvN8
 vFWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682059857; x=1684651857;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p1sTwPyPVcFukLw03vGCbtJsCbhifAUGHFdn0E4OU6s=;
 b=LN//wPF0CqRLwzhI20VDPA3wZuNswq9ha8kqrPlnu8XER4B2y64hS3XvE99H54WG0n
 01TXn3CawHAvw3EyHVzO0s4NAurNvMMb6pcGuLBrKhAYaarNkajGafCreETa/l7sIOaJ
 +FThL726Ucg25S+Js18pRf+eC9oC0lTRamx5hUTGDMv1+YslJb5B1xd3ctfZZoYN3rKB
 SFxD2xXrE1bzzD5O+nUWAtz0VZQl+1fsGYnuqYhjzAe4RvoGCZIEub+aYOXNtWADhWs0
 a1FJOr/XUDEVpHagW7gA6uB2t6jdLWjaj+iPoaxi4g2cEV/En/zKS9Pi28lGCMRhEsSt
 XHMA==
X-Gm-Message-State: AAQBX9f079BeBioHyh5Bq5RmcEzKVwaz+KztBjTg9CvvyrhESemZfyDj
 rWAEpWjMbzKCTNy/98nSuhvvng==
X-Google-Smtp-Source: AKy350b1ljCKHD+HLifwTPATJxOgDJLznxX643l858Kwtjs2A5P40Ve6QhzBO4Ap2grSGmx7LqRYhA==
X-Received: by 2002:a1c:4c05:0:b0:3ee:282d:1016 with SMTP id
 z5-20020a1c4c05000000b003ee282d1016mr918191wmf.25.1682059857622; 
 Thu, 20 Apr 2023 23:50:57 -0700 (PDT)
Received: from [192.168.69.115] (min31-h02-176-184-28-119.dsl.sta.abo.bbox.fr.
 [176.184.28.119]) by smtp.gmail.com with ESMTPSA id
 h5-20020a1ccc05000000b003ed1ff06faasm3930191wmb.19.2023.04.20.23.50.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 23:50:57 -0700 (PDT)
Message-ID: <4957477d-98ef-f415-6226-aeaf46c1360d@linaro.org>
Date: Fri, 21 Apr 2023 08:50:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH 03/10] trace: remove vcpu_id from the TraceEvent structure
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Riku Voipio <riku.voipio@iki.fi>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Yanan Wang <wangyanan55@huawei.com>, Greg Kurz <groug@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, Eduardo Habkost <eduardo@habkost.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230420150009.1675181-1-alex.bennee@linaro.org>
 <20230420150009.1675181-4-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230420150009.1675181-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.669,
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

On 20/4/23 17:00, Alex Bennée wrote:
> This does involve temporarily stubbing out some helper functions
> before we excise the rest of the code.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   trace/control-internal.h      |  4 ++--
>   trace/event-internal.h        |  2 --
>   trace/control.c               | 10 ----------
>   scripts/tracetool/format/c.py |  6 ------
>   scripts/tracetool/format/h.py | 11 +----------
>   5 files changed, 3 insertions(+), 30 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


