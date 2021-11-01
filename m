Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0F24420FC
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 20:40:51 +0100 (CET)
Received: from localhost ([::1]:54926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhdAo-0006Ke-DF
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 15:40:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhbvt-0004BD-FZ
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:21:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhbvr-0007AX-Ha
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:21:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635790878;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=0JFOm8S0YXp0WdIe1EqMI4MfdPXZcI9o0noAQ37v/u4=;
 b=J8WzGInKM08EMsAG2vtq751IHAyrJbrEM+EB98LESOx9w49WpxXGNvyobS2b0b1G09BgJM
 4erkSZp06jRffEq3E0kwtehD2IBWvKgCeRDdygrXPIb7XK5TWCFXaey9EuhC7QWSQXmKod
 Bliazzrsy9MChq1wmajq7LXBBEqruc0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-4_jIfqtdNReRmM7xA3IHCA-1; Mon, 01 Nov 2021 14:21:17 -0400
X-MC-Unique: 4_jIfqtdNReRmM7xA3IHCA-1
Received: by mail-wr1-f71.google.com with SMTP id
 d13-20020adfa34d000000b00160aa1cc5f1so6508758wrb.14
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 11:21:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=0JFOm8S0YXp0WdIe1EqMI4MfdPXZcI9o0noAQ37v/u4=;
 b=syL/q5abwKo6sYsPFvkzUkXZhd4LuBKGrunsSpA6xyUhGHyfaCcWENS2pjS7dpAFG7
 hP8iFFhygG4byQCihjebuBP1hEKvMJ7EbkF2ANhSLdDQlK2bDpW6TwCyvk8jaE5P4/I4
 ppSIVpuTUi8jCyR64t6ex9X66nKy0jahQy6P2hMCqyMtHVwUCr2PPjHEkyB5DmFD/V95
 72NUZvi3M9Efna3tv6triJjiU2+cvg2IbnqlzkP3vfWq8i5iNr7kHsLMb5keSDl4A31c
 xotduKvQJmhkcDR3v4FKKFGv7RA9PdcMeTrpeaQU8L/FG7msvr2yF3sz8lAMVs6+s+NQ
 ofSQ==
X-Gm-Message-State: AOAM530mepP42FIinlgciPrla2mh8GHt7D6Qyko14MQ0Owcj86ShDQMw
 u5Uotzkv1Szwn75EKo9+iWM9kaXyulgXy4NzJuOUsFJn3vdz0i7BnCXArtX8VVRHrvM2M5m4ETn
 U/3oCyf0HVnJphfo=
X-Received: by 2002:a5d:4443:: with SMTP id x3mr31031132wrr.189.1635790876644; 
 Mon, 01 Nov 2021 11:21:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFb6HGcSg6UW5ezZSRPwfFVyU/POW9G8W5vzDIHqRJkkKrjptsp+r2snQ9YQbCgm1UudZftg==
X-Received: by 2002:a5d:4443:: with SMTP id x3mr31031113wrr.189.1635790876505; 
 Mon, 01 Nov 2021 11:21:16 -0700 (PDT)
Received: from localhost ([178.139.231.243])
 by smtp.gmail.com with ESMTPSA id 4sm1757139wrz.90.2021.11.01.11.21.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 11:21:16 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 6/9] migration/postcopy: Handle RAMBlocks with a
 RamDiscardManager on the destination
In-Reply-To: <20211011175346.15499-7-david@redhat.com> (David Hildenbrand's
 message of "Mon, 11 Oct 2021 19:53:43 +0200")
References: <20211011175346.15499-1-david@redhat.com>
 <20211011175346.15499-7-david@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 01 Nov 2021 19:21:14 +0100
Message-ID: <87sfwfspnp.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 teawater <teawaterz@linux.alibaba.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

David Hildenbrand <david@redhat.com> wrote:
> Currently, when someone (i.e., the VM) accesses discarded parts inside a
> RAMBlock with a RamDiscardManager managing the corresponding mapped memory
> region, postcopy will request migration of the corresponding page from the
> source. The source, however, will never answer, because it refuses to
> migrate such pages with undefined content ("logically unplugged"): the
> pages are never dirty, and get_queued_page() will consequently skip
> processing these postcopy requests.
>
> Especially reading discarded ("logically unplugged") ranges is supposed to
> work in some setups (for example with current virtio-mem), although it
> barely ever happens: still, not placing a page would currently stall the
> VM, as it cannot make forward progress.
>
> Let's check the state via the RamDiscardManager (the state e.g.,
> of virtio-mem is migrated during precopy) and avoid sending a request
> that will never get answered. Place a fresh zero page instead to keep
> the VM working. This is the same behavior that would happen
> automatically without userfaultfd being active, when accessing virtual
> memory regions without populated pages -- "populate on demand".
>
> For now, there are valid cases (as documented in the virtio-mem spec) where
> a VM might read discarded memory; in the future, we will disallow that.
> Then, we might want to handle that case differently, e.g., warning the
> user that the VM seems to be mis-behaving.
>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


