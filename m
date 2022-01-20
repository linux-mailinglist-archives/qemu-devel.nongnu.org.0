Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6085B4954D2
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 20:19:25 +0100 (CET)
Received: from localhost ([::1]:55618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAcxw-0006Vo-Bf
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 14:19:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nAXg7-0003I0-NR
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 08:40:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nAXg3-0008CZ-MO
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 08:40:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642686034;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ow+8KIqY6RT/oTMycy/P9vQnRfBIPMOEWqudq13hC8=;
 b=AxdAnYBRyS87umtFzVZyKHX/+sGPsgDfRtfK12dEBHAR7Poa1/EwG7b7eVhqkVKdP8O3BQ
 b/Cw6QTDfWItUZNscUnRr6bDuVrGLbDlAR2h6UJ/gcbpVoKOwzS1QI0xZsDMg9FXNtSRlA
 et5gxfLZzdy+PaGpe1l+LeiCfrefvRI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-505-rTT5zOP8NRmB_wRztNmWcg-1; Thu, 20 Jan 2022 08:40:26 -0500
X-MC-Unique: rTT5zOP8NRmB_wRztNmWcg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EFDB64093;
 Thu, 20 Jan 2022 13:40:25 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.153])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C3378464D;
 Thu, 20 Jan 2022 13:40:07 +0000 (UTC)
Date: Thu, 20 Jan 2022 13:40:04 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 1/2] python: introduce qmp-shell-wrap convenience tool
Message-ID: <YelmNGvwwUDWmW93@redhat.com>
References: <20220117141103.157288-1-berrange@redhat.com>
 <20220117141103.157288-2-berrange@redhat.com>
 <CAFn=p-Z4sn94+i18JjEnXgPTJK1H0GBqjCA3kwxtHdrELcOc5g@mail.gmail.com>
 <YeaRJF3tqMjipU3o@redhat.com>
 <CAFn=p-ZS247FdLySHMcBTpqKzV=eTgsQQMAXyU5CwNEWdZQusQ@mail.gmail.com>
 <a82daf05-24d0-f871-185e-3588e4c91dea@amsat.org>
MIME-Version: 1.0
In-Reply-To: <a82daf05-24d0-f871-185e-3588e4c91dea@amsat.org>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Beraldo Leal <bleal@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 20, 2022 at 02:33:46PM +0100, Philippe Mathieu-Daudé wrote:
> On 18/1/22 19:04, John Snow wrote:
> > On Tue, Jan 18, 2022 at 5:06 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> 
> > > It would be nice to just have this integrated into 'make check' so we
> > > don't need to remember to run a special command.
> > 
> > The CI will run it, but 'make check' doesn't. To add it to make check,
> > I need to figure out how to insert a venv-building step into 'make
> > check' such that the venv gets deposited into the build dir instead of
> > the source dir.
> > I think I may also need yet another set of package dependencies that
> > pin on precise dependencies for testing purposes to prevent random
> > regressions during 'make check' when nobody has touched the Python
> > code.
> > 
> > Overall, I felt like maybe it was more hassle than it was worth if I
> > can just nudge people touching the python to run a 'make check-dev'
> > every so often.
> > 
> > Patches welcome, etc. My overall strategy with the python tests so far has been:
> > 
> > (1) Keep python tests fully separate from the QEMU build system to
> > allow them to be split out into new repositories easily.
> > (2) Use the pipenv test to lock the very oldest dependencies the code
> > and tests support, using the very oldest python we support (3.6) This
> > test is used as the gating test in GitLab CI, as it is very repeatable
> > and the GitLab CI setup ensures I can always have the exact Python
> > packages it requires available.
> > (3) Use the tox test to test against a wide variety of Python
> > interpreters (3.6 through 3.10 inclusive) using the very latest python
> > packages to detect regressions on cutting-edge environments
> > (4) Use the widest possible range of versions for dependent packages
> > in setup.cfg such that QEMU packages are unlikely to cause versioning
> > conflicts in environments that decide to integrate our code.
> > 
> > Overall, I test on 3.6 through 3.10, and against the "oldest" and
> > "newest" dependencies. It's a good, wide matrix.
> > 
> > However, It's #4 there that runs me into trouble with tests that are
> > guaranteed to pass -- the linters update all the time and cause new
> > problems. I use pipenv to lock to specific versions, but that tool
> > wants to run against Python 3.6 *explicitly*, so it isn't suitable for
> > a generic purpose 'make check' because not everyone will have a Python
> > 3.6 interpreter available. I need something kind of halfway between,
> > where I can lock against specific versions but not against the Python
> > interpreter version, and that's what could be used for a decent 'make
> > check' test.
> > 
> > Of course, I don't want to maintain like 10 versions of a dependent
> > packages list, either.
> > 
> > (I really, really wish pip had an --use-oldest flag for dependency
> > resolution, but it doesn't.)
> 
> Could we simply use a virtualenv for all QEMU testing tasks (packages
> consumed by QEMU tests), and only deal with installed Python packages
> for regular non-testing QEMU uses (things exposed via pyqemu that we
> want stable)?

I don't especially like the idea of using virtualenv. It is a good thing
that we're testing on the distro python packages, because that is the
scenario that our contributors/developers will actually use these
tools in. We're got a well defined set of target platforms that QEMU
aims for that we need to cover in testing. If we also want to do tests
against general python using a virtualenv in CI pipelines thats fine,
but doesn't replace the need to testing against our explicit platform
targets, its just additive.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


