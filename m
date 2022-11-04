Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4BD619534
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 12:14:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqudT-0001Nf-3F; Fri, 04 Nov 2022 07:13:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oqudQ-0001NV-Pw
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 07:13:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oqudL-0004gJ-5K
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 07:13:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667560389;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8KDJ1RJq8F1kD9O1rJJ5VIgVidhcPnJhr49kpA9tapE=;
 b=Av4aHjp7ftlJPwzAj2pmgD2oScCVf1g2ooadDB17ADRzlz3WZW0ZWh3XUkwXOp/GUoAGi1
 gsJ/xOFgbwpwGBr5NITv75JqyFZY/cbCs8AO3n1A9RL0QbNHlup/rQtDu5Ec7T8hABfQQj
 FnoSD/znVVZM1DkX4z5Y6La9aynv2Mk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-240-tUDirOa8OLCZG3s77sxoiw-1; Fri, 04 Nov 2022 07:13:06 -0400
X-MC-Unique: tUDirOa8OLCZG3s77sxoiw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6877A800B23;
 Fri,  4 Nov 2022 11:13:06 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D9F3403160;
 Fri,  4 Nov 2022 11:13:04 +0000 (UTC)
Date: Fri, 4 Nov 2022 11:13:02 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] tests/qtest: netdev: test stream and dgram backends
Message-ID: <Y2Tzvp5Z+bSBdTBj@redhat.com>
References: <20221104092236.184792-1-lvivier@redhat.com>
 <Y2TeNFBUnwW9XZBk@redhat.com>
 <680deee3-ccf7-b32c-2dfe-189ab02463d4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <680deee3-ccf7-b32c-2dfe-189ab02463d4@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Fri, Nov 04, 2022 at 11:58:29AM +0100, Laurent Vivier wrote:
> On 11/4/22 10:41, Daniel P. Berrangé wrote:
> ...
> > > +static void test_stream_unix(void)
> > > +{
> > > +    QTestState *qts0, *qts1;
> > > +    char *expect;
> > > +    gchar *path;
> > > +    int ret;
> > > +
> > > +    ret = g_file_open_tmp("netdev-XXXXXX", &path, NULL);
> > > +    g_assert_true(ret >= 0);
> > > +    close(ret);
> > 
> > This is creating a zero length plain file, and then paassing
> > that as a path for the UNIX socket.
> > 
> > This is pretty dubious and only works because the code will
> > be doing 'unlink' on the path. Just delete this as there's
> > no reason to pre-create anything on disk for UNIX sockets.
> > 
> 
> The idea here is to generate a path for the socket and to be sure this path
> is actually not already in use.

Create a temporary directory, and let it create a socket inside
that dir ?

> The same for the abstract one, how to be sure we are not running the same
> test concurrently and select a different unix name?

I guess creating the temp file gives you an indirect guarantee, because
we know the tempfile path will be transformed to an abstract socket path
by twiddling byte 0 to NUL.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


