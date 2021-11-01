Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A85D4420C6
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 20:24:20 +0100 (CET)
Received: from localhost ([::1]:57304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhcup-0005Gr-Fm
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 15:24:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhc1s-000498-KI
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:27:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhc1o-00017p-Fa
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:27:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635791247;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=9QvYapJgtKLuB2Gxw7sJz5C/DhQ0Zp/a+aCQ87BHJrg=;
 b=QlP3o7IWwmOhL6rpK5e6yLiC/AH1KJwSBwWvL8zO8QYDOOUc2FctNR4ZvLRgfj4xK+P9mC
 6P96+fYS8ckjoas5eDMLrWoZxE0Hf8A+Qk8VqgqwCb68ycj4y5l4L3K4ku4Ee3BQhyU7Ya
 4wBPcwYU86Nq1iA8G2e2I+JX+8r8l60=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-zyM3bHtfMtWZ-THIsM8KYg-1; Mon, 01 Nov 2021 14:27:26 -0400
X-MC-Unique: zyM3bHtfMtWZ-THIsM8KYg-1
Received: by mail-wr1-f70.google.com with SMTP id
 p17-20020adff211000000b0017b902a7701so3709864wro.19
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 11:27:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=9QvYapJgtKLuB2Gxw7sJz5C/DhQ0Zp/a+aCQ87BHJrg=;
 b=6sY3v3TVumud795HO6cja/BLj7SHWqviFO3V+vJ+Wy0CqmoLNsQVsE4MgA0bmdADOY
 MGazhtnrjs33o6Q9ArTeryE5EqJrrBfQFWo3ncmJP6qZ6qK6BXOgwzOwSpau4W0r6iut
 J9FvwnEHkc6tDg9w0Nhz6DbiPLTOv+efLptUkGMwTIVYfImVJgfjJYhfvf2+zPJ1jphR
 InIilyqkMeUj9dh4D0PvC1oXR4vsg5cwMX7ZNhTfz9c5FgJPf7SaR0rkbjhVx2EhufPV
 u3MBREfGIl3rWcG74thFN+V70KtO709JhxXuGaU2samfHPiQ5X8LlW2DaDnU/WCzvm2I
 /6Tg==
X-Gm-Message-State: AOAM5322YlwSiSsLS8fEaqFLFOMbACAO/lEt8E99fx0uOJa+YB6Iog+E
 SDzZDi6A8GsxEGSmv9RPYMkKL61fkyWHJViWnjj4hbIBDaeN2F6Uipl1+k72iGJB3zZb55zVhxf
 Ije1oLnStS10WW5U=
X-Received: by 2002:a5d:624c:: with SMTP id m12mr41448310wrv.160.1635791245128; 
 Mon, 01 Nov 2021 11:27:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJcmN9LPXlWkwgYC3X5WATZbB+mDNS9TyHhnTS5JXPNbSxqrJs9jQ887hw/JN1wcddFRtOQA==
X-Received: by 2002:a5d:624c:: with SMTP id m12mr41448285wrv.160.1635791244964; 
 Mon, 01 Nov 2021 11:27:24 -0700 (PDT)
Received: from localhost ([178.139.231.243])
 by smtp.gmail.com with ESMTPSA id q123sm240429wma.30.2021.11.01.11.27.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 11:27:24 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 7/9] migration: Simplify alignment and alignment checks
In-Reply-To: <20211011175346.15499-8-david@redhat.com> (David Hildenbrand's
 message of "Mon, 11 Oct 2021 19:53:44 +0200")
References: <20211011175346.15499-1-david@redhat.com>
 <20211011175346.15499-8-david@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 01 Nov 2021 19:27:22 +0100
Message-ID: <87mtmnspdh.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
> Let's use QEMU_ALIGN_DOWN() and friends to make the code a bit easier to
> read.
>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>
u


