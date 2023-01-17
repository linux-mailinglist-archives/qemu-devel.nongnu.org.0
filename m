Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB66F66E280
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 16:42:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHo5s-0005ge-PG; Tue, 17 Jan 2023 10:41:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pHo5q-0005ah-O1
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 10:41:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pHo5o-0006kn-Ko
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 10:41:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673970017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fb7oLAeGiuEFJcf8uiUC3CSCYfHTGXc+YTRKf6rhxDE=;
 b=QnojEwNJdRcDTcrHHyvRxzU5D9jvFGyondOCH2GQoWFMbMOVn4xSkQw6bUtqcEUix0jOLT
 g2t63LfdEexLlMQmls8CyelV8eltaYXwTYhLhYM//610maBFa4Zc1xmS3ujHn6G0OazsiW
 Dgs7KXcOQ7UYIKXxCrQtciAicGANdss=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-516-tY2R4UZ4NceAwqPzLlkrqA-1; Tue, 17 Jan 2023 10:40:14 -0500
X-MC-Unique: tY2R4UZ4NceAwqPzLlkrqA-1
Received: by mail-qk1-f200.google.com with SMTP id
 u10-20020a05620a0c4a00b00705e77d6207so12655914qki.5
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 07:40:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fb7oLAeGiuEFJcf8uiUC3CSCYfHTGXc+YTRKf6rhxDE=;
 b=0v/OVcWpx/SSHE2r/FEZrBJCQkYOSc4dNDMjDcNQoA8Pc0CEfMK87JxTpc5C++kGuE
 1mYDfk7NISSogvbBHheegQba4UDmuMfrE/TkvblfkKj/pk6kd0ezmdyGdK+7PB5nHQ9V
 c2/na2TJaan/a42cdJbPLlOcGp7dsFRdxis9yHsfulQ5oxTJlnicoTJGbyphayVds8wW
 WQO/CbyoECfnxPwgPBa/0U4QXgJb0AWzKyiD9QBRny3FtFNMckiInJ1eXTfjdGZFIt5P
 jvxTiUiRN8ubHr/INyH0l21v5+U7hygfh7SQH0nqUfa3hR4cBkR70lgrEXWQ/6HI3I9Y
 ryNA==
X-Gm-Message-State: AFqh2ko6YpUYgYZjRRunJXfdp0wxBt7MoNaRFPQCtKNRK4WcgxInUVIE
 G//4GS69nzJyew+o5i0N6Z+uzelmVGgRYrR9AhmI/86v2Xs6+NAeNc1/18P7wUO7tGhRmQafWbi
 skp1nqqLvgArFSOQ=
X-Received: by 2002:ac8:4d09:0:b0:3b2:ae67:97f8 with SMTP id
 w9-20020ac84d09000000b003b2ae6797f8mr3626671qtv.44.1673970005400; 
 Tue, 17 Jan 2023 07:40:05 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtBhIqQnwBnebHBP65X6taDYBlABoUmY9/lUM4cjIV+4NZmkDArcicWAzFOVCr41qocimlHFg==
X-Received: by 2002:ac8:4d09:0:b0:3b2:ae67:97f8 with SMTP id
 w9-20020ac84d09000000b003b2ae6797f8mr3626656qtv.44.1673970005185; 
 Tue, 17 Jan 2023 07:40:05 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 ge9-20020a05622a5c8900b003a7e38055c9sm16135104qtb.63.2023.01.17.07.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 07:40:03 -0800 (PST)
Date: Tue, 17 Jan 2023 10:40:02 -0500
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
Subject: Re: [PATCH v5 0/8] virtio-mem: Handle preallocation with migration
Message-ID: <Y8bBUsn9oILkEr91@x1n>
References: <20230117112249.244096-1-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230117112249.244096-1-david@redhat.com>
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

On Tue, Jan 17, 2023 at 12:22:41PM +0100, David Hildenbrand wrote:
> While playing with migration of virtio-mem with an ordinary file backing,
> I realized that migration and prealloc doesn't currently work as expected
> for virtio-mem. Further, Jing Qi reported that setup issues (insufficient
> huge pages on the destination) result in QEMU getting killed with SIGBUS
> instead of failing gracefully.
> 
> In contrast to ordinary memory backend preallocation, virtio-mem
> preallocates memory before plugging blocks to the guest. Consequently,
> when migrating we are not actually preallocating on the destination but
> "only" migrate pages. Fix that be migrating the bitmap early, before any
> RAM content, and use that information to preallocate memory early, before
> migrating any RAM.
> 
> Postcopy needs some extra care, and I realized that prealloc+postcopy is
> shaky in general. Let's at least try to mimic what ordinary
> prealloc+postcopy does: temporarily allocate the memory, discard it, and
> cross fingers that we'll still have sufficient memory when postcopy
> actually tries placing pages.
> 
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Michal Privoznik <mprivozn@redhat.com>

For patch 1-5:

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


