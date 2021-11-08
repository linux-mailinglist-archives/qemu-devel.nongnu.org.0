Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44496447FE7
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 13:55:22 +0100 (CET)
Received: from localhost ([::1]:34336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk4BE-0006OU-Tz
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 07:55:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1mk4AM-0005hx-HL
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 07:54:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1mk4AJ-0008Fl-8d
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 07:54:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636376061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1mB1O3D6+j/9Fmk5vMxvZSDhh1Q4wXvlKmOQ+PCTowY=;
 b=Hq1jr9dJhpoPL9mank/hfeAc7D8htyGQUmjaqvKrGJwcAnpBMDmhJly9CY7isdCKEzpOX8
 DtIYdI9PhOx2th5Nue8BbRgyawI2p0T82IWUU6JGsqvqsRRh498VL78JPQ3oEHcAITWHSH
 K31zI54xNwvInctLdElG5VUbR9odqzI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-2GWktuL6NUS31aXwD4Gq0g-1; Mon, 08 Nov 2021 07:54:19 -0500
X-MC-Unique: 2GWktuL6NUS31aXwD4Gq0g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B66E8799EB;
 Mon,  8 Nov 2021 12:54:17 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.195.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 27D7460BE5;
 Mon,  8 Nov 2021 12:54:08 +0000 (UTC)
Date: Mon, 8 Nov 2021 13:54:06 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v3 03/12] vfio-user: define vfio-user-server object
Message-ID: <YYkd7hlces8zO6+J@angien.pipo.sk>
References: <13dba991f1de91711e5c3cad9a332d6e7c5eee7b.1633929457.git.jag.raman@oracle.com>
 <YXly2vSh/bhgr0i/@stefanha-x1.localdomain>
 <6346833B-469B-487B-8382-62EA03BA56C2@oracle.com>
 <YX/Cx7g0D5o8dVtp@stefanha-x1.localdomain>
 <87wnloce5t.fsf@dusky.pond.sub.org> <YYPwogn87tMf0p7s@redhat.com>
 <87y2623of6.fsf@dusky.pond.sub.org> <YYUvZjg0lmaWE223@redhat.com>
 <87fss9vlla.fsf@dusky.pond.sub.org> <YYkSdrGhWmIL3ZLB@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YYkSdrGhWmIL3ZLB@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "thuth@redhat.com" <thuth@redhat.com>, Jag Raman <jag.raman@oracle.com>,
 "swapnil.ingle@nutanix.com" <swapnil.ingle@nutanix.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 08, 2021 at 13:05:10 +0100, Kevin Wolf wrote:
> Am 06.11.2021 um 07:34 hat Markus Armbruster geschrieben:
> > Kevin Wolf <kwolf@redhat.com> writes:
> > > Am 05.11.2021 um 11:08 hat Markus Armbruster geschrieben:
> > >> Kevin Wolf <kwolf@redhat.com> writes:
> > >> > Am 04.11.2021 um 13:13 hat Markus Armbruster geschrieben:

[...]

> > >                                   Peter Maydell also wants to do this
> > >    only after a big user (read: libvirt) has implemented and is
> > >    using JSON, basically as a proof that the alternative is working.
> > >
> > >    So this can certainly be done for -object. I believe libvirt also
> > >    uses JSON for -device now, so this should be fine now, too.
> > 
> > The non-sugar options supporting JSON are -audiodev, -blockdev, -compat,
> > -display (partially), -machine (I think), -object.
> > 
> > -netdev is QAPIfied, but still uses QemuOpts.  Too late for 6.2, I'm
> > afraid.
> 
> Ok. Not sure about the libvirt status for some of these, but -object and

Interresting.

We don't do JSON for -audiodev, -compat, -display or -machine.

-audiodev and -compat are recent enough so I suppose those accepted JSON
always. Converting them will be trivial.

For -display and -machine we'll need a witness to switch to the new
syntax but I think I can convert them in libvirt if it helps qemu to
have a more consistent message.

> -device are the ones that I know are going to be in the way in the
> future, so degrading their non-JSON form would already be helpful.


