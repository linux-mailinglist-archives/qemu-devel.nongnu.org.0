Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4DF5F76C2
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 12:21:26 +0200 (CEST)
Received: from localhost ([::1]:53534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogkTp-0005yI-QH
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 06:21:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ogkKR-0000Db-8c
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:11:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ogkKL-00063G-Kk
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:11:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665137492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DeegLjysuJmzxdqWOTGhy+nk25x4GT/gDkrxWxAgYjc=;
 b=YsEWv+u9kqasEuYVumr8+efxkAUD59Zx2MBMMKYkJ0RsXAA3dKAZYr0IQQbusqBR9u4iVF
 voJmHZQH8RMZ/2thf/I/dNVwy46ULtOZp+Ogw0Vu1ZOY1UTg5DMgGZgSvpWiavHjGeoxSX
 pfwz7spNt6NBhz4A7afLtIUdyLS7bng=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-311-NlN3vdpiOpmCgIdCIih-ZA-1; Fri, 07 Oct 2022 06:11:31 -0400
X-MC-Unique: NlN3vdpiOpmCgIdCIih-ZA-1
Received: by mail-wm1-f71.google.com with SMTP id
 c130-20020a1c3588000000b003b56be513e1so2496686wma.0
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 03:11:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DeegLjysuJmzxdqWOTGhy+nk25x4GT/gDkrxWxAgYjc=;
 b=wAIHYgA86C5aGMe8EAURxYSZ+MfXPNCW1qCNvgmemb5Rl6axZ3UMeEFBhunHAnADBv
 fn3Th45ZVkfRyI0+HBBs7fKPEiTd91x/qi4OEAELMoARsx549zgDlo9nPOzb42GYw+zD
 dIoQQ0KzHTaEYQ8iH9VbLFZJEpR5JIdG+HVkaex0AiWRjKdjP59EJ3OwtquplOHoB230
 YkYyaZRP/gFJn9++4wgW4HP3lwN01Rpp1v7mD50VwR1ODWJ270cSk9OjE7ZrHY7TrREo
 AvyKROAiIAXfZGwdtggep6wWZfBrT+kQyx6yQeNmi3NZbpfJvG4alB4aimKmOB0EQvwT
 pHCg==
X-Gm-Message-State: ACrzQf2hqQH1UyDwXwKSE6H3tyFwNFv/V8tZbkyNsDuQD1Z1S4N1yoMN
 eFNoAdOEOeonKijieEf7T+NG5if+uNCzOvJVM6kQ7D0S7J0zlzFNpSg6rHkRD4NEYd7Mwr9ySjo
 cVTS1laPRjZq13W8=
X-Received: by 2002:a1c:f214:0:b0:3be:4e7c:1717 with SMTP id
 s20-20020a1cf214000000b003be4e7c1717mr2784700wmc.171.1665137489641; 
 Fri, 07 Oct 2022 03:11:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM59B8kTEagsSl0scBzmeGap/PoUfxaloY9ziYl+3y5Louo+qfWUZgBQQD1/08eExZQGaJz2RQ==
X-Received: by 2002:a1c:f214:0:b0:3be:4e7c:1717 with SMTP id
 s20-20020a1cf214000000b003be4e7c1717mr2784682wmc.171.1665137489384; 
 Fri, 07 Oct 2022 03:11:29 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 r3-20020a5d4e43000000b0022a2bacabbasm1644583wrt.31.2022.10.07.03.11.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 03:11:28 -0700 (PDT)
Date: Fri, 7 Oct 2022 06:11:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH] gitmodules: recurse by default
Message-ID: <20221007061037-mutt-send-email-mst@kernel.org>
References: <20221006113906.179963-1-mst@redhat.com>
 <Yz8kfJcfbbTAnmuR@redhat.com>
 <20221006202250-mutt-send-email-mst@kernel.org>
 <Yz/eNaP994pc+P6Q@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yz/eNaP994pc+P6Q@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 07, 2022 at 09:07:17AM +0100, Daniel P. Berrangé wrote:
> On Thu, Oct 06, 2022 at 08:24:01PM -0400, Michael S. Tsirkin wrote:
> > On Thu, Oct 06, 2022 at 07:54:52PM +0100, Daniel P. Berrangé wrote:
> > > On Thu, Oct 06, 2022 at 07:39:07AM -0400, Michael S. Tsirkin wrote:
> > > > The most commmon complaint about submodules is that
> > > > they don't follow when one switches branches in the
> > > > main repo. Enable recursing into submodules by default
> > > > to address that.
> > > > 
> > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > > ---
> > > >  .gitmodules | 23 +++++++++++++++++++++++
> > > >  1 file changed, 23 insertions(+)
> > > 
> > > What am I missing, as I tried something equiv to this change
> > > with one submodule and it didn't appear to have any effect.
> > > I started from a clean slate:
> > > 
> > > $ git submodule  deinit --all --force
> > > 
> > > The .gitmodules config has 'recurse = true' for the ui/keycodemapdb
> > > module:
> > > 
> > > $ grep keycodemap --after 1 .gitmodules 
> > > [submodule "ui/keycodemapdb"]
> > > 	path = ui/keycodemapdb
> > > 	url = https://gitlab.com/qemu-project/keycodemapdb.git
> > > 	recurse = true
> > > 
> > > I have a change on master setting the submodule commit:
> > > 
> > > $ git show master | grep +Sub
> > > +Subproject commit 7381b9bfadd31c4c9e9a10b5bb5032f9189d4352
> > > 
> > > and check it out:
> > > 
> > > $ git submodule update --init ui/keycodemapdb
> > > Submodule 'ui/keycodemapdb' (https://gitlab.com/qemu-project/keycodemapdb.git) registered for path 'ui/keycodemapdb'
> > > Submodule path 'ui/keycodemapdb': checked out '7381b9bfadd31c4c9e9a10b5bb5032f9189d4352'
> > > 
> > > 
> > > In another branch I have a different commit:
> > > 
> > > $ git show sub-foo  | grep +Sub
> > > +Subproject commit 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae
> > > 
> > > 
> > > Now I switch branches and nothing happens, the submodule
> > > is marked as dirty:
> > > 
> > > $ git checkout sub-foo
> > > M	ui/keycodemapdb
> > > Switched to branch 'sub-foo'
> > > 
> > > $ (cd ui/keycodemapdb && git show | head -1)
> > > commit 7381b9bfadd31c4c9e9a10b5bb5032f9189d4352
> > > 
> > > 
> > > >From your description (and indeed that of the man page) it
> > > sounded like ui/keycodemapdb should have got updated to
> > > commit 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae when I did
> > > 'git checkout', but that didn't happen
> > 
> > I think .gitmodules got overwritten when you checked out the branch.
> > Possible?
> 
> No, it the same in both branches, since they share a common
> ancestor commit which added the recurse tag
> 
> $ git checkout master
> Switched to branch 'master'
> $ git grep keycodemapdb --after 1 .gitmodules 
> [submodule "ui/keycodemapdb"]
> 	path = ui/keycodemapdb
> 	url = https://gitlab.com/qemu-project/keycodemapdb.git
> 	recurse = true
> $ git checkout sub-foo 
> M	ui/keycodemapdb
> Switched to branch 'sub-foo'
> $ grep keycodemapdb --after 1 .gitmodules 
> [submodule "ui/keycodemapdb"]
> 	path = ui/keycodemapdb
> 	url = https://gitlab.com/qemu-project/keycodemapdb.git
> 	recurse = true
> 
> 
> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


I just retested and it's not working for me either :(
I was sure it worked but I guess the testing wasn't done properly.
Back to the drawing board sorry.

-- 
MST


