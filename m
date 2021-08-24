Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0E93F61D2
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 17:39:03 +0200 (CEST)
Received: from localhost ([::1]:53274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIYVy-0002vE-Vb
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 11:39:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mIYV0-00027v-Vn
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 11:38:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mIYUz-0005gg-JI
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 11:38:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629819480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6JfRZp7+4iDWqXYzu/J3+zBKraFtOmvMRPWPk+mlZOw=;
 b=MwLipXQbdvZqD3fYekmiaLprkCOXfiAaCUwmEMxfgP3GKs2Hfl3Dz1w1oCHRpzp1U8w1dC
 O6Xxu+Vs3S//6tXw+qJiP+4VlzjX8MndB9D6rPny8pVz2tWLOIQG5XkOWZM9NHv+68OKBM
 UZP1RbqKvKkmNuF5srmjLSjxj43u+lI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-S0L-MH36MjSPOnh7D7vXPw-1; Tue, 24 Aug 2021 11:37:57 -0400
X-MC-Unique: S0L-MH36MjSPOnh7D7vXPw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A1C58799ED;
 Tue, 24 Aug 2021 15:37:56 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.114])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C8835D9C6;
 Tue, 24 Aug 2021 15:37:55 +0000 (UTC)
Date: Tue, 24 Aug 2021 17:37:53 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Christopher Pereira <kripper@imatronix.cl>
Subject: Re: qcow2 perfomance: read-only IO on the guest generates high write
 IO on the host
Message-ID: <YSUSNCR6kZVnCBKF@redhat.com>
References: <55980bc8-97ad-77a4-1bb7-a086f2712ea1@imatronix.cl>
MIME-Version: 1.0
In-Reply-To: <55980bc8-97ad-77a4-1bb7-a086f2712ea1@imatronix.cl>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[ Cc: qemu-block ]

Am 11.08.2021 um 13:36 hat Christopher Pereira geschrieben:
> Hi,
> 
> I'm reading a directory with 5.000.000 files (2,4 GB) inside a guest using
> "find | grep -c".
> 
> On the host I saw high write IO (40 MB/s !) during over 1 hour using
> virt-top.
> 
> I later repeated the read-only operation inside the guest and no additional
> data was written on the host. The operation took only some seconds.
> 
> I believe QEMU was creating some kind of cache or metadata map the first
> time I accessed the inodes.

No, at least in theory, QEMU shouldn't allocate anything when you're
just reading.

Are you sure that this isn't activity coming from your guest OS?

> But I wonder why the cache or metadata map wasn't available the first time
> and why QEMU had to recreate it?
> 
> The VM has "compressed base <- snap 1" and base was converted without
> prealloc.
> 
> Is it because we created the base using convert without metadata prealloc
> and so the metadata map got lost?
> 
> I will do some experiments soon using convert + metadata prealloc and
> probably find out myself, but I will happy to read your comments and gain
> some additional insights.
> If it the problem persists, I would try again without compression.

What were the results of your experiments? Is the behaviour related to
any of these options?

> Additional info:
> 
>  * Guest fs is xfs.
>  * (I believe the snapshot didn't significantly increase in size, but I
>    would need to double check)
>  * This is a production host with old QEMU emulator version 2.3.0
>    (qemu-kvm-ev-2.3.0-31.el7_2.10.1)

Discussing the most recent version is generally easier, but the expected
behaviour has always been the same, so it probably doesn't matter much
in this case.

Kevin


