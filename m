Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9324420FD
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 20:41:00 +0100 (CET)
Received: from localhost ([::1]:55450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhdAx-0006i3-TS
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 15:40:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhc6i-0000bT-1h
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:32:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhc6d-00045V-PO
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:32:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635791546;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Dc4xDQdaSHKlGowNQp7GhCOwZsqa25kTcVNqLaZVKs0=;
 b=PmkzHwCRK3wterlU/nzPsmZ1drXtVVPWhj0dC9PoG92w1b9MSwezdTtBbwaQttQgRzJfGG
 6yn7Y/U6+PgXffA5uC+vcfSYZxdph0w03CYWC8gwZOTD1PxuLbuaw5Km1M3zR0OizzeWz2
 lBBzo/KPkQ3lNDFfrwL75pl1r5bywec=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-WRJaUGXuPA-xUrVgbytvhw-1; Mon, 01 Nov 2021 14:32:25 -0400
X-MC-Unique: WRJaUGXuPA-xUrVgbytvhw-1
Received: by mail-wr1-f72.google.com with SMTP id
 d13-20020adf9b8d000000b00160a94c235aso6515786wrc.2
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 11:32:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=Dc4xDQdaSHKlGowNQp7GhCOwZsqa25kTcVNqLaZVKs0=;
 b=a6pMor/s56z7kAWoYxs6lYEddojlVeThHB2HwLd5BzYEe3Nuo8/127PZuTOJkPVbJT
 XwiE5rodmxgGzHq7QBJor2yjo8enNTOuThHS/2EAr+cbXBSrFHFWTzSaKMGB6z/ludCD
 YkAPXD9latNcv1l+xlGS04FUE2iY9LYRCi4ou76L8TAoTEWJI0pJ3ujDGCBGGC7i6nTV
 p3fmerpxI9aaDZvTNbjYHcmwNJ3+qf9HUY1RPMMp9zFmOSYUEWtJjSUYZheWWocKxomz
 iZIoqNS1ojTAZcNDzt56Oa9Pbn3zWVRH5A/fXhe+I3TfUngF8oVHFN66xyZr9We5XZWr
 rupQ==
X-Gm-Message-State: AOAM532Abxxys56Y8PCWIEUjkr6rZgG7Dx4yCIEn/BP5a5WMfddUk07z
 BQyTpiXoIuYzb8WAHhUJMBdIPGwh/9jURI0abNAKXYvkR/a27TvQ/uBbcUygghjuXBOnIc7cJVR
 BYNjZeQbjLZZ7EwQ=
X-Received: by 2002:a05:600c:3511:: with SMTP id
 h17mr690652wmq.144.1635791544287; 
 Mon, 01 Nov 2021 11:32:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyq4FWBSJSV/wd0WZIUAgSNUGeNdedZGVyUIYz4CYagrrxFsLCywlIYCA1GGc+/ULCRErc3GA==
X-Received: by 2002:a05:600c:3511:: with SMTP id
 h17mr690622wmq.144.1635791544083; 
 Mon, 01 Nov 2021 11:32:24 -0700 (PDT)
Received: from localhost ([178.139.231.243])
 by smtp.gmail.com with ESMTPSA id f15sm5153477wrt.26.2021.11.01.11.32.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 11:32:23 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 8/9] migration/ram: Factor out populating pages
 readable in ram_block_populate_pages()
In-Reply-To: <20211011175346.15499-9-david@redhat.com> (David Hildenbrand's
 message of "Mon, 11 Oct 2021 19:53:45 +0200")
References: <20211011175346.15499-1-david@redhat.com>
 <20211011175346.15499-9-david@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 01 Nov 2021 19:32:20 +0100
Message-ID: <87ilxbsp57.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
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
> Let's factor out prefaulting/populating to make further changes easier to
> review and add a comment what we are actually expecting to happen. While at
> it, use the actual page size of the ramblock, which defaults to
> qemu_real_host_page_size for anonymous memory. Further, rename
> ram_block_populate_pages() to ram_block_populate_read() as well, to make
> it clearer what we are doing.
>
> In the future, we might want to use MADV_POPULATE_READ to speed up
> population.
>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


