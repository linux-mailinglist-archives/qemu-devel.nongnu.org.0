Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BE13D7E41
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 21:05:27 +0200 (CEST)
Received: from localhost ([::1]:46194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8SOM-0007uM-LP
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 15:05:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m8SNB-0007Da-CG
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 15:04:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m8SN9-0006HG-F1
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 15:04:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627412650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jkByroHCkB5GSEYhO8uE5E3/DEdaxZbPmLy6jNb01Ls=;
 b=bxjVxmYeh3i4GeDyibdzrUVpbsRw9Hk0tgre2g/KCJfjgCXJuFKa1FiB5cccMSu2EmLIAl
 GwJj3T4NxYNDrweSyWkZ/5X/Fq7LFoEFgkvslYf28cqUwXN7pLNxDxoQW9DMuRsb+XtvRf
 R1qPI2rDuqA2QZnzcp3N1forFA8WQ3w=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-2ei65G1YPB68DH3YhTDphQ-1; Tue, 27 Jul 2021 15:04:09 -0400
X-MC-Unique: 2ei65G1YPB68DH3YhTDphQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 z10-20020adfdf8a0000b02901536d17cd63so3647620wrl.21
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 12:04:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jkByroHCkB5GSEYhO8uE5E3/DEdaxZbPmLy6jNb01Ls=;
 b=pRcVWEdQh98hy1BkTi+VSVNnZ3hioMqxhBk2F9JyN09/N8bi4/o8YxnGqlZvm6p2Dv
 4F5qc8t5rEvrovyB/sZYCCyTR+wXioK+t+Piyat9wQCBQxNlDw23RSkXa1OGoOuX8Tey
 VBPUQAqMRQYJ39liZPbv1MQa6vGK3y1v9BeFk5pK5vcCr0FbCFL9Wc8hnXmdUdvHb8Ey
 7qLXc/skJ9EMX677K3rZU08vFzaa/0hvE31kJvCYQ+9cc45C7ygtYbwr2LerTa5sU34H
 ZVhZgUfXE6NVZ48A00Kzgwsyf4BKhDZH0ETKmFQmZziAWEiWPAfCH1de1Wv6C3XHtMuf
 ZMDg==
X-Gm-Message-State: AOAM533df3lc9Mjzo5pqbRutUYHFRIkjQkbXD4YprXNkp66URcYhYWHJ
 GiCXSTct6d42peH8sF+jgu1C/dcKtQUwLdCRcwkjktkUM2CPP9rC5V78FC2CJu2pZVNld5yNJOX
 nHINOf/jRoVgjzwQ=
X-Received: by 2002:a1c:a94f:: with SMTP id s76mr3586649wme.17.1627412648222; 
 Tue, 27 Jul 2021 12:04:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6exJCxE/dIeyYpT4Kqq0eeMjOnkThiUvt0i43cyMOwfenxq5HVP9QseGkXxiKa2IEK4+UxA==
X-Received: by 2002:a1c:a94f:: with SMTP id s76mr3586635wme.17.1627412648088; 
 Tue, 27 Jul 2021 12:04:08 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id m15sm3969413wmc.20.2021.07.27.12.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 12:04:07 -0700 (PDT)
Date: Tue, 27 Jul 2021 20:04:05 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 4/6] util/oslib-posix: Avoid creating a single thread
 with MADV_POPULATE_WRITE
Message-ID: <YQBYpfgfUa8c9q0G@work-vm>
References: <20210722123635.60608-1-david@redhat.com>
 <20210722123635.60608-5-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210722123635.60608-5-david@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* David Hildenbrand (david@redhat.com) wrote:
> Let's simplify the case when we only want a single thread and don't have
> to mess with signal handlers.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  util/oslib-posix.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/util/oslib-posix.c b/util/oslib-posix.c
> index a1d309d495..1483e985c6 100644
> --- a/util/oslib-posix.c
> +++ b/util/oslib-posix.c
> @@ -568,6 +568,14 @@ static bool touch_all_pages(char *area, size_t hpagesize, size_t numpages,
>      }
>  
>      if (use_madv_populate_write) {
> +        /* Avoid creating a single thread for MADV_POPULATE_WRITE */
> +        if (context.num_threads == 1) {
> +            if (qemu_madvise(area, hpagesize * numpages,
> +                             QEMU_MADV_POPULATE_WRITE)) {

Do you never have to fall back if this particular memory region is the
one that can't do madv?

Dave

> +                return true;
> +            }
> +            return false;
> +        }
>          touch_fn = do_madv_populate_write_pages;
>      } else {
>          touch_fn = do_touch_pages;
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


