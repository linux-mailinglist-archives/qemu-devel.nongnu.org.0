Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A173698423
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 20:09:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSN8p-0002hF-Aj; Wed, 15 Feb 2023 14:08:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSN8n-0002YB-Li
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:08:29 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSN8m-0003NL-2L
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:08:29 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 oa11-20020a17090b1bcb00b002341a2656e5so2824621pjb.1
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 11:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wXFVKwcPrXmzbCp+JnQgTrb9l9DAqUEHTYUSVH+GaUI=;
 b=bfFF2fw6pPXNAHkRUjkJLpBx2aTbH6f7F1+V3+h5EmE8RfuRNixIr7LF58QCNn37f9
 S2wuh7B8dJBDA0xXHFTNf/FfrGxHsJDG2fuSKMBBvkm34YlS24kJ8eDkM/LbWK9ycOcy
 +gQ/ck6G5v+bQdQC+pXFrQoo7kuYSH93KvbgYsIUmDhmJX27+tuqh2Sw9LCUH7gMAUNt
 I+CjDf5m7mEakQPsXG/J93NxjIwWBeMmNUSUwv198g7iXeSR7XBMGn1d0kjtBaUQKyhs
 WWW7VLu0t/kb/6T+JzDOc0d2jyLavyboIZTTSqdWPH06N9ryamDZGeRvSIw9zxxdrqL5
 cNsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wXFVKwcPrXmzbCp+JnQgTrb9l9DAqUEHTYUSVH+GaUI=;
 b=TRUz1ZbLmOq2VhvitXZzdhjHVZ54jcBfV15HJ/lSM8eCZPvTPVJTxcdHQqfgHGhnxG
 r7AKT6qBdu2CcB5L5jrCdZdKTka/zsxFqZlvBV+KewcZzaNC4OQJB+qCs088uzBTOi6C
 3aWLf229U+f9oDj1LLCjfLlzDDb0zrkoDDd1at4EW573wbLcP7JHDleFcUarwg3C+oZT
 7T6fUZG5v2GTIGx6bZQZnUPmMpJZiwmOlgIWuayB31/o6vGas7h9keTKAOnrbaLm2oSC
 9CvsXMOiw+jhErWOsnMPtFwQHnxw8HAzeQAUfgTiJBFQUgwAVin45Qyo2tqR1v3N96x8
 RJzg==
X-Gm-Message-State: AO0yUKX1W+Q2w1DPNCILYYQVvnz6b+rf+9OiHqTX+SJwgwOoCP/fd8Se
 pnwIFrPxbf4uMKEDMWyXTcrgFA==
X-Google-Smtp-Source: AK7set/abBAXBJcvdW6Pyqcei2Sbl4Dv8tJb2R3MeuW7t44OtZkUOkzebB4YZ5rhVT+zVFaJx9D1+Q==
X-Received: by 2002:a17:902:dad1:b0:199:4934:9d33 with SMTP id
 q17-20020a170902dad100b0019949349d33mr4107273plx.15.1676488106625; 
 Wed, 15 Feb 2023 11:08:26 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 jl14-20020a170903134e00b0019117164732sm12448053plb.213.2023.02.15.11.08.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 11:08:26 -0800 (PST)
Message-ID: <ba133be9-1e1d-62f0-da23-95b5f76fd189@linaro.org>
Date: Wed, 15 Feb 2023 09:08:17 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 04/20] hw/ide/isa: Extract TYPE_ISA_IDE declarations to
 'hw/ide/isa.h'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230215112712.23110-1-philmd@linaro.org>
 <20230215112712.23110-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230215112712.23110-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 2/15/23 01:26, Philippe Mathieu-Daudé wrote:
> "hw/ide.h" is a mixed bag of lost IDE declarations.
> 
> Extract isa_ide_init() and the TYPE_ISA_IDE QOM declarations
> to a new "hw/ide/isa.h" header.
> 
> Rename ISAIDEState::isairq as 'irqnum' to emphasize this is
> not a qemu_irq object but the number (index) of an ISA IRQ.

This is fine, but should be separate from the header creation.

With the split, for both patches,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

