Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D9AA3D60
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Aug 2019 20:03:54 +0200 (CEST)
Received: from localhost ([::1]:39568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i3lFZ-0008OR-HI
	for lists+qemu-devel@lfdr.de; Fri, 30 Aug 2019 14:03:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52806)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1i3l8p-00059s-Me
 for qemu-devel@nongnu.org; Fri, 30 Aug 2019 13:56:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1i3l8m-0005pC-K3
 for qemu-devel@nongnu.org; Fri, 30 Aug 2019 13:56:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51584)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1i3l8m-0005jv-C4
 for qemu-devel@nongnu.org; Fri, 30 Aug 2019 13:56:52 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BF3A5308FEC1;
 Fri, 30 Aug 2019 17:56:50 +0000 (UTC)
Received: from localhost (ovpn-116-109.gru2.redhat.com [10.97.116.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 56D0C600F8;
 Fri, 30 Aug 2019 17:56:49 +0000 (UTC)
Date: Fri, 30 Aug 2019 14:56:48 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Message-ID: <20190830175648.GE3694@habkost.net>
References: <20190829013125.GG16342@umbus.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190829013125.GG16342@umbus.fritz.box>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Fri, 30 Aug 2019 17:56:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] Cryptic errors from PIP install if missing
 openssl-devel
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
Cc: ldoktor@redhat.com, qemu-devel@nongnu.org, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 29, 2019 at 11:31:25AM +1000, David Gibson wrote:
> If I attempt to run "make check-acceptance" on my POWER9, RHEL8.1
> machine when the openssl-devel package isn't installed, I get the
> following very cryptic error:
> 
>   VENV    /home/dwg/qemu/build/rhel8/tests/venv
>   PIP     /home/dwg/qemu/tests/requirements.txt
> Command "/home/dwg/qemu/build/rhel8/tests/venv/bin/python -u -c "import setuptools, tokenize;__file__='/tmp/pip-build-la4el5r5/cryptography/setup.py';f=getattr(tokenize, 'open', open)(__file__);code=f.read().replace('\r\n', '\n');f.close();exec(compile(code, __file__, 'exec'))" install --record /tmp/pip-1efs22iz-record/install-record.txt --single-version-externally-managed --compile --install-headers /home/dwg/qemu/build/rhel8/tests/venv/include/site/python3.6/cryptography" failed with error code 1 in /tmp/pip-build-la4el5r5/cryptography/
> 
> Using V=1 doesn't give any more useful information, and it's not
> (easily) possible to manually re-run the given command since it relies
> on things in /tmp that are removed once the attempt finishes.

V=1 is supposed to show the actual pip command being run.  I see
it here:

  $ make check-venv V=1
  [...]
  python3 -B -m venv --system-site-packages /home/ehabkost/rh/proj/virt/qemu/tests/venv
* /home/ehabkost/rh/proj/virt/qemu/tests/venv/bin/python -m pip -q install -r /home/ehabkost/rh/proj/virt/qemu/tests/requirements.txt
  You are using pip version 19.0.3, however version 19.2.3 is available.
  You should consider upgrading via the 'pip install --upgrade pip' command.
  touch /home/ehabkost/rh/proj/virt/qemu/tests/venv

Can you reproduce the problem if you re-run the pip command?


> 
> I only figured out it was openssl-devel being missing that was the
> problem by (mostly) guesswork.  It would be really great if we could
> generate a more helpful error here.

I don't think there's much we can do about it, as the error is generated by a
package being built by pip.

There's one thing we can do to make it slightly better: not passing `-q` to pip
if running with V=1, so people can see which packages are being installed and
which one is generating the error.

> 
> In addition, if I rerun "make check-acceptance" it no longer even
> attempts the PIP install, since tests/venv already exists in my build
> environment.  It then sort of works, but I think it might be hitting
> other errors because of the missing python packages.  Sorry that's a
> bit vague - I also seem to be getting unrelated errors that I'm still
> trying to figure out.

This sounds like a bug and we need to fix it.

-- 
Eduardo

