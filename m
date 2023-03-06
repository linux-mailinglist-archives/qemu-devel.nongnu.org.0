Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CFD6AC08A
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 14:15:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZAg4-0006Zj-G9; Mon, 06 Mar 2023 08:14:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pZAfy-0006YL-BF
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:14:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pZAfw-00042e-M2
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:14:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678108486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0VcfJMVrhowpkRCecwnoDzhkzDqyfgfCZsybfrTDURs=;
 b=d/ivzLQqLQMDjGxSTeh4yKWKfWVCvA/NdUjC52JjjAIqksLpkMXuLYnG8QKA0oxsROMA0k
 FiIQkVb1JAdIZizp4+qqbXdQk4LudiS1Zk95MXOx31jbO5U4mC1FyDIAttXsTGz64Ym0oi
 OOH8xrNhPM0kU9bhz8AEoehmZ+KsCtU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-301-m__f_AenM8KnzO9DTRhbtQ-1; Mon, 06 Mar 2023 08:14:41 -0500
X-MC-Unique: m__f_AenM8KnzO9DTRhbtQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 l14-20020a5d526e000000b002cd851d79b2so1453695wrc.5
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 05:14:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678108480;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0VcfJMVrhowpkRCecwnoDzhkzDqyfgfCZsybfrTDURs=;
 b=au4py80HtOAlGmKPbjRjbD1mXcNiWrivnVZWCUpPcv3a86AoJI3hroASPH6WfE07X2
 L7cMeaiTYqNka5Arat+u6RUcoj1llQkTchmO5GqwplfVmGAMwWY/L/ki9ojjUJjcFyC/
 vMG+ulCz0j1NTSVX30Tr5eK98iO+O7XuAGkI6oET7okSjF+UsHu3PmzGFn6PMZhZy+rQ
 P79OvtF4waXs+NYMsYqmBK0u7SsecjZHNGFON80cbkpBCWqn/binaBwfMbz5jKxA3SMo
 jabmD4iKaR3Q65l/a/wNafr6SybMynMTH2ozVqgPfAIO+QC8A007jEw/G74UCnljj6Wj
 6dIA==
X-Gm-Message-State: AO0yUKU+jLRZuzb/BevJW+/AfjXT1rJXCH4ODfsIMGwSGtml1ztank6M
 xtC2i1l4wI39SEEBo9RWk+7XaoEKuxMyHJlgB29nnaQJ1rsAiYTH+XN1+vgvkIahhVT5VxO1DO9
 L5Pfru3+RtIpLTZU=
X-Received: by 2002:a7b:cb01:0:b0:3ea:d611:f8 with SMTP id
 u1-20020a7bcb01000000b003ead61100f8mr9765281wmj.38.1678108479830; 
 Mon, 06 Mar 2023 05:14:39 -0800 (PST)
X-Google-Smtp-Source: AK7set9osapfiODeMLXpTjJaCHsQJCroWAarxO9js35AO26AbNTMl713He913rAsS2o56d8Pb7dGcw==
X-Received: by 2002:a7b:cb01:0:b0:3ea:d611:f8 with SMTP id
 u1-20020a7bcb01000000b003ead61100f8mr9765245wmj.38.1678108479490; 
 Mon, 06 Mar 2023 05:14:39 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 v2-20020adfe282000000b002c7066a6f77sm9772983wri.31.2023.03.06.05.14.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 05:14:39 -0800 (PST)
Date: Mon, 6 Mar 2023 13:14:36 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH RESEND v7 5/9] tests/avocado: Pass parameters to
 migration test
Message-ID: <ZAXnPIfuY2Gyt6nt@work-vm>
References: <20230228192628.26140-1-farosas@suse.de>
 <20230228192628.26140-6-farosas@suse.de>
 <CAFEAcA8p86BdbbO-thyov+A-dc98iygPx6nyCmnxinCRCuKviA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8p86BdbbO-thyov+A-dc98iygPx6nyCmnxinCRCuKviA@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Tue, 28 Feb 2023 at 19:28, Fabiano Rosas <farosas@suse.de> wrote:
> >
> > The migration tests are currently broken for an aarch64 host because
> > the tests pass no 'machine' and 'cpu' options on the QEMU command
> > line.
> >
> > Add a separate class to each architecture so that we can specify
> > 'machine' and 'cpu' options instead of relying on defaults.
> >
> > Add a skip decorator to keep the current behavior of only running
> > migration tests when the qemu target matches the host architecture.
> 
> I still don't understand this patch. Don't we run the
> migration-test on all hosts already? David ?

I don't run the avocado tests.

Dave

> > Signed-off-by: Fabiano Rosas <farosas@suse.de>
> > ---
> >  tests/avocado/migration.py | 83 +++++++++++++++++++++++++++++++++++---
> >  1 file changed, 78 insertions(+), 5 deletions(-)
> >
> > diff --git a/tests/avocado/migration.py b/tests/avocado/migration.py
> > index 4b25680c50..8b2ec0e3c4 100644
> > --- a/tests/avocado/migration.py
> > +++ b/tests/avocado/migration.py
> > @@ -11,6 +11,8 @@
> >
> >
> >  import tempfile
> > +import os
> > +
> >  from avocado_qemu import QemuSystemTest
> >  from avocado import skipUnless
> >
> > @@ -19,7 +21,7 @@
> >  from avocado.utils.path import find_command
> >
> >
> > -class Migration(QemuSystemTest):
> > +class MigrationTest(QemuSystemTest):
> >      """
> >      :avocado: tags=migration
> >      """
> > @@ -62,20 +64,91 @@ def _get_free_port(self):
> >              self.cancel('Failed to find a free port')
> >          return port
> >
> > -
> > -    def test_migration_with_tcp_localhost(self):
> > +    def migration_with_tcp_localhost(self):
> >          dest_uri = 'tcp:localhost:%u' % self._get_free_port()
> >          self.do_migrate(dest_uri)
> >
> > -    def test_migration_with_unix(self):
> > +    def migration_with_unix(self):
> >          with tempfile.TemporaryDirectory(prefix='socket_') as socket_path:
> >              dest_uri = 'unix:%s/qemu-test.sock' % socket_path
> >              self.do_migrate(dest_uri)
> >
> >      @skipUnless(find_command('nc', default=False), "'nc' command not found")
> > -    def test_migration_with_exec(self):
> > +    def migration_with_exec(self):
> >          """The test works for both netcat-traditional and netcat-openbsd packages."""
> >          free_port = self._get_free_port()
> >          dest_uri = 'exec:nc -l localhost %u' % free_port
> >          src_uri = 'exec:nc localhost %u' % free_port
> >          self.do_migrate(dest_uri, src_uri)
> > +
> > +
> > +@skipUnless('aarch64' in os.uname()[4], "host != target")
> > +class Aarch64(MigrationTest):
> > +    """
> > +    :avocado: tags=arch:aarch64
> > +    :avocado: tags=machine:virt
> > +    :avocado: tags=cpu:max
> > +    """
> > +
> > +    def test_migration_with_tcp_localhost(self):
> > +        self.migration_with_tcp_localhost()
> > +
> > +    def test_migration_with_unix(self):
> > +        self.migration_with_unix()
> > +
> > +    def test_migration_with_exec(self):
> > +        self.migration_with_exec()
> > +
> > +
> > +@skipUnless('x86_64' in os.uname()[4], "host != target")
> > +class X86_64(MigrationTest):
> > +    """
> > +    :avocado: tags=arch:x86_64
> > +    :avocado: tags=machine:pc
> > +    :avocado: tags=cpu:qemu64
> > +    """
> > +
> > +    def test_migration_with_tcp_localhost(self):
> > +        self.migration_with_tcp_localhost()
> > +
> > +    def test_migration_with_unix(self):
> > +        self.migration_with_unix()
> > +
> > +    def test_migration_with_exec(self):
> > +        self.migration_with_exec()
> > +
> > +
> > +@skipUnless('ppc64le' in os.uname()[4], "host != target")
> > +class PPC64(MigrationTest):
> > +    """
> > +    :avocado: tags=arch:ppc64
> > +    :avocado: tags=machine:pseries
> > +    :avocado: tags=cpu:power9_v2.0
> > +    """
> > +
> > +    def test_migration_with_tcp_localhost(self):
> > +        self.migration_with_tcp_localhost()
> > +
> > +    def test_migration_with_unix(self):
> > +        self.migration_with_unix()
> > +
> > +    def test_migration_with_exec(self):
> > +        self.migration_with_exec()
> > +
> > +
> > +@skipUnless('s390x' in os.uname()[4], "host != target")
> > +class S390X(MigrationTest):
> > +    """
> > +    :avocado: tags=arch:s390x
> > +    :avocado: tags=machine:s390-ccw-virtio
> > +    :avocado: tags=cpu:qemu
> > +    """
> > +
> > +    def test_migration_with_tcp_localhost(self):
> > +        self.migration_with_tcp_localhost()
> > +
> > +    def test_migration_with_unix(self):
> > +        self.migration_with_unix()
> > +
> > +    def test_migration_with_exec(self):
> > +        self.migration_with_exec()
> > --
> > 2.35.3
> 
> thanks
> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


