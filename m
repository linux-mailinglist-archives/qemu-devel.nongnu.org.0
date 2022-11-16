Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B39D62C089
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 15:08:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovJ4Y-0008Ee-M4; Wed, 16 Nov 2022 09:07:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ovJ4S-00088z-JJ
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 09:07:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ovJ4A-0005uY-1B
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 09:07:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668607611;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=liCUNvbe6ReKeyBXZHMYEgAPns4Z7yYLYTXbJgHrJEc=;
 b=EgCIJI3+h0p4RW5uLcP7do40RC/JEdRA+50QamAP2hIa+VsLyHRUdo4JR73mNHzrWAbej3
 GjFFZgLwGk7roLPy7nEXK3BAIqvhhwIcDJUzVd/vrVPMOM0Bi7HNY4m0m4ZJQLIqJNcefg
 WYPZXzskmXzNZcaZAoRazfzKFxkTwy4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-CHqAE70dNKeAiYP7GCf9GA-1; Wed, 16 Nov 2022 09:06:48 -0500
X-MC-Unique: CHqAE70dNKeAiYP7GCf9GA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF3C91C087A8;
 Wed, 16 Nov 2022 14:06:47 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6431A40C2086;
 Wed, 16 Nov 2022 14:06:46 +0000 (UTC)
Date: Wed, 16 Nov 2022 14:06:44 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, alex.bennee@linaro.org,
 philmd@redhat.com, crosa@redhat.com, wainersm@redhat.com,
 bleal@redhat.com, bakulinm@ispras.ru
Subject: Re: [PATCH] tests/avocado: using several workers while testing
Message-ID: <Y3TuYPX/RFLgbLRC@redhat.com>
References: <166860649008.1258000.17066080427505400235.stgit@pasha-ThinkPad-X280>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <166860649008.1258000.17066080427505400235.stgit@pasha-ThinkPad-X280>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Nov 16, 2022 at 04:48:10PM +0300, Pavel Dovgalyuk wrote:
> From: bakulinm <bakulinm@gmail.com>
> 
> make check-avocado takes a lot of time, and avocado since version 91 has
> multithreaded mode for running several tests simultaneously.
> This patch allows to run "make check-avocado -j" to use all cores or,
> for example, "make check-avocado -j4" to select number of workers to use.
> By default ("make check-avocado") only one worker is used.
> 
> Changes:
> 1) Version of avocado in requirements.txt upgraded from 88.1 to <93
>  (LTS version is used, as mentioned here
>   https://avocado-framework.readthedocs.io/en/latest/releases/lts/92_0.html )
> 2) Makefile 4.1 (used in e.g. Ubuntu 18.04) doesn't provide number of jobs
>  in $MAKEFLAGS, so python script from here
>  https://stackoverflow.com/a/67247743/5936122 is used.


> diff --git a/tests/jobs.py b/tests/jobs.py
> new file mode 100644
> index 0000000000..a339192d97
> --- /dev/null
> +++ b/tests/jobs.py
> @@ -0,0 +1,42 @@

No license information or attribution put on this code that
you've said was directly copied from stackoverflow. AFAICT,
all content on stackoverflow is placed under the creative
commons license. This is not something we would generally
want to be applied to code in QEMU as that's generally
considered as a content license.

Unless the copied code is trivial (this case is not), then
stackoverflow should really only be used a learning resource,
and then code written from scratch without copying, so it
can be placed under the project's usual license.

> +import argparse, os
> +import sys
> +
> +def safe_int(s):
> +    try:
> +        return int(s)
> +    except:
> +        return -1
> +
> +class JobserverArgs:
> +    known_names = ["jobserver-fds","jobserver-auth"]
> +    def __init__(self):
> +        self.fds = "-1,-1"
> +
> +    @staticmethod
> +    def from_argv():
> +        ja = JobserverArgs()
> +        parser = argparse.ArgumentParser()
> +        for name in JobserverArgs.known_names:
> +            parser.add_argument('--'+name, dest="fds")
> +        parser.parse_known_args(namespace=ja)
> +        return ja
> +
> +    def get_fds(self):
> +        return tuple([safe_int(fd) for fd in (self.fds+",").split(",")][:2])
> +
> +fd_in, fd_out = JobserverArgs.from_argv().get_fds()
> +
> +if fd_in == -1 or fd_out == -1:
> +# if no jobserver is used, but -j is present, use total number of cpu cores
> +    if '-j' in sys.argv:
> +        print(os.cpu_count())
> +# use single thread
> +    else:
> +        print(1)
> +else:
> +    os.set_blocking(fd_in, False)
> +
> +    tokens = os.read(fd_in, 1024)
> +    os.write(fd_out, tokens)
> +
> +    print(len(tokens)+1)
> \ No newline at end of file
> diff --git a/tests/requirements.txt b/tests/requirements.txt
> index 0ba561b6bd..3b8c4d4706 100644
> --- a/tests/requirements.txt
> +++ b/tests/requirements.txt
> @@ -2,5 +2,5 @@
>  # in the tests/venv Python virtual environment. For more info,
>  # refer to: https://pip.pypa.io/en/stable/user_guide/#id1
>  # Note that qemu.git/python/ is always implicitly installed.
> -avocado-framework==88.1
> +avocado-framework<93
>  pycdlib==1.11.0
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


