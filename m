Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFED310963
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 11:45:18 +0100 (CET)
Received: from localhost ([::1]:55226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7yc0-00009S-Hd
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 05:45:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1l7yab-00084q-Gq
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 05:43:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1l7yaY-00040E-FN
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 05:43:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612521824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WVbXENClknuo+rUYn1oIto34wAdR3aYEcF6u2XNibWM=;
 b=b0iRW19v5Wi5yP/HdP2U+Le85laUar41mblWT26S03T/zbuw5TnQFJ9Ozzz0zPlFtZ8zmh
 KOSK1n66wfNOOZRH5a5C1+bhudzo99n6dfzokB/lZkCgxHvvM8svdjh4NAOH3E0pTYHp2e
 CNXdNwJxcHq2TQ455vVEgaeEnXV7D7U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-WHv3nM7PMJ6wdWoDtHnouw-1; Fri, 05 Feb 2021 05:43:42 -0500
X-MC-Unique: WHv3nM7PMJ6wdWoDtHnouw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E50C8195D560;
 Fri,  5 Feb 2021 10:43:40 +0000 (UTC)
Received: from localhost (ovpn-114-98.ams2.redhat.com [10.36.114.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 747605C5B5;
 Fri,  5 Feb 2021 10:43:40 +0000 (UTC)
Date: Fri, 5 Feb 2021 10:43:39 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH] qemu-img: add seek and -n option to dd command
Message-ID: <20210205104339.GD30079@redhat.com>
References: <20210128140704.6547-1-pl@kamp.de>
 <99982043-ed89-5fbe-afe2-691a9c19280d@redhat.com>
 <567ab8bb-b452-d6c2-dec7-bc2cf1e34ec8@kamp.de>
 <3dff97ae-5172-d9ca-509f-2a520c2841b5@redhat.com>
MIME-Version: 1.0
In-Reply-To: <3dff97ae-5172-d9ca-509f-2a520c2841b5@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, Peter Lieven <pl@kamp.de>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 04, 2021 at 02:44:03PM -0600, Eric Blake wrote:
> On 2/4/21 2:09 PM, Peter Lieven wrote:
> > Am 02.02.21 um 16:51 schrieb Eric Blake:
> >> On 1/28/21 8:07 AM, Peter Lieven wrote:
> >>> Signed-off-by: Peter Lieven <pl@kamp.de>
> >> Your commit message says 'what', but not 'why'.  Generally, the one-line
> >> 'what' works well as the subject line, but you want the commit body to
> >> give an argument why your patch should be applied, rather than blank.
> >>
> >> Here's the last time we tried to improve qemu-img dd:
> >> https://lists.gnu.org/archive/html/qemu-devel/2018-08/msg02618.html
> > 
> > 
> > I was not aware of that story. My use case is that I want to be
> > 
> > able to "patch" an image that Qemu is able to handle by overwriting
> > 
> > certain sectors. And I especially do not want to "mount" that image
> > 
> > via qemu-nbd because I might not trust it. I totally want to avoid that the host
> > 
> > system tries to analyse that image in terms of scanning the bootsector, partprobe,
> > 
> > lvm etc. pp.
> 
> qemu-nbd does not have to mount an image (yes, one use of qemu-nbd is to
> use -c /dev/nbdX to get the kernel to mount it; but other uses are to
> expose the NBD image in user-space only with no kernel involvement, and
> therefore no system mount efforts).

I agree, there's nothing unsafe about qemu-nbd (provided you don't use
the -c option).

> Another thing you might try is libnbd, which now includes a utility
> nbdcopy.  It should make it easier to overwrite a portion of an NBD
> image using only user-space actions.  I'm not sure if Rich has got it
> doing partial file overwrites yet (.../me goes and compiles the latest
> git checkout... nope, still a TODO item to implement subsetting), but it
> may be possible to combine nbdkit's --filter=offset with the full NBD
> image in order to then easily point nbdcopy to only the subset you care
> about.  Definitely some ideas worthy of implementation.

TBH I would use nbdsh.  For example to overwrite the sector at 1M in a
qcow2 image with "1"s:

  $ qemu-img create -f qcow2 test.qcow2 10M
  $ nbdsh -c 'h.connect_systemd_socket_activation(["qemu-nbd","-t","-f","qcow2","test.qcow2"])' \
          -c 'h.pwrite(b"1"*512, 1024*1024)'

and to show it was really overwritten:

  $ nbdcopy -- [ qemu-nbd -f qcow2 test.qcow2 ] - | hexdump -C
  00000000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
  *
  00100000  31 31 31 31 31 31 31 31  31 31 31 31 31 31 31 31  |1111111111111111|
*
  00100200  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
*
  00a00000

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-df lists disk usage of guests without needing to install any
software inside the virtual machine.  Supports Linux and Windows.
http://people.redhat.com/~rjones/virt-df/


