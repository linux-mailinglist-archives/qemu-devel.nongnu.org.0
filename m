Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5EE54F4B0
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 11:56:51 +0200 (CEST)
Received: from localhost ([::1]:58966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o28if-0007TJ-Ru
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 05:56:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o28cB-0005kM-0m
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 05:50:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o28c5-0001XN-1H
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 05:50:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655459397;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8kylTe9dWC4cC4SI5PQt95stM3F3ln7OxOXtB9+kS3s=;
 b=YkfJ11qU85UKczonCYgFtDrgK8rlnD1VlxfIv3UG20BJ7Wma/Yc0Ovm6Q8zOpGnrfVmGDn
 6jzdS1+x6ToiCFVS1cx6kD9EgjJ1um8kBC81JwCV0ShbqHTRh4Q9+QQnuzKdnJsQmVGm/W
 8Ewk30KY5m6IkEZWIeVxBn9tqVdxD+I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-451-YY6Tmyh8PAmXJLhjRbxCKQ-1; Fri, 17 Jun 2022 05:49:53 -0400
X-MC-Unique: YY6Tmyh8PAmXJLhjRbxCKQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3704F185A794;
 Fri, 17 Jun 2022 09:49:53 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.139])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 81C624619F3;
 Fri, 17 Jun 2022 09:49:50 +0000 (UTC)
Date: Fri, 17 Jun 2022 10:49:48 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Cc: John Snow <jsnow@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Beraldo Leal <bleal@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 03/10] qga: treat get-guest-fsinfo as "best effort"
Message-ID: <YqxOPI4L/oMcgY0y@redhat.com>
References: <20220616142659.3184115-1-jsnow@redhat.com>
 <20220616142659.3184115-4-jsnow@redhat.com>
 <CAJ+F1C+iHv-RvnbvUikD431tNN8PJ+Z=EO0Hgi8Dht-sX1OKBQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ+F1C+iHv-RvnbvUikD431tNN8PJ+Z=EO0Hgi8Dht-sX1OKBQ@mail.gmail.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 16, 2022 at 06:35:44PM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Thu, Jun 16, 2022 at 6:27 PM John Snow <jsnow@redhat.com> wrote:
> 
> > In some container environments, there may be references to block devices
> > witnessable from a container through /proc/self/mountinfo that reference
> > devices we simply don't have access to in the container, and could not
> > provide information about.
> >
> > Instead of failing the entire fsinfo command, return stub information
> > for these failed lookups.
> >
> > This allows test-qga to pass under docker tests, which are in turn used
> > by the CentOS VM tests.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  qga/commands-posix.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> > index 0469dc409d4..5989d4dca9d 100644
> > --- a/qga/commands-posix.c
> > +++ b/qga/commands-posix.c
> > @@ -1207,7 +1207,13 @@ static void build_guest_fsinfo_for_device(char
> > const *devpath,
> >
> >      syspath = realpath(devpath, NULL);
> >      if (!syspath) {
> > -        error_setg_errno(errp, errno, "realpath(\"%s\")", devpath);
> > +        if (errno == ENOENT) {
> > +            /* This devpath may not exist because of container config,
> > etc. */
> > +            fprintf(stderr, "realpath(%s) returned NULL/ENOENT\n",
> > devpath);
> >
> 
> qga uses g_critical() (except for some win32 code paths atm)
> 
> 
> > +            fs->name = y
> >
> 
> Hmm, maybe we should make the field optional instead.

In my own testing, this method is called in various scenarios.
Some example:

  devpath==/sys/dev/block/253:0
  syspath==/sys/devices/virtual/block/dm-0

    => fs->name == dm-0

  devpath==/sys/devices/virtual/block/dm-0/slaves/nvme0n1p4
  syspath==/sys/devices/pci0000:00/0000:00:1d.0/0000:02:00.0/nvme/nvme0/nvme0n1/nvme0n1p4

    => fs->name == nvme0n1p4

  devpath==/sys/dev/block/259:2
  syspath==/sys/devices/pci0000:00/0000:00:1d.0/0000:02:00.0/nvme/nvme0/nvme0n1/nvme0n1p2

    => fs->name == nvme0n1p2

We set fs->name from  basename(syspath)

If the realpath call fails, we could use  basename(devpath). That
would sometimes give the correct answer, and in other types it
would at least give the major:minor number, which an admin can
manually correlate if desired via /proc/partitions.

If we want to be really advanced, we could just open /proc/partitions
and resolve the proper name ourselves, but that's probably overkill

  basename(sysfspath)

is better than g_strdup("??\?-ENOENT")  IMHO

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


