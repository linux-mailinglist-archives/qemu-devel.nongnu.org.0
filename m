Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE825FCA13
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 19:52:57 +0200 (CEST)
Received: from localhost ([::1]:47746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oifua-0007mD-2a
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 13:52:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oift2-0005iH-EX
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 13:51:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oifst-0005VV-TI
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 13:51:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665597070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JgRwOQEDk5fNO3Y4Lq4oD4Jg961V4d2aracxl1YQbU4=;
 b=Fb7/bjq2YR0+SBAIwa5KlMV7Wv52RLMVbi7O9rYQlyj8X7Df3AAevdf+fj+gj/TR8hV7Mm
 Aubl2pndr6Om9pyXcNMYrmBS28QmUcn7KgyahPMg+eCZ9QTUHdcENSlI8HcuyIN04n6fsX
 wa7AYMcTkCVVvIOCGzafKpeJqDaEvNg=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-52-S0dC19WmOTCse7mClXMidg-1; Wed, 12 Oct 2022 13:51:09 -0400
X-MC-Unique: S0dC19WmOTCse7mClXMidg-1
Received: by mail-qk1-f197.google.com with SMTP id
 bi38-20020a05620a31a600b006eeb2862816so141952qkb.0
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 10:51:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JgRwOQEDk5fNO3Y4Lq4oD4Jg961V4d2aracxl1YQbU4=;
 b=Sa2ujFl2Cbju0rJv5YYZRJDS3g/AhJfbUHc3p18bLX8pAEF1YlkRm0VF0kzi+UozlW
 Jhle8GwORGA2ZhDNBvca0kqJSISW9m5K8tON9p+IgHz6ug9by9MmHBzhZr58T5juvJie
 BM7b+7rAcgnEfBNnigitmsJE/JdrP7dympEdCyOYfOcP1a2RTZabtXX+MjFiyuvuwBjV
 k7JWWV1ZPh6lHBfjqQjR0aj+IDUGMDWMdVRiI1Praaa/rSPVBwRvWzhoauzBTlaWoyj8
 2f1eB3C7WZEXCKCZqYfa/S13AhbVWyg/x0nsASm7KJAHlEnnouKWoTgn9Sfa9mmnnDxj
 2cCg==
X-Gm-Message-State: ACrzQf20tVdnKERoDGyFI+YmCE2iIvx8F3beU76VXZFkNzxieHQm3SLO
 GZdAyIHGsmjEmIxjKwUYTL6erVhFoDs6gCDePrcMRynDbc7swDVW5VCk1gsaEQwk30MntEmllaj
 biLw/3MmFfnuxMIk=
X-Received: by 2002:ac8:5b4d:0:b0:39c:bcae:bf9 with SMTP id
 n13-20020ac85b4d000000b0039cbcae0bf9mr4777641qtw.77.1665597069019; 
 Wed, 12 Oct 2022 10:51:09 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5lemuHVP4gGHNoUt8ohAya2A2YnuP5k1x6wuOZ7waYiO+b72Eew9VybURNmNIOb43qOtgpyQ==
X-Received: by 2002:ac8:5b4d:0:b0:39c:bcae:bf9 with SMTP id
 n13-20020ac85b4d000000b0039cbcae0bf9mr4777627qtw.77.1665597068796; 
 Wed, 12 Oct 2022 10:51:08 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 u10-20020a05620a430a00b006ce7cd81359sm16022370qko.110.2022.10.12.10.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Oct 2022 10:51:08 -0700 (PDT)
Date: Wed, 12 Oct 2022 13:51:07 -0400
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, ani@anisinha.ca,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>
Subject: Re: [PATCH v2 06/15] migration: Yield bitmap_mutex properly when
 sending/sleeping
Message-ID: <Y0b+i6vliRkBC2MI@x1n>
References: <20221011215559.602584-1-peterx@redhat.com>
 <20221011215559.602584-7-peterx@redhat.com>
 <Y0buySbboE3xOVoQ@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y0buySbboE3xOVoQ@work-vm>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 12, 2022 at 05:43:53PM +0100, Dr. David Alan Gilbert wrote:
> * Peter Xu (peterx@redhat.com) wrote:
> > Don't take the bitmap mutex when sending pages, or when being throttled by
> > migration_rate_limit() (which is a bit tricky to call it here in ram code,
> > but seems still helpful).
> > 
> > It prepares for the possibility of concurrently sending pages in >1 threads
> > using the function ram_save_host_page() because all threads may need the
> > bitmap_mutex to operate on bitmaps, so that either sendmsg() or any kind of
> > qemu_sem_wait() blocking for one thread will not block the other from
> > progressing.
> > 
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> although a comment above the reclaration of ram_save_host_pages saying
> it can drop the lock would be veyr good.

Let me add that.  Thanks,

-- 
Peter Xu


