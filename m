Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 146CA3A7223
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 00:38:24 +0200 (CEST)
Received: from localhost ([::1]:52784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsvDr-0005yZ-4x
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 18:38:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsvCv-0005JU-RG
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 18:37:25 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:43804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsvCt-000693-OW
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 18:37:25 -0400
Received: by mail-pl1-x62e.google.com with SMTP id v12so7399988plo.10
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 15:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=klDoN7C+ag3EhrqpLPsu3IJND82XkcX0RHxMiLs75r4=;
 b=aig3EOZyC5qPgOG+ATOjXjCK7U3mSEw8c8mxX8byWP+6fnE4FrCEPCO0hGpK97zx4+
 N/2+ST0uBb5Hju7x1gjAFp1BQ6xSknp8slbMNsQjL5EhmNu4NJOXJ+wG/vUkniXPzDtq
 sE/71YKYkMJEKO8QLpNpbwFkaFyE5RfePoHwNX5x0su8yGTHA53qc55xNxJTnJT/mbTH
 W7cYtvg5faxxFMYn2pAHRp2pl7VZ83X1pu2zs5GxODhAIpi8+cLqVp4zvJd+5gcP5PNB
 JAqmDLXJs8EnOvQ4jIdKXkfoEH8LARXWv91+eYCQWi1/OFDK3FpTsZHWplo8bem9jZtf
 ctGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=klDoN7C+ag3EhrqpLPsu3IJND82XkcX0RHxMiLs75r4=;
 b=L8gzOg0CBRgOf/rSOxudR+wWvN+dFSWTNMt4/llbFcleJk8xhgWt5gasNVaMlC4+/k
 BkqMPaDGFnhixMz4zqc8+VHJacMXJf6y4x5/ppyPIDPfxjhGXA8BYsMfjoDwolzN8V0x
 1JE64rH69VOMv+wvQp41AuFtE8hvzo1ufdYCVJkVwJnxz7B3wgV0dDfmSyNUthiT2pXq
 qHCZa4GhY9VMtAj0ZOc0n/4YLE895Y1HwWCk21l56MRFk7eGxclFtixFMTtQGJIVJRqF
 s9bApstrM3b33Wq+YYsYQFvDXBjX9U7Gd72PDtNrkrBU9IAgGSMCaTVS7YRGDvd8M5EB
 Mkgw==
X-Gm-Message-State: AOAM533BXoofQ8pdsLAw8it0Yqu56e7DW3RA+443upggQLLC2kXigWAb
 TN63WALqpugX4WFdGDwDU17qig==
X-Google-Smtp-Source: ABdhPJzFoKZMTEcypC+GZwDXnmKWF4WXgNDHn7hGQGq5TX79G7fgZYdT8FiNalyvl0KJ75ejaOAIpw==
X-Received: by 2002:a17:90a:8c14:: with SMTP id
 a20mr21179393pjo.167.1623710242028; 
 Mon, 14 Jun 2021 15:37:22 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 t5sm13080262pfe.116.2021.06.14.15.37.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 15:37:21 -0700 (PDT)
Subject: Re: [RFC PATCH v2 2/2] target/ppc: make gdb able to translate
 priviledged addresses
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210614191630.101304-1-bruno.larsen@eldorado.org.br>
 <20210614191630.101304-2-bruno.larsen@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c2ffffa6-2868-f7ab-78c6-1f29eaafc4e5@linaro.org>
Date: Mon, 14 Jun 2021 15:37:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210614191630.101304-2-bruno.larsen@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.489,
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
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 Greg Kurz <groug@kaod.org>, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/21 12:16 PM, Bruno Larsen (billionai) wrote:
> This patch changes ppc_cpu_get_phys_page_debug so that it is now
> able to translate both, priviledged and real mode addresses
> independently of whether the CPU executing it has those permissions
> 
> This was mentioned by Fabiano as something that would be very useful to
> help with debugging, but could possibly constitute a security issue if
> that debug function can be called in some way by prodution code. the
> solution was implemented such that it would be trivial to wrap it around
> ifdefs for building only with --enable-debug, for instance, but we are
> not sure this is the best approach, hence why it is an RFC.
> 
> Suggested-by: Fabiano Rosas<farosas@linux.ibm.com>
> Signed-off-by: Bruno Larsen (billionai)<bruno.larsen@eldorado.org.br>
> ---
>   target/ppc/mmu_helper.c | 23 +++++++++++++++++++++++
>   1 file changed, 23 insertions(+)

I think the first part is unnecessary.  Either the cpu is in supervisor mode or it isn't, 
and gdb should use the correct address space.  If you really want to force supervisor 
lookup from a guest that is paused in usermode, I suppose you could force MSR.PR=1 while 
you're performing the access and set it back afterward.

I think the second part is actively wrong -- real-mode address lookup will (for the most 
part) always succeed.  Moreover, the gdb user will have no idea that you've silently 
changed addressing methods.

r~

