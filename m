Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BF9319898
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 04:08:01 +0100 (CET)
Received: from localhost ([::1]:55140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAOoK-000402-7J
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 22:08:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lAOmu-0003W4-87
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 22:06:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lAOmr-00054m-TT
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 22:06:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613099188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cv8OOUX/cHdl3SlyZ7qqT9a6mdVWa1hBF27lpPE4bwY=;
 b=CL9uZQFbjozpub52aXHsz8fvzZ2/woKrncTGeZ51ehJ+qHWHB9ntlW25+B0Mqy3k51Oh4Y
 SMQtmAHqm5EAut780z2rdcGxRUb7/ZEQ38RHWOTAqQkD1RnZeRLrCoxwSl7cHMGLN0CfzC
 oRwmpeTc4z6E26Ho4/SOcLPhzZQBkT8=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-LjgZWOglOBiVpvCJCjHw9Q-1; Thu, 11 Feb 2021 22:06:24 -0500
X-MC-Unique: LjgZWOglOBiVpvCJCjHw9Q-1
Received: by mail-qk1-f198.google.com with SMTP id f16so6282129qke.0
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 19:06:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=cv8OOUX/cHdl3SlyZ7qqT9a6mdVWa1hBF27lpPE4bwY=;
 b=LfnRwqL2OvOjOaeRp5XrtPKkMHW7WRfNEsIm60D7SEWrVirUuGa165en2AIXkpBJYR
 Jc8Bk66XvAHIEqfrLDdwE3iTNdKTH326PL6YC156Krmo0wuF5vOCQJA1UerV6XHGVz4N
 wid2QNTE5yrALOOWV1YQLDzNTCpXoCF6qEAcmYKQSpWSoqeU4JLPsG9lBq5bZvs4J6to
 M0M5HLtsKvVLFv0O410E7O2b9BoTQzujaUmigaezqmdBKdFIxFSh3+sPMRTrIZKY6Hz0
 M13BwhJnA+NvsnSMDDEUew4RsScg06TM6w5dV3B34JgeK1xE28hoRho3893ULB4/3Lic
 K53w==
X-Gm-Message-State: AOAM531HVc0sGegmwh6T9omoWhdQBe2tEg4MzDoQvZg4xhnEri7aBMX3
 Q/kPFfGmGuDwXSeiZpxWzrqn2th5Nq3dB509CVZc527YeFsOvuTcG8LJgGiid+ObJP6F+1BwX1O
 fRyjp8/b+ulqvuWw=
X-Received: by 2002:ad4:448e:: with SMTP id m14mr760540qvt.35.1613099184090;
 Thu, 11 Feb 2021 19:06:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyh8irOL7MIqfIp/RoNRpMFOONkqDoYBVwLKjrYIccm5fC5aLXq74qltq9DjiIsKowouCa3YA==
X-Received: by 2002:ad4:448e:: with SMTP id m14mr760525qvt.35.1613099183855;
 Thu, 11 Feb 2021 19:06:23 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-20-174-93-89-182.dsl.bell.ca. [174.93.89.182])
 by smtp.gmail.com with ESMTPSA id o17sm4980875qtl.47.2021.02.11.19.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 19:06:23 -0800 (PST)
Date: Thu, 11 Feb 2021 22:06:21 -0500
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v13 0/5] UFFD write-tracking migration/snapshots
Message-ID: <20210212030621.GF157159@xz-x1>
References: <20210211210549.GE157159@xz-x1>
 <4E588B57-AAC8-40DD-9260-541836074DB3@redhat.com>
MIME-Version: 1.0
In-Reply-To: <4E588B57-AAC8-40DD-9260-541836074DB3@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Alexander Duyck <alexander.duyck@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Den Lunev <den@openvz.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 11, 2021 at 10:09:58PM +0100, David Hildenbrand wrote:
> The issue is when the discard happened before starting the snapshot. Write-protection won‘t work and the zeroed content won‘t be retained in the snapshot.

I see what you mean now, and iiuc it will only be a problem if init_on_free=1.
I think CONFIG_INIT_ON_FREE_DEFAULT_ON should be off for most distros, so the
impact should be small, I think.  I thought about it, but indeed I didn't see a
good way to fix this if without fixing the zero page copy for live snapshot.

-- 
Peter Xu


