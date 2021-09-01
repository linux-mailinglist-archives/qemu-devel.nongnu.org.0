Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4050E3FE3F7
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 22:26:56 +0200 (CEST)
Received: from localhost ([::1]:33252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLWow-0004uL-3G
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 16:26:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mLWn0-0002UU-DA
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 16:24:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mLWmw-0006c5-LX
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 16:24:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630527890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LWXXSnO0nrnko3A+YzxuBOuZwcqMDat9+Anp6yWxowM=;
 b=XXvhlWRdIpJAoNTxyFhAo57u+XQd26lSZVyGtyt2v4oRtZZHF0Ct+d7yMRT+Neh6YnGvpL
 X++1FUZ1AfFbl47X0IN+35ND7d9TfmRp+s9O2jcVeJm68ySxnzQnF6SnPffA1IMpSgYcTI
 sMxDf62bRZYsAdhQXow2K4xmYT3+n/o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-CjNzYdrVMt-pas_Ng4Wciw-1; Wed, 01 Sep 2021 16:24:45 -0400
X-MC-Unique: CjNzYdrVMt-pas_Ng4Wciw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72D6C10CE780;
 Wed,  1 Sep 2021 20:24:44 +0000 (UTC)
Received: from localhost (unknown [10.39.192.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F84260E1C;
 Wed,  1 Sep 2021 20:24:43 +0000 (UTC)
Date: Wed, 1 Sep 2021 21:24:43 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] tcg/arm: Increase stack alignment for function generation
Message-ID: <20210901202443.GL26415@redhat.com>
References: <20210901164446.2722007-1-rjones@redhat.com>
 <20210901164446.2722007-2-rjones@redhat.com>
 <CAFEAcA8WD97HqQRRzB8Z1LVMCmkKZu3_EAQZM1HAMxccQ=PMnA@mail.gmail.com>
 <20210901183009.GG26415@redhat.com>
 <CAFEAcA-V7kp+HGBkHM_Zjfq28KhRReo74nowbtP4ZuZzVaw+kw@mail.gmail.com>
 <20210901185115.GI26415@redhat.com>
 <CAFEAcA_JiWFrtj8nyVuPio-qPmu2z4_V4mu1kXFSv-UPXXxPNA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_JiWFrtj8nyVuPio-qPmu2z4_V4mu1kXFSv-UPXXxPNA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-stable <qemu-stable@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 01, 2021 at 09:17:07PM +0100, Peter Maydell wrote:
> On Wed, 1 Sept 2021 at 19:51, Richard W.M. Jones <rjones@redhat.com> wrote:
> >
> > On Wed, Sep 01, 2021 at 07:41:21PM +0100, Peter Maydell wrote:
> > > Is the failure case short enough to allow -d ... logging to
> > > be taken? That's usually the most useful info, but it's so huge
> > > it's often not feasible.
> >
> > I can try -- what exact -d option would be useful?
> 
> Depends what you're after. Personally I'm fairly sure I know
> what's going on, I'm just not sure what the right fix is.

Another question: We couldn't reproduce this even with the identical
ARM guest kernel + initrd + command line using qemu-system-arm
compiled for x86-64 host.  This was a bit surprising!  Was that bad
luck or is there some reason why this bug might not be reproducible
except on armv7 host?  (Both cases use -machine accel=tcg).

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
libguestfs lets you edit virtual machines.  Supports shell scripting,
bindings from many languages.  http://libguestfs.org


