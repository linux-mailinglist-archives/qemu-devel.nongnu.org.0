Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC3F6F3F2C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 10:36:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptlTS-0004Jc-H4; Tue, 02 May 2023 04:35:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ptlTP-0004JF-Px
 for qemu-devel@nongnu.org; Tue, 02 May 2023 04:34:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ptlTN-0007Wi-58
 for qemu-devel@nongnu.org; Tue, 02 May 2023 04:34:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683016494;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=dNb05neDA0G7+NZBFrkmlPxF+fbsRCcS+/aUaS79SRQ=;
 b=GJxdz88ZZ0aPyXRKmXQSYJjG1m13+idCSlS/heG0t0At+xmuefTDAuuQ+XNSEHihvpCLlC
 FuDW4bVQZCPo3gsAIq3xADZ80BALRML5roEsspZgI2XB0oIKhfD43CALyzS+3HPnL7vfBR
 EjCeO1TxBERBhxxMmyA9Rr3WUogWxqM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-igoMNhpYNJGpzgYn-CYVHQ-1; Tue, 02 May 2023 04:34:53 -0400
X-MC-Unique: igoMNhpYNJGpzgYn-CYVHQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F4403806709;
 Tue,  2 May 2023 08:34:53 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C8C640F2D4B;
 Tue,  2 May 2023 08:34:48 +0000 (UTC)
Date: Tue, 2 May 2023 09:34:31 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v3] meson: Pass -j option to sphinx
Message-ID: <ZFDLF2nPKdvQ1Mho@redhat.com>
References: <20230428150102.13114-1-farosas@suse.de>
 <12c1fa01-9c1d-9af7-71eb-e9103346d0af@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <12c1fa01-9c1d-9af7-71eb-e9103346d0af@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Sat, Apr 29, 2023 at 02:33:17PM +0200, Paolo Bonzini wrote:
> On 4/28/23 17:01, Fabiano Rosas wrote:
> > Also make sure our plugins support parallelism and report it properly
> > to sphinx. Particularly, implement the merge_domaindata method in
> > DBusDomain that is used to merge in data from other subprocesses.
> > 
> > before:
> >    $ time make man html
> >    ...
> >    [1/2] Generating docs/QEMU manual with a custom command
> >    [2/2] Generating docs/QEMU man pages with a custom command
> > 
> >    real    0m43.157s
> >    user    0m42.642s
> >    sys     0m0.576s
> > 
> > after:
> >    $ time make man html
> >    ...
> >    [1/2] Generating docs/QEMU manual with a custom command
> >    [2/2] Generating docs/QEMU man pages with a custom command
> > 
> >    real    0m25.014s
> >    user    0m51.288s
> >    sys     0m2.085s
> 
> The 'nproc' fallback will potentially cause twice #CPUs processes to be
> active, since sphinx will run in parallel with everything else.
> 
> Is this result with "-j auto", and if so with which computer?  If the
> speedup is only 2x as it seems to be from the "time" above, I'd rather have
> "-j 2" only so that sphinx doesn't risk killing the machine...

Why would it kill the machine ? If there are two sphinx processes
concurrent, thus overcomitting available CPUs, the scheduler will
just end up giving them shorter timeslice OS. Given that the
sphinx parallelism seems to be very bursty when I monitored it,
I think having the high CPU counts is justified. The times when
both sphinx processes need all 8/16/whatever CPUs is relatively
unlikely to clash for prolonged periods.

What could kill the machine is if the RAM usage was excessive,
but I would thing we would see that already if it were a problem.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


