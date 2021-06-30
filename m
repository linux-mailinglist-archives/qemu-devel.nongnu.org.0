Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AADDE3B80FC
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 12:53:41 +0200 (CEST)
Received: from localhost ([::1]:37642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyXqe-0006fA-PD
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 06:53:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lyXpt-0005pW-Ed
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 06:52:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lyXpq-0006Yd-Bz
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 06:52:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625050368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9yBrNUrO6NoASCzKLiXQcF5F48GhwMl5BxxJVh258dA=;
 b=Kcby2D0pa8v9riLWWv+4OAVHymEMvXRICoZXtl/rYVbuh3fU6UIfJsttLcKUAI60dUcbPr
 Jhsy++p4Bg6BLNk+0kWCafWJP17rO6YI976ZlR6+8HisLRNp1b8XuLc7FoMD/qDmu+SEaS
 I7J0nDAccm2/2ZGzjUMaIgCaBZSEWmc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-bcRvBhJ2Pl6ag1F2emiDOA-1; Wed, 30 Jun 2021 06:52:47 -0400
X-MC-Unique: bcRvBhJ2Pl6ag1F2emiDOA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33B82801F97;
 Wed, 30 Jun 2021 10:52:46 +0000 (UTC)
Received: from redhat.com (ovpn-114-114.ams2.redhat.com [10.36.114.114])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BE6BE60854;
 Wed, 30 Jun 2021 10:52:44 +0000 (UTC)
Date: Wed, 30 Jun 2021 12:52:43 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH] block/ssh: add support for sha256 host key fingerprints
Message-ID: <YNxM+/c1Q3iUKZVC@redhat.com>
References: <20210622115156.138458-1-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210622115156.138458-1-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 22.06.2021 um 13:51 hat Daniel P. Berrangé geschrieben:
> Currently the SSH block driver supports MD5 and SHA1 for host key
> fingerprints. This is a cryptographically sensitive operation and
> so these hash algorithms are inadequate by modern standards. This
> adds support for SHA256 which has been supported in libssh since
> the 0.8.1 release.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Thanks, applied to the block branch.

> Note I can't actually get iotest '207' to fully pass. It always
> complains that it can't validate the "known_hosts" file
> 
>   qemu-img: Could not open 'TEST_IMG': no host key was found in known_hosts
> 
> it seems to rely on some specific developer host setup that my
> laptop doesn't satisfy. It would be useful if any pre-requisite
> could be documented in the iotest.
> 
> At least the sha256 verification step I added to 207 does pass
> though.

It passes for me when I make sure to add 127.0.0.1 to known_hosts first.
My ~/.ssh/config also has these lines, probably from a previous run,
which may or may not be necessary:

Host 127.0.0.1
    HostKeyAlgorithms ssh-rsa

Kevin


