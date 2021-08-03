Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC57A3DF6C3
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 23:16:17 +0200 (CEST)
Received: from localhost ([::1]:54844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mB1lo-0003XM-Os
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 17:16:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mB1kF-0001ZR-SR
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 17:14:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mB1kE-0006li-HX
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 17:14:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628025277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lfk2GZYtuGrLi5xVRtWNqRfY/o/pI1ocDWzkMdFhfmI=;
 b=F4GsxRFdCWv+egYClkVOG0VyAUsCaXMv9xvv6SqPfyICJ9/ExipGwnAm51OGpT3YYiZP0Q
 2xHWFEAq1W6RwEaDjY4Rigbc57au7mcKNCAT3fhhat39Kc8n4GxrnIhwO3uHFEWEcKTA5D
 8lS2J3hC5jzq+rAOBc4q8oEOOJWDrLE=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-HMElmyKrMxGCCpRQWC7DZg-1; Tue, 03 Aug 2021 17:14:32 -0400
X-MC-Unique: HMElmyKrMxGCCpRQWC7DZg-1
Received: by mail-qv1-f71.google.com with SMTP id
 j13-20020a0cf30d0000b029032dd803a7edso148577qvl.2
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 14:14:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=lfk2GZYtuGrLi5xVRtWNqRfY/o/pI1ocDWzkMdFhfmI=;
 b=hPoar4yCKEzOXM/bNBIbMMF5qlsLlvDzvxh4oJsLqE4YgcNFRVAeWJlHDdttm0teRj
 yrJ2bLN7PFudpZ/I2Dh8d/IOCYhIk4miHSk6oDyyMCfOE1U+g2IHa1OU8xNJptTUXVXO
 ofD6aAHuGhSUl9oS78vIHgMsE1nAZ/KdB37EShCdk+PehMa0ldz/oYhNpyRAlbvxP6JE
 Ojgg5wgH2cqG5Z6Ys146bRsr730PJDRyBbMqPNBY5PbaXfDYbMmYnvYbUIj8VnF9bX46
 SBvbWJgMLFoDwc5FZMih6OsHNfSzmcPJGLnkgoFZTm4XyZ0nsRXyAsLdA3/6TPPOfSf2
 JGhg==
X-Gm-Message-State: AOAM5337NdhDwoncHT6HVzAJl73pobd8jRV6SwmiSLdcrMgA5GXxVen2
 Bta/CdvMxrVyFI7BWmHJy95Ro+s22aXw8p2uUGafCPjhI3YfQ93vw3Ksc8V8FgV+esV25LyHnB9
 szfcbUwpXS7YfVQw=
X-Received: by 2002:a05:620a:1452:: with SMTP id
 i18mr22341667qkl.191.1628025272549; 
 Tue, 03 Aug 2021 14:14:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrmlxeth2DfycQthot/aUFxcQRa7skzKszzjszcs9J06SppYeCjJ9gvSbDSWtyDJvLrNkPng==
X-Received: by 2002:a05:620a:1452:: with SMTP id
 i18mr22341651qkl.191.1628025272366; 
 Tue, 03 Aug 2021 14:14:32 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-92-76-70-75-133.dsl.bell.ca.
 [76.70.75.133])
 by smtp.gmail.com with ESMTPSA id v4sm99068qkf.52.2021.08.03.14.14.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 14:14:31 -0700 (PDT)
Date: Tue, 3 Aug 2021 17:14:30 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1] softmmu/physmem: fix wrong assertion in
 qemu_ram_alloc_internal()
Message-ID: <YQmxtvm9M5r43NM+@t490s>
References: <20210802152238.10783-1-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210802152238.10783-1-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 02, 2021 at 05:22:38PM +0200, David Hildenbrand wrote:
> When adding RAM_NORESERVE, we forgot to remove the old assertion when
> adding the updated one, most probably when reworking the patches or
> rebasing. We can easily crash QEMU by adding
>   -object memory-backend-ram,id=mem0,size=500G,reserve=off
> to the QEMU cmdline:
>   qemu-system-x86_64: ../softmmu/physmem.c:2146: qemu_ram_alloc_internal:
>   Assertion `(ram_flags & ~(RAM_SHARED | RAM_RESIZEABLE | RAM_PREALLOC))
>   == 0' failed.
> 
> Fix it by removing the old assertion.
> 
> Fixes: 8dbe22c6868b ("memory: Introduce RAM_NORESERVE and wire it up in qemu_ram_mmap()")
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


