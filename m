Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE8D602BF5
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 14:43:52 +0200 (CEST)
Received: from localhost ([::1]:54368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oklwl-0003IW-ON
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 08:43:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oklRw-0008Db-By
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 08:12:12 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:36425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oklRt-0006so-At
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 08:11:59 -0400
Received: by mail-wr1-x42b.google.com with SMTP id j7so23138768wrr.3
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 05:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MhHjGfr9kWyyT8aYXqnCZetdICbsBosFUWiAzpndDuw=;
 b=RTxGhQJBksHdMz3UH77j4QTZTNSCjREK7o0PaE/CHwekJ4UCqAfMMDSc1Be5ZDZbRl
 t6FQMINX84rHMgUv7bQbe1tUhEq1km1BSB6qpi63cSyw3iQiJPg8wbPonpD5MxeR9pR5
 VVyhwPjYzDubfaU40BDxXfDHQmggz5FLrc9Ly929ox6fM2s4W9p6FQlHMleiVVII/Dql
 J562Tzf37eE96DbVnnF16unXBPCKOAgmL6ravJezkXWV0/P2O2bXcp0rSZVTQ83/oc8e
 a3hWpSaHidJoxTixG6mttDTaKquDWBFvDy5QdTp288acyDgE/ookpGQ9xtHVRShizVcJ
 5NOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MhHjGfr9kWyyT8aYXqnCZetdICbsBosFUWiAzpndDuw=;
 b=rJLpMSZ88Z9hLNw+Du5aoZNvRjJAgR0yOwyqVniHD5g0zb/Mb/fVDq4u6vswO2IgwY
 HRiY+NKkqfLMStsn93PBd/EVPW81eSIsv2U0G6dIVB9AS2Hmaa0TPc/26RFjkBpzOfii
 NPoFodEY9zupqVWJZMx3ovH7biqgazCBU7hZKkMt2zaYM/scf36CWg8aslj/i87+wUXN
 mUoef0aHcbrdp1xuWkt6CN5sPYf5nMmtq9XXhd+xwgLSsR9NK6YGkVJOzphBbTNsYNX7
 X22L9iHpT73M+Hy6qdMl2sVjjv0vcptZDA3ihCofQ/f9CJsBm4p9yztk860dfZXI/KOi
 OPvg==
X-Gm-Message-State: ACrzQf0yYvQdx+uCKTfg3FBSF8lq9YFOd5SNqAF2TJtSaj0ZPQxtNcN8
 K19ytyKFcw4G3sjvABgC8EuHrQ==
X-Google-Smtp-Source: AMsMyM69VTnGwPMVnHqrd+I4kvkoGffU5SUe7dD+y5iOCXi23Y5fx036RySXwxb3z7IhgTudOA/udQ==
X-Received: by 2002:a5d:45c1:0:b0:22e:6d1f:46d0 with SMTP id
 b1-20020a5d45c1000000b0022e6d1f46d0mr1708133wrs.557.1666095115433; 
 Tue, 18 Oct 2022 05:11:55 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l12-20020a05600c2ccc00b003c6f27d275dsm9763070wmc.33.2022.10.18.05.11.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Oct 2022 05:11:54 -0700 (PDT)
Message-ID: <70710a54-223b-cd8c-c5ec-a5f4e3319b7a@linaro.org>
Date: Tue, 18 Oct 2022 14:11:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v2 19/28] qapi replay: Elide redundant has_FOO in
 generated C
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: michael.roth@amd.com, jsnow@redhat.com, eblake@redhat.com,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20221018062849.3420573-1-armbru@redhat.com>
 <20221018062849.3420573-20-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221018062849.3420573-20-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/10/22 08:28, Markus Armbruster wrote:
> The has_FOO for pointer-valued FOO are redundant, except for arrays.
> They are also a nuisance to work with.  Recent commit "qapi: Start to
> elide redundant has_FOO in generated C" provided the means to elide
> them step by step.  This is the step for qapi/replay.json.
> 
> Said commit explains the transformation in more detail.  The invariant
> violations mentioned there do not occur here.
> 
> Cc: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   replay/replay-debugging.c | 1 -
>   scripts/qapi/schema.py    | 1 -
>   2 files changed, 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

