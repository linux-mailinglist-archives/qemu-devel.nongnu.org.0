Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B364EA628
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 05:39:57 +0200 (CEST)
Received: from localhost ([::1]:34024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ2i4-0006dK-6f
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 23:39:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZ2gP-0005nI-Io
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 23:38:16 -0400
Received: from [2607:f8b0:4864:20::22c] (port=33716
 helo=mail-oi1-x22c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZ2gN-0006Xx-G3
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 23:38:13 -0400
Received: by mail-oi1-x22c.google.com with SMTP id k10so17857892oia.0
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 20:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=PU6lXM24lt6zXSgSPX1JmupcB2oW7Fb7EPaRYb5tSW0=;
 b=uBf5qh80ikUoUfeWSXX6uGaTOu4HWfLnMGNvUFwPzYolh+SNKZeIeTSiWLFqzCBoOO
 ZVBL9fBGDXoWrwHzqeZTkvjI0+fGL1+sJTu775VeyDv0PTz7sc4q6jtQOcIrFK/GNNUm
 PLbCuLz9X016o8/t2TXoDwX1jYHRyDt2jTFZ4KcQ2s3nb3LpyasnIiuXLROy7dvK59W/
 ZfgwmUV6FKip6V37EJywb3QaBa5BRX9l5GAv4IcSMoxlDlJ4d5X5XPSUYiP9Ehg5hc4c
 v5rd/FBf1Lx53MLWCeR5aeESNEosNwVSXqsEgoXGHcrg+WSR8bVaRV10Sl6vVRXEDGL/
 4YEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PU6lXM24lt6zXSgSPX1JmupcB2oW7Fb7EPaRYb5tSW0=;
 b=JyahzWiahOCSqExpnISTDz0QFIe3Hs7TjyCfIEVXq8gvhVcCqPggmEXvG0O0pKzney
 nB5BsgN5TlWR9xdv/5EjhcEdG2uthLITsI5E6iOBP79l+1QJgVIXq6MDiCoJhuizLTiS
 rZ8w6bp6u+fNwFYdylPNsZBIPzx7Q8G134K/VTw3Ip9SCTFcM7Q+lw61uSoGcIs5DGrX
 ICCO/hbimXU2PNTa0zVMZlGmBaHDS7SdenfdArKM2m4WgHX94teWKInoY57pnR/OlGGS
 CKoUUQk5C+R9ml5hCzIqYgsTfO1Gh+U6rTunPVwiA5283EuUGdo4GRZYs28jEO8Pinbj
 HTPw==
X-Gm-Message-State: AOAM531kbhSwM5R80xZZBgYhcJE8Z+5tpJ+VTuImlDvo2SsVWQVW+3lW
 9UfzAuzHpEt/Q7/La914Lc+gNw==
X-Google-Smtp-Source: ABdhPJxsPAh8wwx+/tum8eadxDlEAXMadR4DMEDivDlpE182B8fDx9zpP8DRkPIO4qdHcORrU5q4YA==
X-Received: by 2002:a05:6808:300a:b0:2f7:5d32:b67 with SMTP id
 ay10-20020a056808300a00b002f75d320b67mr348173oib.122.1648525090090; 
 Mon, 28 Mar 2022 20:38:10 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 c8-20020a4ad788000000b0031ce69b1640sm7736562oou.10.2022.03.28.20.38.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 20:38:09 -0700 (PDT)
Message-ID: <c2a9a1e2-18f5-9a3c-8fcb-bc2777ca2912@linaro.org>
Date: Mon, 28 Mar 2022 21:38:06 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH 0/6] softfloat 128-bit integer support
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220328201442.175206-1-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220328201442.175206-1-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/28/22 14:14, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> This RFC is a first attempt at implementing the 128-bit integer
> conversion routines in softfloat, as required by the xscv[su]qqp and
> xscvqp[su]qz instructions of PowerISA v3.1.
> 
> Instead of using int128.h, int-to-float routines receive the 128-bit
> numbers through a pair of 64-bit values, and float-to-int conversions
> use a pointer to return the lower half of the result.
> 
> We only need the parts128 methods, but since the difference to parts64
> ones seemed minor, I included both in this patch.
> 
> RFC:
>   - Should we use struct Int128 instead of 64-bit value pairs?

I think so.  We have it, and it makes the interface more obvious.

>   - I've not tested the float64 methods since the PPC instructions only
>     use the quad-precision routines. Should we keep them in the final
>     version?

Let's not add anything that we don't have a need for.
It may eventually be needed by RISC-V RV128, but we can add it then.


r~

