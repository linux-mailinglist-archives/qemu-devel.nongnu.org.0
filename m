Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1848542EFF3
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 13:51:31 +0200 (CEST)
Received: from localhost ([::1]:45788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbLkG-0005MJ-RL
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 07:51:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mbLho-0004VE-PX
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 07:48:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mbLhl-0005w7-H1
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 07:48:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634298532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2FPPycvpiPrH8jClJ2MYGjCxRtIwW8q8ZjP6qQ+aOzk=;
 b=CCnRl2zwSwTyg39ZLJRRARd2rsdhuFR5feM9SdFEqwnz4mqjr6xJJIXpwAtwZlBNeajUBb
 CHQyTMrI85mMVPuLrh2HNMRWw9UqT4casnHrxU04XNpToy0KbA1VJ3y1+3oXpLvZthJihF
 CRLP1VDMNdja6xxwciOtcHzC7VBhEW0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-8Mrf1buBO_-rTEH8vu5ZKw-1; Fri, 15 Oct 2021 07:48:49 -0400
X-MC-Unique: 8Mrf1buBO_-rTEH8vu5ZKw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1BD5E1006AA2;
 Fri, 15 Oct 2021 11:48:48 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 160C41002D67;
 Fri, 15 Oct 2021 11:48:46 +0000 (UTC)
Date: Fri, 15 Oct 2021 13:48:45 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Nada Lachtar <nlachtar@umich.edu>
Subject: Re: Storage controller access to data
Message-ID: <YWlqnb+7SGBieild@redhat.com>
References: <MN2PR14MB40158028639DACBC17BFFD4DFDB69@MN2PR14MB4015.namprd14.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <MN2PR14MB40158028639DACBC17BFFD4DFDB69@MN2PR14MB4015.namprd14.prod.outlook.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 12.10.2021 um 19:52 hat Nada Lachtar geschrieben:
> I’m working on a project that requires me to read the data being sent
> to storage and it to a file for analysis. To be more specific, I’m
> trying to analyze the data in the phase of being written to the
> storage disk, thus, I’m trying to read the data when it’s going
> through a storage controller on x86 device. I’ve been looking into the
> implementation of different storage controllers, but I need help to
> pinpoint where I can read such data.

Did you consider getting the data not from the frontend (i.e. the
implementation of the storage controller emulation), but from the
backend (i.e. the -blockdev configuration)?

For example, there is the blklogwrites block driver that creates a log
file that contains all the write requests that were made. Maybe this
provides already what you need.

If you need more flexibility than this, you could use an NBD connection
as the backend and have a custom NBD server that can process the data in
whatever way you need.

Kevin


