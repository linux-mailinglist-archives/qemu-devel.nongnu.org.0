Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F3060F324
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 11:03:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onymc-00022y-73; Thu, 27 Oct 2022 05:02:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1onymS-0001pK-1D
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 05:02:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1onymP-0002wj-GD
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 05:02:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666861343;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MNhsquvlsYqZ6rppf/wiIpVT8XYCmkqRQbG5r6naQgY=;
 b=OFf9bm0KJfwlhuAsE4iia3PfOjSI4RimBFW2ueCq+qt2UhgTkR49aWGWPhInWWD4q7zqNx
 X6Eyjd7/X/DfqRSSdHoGYKd4fBavrWFbG5zmune/nmbuOZMhbtXpNYXdYYjDTQ5ryML+05
 yI/ff8b/fHrV6tkueWfnOs7tRsuMUrs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594--FbZAgIgPhy2zeswhcHbTA-1; Thu, 27 Oct 2022 05:02:20 -0400
X-MC-Unique: -FbZAgIgPhy2zeswhcHbTA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58C4B87A9F7;
 Thu, 27 Oct 2022 09:02:08 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.236])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AA98A111CA04;
 Thu, 27 Oct 2022 09:01:57 +0000 (UTC)
Date: Thu, 27 Oct 2022 10:01:54 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH] avocado: use sha1 for fc31 imgs to avoid first time
 re-download
Message-ID: <Y1pI2Tg9VTNwrrEE@redhat.com>
References: <20221022170350.936685-1-danielhb413@gmail.com>
 <Y1ZUsauC6F3yDuny@redhat.com>
 <8d2d7c90-288f-387f-e474-7eefe47005e8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8d2d7c90-288f-387f-e474-7eefe47005e8@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Oct 27, 2022 at 09:46:29AM +0200, Thomas Huth wrote:
> On 24/10/2022 11.02, Daniel P. Berrangé wrote:
> > On Sat, Oct 22, 2022 at 02:03:50PM -0300, Daniel Henrique Barboza wrote:
> > > 'make check-avocado' will download any images that aren't present in the
> > > cache via 'get-vm-images' in tests/Makefile.include. The target that
> > > downloads fedora 31 images, get-vm-image-fedora-31, will use 'avocado
> > > vmimage get  --distro=fedora --distro-version=31 --arch=(...)' to
> > > download the image for each arch. Note that this command does not
> > > support any argument to set the hash algorithm used and, based on the
> > > avocado source code [1], DEFAULT_HASH_ALGORITHM is set to "sha1". The
> > > sha1 hash is stored in a Fedora-Cloud-Base-31-1.9.{ARCH}.qcow2-CHECKSUM
> > > in the cache.
> > 
> > > For now, in QEMU, let's use sha1 for all Fedora 31 images. This will
> > > immediately spares us at least one extra download for each Fedora 31
> > > image that we're doing in all our CI runs.
> > > 
> > > [1] https://github.com/avocado-framework/avocado.git @ 942a5d6972906
> > > [2] https://github.com/avocado-framework/avocado/issues/5496
> > 
> > Can we just ask Avocado maintainers to fix this problem on their
> > side to allow use of a modern hash alg as a priority item. We've
> > already had this problem in QEMU for over a year AFAICT, so doesn't
> > seem like we need to urgently do a workaround on QEMU side, so we
> > can get Avocado devs to commit to fixing it in the next month.
> 
> Do we have such a commitment? ... The avocado version in QEMU is completely
> backlevel these days, it's still using version 88.1 from May 2021, i.e.
> there hasn't been any update since more than a year. I recently tried to
> bump it to a newer version on my own (since I'm still suffering from the
> problem that find_free_port() does not work if you don't have a local IPv6
> address), but it's not that straight forward since the recent versions of
> avocado changed a lot of things (e.g. the new nrunner - do we want to run
> tests in parallel? If so it breaks a lot of the timeout settings, I think),
> so an update needs a lot of careful testing...

That it is so difficult to update Avocado after barely more than
1 year is not exactly a strong vote of confidence in our continued
use of Avocado long term :-(

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


