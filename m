Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C3E35E33E
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 17:56:20 +0200 (CEST)
Received: from localhost ([::1]:38734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWLOl-0000tO-QG
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 11:56:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lWLLw-0008S7-0C
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 11:53:24 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:39614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lWLLs-0007Bu-8e
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 11:53:22 -0400
Received: by mail-pl1-x636.google.com with SMTP id u7so6643997plr.6
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 08:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fzhBorV0qRm60XZ3hVksiC41kjDXTlHmnuRyVFvu+lA=;
 b=UwWA0EmB/8stBFDt1XR8EMcQ/RT0KKIUpcSEpmxmMJvwVM1qhHUWO0ZUQXpWhInl0U
 KJhdGXe97dWk1v8SKQKns0KT77IDeIqNceqepGOBCVAQw5bZmjJzsgg0HTYcFj+WCEAJ
 QdA8i/wEmfVQF989jRmK6rOyZ8wDgEUKzvfAv9a16iZAYXAWc74qzNIzzzPS34+Skuex
 EWcoua2eyoFk9WwnMwRzVWkADmzkWpMN6pkMNYys1UyUZgabPCl3DPe7elZubsig022N
 0N2E1QNQ027C9N5v5/+UqmYf7izl09Olvc7LtzRyBOIkmxwFDud0kCaZZYIywTasgXr5
 zyYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fzhBorV0qRm60XZ3hVksiC41kjDXTlHmnuRyVFvu+lA=;
 b=nA8GvAGSGNVW4aatmkPyQfHbpJB05xIthFiH8f9ExBOuwwL/vcdbmNWIG0/upFjGv5
 FHRziMWUGm1dlITNe6r9bRSbM21u0ky4hrLD3i/esTCY0K02FO82XU98wG4xfbkOp0sS
 VsbqA+6ZU7nFLUlLtKPYVcX4VDGufTwHgaknAskwj66XOpbMbd0ZI7Q57UJVJygzl9mr
 fqB6+3jJjoHJ/YsoVwKmDANn8dbVNLiN6jrCUunzNGdAFq07rbj5GBTePhoJEj1FkI8d
 IIgmz75qDUcwMwLm2JxTm/N0oCtR+MM365neBUH5vVBQdNrA/aOOiaXdpqSiWEDp5437
 lp6A==
X-Gm-Message-State: AOAM531HuL6G3g2175KjE8njv08ce2Lq+FwGskYymbuUKVTVF083RIQR
 r96CBjEoB7khVrInjeNCrxVV/twDbZiR4w==
X-Google-Smtp-Source: ABdhPJxs6ZW+E1xLIqJpFXDwEX+wfT0y1DyA5Nji4gVFqHthiCoeovGcEODfg4txYH/WiuKp+EKNGQ==
X-Received: by 2002:a17:90a:3902:: with SMTP id
 y2mr711760pjb.202.1618329197484; 
 Tue, 13 Apr 2021 08:53:17 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id p2sm14319429pgm.24.2021.04.13.08.53.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Apr 2021 08:53:17 -0700 (PDT)
Subject: Re: [PATCH v2] target/ppc: code motion from translate_init.c.inc to
 gdbstub.c
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210413145427.41749-1-bruno.larsen@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f580510c-0468-f1bd-5d3a-dc52043e5c1a@linaro.org>
Date: Tue, 13 Apr 2021 08:53:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210413145427.41749-1-bruno.larsen@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: farosas@linux.ibm.com, lucas.araujo@eldorado.org.br,
 luis.pires@eldorado.org.br, fernando.valle@eldorado.org.br,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/13/21 7:54 AM, Bruno Larsen (billionai) wrote:
> +/* gdbstub.c */
> +void ppc_gdb_init(CPUState *cs, PowerPCCPUClass *ppc);
> +gchar *ppc_gdb_arch_name(CPUState *cs);

These should probably go into internal.h and not cpu.h.
These do not need to be exposed outside of target/ppc/.

> +#include "exec/helper-proto.h"

Not ideal, but ok temporarily.

> +        gdb_get_reg32(buf, helper_mfvscr(env));
...
> +        helper_mtvscr(env, ldl_p(mem_buf));

These should be modeled on e.g. store_fpscr, where there's a non-"helper" 
function to be called, which is then called by the "helper" function.

Obviously, splitting that out should be a separate patch.


r~

