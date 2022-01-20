Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6124945B8
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 03:15:23 +0100 (CET)
Received: from localhost ([::1]:47274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAMyv-00025a-Kl
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 21:15:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nAMvw-0000dw-Ng
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 21:12:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nAMvu-00021N-8m
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 21:12:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642644733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/VAKbKRI4E9XiMFewGZ4S9qSsCJJD6xg+BToA1i9g3E=;
 b=i4k0H/kTi12zSfH66dsQLEiJP369DrvF1JXmDKbphmKTkN+9UEq6NXJnsqhYiY3tl9V3Xk
 LIW/Za0TmtcwGy+wik5ePkka2XfzeD5rAp2hvo5wASAbPKoIUGJmgrULz/38yTNpHK+46O
 Jm1+LgeKaJWhRGVFcLCjfE+78VFLy+Y=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-126-kWwjsl2zNwSXBYSyDwEJZA-1; Wed, 19 Jan 2022 21:12:11 -0500
X-MC-Unique: kWwjsl2zNwSXBYSyDwEJZA-1
Received: by mail-pj1-f72.google.com with SMTP id
 o72-20020a17090a0a4e00b001b4e5b5b6c0so3033339pjo.5
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 18:12:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/VAKbKRI4E9XiMFewGZ4S9qSsCJJD6xg+BToA1i9g3E=;
 b=sr7x5h9Hr72+VqU+FFHvpuBx64o+12BwEpe6pNcP7iTlGX9qdj61HoX8g3mxL8cUoj
 KFxbaHylsGoZjm8Op/g0IV4Fk2ZkK/qM4vZ9d5rS/4xmQdAPPQI/0WUDLcgKF6WvlEAt
 PxqQ9kHRg5VlCqMlanlywwmh0pUxdA+sPC6sYNIIK+KE3AlH+w3oabmUSU+RzkUg8Poc
 tgRv6GXFXkkHSrIVyOoloQgzlNlQIrJvm3noEbh/hq/CY07OfRsKmXcsFKqHuvt+PbBv
 DnEYTyhMAnGX7b+tcl1gQVSNCSrarigE/ANiMfWfCatAbpGlJvqIYnI+uQ/MbRAnTejD
 sQQQ==
X-Gm-Message-State: AOAM531a/eNsgYzFqIJksT56HKo3+Hbcz3ttYTBOsGByK+0k4wzNLQyn
 8yn7mDYF5fgvQCnv6dwOsftsKhf4dPYtxfy+YAZJyt/SSbkzYHiQglrbabbuUy/3k/1hTx9vWjo
 fsXRQcI9OPQm3caw=
X-Received: by 2002:a05:6a00:2186:b0:4c6:50ea:6701 with SMTP id
 h6-20020a056a00218600b004c650ea6701mr403384pfi.12.1642644730721; 
 Wed, 19 Jan 2022 18:12:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwx2RVIeiWne8mJ5HCI2+sz8yxuYbfv0Jd+oGIoivAW2u2B5UIc034xSW1hAwCXwW04m6029Q==
X-Received: by 2002:a05:6a00:2186:b0:4c6:50ea:6701 with SMTP id
 h6-20020a056a00218600b004c650ea6701mr403354pfi.12.1642644730325; 
 Wed, 19 Jan 2022 18:12:10 -0800 (PST)
Received: from xz-m1.local ([94.177.118.77])
 by smtp.gmail.com with ESMTPSA id g19sm984034pfv.11.2022.01.19.18.12.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 18:12:09 -0800 (PST)
Date: Thu, 20 Jan 2022 10:12:03 +0800
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH RFC 02/15] migration: Allow pss->page jump over clean pages
Message-ID: <YejE8+F1l0ugJruR@xz-m1.local>
References: <20220119080929.39485-1-peterx@redhat.com>
 <20220119080929.39485-3-peterx@redhat.com>
 <YegVV6lmkkmKBv9p@work-vm>
MIME-Version: 1.0
In-Reply-To: <YegVV6lmkkmKBv9p@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kunkun Jiang <jiangkunkun@huawei.com>, Juan Quintela <quintela@redhat.com>,
 Keqian Zhu <zhukeqian1@huawei.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 19, 2022 at 01:42:47PM +0000, Dr. David Alan Gilbert wrote:
> * Peter Xu (peterx@redhat.com) wrote:
> > Commit ba1b7c812c ("migration/ram: Optimize ram_save_host_page()") managed to
> > optimize host huge page use case by scanning the dirty bitmap when looking for
> > the next dirty small page to migrate.
> > 
> > However when updating the pss->page before returning from that function, we
> > used MIN() of these two values: (1) next dirty bit, or (2) end of current sent
> > huge page, to fix up pss->page.
> > 
> > That sounds unnecessary, because I see nowhere that requires pss->page to be
> > not going over current huge page boundary.
> > 
> > What we need here is probably MAX() instead of MIN() so that we'll start
> > scanning from the next dirty bit next time. Since pss->page can't be smaller
> > than hostpage_boundary (the loop guarantees it), it probably means we don't
> > need to fix it up at all.
> > 
> > Cc: Keqian Zhu <zhukeqian1@huawei.com>
> > Cc: Kunkun Jiang <jiangkunkun@huawei.com>
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> 
> 
> Hmm, I think that's potentially necessary.  note that the start of
> ram_save_host_page stores the 'start_page' at entry.
> That' start_page' goes to the ram_save_release_protection and so
> I think it needs to be pagesize aligned for the mmap/uffd that happens.

Right, that's indeed a functional change, but IMHO it's also fine.

When reaching ram_save_release_protection(), what we guaranteed is that below
page range contains no dirty bits in ramblock dirty bitmap:

  range0 = [start_page, pss->page)

Side note: inclusive on start, but not inclusive on the end side of range0
(that is, pss->page can be pointing to a dirty page).

What ram_save_release_protection() does is to unprotect the pages and let them
run free.  If we're sure range0 contains no dirty page, it means we have
already copied them over into the snapshot, so IIUC it's safe to unprotect all
of it (even if it's already bigger than the host page size)?

That can be slightly less efficient for live snapshot in some extreme cases
(when unprotect, we'll need to walk the pgtables in the uffd ioctl()), but I
don't assume live snapshot to be run on a huge VM, so hopefully it's still
fine?  Not to mention it should make live migration a little bit faster,
assuming that's more frequently used..

Thanks,

-- 
Peter Xu


