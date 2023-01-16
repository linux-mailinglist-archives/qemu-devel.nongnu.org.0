Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8A066C2FF
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 15:58:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHQv4-00065V-1Y; Mon, 16 Jan 2023 09:57:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pHQv2-00065L-MS
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 09:57:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pHQv0-0002ld-PT
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 09:57:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673881021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aTKN3xYo/LZdVdBXMvOxaUDfBaf925hwdovshNaS87o=;
 b=KPXwjsUC+TcAIkbpEgf8V9fngf3vbpWWScfATpUsgKOQsvJS6LWAnUYc8R6b5B6t1gz7Ys
 w5Nhoy62FF4RDAOup97Ts3uMKj4niXdo8/6br9UqKKNSgexupA0pyDUwviYi9yUr80LjcB
 fLeDs/2X7E+pXAUZtHxgeXFSQeIZc0s=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-82-vNzYVD-GOrG5x6hQoD8FJw-1; Mon, 16 Jan 2023 09:57:00 -0500
X-MC-Unique: vNzYVD-GOrG5x6hQoD8FJw-1
Received: by mail-qk1-f197.google.com with SMTP id
 q21-20020a05620a0d9500b0070572ccdbf9so20874124qkl.10
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 06:56:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aTKN3xYo/LZdVdBXMvOxaUDfBaf925hwdovshNaS87o=;
 b=ShTYoRwlwrwP5PBBu+9fstm+ZbQNB6FH3N5g1JxsEpjVSHspiWPRWvHm32xsz4cCi6
 geRjGhvuB7cwT2gUEQZxLKa/a1amHMYhGll+QSw+RQqk7EqDCCNcR5nrxjHIYpl2fdWZ
 GtkRL2h9+M0D1v61IuE+t3xI4++2ehOpNI5f/rwsU7jI44dpE2w6ANjrxK2PYyP3SXc3
 Rfbbim+oxywUnDjKe3zVyHK2ZINdiY3KmcWA6a3rBrJ2KbVzUZU1IIqWJMaHnh+MCC4t
 g6fTWxGxQtVSYo78+/ZtUlSrcIvcrDJczR6PWxghrlhjwBsaMe7ypWzb1mXNfRTMBD5y
 vq+w==
X-Gm-Message-State: AFqh2kpx2vJ/ZPtkY2r0JCVXOb4c34mIbh//CL8HOHW/SCgY5QayPPny
 WRBOS+Iq60ZV7JnDaC9sTSV6Ml9GZUgcnBo4SQoWM7EisZNfZsFO5sGtKt2IF4W1djvCip0HmyG
 OlGS2Uy8P1ibKFUk=
X-Received: by 2002:ac8:7ca3:0:b0:3a7:f08f:4788 with SMTP id
 z3-20020ac87ca3000000b003a7f08f4788mr110422522qtv.63.1673881019502; 
 Mon, 16 Jan 2023 06:56:59 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs1bwxKOKHh8Vlqs7Tr1y1LxvcAqZklCE1Wo1yMRFreok732KgchRqWM0qf/5uwvFzQRJrYsw==
X-Received: by 2002:ac8:7ca3:0:b0:3a7:f08f:4788 with SMTP id
 z3-20020ac87ca3000000b003a7f08f4788mr110422500qtv.63.1673881019276; 
 Mon, 16 Jan 2023 06:56:59 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 y13-20020a37f60d000000b006fa2b1c3c1esm2284283qkj.58.2023.01.16.06.56.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 06:56:58 -0800 (PST)
Date: Mon, 16 Jan 2023 09:56:57 -0500
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
Subject: Re: [PATCH v3 3/8] migration/savevm: Allow immutable device state to
 be migrated early (i.e., before RAM)
Message-ID: <Y8VluVbZBsGp4v4Q@x1n>
References: <20230112164403.105085-4-david@redhat.com>
 <Y8BJ02EiHNSr6xMv@work-vm>
 <11b7237a-000a-5ad7-3747-246825188d83@redhat.com>
 <Y8BlCeViRSzyTQ8+@work-vm> <Y8CGYZ3F/h1oXV+d@x1n>
 <Y8CJf7hCy76AtfcF@x1n>
 <fa21267a-c1aa-2d43-799d-eb955318aec3@redhat.com>
 <Y8F2v+ikvEJa5+qc@x1n> <Y8F4eXdyBRKYeY4I@x1n>
 <9d7547c1-c670-2222-c4da-4c816f42a087@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9d7547c1-c670-2222-c4da-4c816f42a087@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Jan 16, 2023 at 11:35:22AM +0100, David Hildenbrand wrote:
> What about the following:
> 
> diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
> index 7bc0cd9de9..cc910cab0f 100644
> --- a/include/migration/vmstate.h
> +++ b/include/migration/vmstate.h
> @@ -188,6 +188,11 @@ struct VMStateDescription {
>       * One SaveStateEntry should either have the save_setup() specified or
>       * the vmsd with early_setup set to true. It should never have both
>       * things set.
> +     *
> +     * Note that for now, a SaveStateEntry cannot have a VMSD and
> +     * operations (e.g., save_setup()) set at the same time. For this reason,

This slightly duplicates with above?

> +     * also early_setup VMSDs are migrated in a QEMU_VM_SECTION_FULL section,
> +     * while save_setup() data is migrated in a QEMU_VM_SECTION_START section.
>       */

This looks good.

Thanks,

-- 
Peter Xu


