Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 696422DFD8F
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 16:28:57 +0100 (CET)
Received: from localhost ([::1]:38228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krN7I-0002oh-Fz
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 10:28:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1krMwW-0008Ou-6n
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 10:17:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1krMwQ-0001U4-Og
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 10:17:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608563856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O/X7eD4L9r4wf37CaXSlFG0H63KmGZb6YVR8cH5yGTM=;
 b=WknZ1nndafkpz18env0MT9esVGq9TFL7FKlnVk7lD2jXqw2EB9aovKTrqQZ3WEVdXOnf9k
 jZ/qGVDHWGiX7W53G+ACZ6dKxRMDV3okBaMxSpHq6U8HeQYy8xHfOnI3FRG3leD5IRPLZq
 OsDgJ6xfPWE5N9k4JV0PY6YC0cd/oto=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-d5m9J9UUOWCSLvwwgnpz7g-1; Mon, 21 Dec 2020 10:17:33 -0500
X-MC-Unique: d5m9J9UUOWCSLvwwgnpz7g-1
Received: by mail-ot1-f72.google.com with SMTP id f11so5178215otp.13
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 07:17:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=O/X7eD4L9r4wf37CaXSlFG0H63KmGZb6YVR8cH5yGTM=;
 b=GlHeY/EPjcvL5bSJH6Hc8v3qvpAVMu8i/oJI3OuIuikQAlzP16vVd2WDTx04U7Wqof
 qr9x7HS0/lqoOvRg1EQlEF0KXc6YmqBfao5v9/WEPG0LvqLu0yrr8sk1+YmlOsLwmViH
 Wqs1Vy6B9VO0tbzyztjnXU+yi5osxzZVYz4rUtOwvFCXycpnkGjOc5RFVcZd3BpATISg
 xbm8/EnCA4+LsZ/DMwVkZx2YbJoZRKLKVg9qkMnC7s9ZYMPXLqK7y0Nz0uxENDrQhEpf
 wQ2asL6Qo8Dv7sC2LzsVLsfAdOK+XzObG68nJtOcCdj3jZlZ5rRB1IvbbFtNeEm8jLw7
 Nncg==
X-Gm-Message-State: AOAM530A7/Vb8oTBnMXgWXcH/5SSQOYHeQDiKpcQOOAxt21aqVH3rB14
 KQrwcAtjsIWtl/IvNAPmpj5B4ob6MgNMW0Hyz9kIFEOtdXVptyLCLYioOkdfNW2wB/MG+jERUIg
 VobsJNrKqUKSqVWI=
X-Received: by 2002:aca:5653:: with SMTP id k80mr11554694oib.0.1608563852617; 
 Mon, 21 Dec 2020 07:17:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwtz/5R9Wq/FHRgtuUXbX5KsEfAMqjk3OfW5M37KqOrcYe1JR/DsW3pImPkrzuaGVcNoOzocw==
X-Received: by 2002:aca:5653:: with SMTP id k80mr11554673oib.0.1608563852358; 
 Mon, 21 Dec 2020 07:17:32 -0800 (PST)
Received: from xz-x1 ([142.126.83.202])
 by smtp.gmail.com with ESMTPSA id e12sm3889184otp.25.2020.12.21.07.17.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 07:17:31 -0800 (PST)
Date: Mon, 21 Dec 2020 10:17:25 -0500
From: Peter Xu <peterx@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v10 0/5] UFFD write-tracking migration/snapshots
Message-ID: <20201221151725.GA6640@xz-x1>
References: <20201217165712.369061-1-andrey.gruzdev@virtuozzo.com>
 <594af923-f960-5e8c-ec14-ef43d8ede8c9@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <594af923-f960-5e8c-ec14-ef43d8ede8c9@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 21, 2020 at 03:44:38PM +0300, Andrey Gruzdev wrote:
> Hi Peter,
> 
> I have a question about the Wiki page you've created https://wiki.qemu.org/ToDo/LiveMigration#Features.
> May we also add to that page/have access rights?

Yes.  I'll send you another email soon for that.  Thanks,

-- 
Peter Xu


