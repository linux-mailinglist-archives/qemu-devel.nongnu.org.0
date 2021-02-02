Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A81830BD4F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 12:43:06 +0100 (CET)
Received: from localhost ([::1]:43762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6u5J-0006Ec-NB
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 06:43:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l6u3o-0005OF-Fr
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 06:41:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l6u3l-00044T-T5
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 06:41:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612266088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W93yZkeRmV4ELTyGRZimoC4cSFtpWjcQDy/+UphjoGM=;
 b=TznUqbKBEv3/q0V/VDIldITcFSrNvLtQjHNbr4SqV+cchZUnNQw410rt3PxbQdiO38TQsH
 kgcUu9cHQy8XGtMZs4jApGfJYJzpjkSnNZgsYKB1aXn8lmA7az0XJ0826QopGkl8UTA/R2
 jtGPxOBhBI1Qt9HX2nWUDjPMbPAESzc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-06VGXAxeOG-co6k6zwEOzQ-1; Tue, 02 Feb 2021 06:41:26 -0500
X-MC-Unique: 06VGXAxeOG-co6k6zwEOzQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84184801817;
 Tue,  2 Feb 2021 11:41:25 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-19.ams2.redhat.com [10.36.112.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 99F3060C05;
 Tue,  2 Feb 2021 11:41:24 +0000 (UTC)
Date: Tue, 2 Feb 2021 12:41:23 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 0/2] block: Fix iotests to respect configured Python binary
Message-ID: <20210202114123.GB5184@merkur.fritz.box>
References: <20210129145240.34104-1-kwolf@redhat.com>
 <CAFEAcA_5ASnuNjWs8rdRid-VpjFaHX0Y_8cKFRY0ojJKLB7ryA@mail.gmail.com>
 <CAFEAcA8y0G_sru10vmESAPW54JWPZRcboN7xSfc2bKDQFaqGNA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8y0G_sru10vmESAPW54JWPZRcboN7xSfc2bKDQFaqGNA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 02.02.2021 um 10:47 hat Peter Maydell geschrieben:
> On Fri, 29 Jan 2021 at 16:13, Peter Maydell <peter.maydell@linaro.org> wrote:
> > This is definitely better so I'm going to apply it, but it seems
> > to reveal a pile of iotest failures on FreeBSD:
> 
> > Failures: 030 040 041 127 256
> 
> It seems to consistently be these five. What do they have in common ?

That's a very good question, especially if you ask what they have in
common with each other, but with no other test.

With 030 040 041, your theory of running out of memory seemed to make a
lot of sense because these are the big block job tests. But 127 doesn't
fit in that group at all, it's a very small test on a tiny 64k image.
Unlike the other tests in your list that make use of our Python
framework, it's also just a shell script.

Other criteria that make 127 special like that it uses scsi and/or
iothreads don't apply to all other failed cases, but instead to other
cases that pass.

Are you still getting the same error message and is it the same for all
Python test cases? ("Unexpected empty reply from server") If QEMU had
been killed, there should be a message telling with which signal it
exited (if that code works correctly on NetBSD).

In any case, the output for 127 must be different because it doesn't use
the Python framework. Can you post the diff for that one?

Kevin


