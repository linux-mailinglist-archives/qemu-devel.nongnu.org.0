Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3E241B30A
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 17:36:15 +0200 (CEST)
Received: from localhost ([::1]:36786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVF9S-0000OI-6y
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 11:36:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mVF7n-0007qs-3z
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 11:34:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mVF7l-0005Su-Iu
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 11:34:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632843269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mOxH1Q4jaA/nroPIFR573XM5goYGBfBMdSoNF7VXIpA=;
 b=HwvvHU4sNxuHmUMA3tCMToDdl+gXJzEaMWAUDkHSR4XumiW56WaR1Rx/TikAxfj6yYBeug
 zFQFbq890/bKa6qQJG4+smLsafELG4KoegmNWvT3dfxctVztCaSqrQyddMxBS6k8EmAEFt
 J0U7D5UlkXeZYmoWI3EbHoAYTLb9MLw=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-jbETlU8wOGKgxLolStA7gw-1; Tue, 28 Sep 2021 11:34:25 -0400
X-MC-Unique: jbETlU8wOGKgxLolStA7gw-1
Received: by mail-il1-f199.google.com with SMTP id
 s19-20020a056e0210d300b002583cfc32ccso19549957ilj.1
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 08:34:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mOxH1Q4jaA/nroPIFR573XM5goYGBfBMdSoNF7VXIpA=;
 b=p2GDxLPwuQnvX3fKDdMSgn0MVa1ct5xzc/Z3Xyem2TTo08rOxQyQHxItNet7l7X4WP
 CegMzlqfKQCvj9+c6L3gOsNptZWS6m3lfWz+XZsm7WO6/pKLDTfihRGLtli83skjbMfd
 3yuStc4ssncGxwRKZzCs2TQGufte+ULDOB6+bnY4U7bqatmBgSKZsqNiD6i/CDi4wbnr
 Ox7yYReksbaq9iXDcMI6MvtORRA20cLN0ayu6vQzE8mg6GItQc4lcEk2STB8pduPJtrA
 ZLqU+7kr4F6eidJzCseYMX3gIv/Es1FUv/j5I9bV+fIesauPzE4rTVQozyf3DcLMRnNB
 E22g==
X-Gm-Message-State: AOAM531WQJTKAdYpejUy2frAAqifKIsbhyO2ORcJTVikN7URoqLFQGeb
 BfL40eT8aIkIP3nOI/Lrpt+htMmcKjoSYxWgYLw2m2F7xaqTBJ3V6wXIZ+TElYDAowD4FfBhTys
 nAgvpfwexsLP1Jsk=
X-Received: by 2002:a6b:2c51:: with SMTP id s78mr4506817ios.73.1632843265029; 
 Tue, 28 Sep 2021 08:34:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydkPcC8h3BA4JcAwac9UlS553UR7guN4M+EFQPxEcckffAkPViHGfvCfLpqvm6TsvhxwQPCw==
X-Received: by 2002:a6b:2c51:: with SMTP id s78mr4506802ios.73.1632843264808; 
 Tue, 28 Sep 2021 08:34:24 -0700 (PDT)
Received: from t490s ([2607:fea8:56a2:9100::d3ec])
 by smtp.gmail.com with ESMTPSA id x12sm11167451ilh.15.2021.09.28.08.34.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 08:34:24 -0700 (PDT)
Date: Tue, 28 Sep 2021 11:34:22 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v5 8/9] migration/ram: Factor out populating pages
 readable in ram_block_populate_pages()
Message-ID: <YVM1/nyZWvYLrCeE@t490s>
References: <20210904160913.17785-1-david@redhat.com>
 <20210904160913.17785-9-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210904160913.17785-9-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Sep 04, 2021 at 06:09:12PM +0200, David Hildenbrand wrote:
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
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


