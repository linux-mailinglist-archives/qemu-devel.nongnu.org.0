Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9104738765E
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 12:24:05 +0200 (CEST)
Received: from localhost ([::1]:49590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liwtQ-0003ZY-MZ
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 06:24:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liwi9-0007fE-7B
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:12:25 -0400
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929]:38415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liwi4-0001GO-4k
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:12:23 -0400
Received: by mail-ua1-x929.google.com with SMTP id k45so3058731uag.5
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 03:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8Gv47P5RaGX3fbNsRV5bsvNA1wOngmqMQUx8u9A8kAs=;
 b=iVL/9eIsD3geb02WzS37QI/0gqA4/yXqkPVCh9RVc5z4diswSyU3ac/lA1CygGi0zt
 m3qONXLChRT3FEK7rXBqHrtqvz6a23jbHlp9U3j6qBrOrw3efSRW+OL7kjPcNdvwT+a8
 E8juPm9TfX4rmh/lZxUQnQ4lEFsv3jcQR5A6b0izmZm26fcZ+tcftIW3PJDKlJo3gjIO
 WHhfrzJdAYjoD0MLanHK4miZHD1xZXjZENcASkg9Hh2VqejZjqV0qBe1eO3PDGYVwv3N
 zFSb2u7RY09WzP7GoQZqg/B+Z7wkUcMQ5dlOhtlZpzgFU0nLFuRlG7fSDRGz2oxOsVDc
 aQMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8Gv47P5RaGX3fbNsRV5bsvNA1wOngmqMQUx8u9A8kAs=;
 b=ibGKWn52+VnMmPpLBSKCbLUFgjjci0SYkzC+YxpAhkaZ9cEyqT/xuBtT3TMJNpPwht
 zvhRwpCoSwlaYI1tm61R75kTgsLO6qRgQqEclGr1SyUsiuV5oNVEChm436Ch65RrwSBW
 VsecdUEIowhc9v9g5TsWxo2iZopoLX0skdb82Y7wzUDZi/+caolz1HQRCtr/1jN8Q1fy
 aUfgvOVDSoMS6brc5oOGDiXYv3p2uTGn4cncZFMbOgg+3c5wMT+2lPVq6oRMPvEc4SH0
 fSWWOeKCIo6BUT/HfIDdTNSUoML1GtyEykCzD38hsbnfiVKScaxyTtMg03l4Lb9va4pO
 lXsQ==
X-Gm-Message-State: AOAM533D0ZDg6cho3h5RN0HKrF1106uYjYKSAZR+heci/9Nk6LRtRZGj
 acQR4MM8HXtpef4Lq7A/D13L7w==
X-Google-Smtp-Source: ABdhPJyIhJ7LoadxtaVewVfeolTkEDjgV/fsmbjaVso5AcxIw02z2e9F4tA6Bk/kp2T/Y3+0S4eWSQ==
X-Received: by 2002:ab0:b1a:: with SMTP id b26mr5334852uak.60.1621332737955;
 Tue, 18 May 2021 03:12:17 -0700 (PDT)
Received: from [172.16.22.144] ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id v132sm2687420vkd.1.2021.05.18.03.12.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 03:12:17 -0700 (PDT)
Subject: Re: [PATCH v5 23/23] target/ppc: Move cmp/cmpi/cmpl/cmpli to
 decodetree
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20210517205025.3777947-1-matheus.ferst@eldorado.org.br>
 <20210517205025.3777947-24-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ef3bb078-8afe-2159-f23d-0d8324c4e3f7@linaro.org>
Date: Tue, 18 May 2021 05:12:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517205025.3777947-24-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::929;
 envelope-from=richard.henderson@linaro.org; helo=mail-ua1-x929.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 luis.pires@eldorado.org.br, f4bug@amsat.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 3:50 PM, matheus.ferst@eldorado.org.br wrote:
> +    if(a->l && (ctx->insns_flags & PPC_64B)) {

Space after IF.

If I look back to the 6xx manual, I see

   NOTE: If L = 1, the instruction form is invalid.

The fact that we're allowing L=1 for ppc32 is an existing bug, afaics.  We 
should fix that.


r~

