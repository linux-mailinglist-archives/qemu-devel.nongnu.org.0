Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C540B49FE7A
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 17:54:25 +0100 (CET)
Received: from localhost ([::1]:39026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDUW0-0004Lf-Qa
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 11:54:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nDTnn-00035m-S6
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 11:08:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nDTnk-0003i5-TE
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 11:08:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643386120;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2UOZXXU78KRMYluWSCEYZ0ACRSsB8w6fyEdWPK0zwfs=;
 b=LmylZETvS+GBmTKe6epmLImWh52P4RIsUDm9AE3XaDwH/gl+n74cCqidR5mTdWJesVBcJf
 wrznDGiVOs3NnCb90ZJ3piNHQkf5iMYUJiFGyQPkdkLqMUe0CVV5S2p7nhKRTT9rHDVSK2
 1V/iYdCV8q8oCvTCeUa9rnS/LBYVHqs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-FMD1vaoxN42moEtOnd0cWg-1; Fri, 28 Jan 2022 11:08:33 -0500
X-MC-Unique: FMD1vaoxN42moEtOnd0cWg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4A22835B4E;
 Fri, 28 Jan 2022 16:08:32 +0000 (UTC)
Received: from redhat.com (unknown [10.33.37.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 85F6874EAF;
 Fri, 28 Jan 2022 16:08:31 +0000 (UTC)
Date: Fri, 28 Jan 2022 16:08:28 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 1/2] python: introduce qmp-shell-wrap convenience tool
Message-ID: <YfQU/N5QYGoxF2IF@redhat.com>
References: <20220118100140.252920-1-berrange@redhat.com>
 <20220118100140.252920-2-berrange@redhat.com>
 <CAFn=p-Ytc=9mmWqPKyrXRY2EFOKsyZ3akw8z=F6g1af6jgq0ug@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFn=p-Ytc=9mmWqPKyrXRY2EFOKsyZ3akw8z=F6g1af6jgq0ug@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Eduardo Habkost <eduardo@habkost.net>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 18, 2022 at 08:07:32PM -0500, John Snow wrote:
> On Tue, Jan 18, 2022 at 5:01 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > With the current 'qmp-shell' tool developers must first spawn QEMU with
> > a suitable -qmp arg and then spawn qmp-shell in a separate terminal
> > pointing to the right socket.
> >
> > With 'qmp-shell-wrap' developers can ignore QMP sockets entirely and
> > just pass the QEMU command and arguments they want. The program will
> > listen on a UNIX socket and tell QEMU to connect QMP to that.
> >
> > For example, this:
> >
> >  # qmp-shell-wrap -- qemu-system-x86_64 -display none
> >
> > Is roughly equivalent of running:
> >
> >  # qemu-system-x86_64 -display none -qmp qmp-shell-1234 &
> >  # qmp-shell qmp-shell-1234
> >
> > Except that 'qmp-shell-wrap' switches the socket peers around so that
> > it is the UNIX socket server and QEMU is the socket client. This makes
> > QEMU reliably go away when qmp-shell-wrap exits, closing the server
> > socket.
> >
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> 
> Thanks, I think this is pretty useful.
> 
> Can you look at setup.cfg and see about adding a qmp-shell-wrap entry
> point there? I had intended to wean people off of using /scripts for
> things that rely on the QMP packages, because I'm gonna fork them out
> and then these little forwards won't work without installing something
> anyway.

This looks simple enough but when I test I can't actuall get any of
the existing programs to work this way.

I did:

 $ python setup.py  install --user
 ...snip...
 Processing qemu-0.6.1.0a1-py3.10.egg
 Copying qemu-0.6.1.0a1-py3.10.egg to /home/berrange/.local/lib/python3.10/site-packages
 Adding qemu 0.6.1.0a1 to easy-install.pth file
 Installing aqmp-tui script to /home/berrange/.local/bin
 Installing qemu-ga-client script to /home/berrange/.local/bin
 Installing qmp-shell script to /home/berrange/.local/bin
 Installing qmp-shell-wrap script to /home/berrange/.local/bin
 Installing qom script to /home/berrange/.local/bin
 Installing qom-fuse script to /home/berrange/.local/bin
 Installing qom-get script to /home/berrange/.local/bin
 Installing qom-list script to /home/berrange/.local/bin
 Installing qom-set script to /home/berrange/.local/bin
 Installing qom-tree script to /home/berrange/.local/bin

 Installed /home/berrange/.local/lib/python3.10/site-packages/qemu-0.6.1.0a1-py3.10.egg
 Processing dependencies for qemu==0.6.1.0a1
 Finished processing dependencies for qemu==0.6.1.0a1


$ export PYTHONPATH=/home/berrange/.local/lib/python3.10/site-packages
$ qmp-shell
$ qmp-shell
Traceback (most recent call last):
  File "/home/berrange/.local/bin/qmp-shell", line 33, in <module>
    sys.exit(load_entry_point('qemu==0.6.1.0a1', 'console_scripts', 'qmp-shell')())
  File "/home/berrange/.local/bin/qmp-shell", line 25, in importlib_load_entry_point
    return next(matches).load()
  File "/usr/lib64/python3.10/importlib/metadata/__init__.py", line 162, in load
    module = import_module(match.group('module'))
  File "/usr/lib64/python3.10/importlib/__init__.py", line 126, in import_module
    return _bootstrap._gcd_import(name[level:], package, level)
  File "<frozen importlib._bootstrap>", line 1050, in _gcd_import
  File "<frozen importlib._bootstrap>", line 1027, in _find_and_load
  File "<frozen importlib._bootstrap>", line 992, in _find_and_load_unlocked
  File "<frozen importlib._bootstrap>", line 241, in _call_with_frames_removed
  File "<frozen importlib._bootstrap>", line 1050, in _gcd_import
  File "<frozen importlib._bootstrap>", line 1027, in _find_and_load
  File "<frozen importlib._bootstrap>", line 992, in _find_and_load_unlocked
  File "<frozen importlib._bootstrap>", line 241, in _call_with_frames_removed
  File "<frozen importlib._bootstrap>", line 1050, in _gcd_import
  File "<frozen importlib._bootstrap>", line 1027, in _find_and_load
  File "<frozen importlib._bootstrap>", line 1004, in _find_and_load_unlocked
ModuleNotFoundError: No module named 'qemu'

I can't see why this is failing to find 'qemu' when it exists fine:

$ python
>>> import qemu.aqmp.qmp_shell
>>> qemu.aqmp.qmp_shell.main()
usage: [-h] [-H] [-N] [-v] [-p] [-l LOGFILE] qmp_server
: error: the following arguments are required: qmp_server


Why is 'load_entry_point' unhappy ?

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


