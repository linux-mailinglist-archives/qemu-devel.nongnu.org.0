Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B00D5365DA
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 18:19:12 +0200 (CEST)
Received: from localhost ([::1]:39062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nucgB-0002rW-IW
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 12:19:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nucFQ-000865-JV
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:51:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nucFK-0005Q9-O9
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:51:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653666686;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ppAwhcz54/VgdXrtIqTFH5ayy5mbevuQZHN6HxgLqa8=;
 b=DnyebwvUOSXB7LLPqhrmkErFODXXk4k+rcFcn/YgosegsVznetUw09VxBxuDdxXTgEbGfI
 U2hZ2JMUcZB5Y+rU8P72+QIv+B6lfvSN05iHomHRa0KQ2yTopepRuH30APrFOImDeFXZLK
 pqK1yk/CYMFiJh8Q8tbsnvBaTAYHUiQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-600-nM0qFAEbMXKBbmeurNI6dQ-1; Fri, 27 May 2022 11:51:23 -0400
X-MC-Unique: nM0qFAEbMXKBbmeurNI6dQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5896D3801157;
 Fri, 27 May 2022 15:51:22 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.86])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B51DC1410DD5;
 Fri, 27 May 2022 15:51:19 +0000 (UTC)
Date: Fri, 27 May 2022 16:51:17 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, fam@euphon.net, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Luigi Rizzo <rizzo@iet.unipi.it>,
 Giuseppe Lettieri <g.lettieri@iet.unipi.it>,
 Vincenzo Maffione <v.maffione@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH  v1 11/33] tests/docker: update debian-amd64 with lcitool
Message-ID: <YpDzdb5Lt02PqrJu@redhat.com>
References: <20220527153603.887929-1-alex.bennee@linaro.org>
 <20220527153603.887929-12-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220527153603.887929-12-alex.bennee@linaro.org>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Fri, May 27, 2022 at 04:35:41PM +0100, Alex Bennée wrote:
> The one minor wrinkle we need to account for is the netmap support
> still requires building from source. We also include cscope and GNU
> global as they are used in one of the builds.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Cc: Luigi Rizzo <rizzo@iet.unipi.it>
> Cc: Giuseppe Lettieri <g.lettieri@iet.unipi.it>
> Cc: Vincenzo Maffione <v.maffione@gmail.com>
> ---
>  .gitlab-ci.d/containers.yml                  |   3 +-
>  tests/docker/dockerfiles/debian-amd64.docker | 194 ++++++++++++++-----
>  tests/lcitool/refresh                        |  19 ++
>  3 files changed, 164 insertions(+), 52 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


> +# Netmap still needs to be manually built as it is yet to be packaged
> +# into a distro. We also add cscope and gtags which are used in the CI
> +# test
> +debian11_extras = [
> +    "# netmap/cscope/global\n",
> +    "RUN DEBIAN_FRONTEND=noninteractive eatmydata \\\n",
> +    "  apt install -y --no-install-recommends \\\n",
> +    "  cscope\\\n",
> +    "  global\\\n",
> +    "  linux-headers-amd64\n",
> +    "RUN git clone https://github.com/luigirizzo/netmap.git /usr/src/netmap\n",
> +    "RUN cd /usr/src/netmap && git checkout v11.3\n",
> +    "RUN cd /usr/src/netmap/LINUX && ./configure --no-drivers --no-apps --kernel-dir=$(ls -d /usr/src/linux-headers-*-amd64) && make install\n",

This will result in many layers bloating the image a little.

We could optimize it with approximately
[
  RUN export DEBIAN_FRONTEND=noninteractive && \
  eatmydata apt install -y --no-install-recommends \
    cscope \
    global \
    linux-headers-amd64 &&
  git clone https://github.com/luigirizzo/netmap.git /usr/src/netmap && \
  cd /usr/src/netmap && \
  git checkout v11.3 && \0
  cd LINUX && \
  ./configure --no-drivers --no-apps --kernel-dir=$(ls -d /usr/src/linux-headers-*-amd64) && \
  make install && \
  cd / && \
  rm -rf /usr/src/netmap &&
  eatmydata apt remove cscope global linux-headers-amd64

(untested)

Essentially this means we only add 1 layer to the docker image
and it only contains the final binary bits

Still, what you have is what already exists in tree, so on
that basis

  Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
  

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


