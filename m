Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3C961944B
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 11:18:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqtku-0002w5-UM; Fri, 04 Nov 2022 06:16:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oqtks-0002v5-C1
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 06:16:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oqtkq-0003zQ-7k
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 06:16:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667557011;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ISveDu6ex4tEIg5EhCMNsw5f9kNMuSDvwHJ26eyixdA=;
 b=Zb9sREhR9YhrvTKB4U5UoM9lGp4g4dATTzeA8iMZYkacaog8xw50cl9yKc3Luv7NqaJ1V4
 AO3E5DTHPUdY6MAn8IM5uG3ygl7CxtsM6NvTTG4zHs0IucuNcDmkQiFA5/vCT2irlePl4L
 ICa6Lnfy4EOLs72Xy4TkEKv77vXoSew=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-410-EtbDi1msOS2hjaVphRv8VA-1; Fri, 04 Nov 2022 06:16:47 -0400
X-MC-Unique: EtbDi1msOS2hjaVphRv8VA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 653E486F134;
 Fri,  4 Nov 2022 10:16:47 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5839640C6EE9;
 Fri,  4 Nov 2022 10:16:46 +0000 (UTC)
Date: Fri, 4 Nov 2022 10:16:43 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Drew DeVault <sir@cmpwn.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org,
 Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v3] linux-user: implement execveat
Message-ID: <Y2Tmi8Ni5aYiFR6O@redhat.com>
References: <20221103173212.3724698-1-sir@cmpwn.com>
 <b22ae5f1-41d9-3739-e219-a717b7ab8b98@linaro.org>
 <CO3F6B8K38DE.1OTGB55K8CMB2@taiga>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CO3F6B8K38DE.1OTGB55K8CMB2@taiga>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
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

On Fri, Nov 04, 2022 at 10:55:39AM +0100, Drew DeVault wrote:
> On Fri Nov 4, 2022 at 10:53 AM CET, Philippe Mathieu-Daudé wrote:
> > Splitting this big patch would ease review:
> 
> It's only +165/-131, are you sure it really needs to be split?

IMHO it is a standard best practice that code movement always be
done in a separate commit from bug fixes / new features, regardless
of # lines of code affected. I've seen way too many patches where
bugs have been hidden due code movement / whitespace changes mixed
in, even when the patch was small.

> > 1/ Replace safe_execve() by safe_execveat()
> >
> >     -safe_execve(exec_path, argp, envp))
> >     +safe_execveat(AT_FDCWD, exec_path, argp, envp, 0));
> >
> > 2/ Extract do_execve()
> >
> > 3/ Convert do_execve() to do_execveat() adding dirfd/flags args
> >
> > 4/ Add TARGET_NR_execveat case
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


