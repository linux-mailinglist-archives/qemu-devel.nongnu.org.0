Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E387316CEB
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 18:38:33 +0100 (CET)
Received: from localhost ([::1]:34110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9tRg-0000nJ-JC
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 12:38:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l9tJS-0000kg-Ue
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 12:30:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l9tJQ-00057F-3d
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 12:30:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612978199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ULBZR55Wl2mJM7cyKGC6J4K8Y2GJJvCJXNgD01LCsLM=;
 b=gr34kHnaemke6hFMjzXZptw8a95NhtRhFt6NVk9zC+ACQ0AWaT633bJAtwIyPU7IGbfzc9
 0+vbHcevopUI+z4aU+8dPt8+F6mgEzJMg6ufrSnxs9E4ndH0uLkjmD+R3GLJmMJc9QJ+41
 iIndby8gEx08hat/pYjZbvFbZYywa6I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-5EHoZU3aOw-M3thB5mSCXA-1; Wed, 10 Feb 2021 12:29:57 -0500
X-MC-Unique: 5EHoZU3aOw-M3thB5mSCXA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12D9F1020C20;
 Wed, 10 Feb 2021 17:29:56 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-33.ams2.redhat.com [10.36.115.33])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 11D2D19C44;
 Wed, 10 Feb 2021 17:29:54 +0000 (UTC)
Date: Wed, 10 Feb 2021 18:29:47 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Masayoshi Mizuma <msys.mizuma@gmail.com>
Subject: Re: [PATCH 1/2] file-posix: Use OFD lock only if the filesystem
 supports the lock
Message-ID: <20210210172947.GK5144@merkur.fritz.box>
References: <20201106040102.13892-1-msys.mizuma@gmail.com>
 <20201118154247.GB11988@merkur.fritz.box>
 <20201118191036.yk4rju2hk4vpkhfl@gabell>
 <20201118194837.b54rp2qpbvuelosx@gabell>
 <20201119104442.GB4530@merkur.fritz.box>
 <20201119235650.62vcbycc5fc4oxec@gabell>
 <20201120154228.GC5599@merkur.fritz.box>
 <20210210164314.4lgw6ovozchsrk6i@gabell>
MIME-Version: 1.0
In-Reply-To: <20210210164314.4lgw6ovozchsrk6i@gabell>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
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
Cc: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Masa,

Am 10.02.2021 um 17:43 hat Masayoshi Mizuma geschrieben:
> Hi Kevin,
> 
> The filesystem team found a locking issue in the filesystem.
> Your comments were very helpful! I really appriciate it.
> 
> Thanks,
> Masa

I'm glad that I could help you to find the root cause. Thanks for
reporting back!

Kevin


