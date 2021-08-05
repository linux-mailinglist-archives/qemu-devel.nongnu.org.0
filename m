Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A876C3E0B17
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 02:06:42 +0200 (CEST)
Received: from localhost ([::1]:45778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBQuH-0002AP-OX
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 20:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mBQsm-0000gh-AW
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 20:05:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mBQsk-00060C-Rv
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 20:05:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628121905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=otCVwSSaRZyEqhsCDQMQyzbqs31Ukt0cgLw5f0OrZF8=;
 b=YUaJusaPJvxgSvL7t3ERlYBqb4D/13mmA56JTEvcM3IDxICemWj7MYHnuFF2z9Z3V+sbB/
 GbsJ1YMDWnHvrG4hUpeU+TQXj5xcK8VXEl9I/VSwlq0P5EdBOvDyagBMHh4nl3cnQqVYbg
 KWLu5R19jCbP381fZh5enI360t6XgXM=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-FNAteZkmMUqAB-N2GXzISA-1; Wed, 04 Aug 2021 20:05:04 -0400
X-MC-Unique: FNAteZkmMUqAB-N2GXzISA-1
Received: by mail-qt1-f198.google.com with SMTP id
 h18-20020ac856920000b029025eb726dd9bso1874562qta.8
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 17:05:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=otCVwSSaRZyEqhsCDQMQyzbqs31Ukt0cgLw5f0OrZF8=;
 b=T+gk+eIP1fZGzuiCjquPxpP0Q9TXvU2ND0zvZlNmtDY+0TjgeGwtrFs0izRsBv1FRg
 v0aB2T+80HbBh9GGax/M67ZFsxNe0EJeCkXGB0PLKTUT83Pl8LSoM+KpqNbXrRDoa4SN
 H8vwA8UncDvxWy6T1pma8lSMJBM8Dcb7LRBAmsqYP/FfRKwfeE/Rug426pmql3zRPS+0
 S2mVdKxNNIvqZw8qmhgrfdC6xyRWq7REKHFsbwdhreklTBzYnWH/1mZFCI6xnWtjNrxZ
 pXNxLAri8U+xIm864WMCdw4YmhHbkY40Fom7Z95cfyoNC2wRBOqS6ICVGL9Y+/m/pvPh
 jwNg==
X-Gm-Message-State: AOAM531rWzCsRgibOiLGWaikbO+hb1oszU5BdApiKvSHxoXdy9L3CXrM
 oaytTICQixy/qh4L23ufvT4kgdmV2bQ6Jmj9xaGDKxTlm/95KmnWAx8uiqKZ5GCBC51TLR7x/yF
 aCEe7iUwkKoZw0Ps=
X-Received: by 2002:a37:9307:: with SMTP id v7mr2010097qkd.371.1628121904248; 
 Wed, 04 Aug 2021 17:05:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygGfXrA9V4FiBaYXSv/+Hfv4gTLjO9JsYn0XOK3I2n6gFDlGEvwdFabEPiG0XY4eE8bkrCnA==
X-Received: by 2002:a37:9307:: with SMTP id v7mr2010077qkd.371.1628121904067; 
 Wed, 04 Aug 2021 17:05:04 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-92-76-70-75-133.dsl.bell.ca.
 [76.70.75.133])
 by smtp.gmail.com with ESMTPSA id g24sm1558025qtr.86.2021.08.04.17.05.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 17:05:03 -0700 (PDT)
Date: Wed, 4 Aug 2021 20:05:01 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 3/7] migration/ram: Don't passs RAMState to
 migration_clear_memory_region_dirty_bitmap_*()
Message-ID: <YQsrLUCrMcdRcdME@t490s>
References: <20210730085249.8246-1-david@redhat.com>
 <20210730085249.8246-4-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210730085249.8246-4-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 30, 2021 at 10:52:45AM +0200, David Hildenbrand wrote:
> The parameter is unused, let's drop it.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


