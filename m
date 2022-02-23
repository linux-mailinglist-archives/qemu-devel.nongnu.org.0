Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A20A94C106B
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 11:37:43 +0100 (CET)
Received: from localhost ([::1]:53396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMp1i-0006FR-Nz
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 05:37:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nMoNe-0007PP-2p
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:56:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nMoNb-0001Me-EU
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:56:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645610173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pRXplA+BjvSzMPOrtcY9bsjNklrTlMx5Tt3aSHkXU0o=;
 b=JY4RCcjg3sWRAjjWOcerAKN3ujW30bB1+obhlk/j3b1yeFLWx1pKUKNZiEoaH0iMVNFN7v
 UjM73+YGVHdqalAf5A4FsV36/Xy8XEpKVBQqQ5qoPGNwA8JJ2y0CLafFJ+MnZKuBb6vFhx
 8mN8RyxrnxNKN+qdCPVwdrK48I+L2NY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-212-yVzunXS3N6CPBTSbqa2t2Q-1; Wed, 23 Feb 2022 04:56:12 -0500
X-MC-Unique: yVzunXS3N6CPBTSbqa2t2Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 v17-20020adfa1d1000000b001ed9d151569so1235892wrv.21
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 01:56:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pRXplA+BjvSzMPOrtcY9bsjNklrTlMx5Tt3aSHkXU0o=;
 b=xNFo9hhYFtVAb/TYEMfeVfN2faU8+tQl2ofOiHQ7YjnXsOtcFBU2okXfvhdeNg4RPK
 7+iJJ5Qygjqbjk4WrtcbfdkkKyJZaljLzZEe7mMOxmTaGSQCpI/MHLSd5bwgVEmE+q16
 3woWUb60PoEVZxUG6v8FX0oUBUyvl+hfwXSszz10KPyqLKmHnCdhq8Ko27FTAqhDHDwL
 B8zeMi9hq74vxBYBIfTLjQ9Nz9iuPhMzjpZGrzRk+offuLlNNuxNjBn1z/piRHbGIEU4
 RANayx9veDxp3uMzlgKE5VvxBnYFogI2T1qui8LlenjCR0zeXCe0Bzg35ThULkxZrDHM
 w3eA==
X-Gm-Message-State: AOAM533TbUljQfNzzBlDKif79H2gD5P6m317AShnyrcIUawOfDKewW0A
 bhLm1EkUFFqJulIDiVYT5jEb4DlmWKG9ChJgSfAaPC8gYxAAD+uEaVpadippK2Cz9aeGQ444nXf
 3ttwmkc72/qqM8wo=
X-Received: by 2002:adf:8b85:0:b0:1ed:b97b:493d with SMTP id
 o5-20020adf8b85000000b001edb97b493dmr1087648wra.108.1645610171070; 
 Wed, 23 Feb 2022 01:56:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwwqRq+xGW7KHSPVHXSV+Q27VgvzT7fw4kLoNjs2eKzuNJnNYugrauBgKMeMmjkin2dK6jfIg==
X-Received: by 2002:adf:8b85:0:b0:1ed:b97b:493d with SMTP id
 o5-20020adf8b85000000b001edb97b493dmr1087639wra.108.1645610170885; 
 Wed, 23 Feb 2022 01:56:10 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id n9sm36413638wrx.76.2022.02.23.01.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 01:56:10 -0800 (PST)
Date: Wed, 23 Feb 2022 09:56:08 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 18/20] migration: Postcopy preemption enablement
Message-ID: <YhYEuI+immRJZh78@work-vm>
References: <20220216062809.57179-1-peterx@redhat.com>
 <20220216062809.57179-19-peterx@redhat.com>
 <YhTAZzuAEyEHGjea@work-vm> <YhXbsyXAXhNLRVsq@xz-m1.local>
MIME-Version: 1.0
In-Reply-To: <YhXbsyXAXhNLRVsq@xz-m1.local>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> On Tue, Feb 22, 2022 at 10:52:23AM +0000, Dr. David Alan Gilbert wrote:
> > This does get a bit complicated, which worries me a bit; the code here
> > is already quite complicated.
> 
> Right, it's the way I chose in this patchset on solving this problem.  Not
> sure whether there's any better and easier way.
> 
> For example, we could have used a new thread to send requested pages, and
> synchronize it with the main thread.  But that'll need other kind of
> complexity, and I can't quickly tell whether that'll be better.
> 
> For this single patch, more than half of the complexity comes from the
> ability to interrupt sending one huge page half-way.  It's a bit of a pity
> that, that part will be noop ultimately when with doublemap.

How does that huge-page interruption interact with recovery?
i.e. do we know the start of that hugepage arrived?

> 
> However I kept those only because we don't know when doublemap will be
> ready, not to say, landing.  Meanwhile we can't assume all kernels will
> have doublemap even in the future.

Yeh, if doublemap was already here you could make it a condition of
allowing you to set the option.

Dave

> > (If you repost, there are a few 'channel' variables that could probably
> > be 'unsigned' rather than int)
> 
> That I can do for sure.
> 
> > 
> > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> Thanks,
> 
> -- 
> Peter Xu
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


