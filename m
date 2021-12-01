Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D846464708
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 07:09:24 +0100 (CET)
Received: from localhost ([::1]:52762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msInz-0007iD-1r
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 01:09:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1msIm5-00070W-Sl
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 01:07:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1msIly-0000eA-MH
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 01:07:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638338837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2v6F0A3sjdXFDLPOob3PpSHqqcC+FwKBxis/xLRVavM=;
 b=TP2DdBP/CxJsBV9b3KBEW9i6ESS/fg0yFUHAWap8InRmnkeyhuL8c4gzoLtkOyJD9e14cG
 t/sskFsoLU6nQChLeCIKzVJ4sRWNrVaCJvVlQJR3mR3ZZLI/yPS9R/FNqlJxpNZn3M6efZ
 jZXE8EFxox8xjbhrj5rUW7+lS6fIiKY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-19-_6yESDm5MhqUjjuyUxbNCw-1; Wed, 01 Dec 2021 01:07:16 -0500
X-MC-Unique: _6yESDm5MhqUjjuyUxbNCw-1
Received: by mail-wm1-f70.google.com with SMTP id
 l4-20020a05600c1d0400b00332f47a0fa3so307402wms.8
 for <qemu-devel@nongnu.org>; Tue, 30 Nov 2021 22:07:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2v6F0A3sjdXFDLPOob3PpSHqqcC+FwKBxis/xLRVavM=;
 b=jE2DmOFKYo++cGcnZ5cC/HNHTFLbUNAerc/R4oNpg/WXQHpom9nAPQU5rxA3iFCrzM
 mdwHrcEFZ3L+450S9P3xrzDrGsKiHVknTqT/rVscFMy/WDVMc1I1OojklOmGE9Jva5Cf
 MZ1nVsZVHi+WwwBCIKI3TNZFN8dg5EfTxigEnL1gEtitqDPKTHxKB8oM4MyWTSd+//Vl
 9VKEoXFacLB5HeKV4Qp0nYDl3Y9Ww8l/+kxyNk+HlQRtW1ka7zhwglrESO54jK801pnn
 qI3tk2t52H4ESR/JHiqYtLmvzzOD283sX98ujn3AorSsMo/xUwjifTbtNZO5Ih388mcm
 jdUQ==
X-Gm-Message-State: AOAM532oY6FegXipYOhuxL4uXeu8sCXQWDnM52iAtKHNHOBrbVQSlFbP
 UTGWXnWPZDhN+9YpAyQgkf+Qms479c3O46dYcKIcSaGIWwAjA1uUhPne8hqwVBh+DxAHIqtTngO
 AdqtG3/9i8dOmbKg=
X-Received: by 2002:a5d:452c:: with SMTP id j12mr4198968wra.430.1638338835356; 
 Tue, 30 Nov 2021 22:07:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyNDjHuZj113JJku0Sn1B3j3KJyoUi+od1bFStZZqYpl3nVY1fiKgFUNo6pTirqEATzqqnc0A==
X-Received: by 2002:a5d:452c:: with SMTP id j12mr4198938wra.430.1638338835094; 
 Tue, 30 Nov 2021 22:07:15 -0800 (PST)
Received: from xz-m1.local ([64.64.123.10])
 by smtp.gmail.com with ESMTPSA id w17sm18738148wrp.79.2021.11.30.22.07.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 22:07:14 -0800 (PST)
Date: Wed, 1 Dec 2021 14:07:08 +0800
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH] memory: Fix incorrect calls of log_global_start/stop
Message-ID: <YacRDCKQByhOG4gS@xz-m1.local>
References: <20211130080028.6474-1-peterx@redhat.com>
 <922e64a8-a26d-6643-1ae7-c89282392038@redhat.com>
MIME-Version: 1.0
In-Reply-To: <922e64a8-a26d-6643-1ae7-c89282392038@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Hyman Huang <huangy81@chinatelecom.cn>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 30, 2021 at 04:03:10PM +0100, David Hildenbrand wrote:
> On 30.11.21 09:00, Peter Xu wrote:
> > We should only call the log_global_start/stop when the global dirty track
> > bitmask changes from zero<->non-zero.
> > 
> > No real issue reported for this yet probably because no immediate user to
> > enable both dirty rate measurement and migration at the same time.  However
> > it'll be good to be prepared for it.
> > 
> > Fixes: 63b41db4bc ("memory: make global_dirty_tracking a bitmask")
> > Cc: Hyman Huang <huangy81@chinatelecom.cn>
> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > Cc: Juan Quintela <quintela@redhat.com>
> > Cc: David Hildenbrand <david@redhat.com>
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> 
> LGTM
> 
> Reviewed-by: David Hildenbrand <david@redhat.com>

Thanks for the quick review, David.

Just a heads-up that I think it'll be nice to have this as 6.2-rc3 material.
QEMU planning page told me rc3 has just passed (Nov 30th) but still I didn't
see it released, so not sure..

I won't call it a blocker though, so if it missed 6.2 we just copy stable, and
it'll be needed for 6.2 stable branch only.

-- 
Peter Xu


