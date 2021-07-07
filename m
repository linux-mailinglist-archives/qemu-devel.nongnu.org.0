Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB123BE92E
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 16:01:11 +0200 (CEST)
Received: from localhost ([::1]:48086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m186v-00021P-SY
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 10:01:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m184Z-0000Z1-Rx
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 09:58:43 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:44952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m184Y-0007Ne-24
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 09:58:43 -0400
Received: by mail-wr1-x432.google.com with SMTP id t15so3160013wry.11
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 06:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4Ddh1zOm4qprYPp5asbsnS5VCnnSZyf0ePYUVLuTxbk=;
 b=BtAANsOFh5az85XjL+ABKHQ8MEVkWbkYQ5h9JQQXUwIdOKgO+e/s+gjbEpSQImawS4
 SRMYhiYTxUrToxyo5jKT3OaDyIHrFuLwSpj1MUPrfcEAtI9Jz06XMu0SHQ2d6BouxZTR
 4Z03hnd667n8rBmuxNGDPjkpaTAIiZngzdQ7l7iwalF6z6tM4MUT3+GsLmYfIgq1uhGe
 T9oAOtHRXguTJgYqtyJXD44xQF+ydfwgPRwjBzB4WISMFG65GMox82kdmzPhL0BFE0Bm
 R8FrI78AaUroI4Uq6sHjqBpqvqxFtUoWwiLEe4vBuNXAKToUR+0YapdgRBEzOqzxBSZO
 o5mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4Ddh1zOm4qprYPp5asbsnS5VCnnSZyf0ePYUVLuTxbk=;
 b=gLAKX5APgp5OMcZAQBKRsXNmGqxGUt92ZS/y1z+NCrJlvK0ez7TyuHj4FxLLr+mNA9
 lb5UCS3hsmSvBbeDs/MgkRb1OhD+ET5/BwncL9272umvEmwiWCieEkoSDYqn3IxbX5Pn
 0Gw9u6284UNYEsAsDg122u27rZiEUR2kX7bfxh1NFCTodNyAGXCW1qT13gKPJOuyEsjH
 n7pn4MbJVhpiKggUssgKJNKOoDkZlX9Ybd3eeZjygU+YDWzgBc+ULzAJJ6/IryQqH8sZ
 71oD2U71xnpZx/RedMTCBMw53I8WxZJOgXFoBnOgrjsiHlc2VFrxxofKCh/h8yz6T/bk
 AJ3Q==
X-Gm-Message-State: AOAM530SLwHoroCZU1WFzAVT7Jj0dbfptVg7yVcGVBmZrXi1rdfCTN6y
 w2bJuc07keeA+qlr7ZKyPSQ=
X-Google-Smtp-Source: ABdhPJxwtukZBHifEf6jhqJ9kP80nFykJwHj3KYmn1QKsL61NXH9WUn4jHOqUZc642c88acvrumVMQ==
X-Received: by 2002:a5d:688c:: with SMTP id h12mr27714010wru.11.1625666319740; 
 Wed, 07 Jul 2021 06:58:39 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id o35sm679983wms.29.2021.07.07.06.58.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 06:58:38 -0700 (PDT)
Subject: Re: [PATCH v4] memory: Directly dispatch alias accesses on origin
 memory region
To: qemu-devel@nongnu.org
References: <20210418055708.820980-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6305a06b-c8a0-bcf7-f693-244aa34b16f4@amsat.org>
Date: Wed, 7 Jul 2021 15:58:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210418055708.820980-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Xu already reviewed, but Cc'ing Peter Maydell too due to
his last comment on v3:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg800482.html

On 4/18/21 7:57 AM, Philippe Mathieu-Daudé wrote:
> Since commit 2cdfcf272d ("memory: assign MemoryRegionOps to all
> regions"), all newly created regions are assigned with
> unassigned_mem_ops (which might be then overwritten).
> 
> When using aliased container regions, and there is no region mapped
> at address 0 in the container, the memory_region_dispatch_read()
> and memory_region_dispatch_write() calls incorrectly return the
> container unassigned_mem_ops, because the alias offset is not used.
> 
> Consider the following setup:
> 
>     +--------------------+ < - - - - - - - - - - - +
>     |     Container      |  mr
>     |  (unassigned_mem)  |                         |
>     |                    |
>     |                    |                         |
>     |                    |  alias_offset
>     +                    + <- - - - - - +----------+---------+
>     | +----------------+ |              |                    |
>     | |  MemoryRegion0 | |              |                    |
>     | +----------------+ |              |       Alias        |  addr1
>     | |  MemoryRegion1 | | <~ ~  ~  ~ ~ |                    | <~~~~~~
>     | +----------------+ |              |                    |
>     |                    |              +--------------------+
>     |                    |
>     |                    |
>     |                    |
>     |                    |
>     | +----------------+ |
>     | |  MemoryRegionX | |
>     | +----------------+ |
>     | |  MemoryRegionY | |
>     | +----------------+ |
>     | |  MemoryRegionZ | |
>     | +----------------+ |
>     +--------------------+
> 
> The memory_region_init_alias() flow is:
> 
>   memory_region_init_alias()
>   -> memory_region_init()
>      -> object_initialize(TYPE_MEMORY_REGION)
>         -> memory_region_initfn()
>            -> mr->ops = &unassigned_mem_ops;
> 
> Later when accessing offset=addr1 via the alias, we expect to hit
> MemoryRegion1. The memory_region_dispatch_read() flow is:
> 
>   memory_region_dispatch_read(addr1)
>   -> memory_region_access_valid(mr)   <- addr1 offset is ignored
>      -> mr->ops->valid.accepts()
>         -> unassigned_mem_accepts()
>         <- false
>      <- false
>    <- MEMTX_DECODE_ERROR
> 
> The caller gets a MEMTX_DECODE_ERROR while the access is OK.
> 
> Fix by dispatching aliases recursively, accessing its origin region
> after adding the alias offset.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> v4:
> - added ASCII schema
> v3:
> - reworded, mentioning the "alias to container" case
> - use recursive call instead of while(), because easier when debugging
>   therefore reset Richard R-b tag.
> v2:
> - use while()
> ---
>  softmmu/memory.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index d4493ef9e43..b899ca6a6b7 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -1442,6 +1442,11 @@ MemTxResult memory_region_dispatch_read(MemoryRegion *mr,
>      unsigned size = memop_size(op);
>      MemTxResult r;
>  
> +    if (mr->alias) {
> +        return memory_region_dispatch_read(mr->alias,
> +                                           mr->alias_offset + addr,
> +                                           pval, op, attrs);
> +    }
>      if (!memory_region_access_valid(mr, addr, size, false, attrs)) {
>          *pval = unassigned_mem_read(mr, addr, size);
>          return MEMTX_DECODE_ERROR;
> @@ -1486,6 +1491,11 @@ MemTxResult memory_region_dispatch_write(MemoryRegion *mr,
>  {
>      unsigned size = memop_size(op);
>  
> +    if (mr->alias) {
> +        return memory_region_dispatch_write(mr->alias,
> +                                            mr->alias_offset + addr,
> +                                            data, op, attrs);
> +    }
>      if (!memory_region_access_valid(mr, addr, size, true, attrs)) {
>          unassigned_mem_write(mr, addr, data, size);
>          return MEMTX_DECODE_ERROR;
> 

