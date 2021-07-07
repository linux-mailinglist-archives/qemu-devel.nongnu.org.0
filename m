Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2CC3BEDAB
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 20:04:13 +0200 (CEST)
Received: from localhost ([::1]:56012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Bu8-0002oJ-9n
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 14:04:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m1Bt0-0001W2-8u
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 14:03:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m1Bsx-0003A9-RG
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 14:03:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625680978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LI/6/3y/Mt3s6myhT3lK9jiaYna4wIDZkPVfJaQ0UPQ=;
 b=J5TcIULvvnHf7nbQuJvDwLaKSRSHN68erq6mEe+PoEzyTp9Exa42gQwP/gfDI9w6Sl8BjA
 azzb/CqO3fXFoT8phsr2DOXf0RAsId7hL1MqG7NMKS8DT0hdeMuT69QM5bDg/izrHCpZuf
 8Ncv+UQr51we7jI7qE/pnMv30JZSZNo=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-DWEmF0JhMkmYwtLGXuLbpA-1; Wed, 07 Jul 2021 14:02:55 -0400
X-MC-Unique: DWEmF0JhMkmYwtLGXuLbpA-1
Received: by mail-qk1-f198.google.com with SMTP id
 k63-20020a37a1420000b02903b4fb67f606so2084682qke.10
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 11:02:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LI/6/3y/Mt3s6myhT3lK9jiaYna4wIDZkPVfJaQ0UPQ=;
 b=ugvlAWrx23eXKjsdqhZQ0LKWLFZQdKK8vhd4CzlYph8EAfHKHxuPYwHcC5y6rG45Lp
 UKmkHNhvlr2s3aQW5MAbU2HlrtOrJzFh/NXbzKMqWsW860Fi/e7kNg0tdmCy5HNYqQv6
 kQTzHN2DxDzWryw3VeKspaqaEeQahzMrDd/S0Ji24ijrfWN60kYyh2SMDP547PsV2xiM
 acEfDMTTzaZHTqJtjpmc/AVdtREfxBpCTCTP9gi8s1jVmkxPwBJ5YRNw9cLQO+unoU7h
 M1ubBxyc+SKTxI0mIJ2E01mARI/kOpPpcTmxCzjM2imp31gAAoV5O6wm7cNERWOcLoYQ
 zbcA==
X-Gm-Message-State: AOAM532KIvre6gz7cZDrbLymx7vu2oODmeoaq5wtKylkL+XMhMV30yJI
 WEOdHBwB9PfY8Y4KLlKtyFRcP0q4L8VpVdh32b3TG4OV72VZOzRDRnnVytcjozdHpDANJjZHtzb
 OsyS1JMqktfO5MWQ=
X-Received: by 2002:a37:a4b:: with SMTP id 72mr14967071qkk.139.1625680974917; 
 Wed, 07 Jul 2021 11:02:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzynuhIWDKoNj6iWvuadi7vNAYjLGQnhdFWKLmuVbkd+xZBtLzvR0vRdV/p5HNtWIwt5b84gA==
X-Received: by 2002:a37:a4b:: with SMTP id 72mr14967047qkk.139.1625680974730; 
 Wed, 07 Jul 2021 11:02:54 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id i2sm5478341qko.43.2021.07.07.11.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 11:02:54 -0700 (PDT)
Date: Wed, 7 Jul 2021 14:02:53 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 2/2] virtio-balloon: disallow postcopy with
 VIRTIO_BALLOON_F_FREE_PAGE_HINT
Message-ID: <YOXsTQoq6eeIR8B5@t490s>
References: <20210707140655.30982-1-david@redhat.com>
 <20210707140655.30982-3-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210707140655.30982-3-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, Alexander Duyck <alexander.duyck@gmail.com>,
 qemu-stable@nongnu.org, Wei Wang <wei.w.wang@intel.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 07, 2021 at 04:06:55PM +0200, David Hildenbrand wrote:
> As it never worked properly, let's disable it via the postcopy notifier on
> the destination. Trying to set "migrate_set_capability postcopy-ram on"
> on the destination now results in "virtio-balloon: 'free-page-hint' does
> not support postcopy Error: Postcopy is not supported".

Would it be possible to do this in reversed order?  Say, dynamically disable
free-page-hinting if postcopy capability is set when migration starts? Perhaps
it can also be re-enabled automatically when migration completes?

I see postcopy a "functional" feature and free-page-hint a "performance"
feature, from that pov IMHO it's better to not block function for performance.

Thanks,

-- 
Peter Xu


