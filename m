Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB06366152
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 23:02:57 +0200 (CEST)
Received: from localhost ([::1]:33316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYxWJ-00013E-JU
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 17:02:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lYxTE-0008QZ-PR
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 16:59:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lYxTB-0002lr-MQ
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 16:59:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618952380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SNC30p0Cuebd2zs+26nFBMMdRHRhmuhhn04sE/j2V1o=;
 b=ByU045NYisa7NQsAz5+xvMFxDtEwop9/N742zqowGGtYPnNl1c4bJNzXJ0PqFJVi6X6jPh
 sSkXoTMxbnlpAlXXNLQyAyQ67GKDFbyC5dH180mFxLe3fn8ILIuayCkeoAKDcW3G9QHpGe
 aPMfykKYkTy+0o5EW/692YCtVuqwJnM=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-507R8BihNyCcRKqBVujh4g-1; Tue, 20 Apr 2021 16:59:36 -0400
X-MC-Unique: 507R8BihNyCcRKqBVujh4g-1
Received: by mail-qk1-f198.google.com with SMTP id
 g184-20020a3784c10000b02902e385de9adaso7644053qkd.3
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 13:59:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=SNC30p0Cuebd2zs+26nFBMMdRHRhmuhhn04sE/j2V1o=;
 b=X07gL26Fd28xB/DlKOmVdEoldT2okPHVI23V691eRimLokuuLo79TBpJ61YmUuj7aA
 JJqePrxXMsULEHnFYzs7H5FZVMZdWC3pYVeoLw+FDpJstp1xLRMwiEjbjB/WaK5GZOJg
 74CXqwHQeh4nww68ToDS2MhsS3J1OnrbE4yLmkBSzDvz8tu7MIswTVlkttc857g9ogDN
 GaNaLNUf9WVvhB9AzacfJmmf0vL+JYmOBcj2JxVtFbzplxqPg3hTKzTVrh9TGWxMUtpK
 Eeavf+1ae8B4mqtfa0E8IuTr0YdP00LeGG882+MapMGYzKLuviA5Lrvs6WdGJgdAVSob
 Uk3w==
X-Gm-Message-State: AOAM531f86W3TOQUiwx8Vi83Irob8p9QlLPVNzY5w0C84Cg5WlRNqt55
 P58LIGgEsIhqqegeuVOzKwq/acvcXabNfYtmR/85ay0+5EX5XbYVtOrNCr4FNBzBRnRM7A99A6K
 oacZUfAH2EIc2CBM=
X-Received: by 2002:a0c:ff48:: with SMTP id y8mr29355077qvt.8.1618952375861;
 Tue, 20 Apr 2021 13:59:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzaOijip7spvnB/ocEYOVyL8JixvLCy7UNlG0JT+FnBJOfrsDwVwEBufvdpd63QlTxztC+Qg==
X-Received: by 2002:a0c:ff48:: with SMTP id y8mr29355036qvt.8.1618952375543;
 Tue, 20 Apr 2021 13:59:35 -0700 (PDT)
Received: from xz-x1 (bras-base-toroon474qw-grc-88-174-93-75-154.dsl.bell.ca.
 [174.93.75.154])
 by smtp.gmail.com with ESMTPSA id k126sm248749qkb.4.2021.04.20.13.59.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 13:59:34 -0700 (PDT)
Date: Tue, 20 Apr 2021 16:59:33 -0400
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v3] memory: Directly dispatch alias accesses on origin
 memory region
Message-ID: <20210420205933.GF4440@xz-x1>
References: <20210417140206.673885-1-f4bug@amsat.org>
 <8f59bd60-3588-3be0-c44c-1ebfbefd78bd@ilande.co.uk>
 <67955dd0-dfc7-271f-009f-cf7247f3b6c2@amsat.org>
 <efea7689-15c6-44bf-77a8-3d6ee945d097@ilande.co.uk>
 <916b95b2-c128-69e0-6e68-78daa0b15722@amsat.org>
MIME-Version: 1.0
In-Reply-To: <916b95b2-c128-69e0-6e68-78daa0b15722@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 20, 2021 at 11:10:26AM +0200, Philippe Mathieu-Daudé wrote:
> On 4/20/21 9:00 AM, Mark Cave-Ayland wrote:
> > On 19/04/2021 21:58, Philippe Mathieu-Daudé wrote:
> > 
> >> Hi Mark,
> >>
> >> On 4/19/21 10:13 PM, Mark Cave-Ayland wrote:
> >>> On 17/04/2021 15:02, Philippe Mathieu-Daudé wrote:
> >>>
> >>>> Since commit 2cdfcf272d ("memory: assign MemoryRegionOps to all
> >>>> regions"), all newly created regions are assigned with
> >>>> unassigned_mem_ops (which might be then overwritten).
> >>>>
> >>>> When using aliased container regions, and there is no region mapped
> >>>> at address 0 in the container, the memory_region_dispatch_read()
> >>>> and memory_region_dispatch_write() calls incorrectly return the
> >>>> container unassigned_mem_ops, because the alias offset is not used.
> >>>>
> >>>> The memory_region_init_alias() flow is:
> >>>>
> >>>>     memory_region_init_alias()
> >>>>     -> memory_region_init()
> >>>>        -> object_initialize(TYPE_MEMORY_REGION)
> >>>>           -> memory_region_initfn()
> >>>>              -> mr->ops = &unassigned_mem_ops;
> >>>>
> >>>> Later when accessing the alias, the memory_region_dispatch_read()
> >>>> flow is:
> >>>>
> >>>>     memory_region_dispatch_read(offset)
> >>>>     -> memory_region_access_valid(mr)   <- offset is ignored
> >>>>        -> mr->ops->valid.accepts()
> >>>>           -> unassigned_mem_accepts()
> >>>>           <- false
> >>>>        <- false
> >>>>      <- MEMTX_DECODE_ERROR
> >>>>
> >>>> The caller gets a MEMTX_DECODE_ERROR while the access is OK.
> >>>>
> >>>> Fix by dispatching aliases recusirvely, accessing its origin region
> >>>> after adding the alias offset.
> >>>>
> >>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> >>>> ---
> >>>> v3:
> >>>> - reworded, mentioning the "alias to container" case
> >>>> - use recursive call instead of while(), because easier when debugging
> >>>>     therefore reset Richard R-b tag.
> >>>> v2:
> >>>> - use while()
> >>>> ---
> >>>>    softmmu/memory.c | 10 ++++++++++
> >>>>    1 file changed, 10 insertions(+)
> >>>>
> >>>> diff --git a/softmmu/memory.c b/softmmu/memory.c
> >>>> index d4493ef9e43..23bdbfac079 100644
> >>>> --- a/softmmu/memory.c
> >>>> +++ b/softmmu/memory.c
> >>>> @@ -1442,6 +1442,11 @@ MemTxResult
> >>>> memory_region_dispatch_read(MemoryRegion *mr,
> >>>>        unsigned size = memop_size(op);
> >>>>        MemTxResult r;
> >>>>    +    if (mr->alias) {
> >>>> +        return memory_region_dispatch_read(mr->alias,
> >>>> +                                           addr + mr->alias_offset,
> >>>> +                                           pval, op, attrs);
> >>>> +    }
> >>>>        if (!memory_region_access_valid(mr, addr, size, false, attrs)) {
> >>>>            *pval = unassigned_mem_read(mr, addr, size);
> >>>>            return MEMTX_DECODE_ERROR;
> >>>> @@ -1486,6 +1491,11 @@ MemTxResult
> >>>> memory_region_dispatch_write(MemoryRegion *mr,
> >>>>    {
> >>>>        unsigned size = memop_size(op);
> >>>>    +    if (mr->alias) {
> >>>> +        return memory_region_dispatch_write(mr->alias,
> >>>> +                                            addr + mr->alias_offset,
> >>>> +                                            data, op, attrs);
> >>>> +    }
> >>>>        if (!memory_region_access_valid(mr, addr, size, true, attrs)) {
> >>>>            unassigned_mem_write(mr, addr, data, size);
> >>>>            return MEMTX_DECODE_ERROR;
> >>>
> >>> Whilst working on my q800 patches I realised that this was a similar
> >>> problem to the one I had with my macio.alias implementation at [1]:
> >>> except that in my case the unassigned_mem_ops mr->ops->valid.accepts()
> >>> function was being invoked on a ROM memory region instead of an alias. I
> >>> think this is exactly the same issue that you are attempting to fix with
> >>> your related patch at
> >>> https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg03190.html
> >>> ("memory: Initialize MemoryRegionOps for RAM memory regions").
> >>
> >> So if 2 contributors hit similar issues, there is something wrong with
> >> the API. I don't see your use case or mine as forbidded by the
> >> documentation in "exec/memory.h".
> >>
> >> My patch might not be the proper fix, but we need to figure out how
> >> to avoid others to hit the same problem, as it is very hard to debug.
> > 
> > I agree with this sentiment: it has taken me a while to figure out what
> > was happening, and that was only because I spotted accesses being
> > rejected with -d guest_errors.
> > 
> > From my perspective the names memory_region_dispatch_read() and
> > memory_region_dispatch_write() were the misleading part, although I
> > remember thinking it odd whilst trying to use them that I had to start
> > delving into sections etc. just to recurse a memory access.

I think it should always be a valid request to trigger memory access via the MR
layer, say, what if the caller has no address space context at all? From the
name of memory_region_dispatch_write|read I don't see either on why we should
not take care of alias mrs.  That's also the reason I'd even prefer this patch
rather than an assert.

But of course it would be great to get opinion from Paolo etc..

-- 
Peter Xu


