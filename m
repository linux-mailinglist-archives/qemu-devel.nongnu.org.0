Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F05652B08
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 02:34:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7nlG-0000xI-Tw; Tue, 20 Dec 2022 20:19:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7nks-0000rx-Gb
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 20:18:59 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7nkq-0006HF-1I
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 20:18:46 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 q17-20020a17090aa01100b002194cba32e9so596998pjp.1
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 17:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=59tNXaRYuvA8AoAwtz69Nxw4CCsk+0UA/eZxQhBBGE4=;
 b=yM88JQJa8DcKJh1D9DNfk3EGa3Lo+AFeaTA1ujumwWJHa1f4BJ4ItynOry2sItSrIS
 aUwUPdJwe+l+qPLnruUJNIKPnnt2iPmsyNREehw05LwgvZouXolzgIKhdSkfjKRTIkpi
 mBNicKCViQCLvKYqucD8NGoHKBG4UxyJBCwnJYuEPhEXWgH0VFnyL3tPPaZpGn1sMlQf
 ZkldbP5umKm9czrr2x6TAc1DDUbZXFowy9r9/VIx7MW/Jw44nuzlWFPE1AICVnGW2gy7
 zFRezjTR6NiXClEV2M/yDYLy+xmUlE/X0MHYLX7hWw9DIuNUwtnWy31vDksKx3vEPr2B
 fXWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=59tNXaRYuvA8AoAwtz69Nxw4CCsk+0UA/eZxQhBBGE4=;
 b=Ci77vDZb8tT0g6vpwuCvBJXvIOohMyY5pYY5Ym8cjrJY6Ax/4DFnsHAScJX2HUF4YD
 4gbEP/Pz5O2jjl8WFjPqleNsDyCi0RhVVqHtVu+GICo9PhfxgZpfophMohKgK3+uEm62
 9Yt2RuwcHoxJRbBEO/78danHbkz7BIl4TvcNy/xMwMkspe4qp1UsypbxWPCw+6hZShfg
 06W3LTKyDzR1BaLFt2y3lHHIuq31CvPasJAzaYhYQFSEWnkHkWqEagwL/ZngbezolMXU
 iivHYwY3YwNOrrxOSthZ8onCXwXN8BeXcJNyHjAKhjDppt7xs6ar8JLff1Dg22wKqKX2
 IIDw==
X-Gm-Message-State: AFqh2krqx1mKn7UzAz0NF4/tpIyzXUO4IbpI8ERmc+YB69UAfoXsaVjm
 7WTzUy/7kq3VzzlxewyR9wiLgw==
X-Google-Smtp-Source: AMrXdXvezK531RJCxmlhnRuuTsXF3Au84N7bgJgLjOYKwJYfUtwthgtMvCwPePZX6+DUzvrJL4+tgg==
X-Received: by 2002:a17:902:8c90:b0:189:9fb2:255a with SMTP id
 t16-20020a1709028c9000b001899fb2255amr15392513plo.19.1671585522247; 
 Tue, 20 Dec 2022 17:18:42 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:3efa:624c:5fb:32c0?
 ([2602:47:d48c:8101:3efa:624c:5fb:32c0])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a170902d34900b00187197c4999sm9971696plk.167.2022.12.20.17.18.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 17:18:41 -0800 (PST)
Message-ID: <dfb649fd-8d70-3132-dbdf-c1d5708b77c4@linaro.org>
Date: Tue, 20 Dec 2022 17:18:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 0/5] cpus: Remove system reset() API from user emulation
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Eduardo Habkost <eduardo@habkost.net>,
 qemu-s390x@nongnu.org, Song Gao <gaosong@loongson.cn>,
 David Hildenbrand <david@redhat.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20221220145625.26392-1-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221220145625.26392-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.161,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/20/22 06:56, Philippe Mathieu-Daudé wrote:
> In user emulation, threads -- implemented as CPU -- are
> created/destroyed, but never reset. There is no point in
> allowing the user emulation access the sysemu/reset API.
> 
> Philippe Mathieu-Daudé (5):
>    target/i386: Restrict qapi/qapi-events-run-state.h to system emulation
>    target/i386: Restrict sysemu/reset.h to system emulation
>    target/loongarch: Restrict sysemu/reset.h to system emulation
>    target/s390x: Restrict sysemu/reset.h to system emulation
>    hw/core: Only build CPU reset handlers with system emulation

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


