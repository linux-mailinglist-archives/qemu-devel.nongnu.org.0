Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 734CE4C9DF1
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 07:47:38 +0100 (CET)
Received: from localhost ([::1]:60734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPIlt-0001lA-0T
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 01:47:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nPIgS-0000CN-Rx
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 01:42:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nPIgN-0003Sp-75
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 01:41:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646203312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z8G8MXiMay7DWaXqLWAgR6wNX5TZWmwnq4VAgQ8Fc6Y=;
 b=OnRF1mVWljV9nyAPmjbBLl/T+hCy3PLnNg318VnINlLXaT+L27nsJWL9z8YmDHsgx07nOz
 n8RSAzLMlfAnh3H6zM+XCWotjGQ/C1lp3i9+VHHueACh4BnBMFWqce3PMHhBglSKyeN0pg
 dJQ3B8daGHloyymz1p/LkubEWetf14s=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-KXZiRztKNa-1gX0j-KlSaA-1; Wed, 02 Mar 2022 01:41:51 -0500
X-MC-Unique: KXZiRztKNa-1gX0j-KlSaA-1
Received: by mail-pf1-f198.google.com with SMTP id
 x19-20020aa79573000000b004e193fae5a1so699010pfq.19
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 22:41:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=z8G8MXiMay7DWaXqLWAgR6wNX5TZWmwnq4VAgQ8Fc6Y=;
 b=XVjYcXTOYD1rvQApcYs7L9Pw+AZvL++qIq+P9r7h71pPPqu62aVQKxWn39f33/b3U8
 zyYeN7XGorjZry01Sm6ogo8WZKa+UPZQJScqyh5VJZsFyGxbmHMsBQj/18s9wsd8JELK
 ffo2h3GS+02a00REsKuNvcMPrIvsAkPnu6O1EZXNZF1F3G/lXUeyK+FaCJEb2GSh5M2x
 W3pv6sAetQitXmPUvDusBDvDAjm/vsewacFatmGIiRvcu4THCPptKNHJ4EfmOL/vKqeB
 hFTbFERQlUjuIBWasW/yk5+LLqtpRVtdroL24OxZD0N7e/5y/OR4LsgicMmDxPZqltRQ
 QXvw==
X-Gm-Message-State: AOAM530nwuQZKgS5okatvWKGXuvTfRXKLwoNgPW8yzghFdBp2xb+U9sN
 nCzAvEr4HDixqqUf8RTqUkGvu2Eigc3bbwOyIW6ZKznqMB07c0bKc1aAGxwlyiTaPmQXP+5GVyE
 4CeL2IXsIUp2n8qE=
X-Received: by 2002:a17:903:1210:b0:14f:973e:188d with SMTP id
 l16-20020a170903121000b0014f973e188dmr4497549plh.61.1646203310219; 
 Tue, 01 Mar 2022 22:41:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxFmOH/hn6H9NwgBtkx1huen6Pl5fhTexN1JmbawrNPvQY0PbaMxfNKyeYjaRISVOYDpM89UQ==
X-Received: by 2002:a17:903:1210:b0:14f:973e:188d with SMTP id
 l16-20020a170903121000b0014f973e188dmr4497538plh.61.1646203309921; 
 Tue, 01 Mar 2022 22:41:49 -0800 (PST)
Received: from xz-m1.local ([94.177.118.101]) by smtp.gmail.com with ESMTPSA id
 j20-20020a056a00235400b004e192221ec2sm20091006pfj.14.2022.03.01.22.41.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 22:41:49 -0800 (PST)
Date: Wed, 2 Mar 2022 14:41:44 +0800
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 20/20] tests: Add postcopy preempt test
Message-ID: <Yh8RqIjmf3FIjePB@xz-m1.local>
References: <20220216062809.57179-1-peterx@redhat.com>
 <20220216062809.57179-21-peterx@redhat.com>
 <YhTcb9o1d1gCQ3rm@work-vm> <YhXnQLY4/b3V2+VL@xz-m1.local>
 <Yh2wdswUis7TSspK@xz-m1.local> <Yh5RHyQ9Oy8zZki1@work-vm>
MIME-Version: 1.0
In-Reply-To: <Yh5RHyQ9Oy8zZki1@work-vm>
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

On Tue, Mar 01, 2022 at 05:00:15PM +0000, Dr. David Alan Gilbert wrote:
> > That's tricky, and we could have done something better.. E.g., we could
> > pass in the MigrateStart** into test_migrate_start() so it can clear it
> > when free, that's not silent use-after-free but crashing, which is better
> > in this case.
> > 
> > I feel lucky I tried..
> 
> It could at least do with a comment on test_migrate_start?

I've added one more patch there at the end of v2 for this:

[PATCH v2 25/25] tests: Pass in MigrateStart** into test_migrate_start()

Although it's at the end of the series, it can still be cleanly applied to
current master branch, too.

Thanks,

-- 
Peter Xu


