Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10895677DFD
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 15:28:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJxnC-0008JS-MZ; Mon, 23 Jan 2023 09:27:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pJxn9-0008E0-1k
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 09:27:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pJxn7-0005sD-5n
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 09:27:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674484040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Q0vzfLspOja+72sV7MT0ZLEWvLocDyM5FQY3+/qHM0=;
 b=gic5e+BRtMVJbIM8Yo2QX9DQWpKC9R0gixDRL51tgEqWsASB4zgs6ZDjSDc3d7/k4hmmwy
 E6E9Rr7LYjeXWpglUWj2f1j3oN0QIWpD+ERzynaBHSIsAEMzGaiwOtTBZ/ItCmRe0Xc/v/
 cGEGHR+FIAGhlWEfI8M/t2zr9vZnzbM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-517-R2qLBHHLNxiNMBph8oQBgQ-1; Mon, 23 Jan 2023 09:27:17 -0500
X-MC-Unique: R2qLBHHLNxiNMBph8oQBgQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 o15-20020a5d684f000000b002be540246e1so1484620wrw.22
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 06:27:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0Q0vzfLspOja+72sV7MT0ZLEWvLocDyM5FQY3+/qHM0=;
 b=rwuUGSTWFa+zz7kiHcEMsgktajEVwrl045bERuvTTDQntIXtp5ug3EWipzCUT9JZTv
 hHPQbz6Hhh9qpegDJCcTYei9IwQsToP4Kll/UnZ2Ml4NoJxlYUETZcKst0h2GTGRCmC1
 /cHs6M38mYvi4FHfLylEKKw6Rw/DjARYmhG0JSkwHm1TwwXNftIQ9Kv0p2kzIk2ySCF/
 FpRvJu+2HtCKzKUMrWGhOhpTFOlA8aeYhkB1y2NZKbEEm2X/kpkHYigplSsTm3mqpbao
 igHzJstyV7mLbch6lRGvoqM4rpq5pxHbe9lvJw9ys8LhJ29xbcYM3OIfH4SknTu8DC8k
 riag==
X-Gm-Message-State: AFqh2kqMtTseoJ0WzBAVIxF7ZNsXzrL2HMhMPV3xzBrwqzNVORSnGfzv
 Yk+ix9u2dNoq6tRNURjUqhIsetOO4P+FtctsKoNzy064m3ONjSYq2xIrEQXOhr9Gc4FZGca7snq
 UHuFDYQe9l7+nkHu1BGDJ24p/kGoq6qMNmsMaoMnvUIm8hjHIh2oGUNy19fGGd3I=
X-Received: by 2002:a7b:cc07:0:b0:3da:fcb7:39e5 with SMTP id
 f7-20020a7bcc07000000b003dafcb739e5mr23125104wmh.23.1674484035280; 
 Mon, 23 Jan 2023 06:27:15 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu2LhpFbmv06/KnGepirpW41eSQ5QYkmckzxhfp45+5nmO8QBFTT4GkHspaQhe3o0TVOMT/GA==
X-Received: by 2002:a7b:cc07:0:b0:3da:fcb7:39e5 with SMTP id
 f7-20020a7bcc07000000b003dafcb739e5mr23125083wmh.23.1674484034938; 
 Mon, 23 Jan 2023 06:27:14 -0800 (PST)
Received: from ?IPV6:2003:cb:c704:1100:65a0:c03a:142a:f914?
 (p200300cbc704110065a0c03a142af914.dip0.t-ipconnect.de.
 [2003:cb:c704:1100:65a0:c03a:142a:f914])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a7bc042000000b003db03725e86sm10543064wmc.8.2023.01.23.06.27.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 06:27:14 -0800 (PST)
Message-ID: <d58a6dfb-cde4-151a-b258-e7fb9431eeda@redhat.com>
Date: Mon, 23 Jan 2023 15:27:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 0/5] migration/ram: background snapshot fixes and
 optimiations
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu
 <peterx@redhat.com>, Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
References: <20230105124528.93813-1-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230105124528.93813-1-david@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.147, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 05.01.23 13:45, David Hildenbrand wrote:
> Playing with background snapshots in combination with hugetlb and
> virtio-mem, I found two issues and some reasonable optimizations (skip
> unprotecting when unregistering).
> 
> With virtio-mem (RamDiscardManager), we now won't be allocating unnecessary
> page tables for unplugged ranges when using uffd-wp with shmem/hugetlb.
> 
> Cc: Juan Quintela <quintela@redhat.com> (maintainer:Migration)
> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com> (maintainer:Migration)
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>

@Juan, David: I can take this via my tree (especially the last patch 
only optimized virtio-mem for now). Just let me know.

-- 
Thanks,

David / dhildenb


