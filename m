Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 337B75435B6
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 16:54:48 +0200 (CEST)
Received: from localhost ([::1]:53458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyx55-0005Ih-7C
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 10:54:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nyx34-0002v0-0f
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 10:52:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nyx2r-0005oC-7f
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 10:52:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654699947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kLbonrqfjBFSX4EF7LWn0O3eL4PGVkmmODN6ZOnFDGc=;
 b=XwpM76HHf4LA73EyMyc1pSgSBDMh3I9jhmtjSr+bN5Jo0HptKWo2R73HdqRKUBOAQTkCMC
 112JRTOv3in2OxCJUtqclgvb/giACDmYH/INbj0oF7DglkCe6riI6Ijs/GqYWtKt1mW/zn
 9qFQp33aZZSgo9WUxZxMLry24XwMnew=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-BWPpXarZNwGVQgYCVVtgnQ-1; Wed, 08 Jun 2022 10:52:26 -0400
X-MC-Unique: BWPpXarZNwGVQgYCVVtgnQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 130-20020a1c0288000000b0039c6608296dso377734wmc.4
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 07:52:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kLbonrqfjBFSX4EF7LWn0O3eL4PGVkmmODN6ZOnFDGc=;
 b=8CLST8kzl15bDuUgleTj7VyzuESjAED25R4LeV8ezd9D9+g9Ruc6tBivft82EyuvOZ
 Qjwz/2/dLpzMxQeKsIkIe1F13cLxTFqXDjJnjWrcOj6gtVYiWi9ha7jCs5jTs3vjkThE
 W9Vyx+8ulr48hJBxFz7tbXoMq/KYxwQMWz1nJNEbnCipcKBXQef0AjoMlYTCoWBFT+qV
 T/JzzzryRVdArx678552trAo5ByEGKOgQAVDCI9oNvbqxOziovX5ezLDkqqBceEMDtBS
 JzXraBeEN2kujVlVis14j+A6UVsv9Tl6rc2z0MQ+aS2K7gZeGV1FBBco6KK8clCdNK4D
 COhA==
X-Gm-Message-State: AOAM533FVzTQwo7TEyh1ho+w1DEKjDZ52U5fUtLd0zybhwBgbhHFv1O+
 lc07YeL7HKV1c2HflrQkvacA0kI/okMgASSFtsjEU7BYDMJ8zj44EOCCSVz+vKokab0sggB7mj9
 g0/PSNj3g86ayrFs=
X-Received: by 2002:a05:6000:1542:b0:218:549a:2a8e with SMTP id
 2-20020a056000154200b00218549a2a8emr8048155wry.314.1654699945044; 
 Wed, 08 Jun 2022 07:52:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwRlk9mAdz7DVUMvdqM7xLbS2CLg/oCEob/ARPEUbyBUdvzF/OGM5IvFPRPaAPGjwJpni0JA==
X-Received: by 2002:a05:6000:1542:b0:218:549a:2a8e with SMTP id
 2-20020a056000154200b00218549a2a8emr8048134wry.314.1654699944853; 
 Wed, 08 Jun 2022 07:52:24 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 n20-20020a7bc5d4000000b0039aef592ca0sm23957775wmk.35.2022.06.08.07.52.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 07:52:24 -0700 (PDT)
Date: Wed, 8 Jun 2022 15:52:22 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, armbru@redhat.com,
 Mark Kanda <mark.kanda@oracle.com>
Subject: Re: [PATCH v5 02/10] kvm: Support for querying fd-based stats
Message-ID: <YqC3pocwSjcp2y/3@work-vm>
References: <20220530150714.756954-1-pbonzini@redhat.com>
 <20220530150714.756954-3-pbonzini@redhat.com>
 <Yp+ObQxOi/EXc6PZ@work-vm>
 <758db6b4-5786-adf4-d293-d8dc7793a21b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <758db6b4-5786-adf4-d293-d8dc7793a21b@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Paolo Bonzini (pbonzini@redhat.com) wrote:
> On 6/7/22 19:44, Dr. David Alan Gilbert wrote:
> 
> > > +        return NULL;
> > > +    }
> > > +    descriptors->kvm_stats_header = kvm_stats_header;
> > > +    descriptors->kvm_stats_desc = kvm_stats_desc;
> > > +    descriptors->ident = g_strdup(ident);
> > 
> > There's something that confuses me here; you check your set of
> > descriptors above to find any with the matching ident, and if you've
> > already got it you return it; OK.  Now, if you don't match then you
> > read some stats and store it with that ident - but I don't see
> > when you read the stats from the fd, what makes it read the stats that
> > correspond to 'ident' ?
> 
> If you mean why not some other source, each source has a different file
> descriptor:
> 
> +    int stats_fd = kvm_vcpu_ioctl(cpu, KVM_GET_STATS_FD, NULL);
> 
> but the descriptors are consistent every time KVM_GET_STATS_FD is called, so
> basically "ident" can be used as a cache key.

Ah OK, this is what I was after; it's a little weird that the caller
does the ioctl to get the stats-fd, but it does the lookup internally
with current_cpu for the ident.

Some comments would help!

Dave

> If you mean how does it access the right stat, here it uses the offset
> field in the descriptor
> 
>     ret = pread(stats_fd, stats_data, size_data,
> kvm_stats_header->data_offset);
>     ...
>     for (i = 0; i < kvm_stats_header->num_desc; ++i) {
>         uint64_t *stats;
>         pdesc = (void *)kvm_stats_desc + i * size_desc;
> 
>         /* Add entry to the list */
>         stats = (void *)stats_data + pdesc->offset;
> 
> Paolo
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


