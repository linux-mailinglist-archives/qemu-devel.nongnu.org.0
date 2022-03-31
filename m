Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1164ED9AC
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 14:33:29 +0200 (CEST)
Received: from localhost ([::1]:48328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZtzU-0003ej-RX
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 08:33:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZtu6-0000yV-2G
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 08:27:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZtu3-0000Zj-I2
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 08:27:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648729670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8weNNAfUYHnLPXztFBpwoPDj+dKJAVDb79Az6xw/Suk=;
 b=hweWvCXN/YLVy1fXPfqLrp+xpfye6XFs8alypFTPWRg+DLoql8uSDqgGnEkAyHYC90e9Vg
 wM2+YwXoI8X9TGV/X3R3HjDhCzVeD/IhY2hbTgwxkT1KXcCpY1G996N4DqXLqp1C1mu1QU
 8UVmo4P7FyOGU+v7FYL6fUGMs/bCEt8=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-136-gpCfW1CJMgmYgTo3GM8tMg-1; Thu, 31 Mar 2022 08:27:49 -0400
X-MC-Unique: gpCfW1CJMgmYgTo3GM8tMg-1
Received: by mail-qv1-f72.google.com with SMTP id
 q4-20020a0cf5c4000000b0044346ee3627so10225440qvm.16
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 05:27:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8weNNAfUYHnLPXztFBpwoPDj+dKJAVDb79Az6xw/Suk=;
 b=MLmf/cAT/upzcdBIoixorQTxnISXvSad29y6Ecsj8KqKPLwy2Cgj7zD9YENwX7Jypx
 xQSi9zYppdb8T5tC2wbwAqnJCcQiD9PgjU/52JyKHD9iegRrZFcNzE24lO4rcgN4R25S
 EnET7pnK8DDZTvyv4lzquKWRUh4iGbjelnhImAqcIDFkb/BIjprNTmO1NjQNCbLV7J2l
 /O0NeUignUDoRP/CWQRbAUidlgA6WNjTQIQAePmrTfLs3pPO9hqINi5GNJ2kOxZJ9I6o
 x/3884nN5GxL+0+Lscddh8EPWX53IT46hu0vZfE2Y/S4sh5xMhyOMM0kcSlWEWDbJLoA
 WGHg==
X-Gm-Message-State: AOAM531NcksvazvucOt7JTN9rS/95pf3FW0MztofkyUnApL436ex8UfO
 1CJJXqhhIpqSGiUtXuSw69duOmiSJrNYTRmQ+sJEvvTa996l1zPJOvCjWUbyZ3A0M/TlFW8ep4m
 49DPfQcj+J7/nAQg=
X-Received: by 2002:a37:55c2:0:b0:479:8293:d7d0 with SMTP id
 j185-20020a3755c2000000b004798293d7d0mr3108537qkb.182.1648729669013; 
 Thu, 31 Mar 2022 05:27:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywOxRJDfX1X84hp2wMHfadsllZXC/C+9YKB0iRNzKyY6hwAdvDnZzbWZXQNrX6EkAZOhu2FQ==
X-Received: by 2002:a37:55c2:0:b0:479:8293:d7d0 with SMTP id
 j185-20020a3755c2000000b004798293d7d0mr3108518qkb.182.1648729668717; 
 Thu, 31 Mar 2022 05:27:48 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 az9-20020a05620a170900b00680aeaac936sm10812054qkb.136.2022.03.31.05.27.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 05:27:48 -0700 (PDT)
Date: Thu, 31 Mar 2022 08:27:47 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH 2/2] softmmu/physmem: fix dirty memory bitmap memleak
Message-ID: <YkWeQ26lKa3jFLU2@xz-m1.local>
References: <20220325154013.16809-1-arbn@yandex-team.com>
 <20220325154013.16809-2-arbn@yandex-team.com>
 <3888d585-c090-24b4-3be9-7be3f03ddadb@redhat.com>
MIME-Version: 1.0
In-Reply-To: <3888d585-c090-24b4-3be9-7be3f03ddadb@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-stable@nongnu.org,
 Andrey Ryabinin <arbn@yandex-team.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, yc-core@yandex-team.ru,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 31, 2022 at 10:37:39AM +0200, David Hildenbrand wrote:
> On 25.03.22 16:40, Andrey Ryabinin wrote:
> > The sequence of ram_block_add()/qemu_ram_free()/ram_block_add()
> > function calls leads to leaking some memory.
> > 
> > ram_block_add() calls dirty_memory_extend() to allocate bitmap blocks
> > for new memory. These blocks only grow but never shrink. So the
> > qemu_ram_free() restores RAM size back to it's original stat but
> > doesn't touch dirty memory bitmaps.
> > 
> > After qemu_ram_free() there is no way of knowing that we have
> > allocated dirty memory bitmaps beyond current RAM size.
> > So the next ram_block_add() will call dirty_memory_extend() again to
> > to allocate new bitmaps and rewrite pointers to bitmaps left after
> > the first ram_block_add()/dirty_memory_extend() calls.
> > 
> > Rework dirty_memory_extend() to be able to shrink dirty maps,
> > also rename it to dirty_memory_resize(). And fix the leak by
> > shrinking dirty memory maps on qemu_ram_free() if needed.
> > 
> > Fixes: 5b82b703b69a ("memory: RCU ram_list.dirty_memory[] for safe RAM hotplug")
> > Cc: qemu-stable@nongnu.org
> > Signed-off-by: Andrey Ryabinin <arbn@yandex-team.com>
> 
> I looked at this a while ago and I think the problem is more involved,
> because we might actually generate holes for which we can free the
> bitmap. I think this patch impoves the situation, though.
> 
> 
> IIRC if you hotplug two dimms and then hotunplug only the latter, the

I assume you meant "former"? :)

> bitmap for the first dimm will remain as long as the second dimm isn't
> hotunplugged.

IMHO it's fine to keep the dirty block for the unplugged hole.  It'll be
better if we could free it, but we can fix the memory leak first which
seems to be more severe.  The dirty memory isn't extremely large (32K ratio
to mem size) if just to be kept idle, but frequent plug/unplug will leak
infinite host mem.

-- 
Peter Xu


