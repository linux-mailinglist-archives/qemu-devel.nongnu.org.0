Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 893CD45092E
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 17:04:53 +0100 (CET)
Received: from localhost ([::1]:39954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmeTU-0001vm-BT
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 11:04:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mmeSF-0000ZQ-S3
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:03:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mmeSD-0000Pm-L1
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:03:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636992212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zHouYsaEr9YNAl02J0ArRA9Zr2FQAMN6eH022ace+OI=;
 b=BnVuqe3T32WByisjxOeFhbimWpGR2ANIAFIHmJo4U45/iwBOjisZ3sW+2V2FjslmEBwwSl
 74NxJNfS3Wpfx4QsAVBf1eZj43MC3bYDEW44iCsP9B+dccBAtawWILTRKgKGErsyk/foJq
 5PaIt1QJECwM5S5kRnYuuh++QD4Z/xI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-ShjFvfcVOAi51E6Y52_fUg-1; Mon, 15 Nov 2021 11:03:31 -0500
X-MC-Unique: ShjFvfcVOAi51E6Y52_fUg-1
Received: by mail-wm1-f69.google.com with SMTP id
 145-20020a1c0197000000b0032efc3eb9bcso9850619wmb.0
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 08:03:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zHouYsaEr9YNAl02J0ArRA9Zr2FQAMN6eH022ace+OI=;
 b=UOxzX9FR4dAO7Cn9QJjdT/SsrZ3ggn3lPy/rbJT5/xq6KnmQWicLRtfOij2Ck6bDls
 N4OrYuvvaHCX6n92cF6zPcPU75K3pwm65qblWpQaPknjvHh1qmaQ/8GhAQNAM87nKLYn
 vOCVlynJgD5eIkfYlUvaDxmJjDpHKUObar2TuDb/W4a1kLwuJ1pfEPG230yG5VX5jDDO
 GKPkApNHJr7nNy7Mw6vyU/nNDeXvhEHO3takFJuLYCwF7QyoMoEXWjKkg30r35N2hold
 d4gEZdJYxmWovfQ5Y884lx+aDB/p2GsQESo7WPLOHeHYVC6kEdQ2MFyG0a2OvbFUGCts
 t9Vw==
X-Gm-Message-State: AOAM530m0CJJRTGx6DRUamfPb3EhQvIOT5/I8Ox4OoFeaX9DksToSNuz
 7m3IJNAAj4b5bJae3UqaBTToXmWQDbvgftlOLatyKO/vX/1byJzS2lRiTCkI0VERAdqi7C5fcf/
 00+Oly0yptZF5DOk=
X-Received: by 2002:a05:600c:4108:: with SMTP id
 j8mr43509883wmi.139.1636992210037; 
 Mon, 15 Nov 2021 08:03:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw339aAAvYfznxT3zxuMx1ghMGJdcMyOh6oWZQiQ/Pl4igNQP/7pZ22c7zYbpYZVNjikyaIWA==
X-Received: by 2002:a05:600c:4108:: with SMTP id
 j8mr43509837wmi.139.1636992209753; 
 Mon, 15 Nov 2021 08:03:29 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id v15sm11057459wro.35.2021.11.15.08.03.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Nov 2021 08:03:29 -0800 (PST)
Message-ID: <93821bd8-2ac0-a19e-7029-900e6a6d9be1@redhat.com>
Date: Mon, 15 Nov 2021 17:03:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 00/25] block layer: split block APIs in global state
 and I/O
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211025101735.2060852-1-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211025101735.2060852-1-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.278, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25.10.21 12:17, Emanuele Giuseppe Esposito wrote:
> Currently, block layer APIs like block-backend.h contain a mix of
> functions that are either running in the main loop and under the
> BQL, or are thread-safe functions and run in iothreads performing I/O.
> The functions running under BQL also take care of modifying the
> block graph, by using drain and/or aio_context_acquire/release.
> This makes it very confusing to understand where each function
> runs, and what assumptions it provided with regards to thread
> safety.
>
> We call the functions running under BQL "global state (GS) API", and
> distinguish them from the thread-safe "I/O API".
>
> The aim of this series is to split the relevant block headers in
> global state and I/O sub-headers.

Despite leaving quite some comments, the series and the split seem 
reasonable to me overall.  (This is a pretty big series, after all, so 
those “some comments” stack up against a majority of changes that seem 
OK to me. :))

One thing I noticed while reviewing is that it’s really hard to verify 
that no I/O function calls a GS function.  What would be wonderful is 
some function marker like coroutine_fn that marks GS functions (or I/O 
functions) and that we could then verify the call paths.  But AFAIU 
we’ve always wanted precisely that for coroutine_fn and still don’t have 
it, so this seems like extremely wishful thinking... :(

I think most of the issues I found can be fixed (or are even 
irrelevant), the only thing that really worries me are the two places 
that are clearly I/O paths that call permission functions: Namely first 
block_crypto_amend_options_generic_luks() (part of the luks block 
driver’s .bdrv_co_amend implementation), which calls 
bdrv_child_refresh_perms(); and second fuse_do_truncate(), which calls 
blk_set_perm().

In the first case, we need this call so that we don’t permanently hog 
the WRITE permission for the luks file, which used to be a problem, I 
believe.  We want to unshare the WRITE permission (and apparently also 
CONSISTENT_READ) during the key update, so we need some way to 
temporarily update the permissions.

I only really see four solutions for this:
(1) We somehow make the amend job run in the main context under the BQL 
and have it prevent all concurrent I/O access (seems bad)
(2) We can make the permission functions part of the I/O path (seems 
wrong and probably impossible?)
(3) We can drop the permissions update and permanently require the 
permissions that we need when updating keys (I think this might break 
existing use cases)
(4) We can acquire the BQL around the permission update call and perhaps 
that works?

I don’t know how (4) would work but it’s basically the only reasonable 
solution I can come up with.  Would this be a way to call a BQL function 
from an I/O function?

As for the second case, the same applies as above, with the differences 
that we have no jobs, so this code must always run in the block device’s 
AioContext (I think), which rules out (1); but (3) would become easier 
(i.e. require the RESIZE permission all the time), although that too 
might have an impact on existing users (don’t think so, though).  In any 
case, if we could do (4), that would solve the problem here, too.


And finally, another notable thing I noticed is that the way how 
create-related functions are handled is inconsistent.  I believe they 
should all be GS functions; qmp_blockdev_create() seems to agree with me 
on this, but we currently seem to have some bugs there.  It’s possible 
to invoke blockdev-create on a block device that’s in an I/O thread, and 
then qemu crashes.  Oops.  (The comment in qmp_blockdev_create() says 
that the block drivers’ implementations should prevent this, but 
apparently they don’t...?) In any case, that’s a pre-existing bug, of 
course, that doesn’t concern this series (other than that it suggests 
that “create” functions should be classified as GS).

Hanna


