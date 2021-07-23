Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B053D42A9
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Jul 2021 00:12:18 +0200 (CEST)
Received: from localhost ([::1]:47458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m73Oz-0005dB-7J
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 18:12:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m73Np-0004or-9K
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 18:11:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m73Nl-0005it-U1
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 18:11:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627078260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1wjTnL0RBc6fmy/DEUK0zPnp1/6JlJNCxi4wNg/0paY=;
 b=ihf6FdIPCqQOcxDT7UlkZmiiYyd4aB3Opk4i21zUlaV3DZBRJdUPuPYDRkI//b3LmQWJrR
 lWqPvCb4klDcoTt+OUlUPsD5AYWTQMbg3XpHtoCq5z3GyuMfymqD2GbUF8o+5lQl40y30k
 huc1IJGQRby70iXYMAPVtrODoLC9zrU=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-I2aTbviiMvSLa2xmgDiIzw-1; Fri, 23 Jul 2021 18:10:59 -0400
X-MC-Unique: I2aTbviiMvSLa2xmgDiIzw-1
Received: by mail-qk1-f197.google.com with SMTP id
 t191-20020a37aac80000b02903b9402486c5so2170367qke.13
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 15:10:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1wjTnL0RBc6fmy/DEUK0zPnp1/6JlJNCxi4wNg/0paY=;
 b=bf9rHwtLBL4XrOO8nlTduWDDj4tcD7cRmcJv6TItmK3aKKR1563c8iHbY06ZsxAqVR
 mhT+v1Ojh7BnnW4ZF6vGwsiJI/H9DfdBDcv6uXE4kX2muvep7d/mPHGTzOt+2xy6I4hP
 oDEzasTrfpBHTmGVp4s9ieeRfpCbOCnf71ANuSPlE91cMo5Jy+8EvqjDcJA4roWyGTo3
 bjt3W/GF8rExeHUSsq8pgjNz7UIqjixIk0vlBBGXumNb4QoInLSaYRr2tlAtrKzsXfaW
 YASvoTZ8gkBXZZB89sAlL9EnNwsL+MH/E3qu6Xt4jmB7Ets1Muiv4vk5ooQ8PNl77ZsF
 pm3Q==
X-Gm-Message-State: AOAM530AoIQYGAoAIOqqM68iWyHHI8CuUbex5MsWAB0UGYxDLoFf9b8Q
 UcWUVDAoYC26byZSW+IYXlLZffd1r/dguYdLp21zrKLxDd6Ey2ko5ZzoERJp0Va+KM/FIz29wf2
 bBSOggOKwErLUv9E=
X-Received: by 2002:a0c:ec02:: with SMTP id y2mr6538496qvo.61.1627078258966;
 Fri, 23 Jul 2021 15:10:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmpXmQh0bVqwevf/SJHzUqYYhbsliK4r/L6iPGKufrlKdezksukmIqWJnz7dG3B+l+TAQvuA==
X-Received: by 2002:a0c:ec02:: with SMTP id y2mr6538479qvo.61.1627078258780;
 Fri, 23 Jul 2021 15:10:58 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id h2sm15696559qkf.106.2021.07.23.15.10.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 15:10:58 -0700 (PDT)
Date: Fri, 23 Jul 2021 18:10:56 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 5/6] migration/postcopy: Handle RAMBlocks with a
 RamDiscardManager on the destination
Message-ID: <YPs+cO7u1eXMomE0@t490s>
References: <20210721092759.21368-1-david@redhat.com>
 <20210721092759.21368-6-david@redhat.com> <YPrvfST43SFOMA1F@t490s>
 <2ce949f2-6950-5404-70e4-73a2e41b4ca8@redhat.com>
 <YPsP8+STD836MO3L@t490s>
 <124693ef-5595-85c9-da5a-8f8e6a827c19@redhat.com>
MIME-Version: 1.0
In-Reply-To: <124693ef-5595-85c9-da5a-8f8e6a827c19@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, teawater <teawaterz@linux.alibaba.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 23, 2021 at 09:01:42PM +0200, David Hildenbrand wrote:
> It can happen in corner cases and is valid: with the current virtio-mem
> spec, guests are allowed to read unplugged memory. This will, for example,
> happen on older Linux guests when reading /proc/kcore or (with even older
> guests) when dumping guest memory via kdump. These corner cases were the
> main reason why the spec allows for it -- until we have guests properly
> adjusted such that it won't happen even in corner cases.
> 
> A future feature bit will disallow it for the guest: required for supporting
> shmem/hugetlb cleanly. With that in place, I agree that we would want to
> warn in this case!

OK that makes sense; with the page_size change, feel free to add:

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


