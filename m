Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF163FF732
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 00:33:54 +0200 (CEST)
Received: from localhost ([::1]:60892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLvHN-0003Ta-CN
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 18:33:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mLvFo-0002bG-CX
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 18:32:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mLvFm-0003jb-LZ
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 18:32:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630621933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=woHEkYXKErzTnLVb7/IWm+2BKsh7foBVIuL2PT+GTzI=;
 b=GwpwXC8DkATHEHJ48IX0/bQip4IMXhHk8RoDIpB0h51A48trcb2A+DBOjHlLOTtV7HuDm+
 RBlA4Sf8mEY+Z8q4owWicURC9+Rd0ejYDO4HHMg9/jj1ZgZOy4e5gDIDqUNRLhTWBAh9F5
 giocegUslu1cmvzejF0prPRfoWKe9Ig=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-5-s4GxkiNdmjxlXtaPasVw-1; Thu, 02 Sep 2021 18:32:12 -0400
X-MC-Unique: 5-s4GxkiNdmjxlXtaPasVw-1
Received: by mail-qt1-f200.google.com with SMTP id
 n19-20020ac81e13000000b0029f679691eeso3618832qtl.20
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 15:32:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=woHEkYXKErzTnLVb7/IWm+2BKsh7foBVIuL2PT+GTzI=;
 b=a8ER1h8vwJ1NIAYdVIDXnKXLK9niqPWRkeoRx/c5RSwQbJ8bwkfYkkR4oPORRr/kIi
 mX9xBLZ0vW3W+dkrYU1mh9MbBtqBku/PAjN0MFTLS6O178CivLiKyrqTYO2VhhzIv9Wo
 S0qlZU5l29tw4bXT1XJz1/HR9PaZgKHetLaQ1T7TmCZc/+XyxqwHuttfiP0Ewwzs2s5W
 HTJ/aWrDzzMHXNt10NMDoyia7rO/ef/FgIrWaEWTEWDM/VGoiDoh4cygxnrqRThaQAUB
 G1Ir9vCMzj9Mo6kC5Wj3OhUJqQfXwjbuFK7kSNed+qtE/CjdqfMqf6yOnYLkO1szpR4V
 +RDQ==
X-Gm-Message-State: AOAM533PZk1kDWSdi44zlSWvKyDrar/J52gxET9/wQdkgXWpoU68p9DL
 ahzeq3qGlaORHm4knfLtahQ4TXiSYd3ZrJmp9XrphhSKPKFPYDf40Q7fl6w8Pw7ZkklPlloS2BM
 Jsrl7RkwOm2yAnuM=
X-Received: by 2002:ae9:ed53:: with SMTP id c80mr426701qkg.402.1630621932372; 
 Thu, 02 Sep 2021 15:32:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybC/yHB0Uv6NqXBZBvWvXCWsxZBJVxl9lYvKVOGYFV+lOBEypGeDLa+NkYwGmEoyhBujv6yg==
X-Received: by 2002:ae9:ed53:: with SMTP id c80mr426679qkg.402.1630621932181; 
 Thu, 02 Sep 2021 15:32:12 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::ad7f])
 by smtp.gmail.com with ESMTPSA id w129sm2607368qkb.61.2021.09.02.15.32.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 15:32:11 -0700 (PDT)
Date: Thu, 2 Sep 2021 18:32:10 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v4 7/9] migration: Simplify alignment and alignment checks
Message-ID: <YTFQ6vzTCFTwK3tz@t490s>
References: <20210902131432.23103-1-david@redhat.com>
 <20210902131432.23103-8-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210902131432.23103-8-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, teawater <teawaterz@linux.alibaba.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 02, 2021 at 03:14:30PM +0200, David Hildenbrand wrote:
> diff --git a/migration/migration.c b/migration/migration.c
> index bb909781b7..ae97c2c461 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -391,7 +391,7 @@ int migrate_send_rp_message_req_pages(MigrationIncomingState *mis,
>  int migrate_send_rp_req_pages(MigrationIncomingState *mis,
>                                RAMBlock *rb, ram_addr_t start, uint64_t haddr)
>  {
> -    void *aligned = (void *)(uintptr_t)(haddr & (-qemu_ram_pagesize(rb)));
> +    void *aligned = (void *)QEMU_ALIGN_DOWN(haddr, qemu_ram_pagesize(rb));

Is uintptr_t still needed?  I thought it would generate a warning otherwise but
not sure.

Also, maybe ROUND_DOWN() is better?  QEMU_ALIGN_DOWN is the slow version for
arbitrary numbers.

-- 
Peter Xu


