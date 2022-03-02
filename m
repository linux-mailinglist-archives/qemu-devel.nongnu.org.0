Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 526704C9AB2
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 02:48:33 +0100 (CET)
Received: from localhost ([::1]:35396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPE6R-0004xl-R3
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 20:48:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nPE52-000427-Ak
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 20:47:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nPE4x-0000FA-SA
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 20:47:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646185618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F+/vEN8gjUeAm36MKb8CpvV65bsFQSakXvSKBHQTLtU=;
 b=FeO7X0EqhSGyDyeBQ1f+lUOO51xY025jM5mG4orzg4rY7B6iOS3BYevNpd9NON0/KkGCXe
 N/EYY/OVLHStsLAfEKQ+ykeZhA1Fv0HMrFmlVzKoLet8Iv6FAZEozeTigpRAo4COARmI9v
 yhiZCRM8M+W83/sqENyDpyrofNbjsFQ=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-3fsL_IT4MjufmXlQZ2noRg-1; Tue, 01 Mar 2022 20:46:57 -0500
X-MC-Unique: 3fsL_IT4MjufmXlQZ2noRg-1
Received: by mail-pl1-f199.google.com with SMTP id
 x18-20020a170902b41200b0014fc2665bddso230228plr.0
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 17:46:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=F+/vEN8gjUeAm36MKb8CpvV65bsFQSakXvSKBHQTLtU=;
 b=CeytYrMr8l2Rmh7+YSpXq7GBGDmZ3IsDBaS2RxDhdWj2WWx7C3hC5TITAUQiHGS6A+
 G+/siOUmKntj4tdVVNVdnJe9XSkmTmLd1yizcvMXXwVRG2D4yqPoA8eCBN8uFeG1MTfi
 lIj0fzSi84sYk+ArbMoNNHet9p7P/6I9/TCvAIF/qaZ2fGTBmTsxo/CJ3EC05u/jVdML
 axgl+mtyX7vHfNAQSwtqj4HLezKBNUy5YWHPxDm/H1j6+ZWip2SbU74+mBMSgCcCqBme
 oE3i/sAEejNdc6ns42Eh05Tmo7J7gWRWASyEik37Lw9x3XZHTnRavvNJQY56oHs8bZQt
 f6CA==
X-Gm-Message-State: AOAM530ec7d4byPomrjZiVXjpAYZSLTacSnbnDvP1bAMikxZ0Q3yD941
 0hVwAKhN6E0L3F9uNCfz/ZEeOk8wafh8yNKr4eFSLEte0Vx163olV516nmZdQs1KXHj1vw9iHF4
 VHV2n74RplNrFpqQ=
X-Received: by 2002:a17:902:f607:b0:14c:d9cf:a463 with SMTP id
 n7-20020a170902f60700b0014cd9cfa463mr28822565plg.32.1646185616098; 
 Tue, 01 Mar 2022 17:46:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzF7ZIGARbfHZNd8TuZTZBnSCj3hl2E2WnZtYvV26onw1Pi32uGpwTbOVS52hmhq4aNoh154Q==
X-Received: by 2002:a17:902:f607:b0:14c:d9cf:a463 with SMTP id
 n7-20020a170902f60700b0014cd9cfa463mr28822534plg.32.1646185615593; 
 Tue, 01 Mar 2022 17:46:55 -0800 (PST)
Received: from xz-m1.local ([94.177.118.101]) by smtp.gmail.com with ESMTPSA id
 a11-20020a056a001d0b00b004f4057fafe2sm9244387pfx.94.2022.03.01.17.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 17:46:54 -0800 (PST)
Date: Wed, 2 Mar 2022 09:46:49 +0800
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v2 00/25] migration: Postcopy Preemption
Message-ID: <Yh7MiZQsEhJUbVis@xz-m1.local>
References: <20220301083925.33483-1-peterx@redhat.com>
 <Yh3mo5VFQ3gT1Gd7@redhat.com> <Yh3yzbmOqAVV9iM9@xz-m1.local>
 <Yh30/nPtWyvqp8xo@redhat.com> <Yh37hLn5Dlffm13P@xz-m1.local>
 <Yh5O/eq4If4MYpTq@work-vm>
MIME-Version: 1.0
In-Reply-To: <Yh5O/eq4If4MYpTq@work-vm>
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 01, 2022 at 04:51:09PM +0000, Dr. David Alan Gilbert wrote:
> Hmm, I think it's worth getting TLS working before putting the full
> series in, because it might impact the way you wire the channels up -
> it's going to take some care; but lets see which parts we can/should
> take.

IMHO it should be mostly transparent to the whole user interface and the
rest of the features, thanks to the well-abstracted qio channel layer, so
most code does not really need to worry about what kind of channel it is.
But sure, we don't need to rush.  Thanks,

-- 
Peter Xu


