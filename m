Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A315C04C0
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 18:53:20 +0200 (CEST)
Received: from localhost ([::1]:48820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob2yM-00075u-Cv
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 12:53:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ob2w0-00051t-SJ
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 12:50:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ob2vx-0007sW-Uk
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 12:50:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663779048;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rGUg9eaE4Xn3faFg7EwSOSMv/gvNBmjodT9pDnGRrrE=;
 b=W5Dw2pRp9QN1HcOJcm6ypelJNsvrfwS2tT5WEl2PIXCqJzFnagEp90WtVhgdNDN/nutA71
 pg0ABpA6xfDQScDCuESNNMvpM98h9/mqhtJVrY3Gi3W90f45DHYMiymGJ2ux3mk+Z27Yd/
 dM2sMCH8IvRCsUtU9669IkCS74KGc9Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-LusvOuPaNq6ku4y4AZP3qw-1; Wed, 21 Sep 2022 12:50:45 -0400
X-MC-Unique: LusvOuPaNq6ku4y4AZP3qw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1246A857FAB;
 Wed, 21 Sep 2022 16:50:45 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1ECAA40C6EC2;
 Wed, 21 Sep 2022 16:50:42 +0000 (UTC)
Date: Wed, 21 Sep 2022 17:50:40 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 26/39] tests/qtest: migration-test: Make sure QEMU
 process "to" exited after migration is canceled
Message-ID: <YytA4Bq+SQRi/NPS@redhat.com>
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
 <20220920103159.1865256-27-bmeng.cn@gmail.com>
 <Yys8A46EUx9AiuVe@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yys8A46EUx9AiuVe@work-vm>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 21, 2022 at 05:29:55PM +0100, Dr. David Alan Gilbert wrote:
> * Bin Meng (bmeng.cn@gmail.com) wrote:
> > From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> > 
> > Make sure QEMU process "to" exited before launching another target
> > for migration in the test_multifd_tcp_cancel case.
> > 
> > Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Hmm you might want to put a small usleep in that loop; otherwise
> it'll burn CPU.
> 
> There is a slim risk with this that another, entirely unrelated, process 
> will start up with the same PID between the end of migrate_cancel
> and then you'll be spinning on it rather than the 'to' qemu.
> 
> I wonder if there's a better way to check for it dieing; e.g. an error
> on it's qmp interface or something?

Both the qtest and qmp sockets should give EOF. So if there's an API
that can call g_poll() on the FD with POLL_HUP event, it would be the
reliable way to detect it, without busy-looping.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


