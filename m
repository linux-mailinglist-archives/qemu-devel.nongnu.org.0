Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DD7366165
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 23:10:30 +0200 (CEST)
Received: from localhost ([::1]:37530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYxdd-00038b-7A
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 17:10:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lYxck-0002eQ-5d
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 17:09:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lYxcg-0000X3-R6
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 17:09:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618952969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IXhKrvG9jXbBNhoFMu+UP383ahQTk2sF8XCVkNR6kNE=;
 b=ZYmJvfQt6v9nDbzE6Y2XPxTeQ1PUc0ruq5FcleXZhEgimE0lSBtsVgW1sSFTuRxVajom2u
 XfTgEMXCHMhO7uzz34NKGyUzgOhSZTytCex/nYy73Um7riLz17HW+0Xn4cBLeEbooEw4SD
 RLwqrNYvIYJisCdrHaAuIylCreZlZpE=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-gcY34flNM-6S8AdPsgT7ig-1; Tue, 20 Apr 2021 17:08:53 -0400
X-MC-Unique: gcY34flNM-6S8AdPsgT7ig-1
Received: by mail-qt1-f200.google.com with SMTP id
 b8-20020a05622a0208b02901b5b18f4f91so8982892qtx.18
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 14:08:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=IXhKrvG9jXbBNhoFMu+UP383ahQTk2sF8XCVkNR6kNE=;
 b=EP5oUo4j0qTjb+OiUliND9strMkLRX2Scr7B4rbAJNuS5QxUrouD9Ts39LXhpsHbG8
 mWTGwmzVcLr3xsJVz9UMK9DR+QrzRO9Pn8E0ZLkMRWWnhV45+FQyLF1XD81RoEqHDT1U
 wxsuqSWg2BGaSrM6u0E7V0RX6ZcaeGG0TJudVEhkb8rRpm1JAv3/avL17EDwRHq4S4E4
 FNduk+ZeIBXSaQNemUD5K+wHe6ZQpPwBoAZkOVb18l7xLq1fyfptm6l8ijr3yZm5xvf1
 oIOVQjdFTtb6A3DTjjv/Sg10kev8Erj7qViZDJaT9DUq2LnKPOtfwCWfjmWIxxdVmc1U
 hbEA==
X-Gm-Message-State: AOAM532P/DdQq+xArABW6tHAxVec/QTqfDMZdJjEvq7duK0LZJ8S/BmW
 jCYGXl61totHKEHDnTaBZaCzIAU9xEhsc19d98HlAdcfd+zH/5v394zqT/nhCSpVu7RGWUJHoCR
 mnI3hyN0XgXq3WUc=
X-Received: by 2002:a05:620a:b0a:: with SMTP id
 t10mr18991955qkg.103.1618952932898; 
 Tue, 20 Apr 2021 14:08:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUGxQ4R27VbBfGrEa8cen/RCCKlmKmI/9CVeYTqx22cuMrv4qyu0yWuadkNnBO4n34EJjsMQ==
X-Received: by 2002:a05:620a:b0a:: with SMTP id
 t10mr18991939qkg.103.1618952932696; 
 Tue, 20 Apr 2021 14:08:52 -0700 (PDT)
Received: from xz-x1 (bras-base-toroon474qw-grc-88-174-93-75-154.dsl.bell.ca.
 [174.93.75.154])
 by smtp.gmail.com with ESMTPSA id t63sm290549qkh.6.2021.04.20.14.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 14:08:52 -0700 (PDT)
Date: Tue, 20 Apr 2021 17:08:50 -0400
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v4] memory: Directly dispatch alias accesses on origin
 memory region
Message-ID: <20210420210850.GG4440@xz-x1>
References: <20210418055708.820980-1-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20210418055708.820980-1-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Apr 18, 2021 at 07:57:08AM +0200, Philippe Mathieu-Daudé wrote:
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

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


