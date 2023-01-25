Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD8967B511
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 15:47:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKh2f-0000CX-3k; Wed, 25 Jan 2023 09:46:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pKh2Y-0000C9-AC
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 09:46:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pKh2T-0002YL-0v
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 09:46:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674657967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QyApVNjHT7kdB0u9f+Nknmn7OSzEqumLcqYvF2Od314=;
 b=V0KhgUWo8Achy1uFbFzaz8IMmbFNKKboCw6aTX4Qc9qVJ7kvHqD1QuH74FA1hyhY9nBcdz
 2Yetqp+efm6bZs6TGxOn7JNFCB08yeIfWJjdPA58m6ZU0vKc28IIsrRO1bQUgnZCHCozYQ
 IQdxSNyPbdUkfzR8Mf2qlx98lYc2nwc=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-256-opqDcMAENmq3CoSWRanWzw-1; Wed, 25 Jan 2023 09:46:06 -0500
X-MC-Unique: opqDcMAENmq3CoSWRanWzw-1
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-5062f3a2977so74394127b3.21
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 06:46:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QyApVNjHT7kdB0u9f+Nknmn7OSzEqumLcqYvF2Od314=;
 b=AE74OBgjJ66FdOm2v/qZ6mTNUuqwfJTDFUUHQqCg7OxnCVnGod5cBnh6FC3ZyobPFE
 a4VnSc6JiMiScAk2jq4Wff25G3jCsV42u91kx3LXTMb6KenoroTwVJv9NOZxyzX0AWQY
 PFi1ttbwvnlCRDXe//yx7NQhO/WITy4K5t/ChHVGAhXgr1SvJGxILlOyczZo+lGA7soq
 GxbaLUs7gsA0R2/oMeRDG5orzWHi1bnNR/CFry9Ii/sk5L406ZGXl0w99nYMF++jLjod
 RvVvtz9PB3hP5RxLI99bi990w2+ifC28UtZh5Lu4ufOLt5FVaZL6qeQRHEHq4MpnuugZ
 bbCQ==
X-Gm-Message-State: AFqh2koaKaKSjGG2EC2Nqig4ju5BiAz6NG/AzDKGEeNboeHkqbdA38Wh
 FcyjgF2ascGtHtHLZHQtOF0Per82hw3v/Vc3YHHbcJOJci5XtYyL7tUHysDG6UeRvV1GakYCcXk
 jRCAb8DcX4oGG5CI=
X-Received: by 2002:a25:9f06:0:b0:7b1:5cbe:98e5 with SMTP id
 n6-20020a259f06000000b007b15cbe98e5mr21759015ybq.34.1674657965573; 
 Wed, 25 Jan 2023 06:46:05 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsWPW71hC3mOncih9BpzWnRngaDJbOI8P29eT3V1EWi5WvPJN5bQjyB2tsPfQKMRCRUKeqYLg==
X-Received: by 2002:a25:9f06:0:b0:7b1:5cbe:98e5 with SMTP id
 n6-20020a259f06000000b007b15cbe98e5mr21758999ybq.34.1674657965281; 
 Wed, 25 Jan 2023 06:46:05 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 b5-20020a378005000000b00704a2a40cf2sm3572360qkd.38.2023.01.25.06.46.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 06:46:04 -0800 (PST)
Date: Wed, 25 Jan 2023 09:46:03 -0500
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 James Houghton <jthoughton@google.com>, Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH RFC 10/21] ramblock: Add ramblock_file_map()
Message-ID: <Y9FAq7mKJYmV4KOL@x1n>
References: <20230117220914.2062125-1-peterx@redhat.com>
 <20230117220914.2062125-11-peterx@redhat.com>
 <Y8+tuN1t9EWMIuzk@work-vm> <Y9BD1jcBYzPDR9VX@x1n>
 <Y9D1SMakob6GT07e@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y9D1SMakob6GT07e@work-vm>
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

On Wed, Jan 25, 2023 at 09:24:24AM +0000, Dr. David Alan Gilbert wrote:
> > > >  static void *file_ram_alloc(RAMBlock *block,
> > > >                              int fd,
> > > >                              bool truncate,
> > > >                              off_t offset,
> > > >                              Error **errp)
> > > >  {
> > > > -    uint32_t qemu_map_flags;
> > > >      void *area;
> > > >  
> > > >      /* Remember the offset just in case we'll need to map the range again */
> > > 
> > > Note that this comment is now wrong; you need to always set that for the
> > > map call.
> > 
> > This line is added in patch 7.  After this patch, a ramblock should always
> > be mapped with ramblock_file_map(), so it keeps being true?
> 
> With ramblock_file_map() it's not a 'just in case' any more though is
> it?  This value always goes through the block-> now?

Ah yes.. Since the comment is not extremely informative, instead of
changing it, I can drop it in the previous patch when introduced.

-- 
Peter Xu


