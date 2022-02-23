Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C524C0CFD
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 08:05:41 +0100 (CET)
Received: from localhost ([::1]:33634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMliW-000336-63
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 02:05:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nMleU-0000oI-DA
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 02:01:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nMleO-0007Eu-Cg
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 02:01:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645599677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5P5SoNMMDjbL7SLoyh8xPT1owiOa+AXeQqoiqKzr1e0=;
 b=BEyuRbxDvKAIjYxLCNDf8d/IBsVA9gcOfIq5zOmKPPX0/+g/X1rijZBPoeeWolT+9hzO3X
 PQcCTfYdoUgPlLlPEi7nmWfYj/rC9+qGOre8qLfcsBKq/iMKq8LM4RFnTT7fM5SRLRhaUl
 cklEUtP1St8HxB/l8iFaBf77Jb77IZw=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-500-Fn7pg9EVPpyVVZw0i7cHxA-1; Wed, 23 Feb 2022 02:01:14 -0500
X-MC-Unique: Fn7pg9EVPpyVVZw0i7cHxA-1
Received: by mail-pg1-f197.google.com with SMTP id
 r8-20020a638f48000000b0036c6a881088so12739976pgn.2
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 23:01:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5P5SoNMMDjbL7SLoyh8xPT1owiOa+AXeQqoiqKzr1e0=;
 b=2BGgCN6QKCtn+YCKfcOIAlTZycAPxx3OgCWuy/OqE4V9Z5QL4HfjXl7SNVk5j2q4y1
 L1eip+4zfszf3fgigtrUmOGxEWI0HZy+ij+RMYtJiQijTX3hvBVH+lv2fGbjDIxco//G
 ZY7a2GJPDl7apKY6fkQu4JQK6IbhFgPIxPUzXjoW9rASpEZ1U2z5ZZ7IWOg+syKZT/HK
 AxAGBIXGkNEuuAY6xxGkPLiBp/4o2V1VI28bleDeLmd2GI8b7hWZT2KAmbZGO2fVMlNE
 ovjrCJanp1ZGO1XXuw1bK8vXik/1E5x7ZVgtRKbmrNtt1QDFXlu2gsG2DvG44kX9ogBp
 Uv8g==
X-Gm-Message-State: AOAM530HsJsyf0k6RTkS1Jo18BTri59hDwP1kPG+fNFTdkkJgKJbvhCh
 B8dSvOPIhEONeflftYHlGP5udGyBlTYJS9WWVQ6gBYF8q0g37S1n4bgKru5Cb2iME8hI7PBGE6B
 T2BcYLT5xKuofYCM=
X-Received: by 2002:a17:903:110c:b0:14d:8859:5c8 with SMTP id
 n12-20020a170903110c00b0014d885905c8mr26852737plh.156.1645599673336; 
 Tue, 22 Feb 2022 23:01:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy7o6mG6lwOB4CvykVf7O84X5rZBa10r/w8ukBXup8dkAXFWa7EVxQrZyrEPiQX1rc8Gvxrgw==
X-Received: by 2002:a17:903:110c:b0:14d:8859:5c8 with SMTP id
 n12-20020a170903110c00b0014d885905c8mr26852716plh.156.1645599673025; 
 Tue, 22 Feb 2022 23:01:13 -0800 (PST)
Received: from xz-m1.local ([94.177.118.100])
 by smtp.gmail.com with ESMTPSA id f7sm21306700pfc.0.2022.02.22.23.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 23:01:12 -0800 (PST)
Date: Wed, 23 Feb 2022 15:01:07 +0800
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 18/20] migration: Postcopy preemption enablement
Message-ID: <YhXbsyXAXhNLRVsq@xz-m1.local>
References: <20220216062809.57179-1-peterx@redhat.com>
 <20220216062809.57179-19-peterx@redhat.com>
 <YhTAZzuAEyEHGjea@work-vm>
MIME-Version: 1.0
In-Reply-To: <YhTAZzuAEyEHGjea@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

On Tue, Feb 22, 2022 at 10:52:23AM +0000, Dr. David Alan Gilbert wrote:
> This does get a bit complicated, which worries me a bit; the code here
> is already quite complicated.

Right, it's the way I chose in this patchset on solving this problem.  Not
sure whether there's any better and easier way.

For example, we could have used a new thread to send requested pages, and
synchronize it with the main thread.  But that'll need other kind of
complexity, and I can't quickly tell whether that'll be better.

For this single patch, more than half of the complexity comes from the
ability to interrupt sending one huge page half-way.  It's a bit of a pity
that, that part will be noop ultimately when with doublemap.

However I kept those only because we don't know when doublemap will be
ready, not to say, landing.  Meanwhile we can't assume all kernels will
have doublemap even in the future.

> (If you repost, there are a few 'channel' variables that could probably
> be 'unsigned' rather than int)

That I can do for sure.

> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Thanks,

-- 
Peter Xu


