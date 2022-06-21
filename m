Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1A4552E5D
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 11:33:02 +0200 (CEST)
Received: from localhost ([::1]:48928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3aFp-0004rq-BG
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 05:33:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o3aDb-0003z2-LT
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 05:30:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o3aDX-0005TI-QR
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 05:30:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655803838;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OOR67iOv+V65UQnAcD0sUqLvXmUJPDA3pjwBJvZiINk=;
 b=baX7lKsf3JfE2UEshTSJ3pUCdF3a56OlVxa1c/MTpqV2HS8ypxmkn4r2CvrnQEh85mbEbX
 0uXBw25huWoN0o6X5jTVad5IPLtJrnHo+jzc6IEw/TOdHoDMDEqRf2x1YQ/lfKKftOHfxm
 Ls8nAzAYPsRXCx0fMAQPqj0nWbivaOQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-258-9OROf7XyPJ2QNT_0KCS8wQ-1; Tue, 21 Jun 2022 05:30:37 -0400
X-MC-Unique: 9OROf7XyPJ2QNT_0KCS8wQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE991801756;
 Tue, 21 Jun 2022 09:30:36 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 08A17141510C;
 Tue, 21 Jun 2022 09:30:35 +0000 (UTC)
Date: Tue, 21 Jun 2022 10:30:33 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Renaud =?utf-8?Q?M=C3=A9trich?= <rmetrich@redhat.com>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 selinux@lists.fedoraproject.org, QEMU <qemu-devel@nongnu.org>
Subject: Re: qemu-ga guest-exec & SELinux
Message-ID: <YrGPuSm5J7gUiIl+@redhat.com>
References: <CAJ+F1C+8y2yNjf4GHirtHSxGASPHy9n7u++39WDhcgDn2p_M8Q@mail.gmail.com>
 <YrBGm4Aar1DMmy1H@redhat.com>
 <330400e6-5a5f-7f59-b93c-0a3dd5ce47b6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <330400e6-5a5f-7f59-b93c-0a3dd5ce47b6@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

On Tue, Jun 21, 2022 at 10:42:39AM +0200, Renaud Métrich wrote:
> Hi there,
> 
> I'm the BZ reporter.
> 
> I think the safe solution is to provide something similar to what was done
> for vmtools: have a context switching to become sort of "unconfined" domain.
> 
> This context switch has to happen only the executor and we already have a
> solution, I documented it in the BZ.
> 
> I don't think having an additional boolean is necessary, unless we want to
> restrict the commands the guest can execute.

If we allow QGA to execute arbitrary commands, running those commands
unconfined_t, then what is the point of having any SELinux policy
for QGA at all. It can just execute "/bin/sh" or "/bin/perl", passing
any script commands it wants, having them run as unconfined_t and thus
escape all SELinux confinement of QGA.

I didn't realize that we in fact already allowed runing any command
labelled bin_t. That already makes the QGA policy useless as a security
measure and should be addressed IMHO by putting that existing rul;e
behind a boolean, defaulting to disabled.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


