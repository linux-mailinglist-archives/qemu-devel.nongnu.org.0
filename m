Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A37A15EFD26
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 20:39:10 +0200 (CEST)
Received: from localhost ([::1]:50214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odyRB-0000Cb-DP
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 14:39:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1odxpJ-0005ZV-Gg
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 14:00:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1odxpG-00028d-LF
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 14:00:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664474398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JN4SndAwNpI3AOCMkkdag5uJJNwj8FythFs5ftu89t0=;
 b=bjZk1gzs7VgALoNQrbsm4e32FKiHSVKRwaltnJPTI3UOYqy9ruv5OKvbEJu9vMXg97KuCZ
 CZ0+BnSMD85P4JqY4kWdmVWku1u0doblweBdoz4t7HQuu54eQrBghckqF/TAmtLi/nxlt3
 X+Kya9RyAolWbT1fTUDWasZFB46tIGM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-217-z-fCpmU9OLyonKADtjcW8Q-1; Thu, 29 Sep 2022 13:59:53 -0400
X-MC-Unique: z-fCpmU9OLyonKADtjcW8Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5FDD48027F5;
 Thu, 29 Sep 2022 17:59:53 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1347D2166B26;
 Thu, 29 Sep 2022 17:59:51 +0000 (UTC)
Date: Thu, 29 Sep 2022 19:59:50 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Keith Busch <kbusch@kernel.org>
Cc: Keith Busch <kbusch@fb.com>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Jens Axboe <axboe@kernel.dk>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Maxim Levitsky <mlevitsk@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCHv2] block: use the request length for iov alignment
Message-ID: <YzXdFhmMkDG5kS8y@redhat.com>
References: <20220923153451.3810456-1-kbusch@fb.com>
 <YzXDSlksuOucjZm3@kbusch-mbp.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YzXDSlksuOucjZm3@kbusch-mbp.dhcp.thefacebook.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 29.09.2022 um 18:09 hat Keith Busch geschrieben:
> On Fri, Sep 23, 2022 at 08:34:51AM -0700, Keith Busch wrote:
> > 
> > An iov length needs to be aligned to the logical block size, which may
> > be larger than the memory alignment. And since this is only used with
> > file-posix backing storage, move the alignment function to there, where
> > the value of the request_alignment is known to be the file's logical
> > block size.
> 
> Any objections to this version? This is fixing real bug reports that
> may become more frequent without this patch.

I think it is okay. Splitting it in two patches would have been nicer
(one for moving code, one for making the change), but it's small enough
that I can ignore that. I'll probably merge it tomorrow.

Kevin


