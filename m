Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B346AE7E2
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 18:04:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZak2-0006qk-8H; Tue, 07 Mar 2023 12:04:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pZak0-0006o3-Qj
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:04:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pZajz-0003z6-8X
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:04:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678208682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/LkzJRldjbXVb4PRNDwl3L1pyeSW3DLggNQrhMLGrAM=;
 b=CF2L+DOiOoiHDgWYw6lcRlfvcgO91M8Crfb+E6jAg/eIQXpFlTkmcpV6MYwdKYumKOZuXF
 VNUhBlsFY+13gRaH3B1p56xyzBZAkM7eXig0ztjWc8RgXl0RBBXg2WVGGCRlgD74z202WW
 5ziSzji6SfXtZ3XSrUVoDjASZ8KxqjI=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-104-0BkllWKPNZafMW0ApwFYBg-1; Tue, 07 Mar 2023 12:04:39 -0500
X-MC-Unique: 0BkllWKPNZafMW0ApwFYBg-1
Received: by mail-qv1-f70.google.com with SMTP id
 z3-20020ad44143000000b005771ea56ab6so7822729qvp.1
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 09:04:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678208678;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/LkzJRldjbXVb4PRNDwl3L1pyeSW3DLggNQrhMLGrAM=;
 b=iC8JM0TBpNznup737JObtWDoOGrUb2eZRWLsGJ3cSDz2tWPGwQTwdfJ0uyxf8ecXgd
 Mi83gjWry9yRaKtuzh970ucHmepbad08utcz6ct23oplWCq7JzT5OwFqe2WgCehZd/E7
 7yZL+lkSD+WIGWpMLx3FeWXWEXpzEYpfVxT6D8BLUJKLgYiJDGbyBxjmaXA0wvjGnMzo
 x4Xd0N+Q6BYWpZR9Hmwdklz8T2Lw/CnMIHgmDgPvQSn4Xol53eZvbELHs+8jx6leb0xQ
 zhEoPb2Pub/TyIEI6couF3J8ivXjlUryB+1iOq2JspZhvH9v8G9mcFc3jNFT3YMGY5Ox
 G1WA==
X-Gm-Message-State: AO0yUKXwD0A+GdCGcRW4O978W2GK4j3XkUTutqEWayqoHzhZQYsCTnkz
 4C26JscbYPj6T3i+Szo7AbemcF9TH+GCr6YGuZ+4LEKWEkIWeswKSaIRV4baCxdrCbvGtFVmDX4
 FcyAZl42wCpFgDkY=
X-Received: by 2002:a0c:b39c:0:b0:571:f805:67ee with SMTP id
 t28-20020a0cb39c000000b00571f80567eemr25319012qve.3.1678208678580; 
 Tue, 07 Mar 2023 09:04:38 -0800 (PST)
X-Google-Smtp-Source: AK7set8PiHUuZ417R7aXbkeD3vzo6g2iy3JTHQRcHj2kf0dOURl1t2aOkjMmtI42NhlBNbscjcOIUw==
X-Received: by 2002:a0c:b39c:0:b0:571:f805:67ee with SMTP id
 t28-20020a0cb39c000000b00571f80567eemr25318989qve.3.1678208678334; 
 Tue, 07 Mar 2023 09:04:38 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 g186-20020a37b6c3000000b007430494ab92sm9730302qkf.67.2023.03.07.09.04.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 09:04:37 -0800 (PST)
Date: Tue, 7 Mar 2023 12:04:36 -0500
From: Peter Xu <peterx@redhat.com>
To: Chuang Xu <xuchuangxclwt@bytedance.com>
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com,
 pbonzini@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com
Subject: Re: [PATCH RESEND v6 0/5] migration: reduce time of loading
 non-iterable vmstate
Message-ID: <ZAdupAAJjbSbJiss@x1n>
References: <20230303105655.396446-1-xuchuangxclwt@bytedance.com>
 <ZAUSPo9bJO0udf9p@x1n>
 <1ea4db90-7535-1dc3-a2ae-d44113a24e29@bytedance.com>
 <ZAZRn9eNG1TEoEl1@x1n>
 <f6e36da0-d20b-af80-4239-5bb59b97f530@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f6e36da0-d20b-af80-4239-5bb59b97f530@bytedance.com>
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

On Tue, Mar 07, 2023 at 09:24:31PM +0800, Chuang Xu wrote:
> > Why do we need address_space_get_flatview_rcu()?  I'm not sure whether you
> 
> address_space_cahce_init() uses address_space_get_flatview() to acquire
> a ref-ed flatview. If we want to use address_space_to_flatview_rcu() and
> make the flatview ref-ed, maybe we need to add address_space_get_flatview_rcu()?
> Or if we use address_space_to_flatview_rcu() directly, then we'll get a
> unref-ed flatview, I'm not sure wheather it's safe in other cases.. At least
> I don't want the assertion to be triggered one day.

No we can't touch that, afaict.  It was a real fix (447b0d0b9e) to a real
bug.

What I meant is we make address_space_get_flatview() always use
address_space_to_flatview_rcu().

I think it's safe, if you see the current callers of it (after my patch 1
fixed version applied):

memory_region_sync_dirty_bitmap[2249] view = address_space_get_flatview(as);
memory_region_update_coalesced_range[2457] view = address_space_get_flatview(as);
memory_region_clear_dirty_bitmap[2285] view = address_space_get_flatview(as);
mtree_info_flatview[3418]      view = address_space_get_flatview(as);
address_space_cache_init[3350] cache->fv = address_space_get_flatview(as);

Case 5 is what we're targeting for which I think it's fine. Logically any
commit() hook should just use address_space_get_flatview_raw() to reference
the flatview, but at least address_space_cache_init() is also called in
non-BQL sections, so _rcu is the only thing we can use here, iiuc..

Case 1-3 is never called during vm load, so I think it's safe.

Case 4 can be accessing stalled flatview but I assume fine since it's just
for debugging. E.g. if someone tries "info mtree -f" during vm loading
after your patch applied, then one can see stalled info.  I don't think it
can even happen because so far "info mtree" should also take BQL.. so it'll
be blocked until vm load completes.

The whole thing is still tricky.  I didn't yet make my mind through on how
to make it very clean, I think it's slightly beyond what this series does
and I need some more thinkings (or suggestions from others).

-- 
Peter Xu


