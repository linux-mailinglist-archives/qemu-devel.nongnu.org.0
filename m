Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 541CF40C50A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 14:18:31 +0200 (CEST)
Received: from localhost ([::1]:53804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQTry-0007sR-EO
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 08:18:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQTqK-0006Pq-3T
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 08:16:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQTqH-00011t-2x
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 08:16:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631708204;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zgo0xWP8pisT5sFYCU8ij4VtsMvqxOjoevWF/MHnis4=;
 b=CKNVk4pJwbDN115lqG95U8tMEXqY4rJvKVJ4h+LaCM05z64xGk1o6lWMX9uJYfPYwLzZb/
 so11Mip/OHjzLaoomsPj7g/qcHoFUttJwqJdS3kzzL1QQfNKUudYI2sPS7OOo7Z8YtfNnh
 eyUwj17pwyXzWcsuXfEWUfGY/4+HBqg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-IzhQxZr5O4CYt-RPTicZUA-1; Wed, 15 Sep 2021 08:16:37 -0400
X-MC-Unique: IzhQxZr5O4CYt-RPTicZUA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4304019251CB;
 Wed, 15 Sep 2021 12:16:36 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.233])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A536E5D9CA;
 Wed, 15 Sep 2021 12:16:34 +0000 (UTC)
Date: Wed, 15 Sep 2021 13:16:32 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] gitlab-ci: Make more custom runner jobs manual, and
 don't allow failure
Message-ID: <YUHkIOhcV4Z4Iv1P@redhat.com>
References: <20210913101948.12600-1-peter.maydell@linaro.org>
 <CAFEAcA86yjW8oeif4tY7WWzGfXYYV0VuqY+4RV9f_NqAApeeeg@mail.gmail.com>
 <YUGu1PbzB+pzZdjf@redhat.com>
 <CAFEAcA9CjgNrGJN2t40PJW6ZO-fP9R0senq4_G_h_8pmjH5n9Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9CjgNrGJN2t40PJW6ZO-fP9R0senq4_G_h_8pmjH5n9Q@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 15, 2021 at 01:12:23PM +0100, Peter Maydell wrote:
> On Wed, 15 Sept 2021 at 09:29, Daniel P. Berrangé <berrange@redhat.com> wrote:
> > Urgh, my bad, I completely forget this behaviour when reviewing.
> > When we only have
> >
> >   when: manual
> >
> > then the job has to be manually started, and it still contributes
> > to pipeline status, so it /must/ triggered manually.
> >
> > If we want it to be manually started and not contribute to the
> > pipeline status we need:
> >
> >  rules:
> >    ...
> >    when: manual
> >    allow_failure: true
> 
> So there's no way to say "if it is triggered, then it must
> not fail, but if it is not triggered, that's OK" ?

Not that I've found.

> I guess it's not a big deal either way though.
> So the fix is to add back the allow_failure tag to those jobs
> which are manual. I'll send a patch...

Note "allow_failure" is allowed both at the top level of the job
and inside the "rules:". I find it clearer if we put it against
the "rules:" section as shown above.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


