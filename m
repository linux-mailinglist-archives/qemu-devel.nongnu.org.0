Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F71551576
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 12:10:12 +0200 (CEST)
Received: from localhost ([::1]:36602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3EMF-0000gN-TF
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 06:10:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o3EIf-0007Be-TI
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 06:06:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o3EId-0005Vk-6y
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 06:06:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655719586;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L5RKrfPpYYRSdPHBPwdJLW/eVR7eHBYdoYlkUvyWejQ=;
 b=ARZt8he8Ht+DjLED5zx4ygoBncXkd7uCrndj3OO0JC0pn+UEvoxjM3wDubRvtA1G+nYBqP
 MuC1+UvOoI5gMAC3Pi+O72psN2SCBgnuE7BlBE2Y+8lTHcAsBQsgsbCWsq5E1CuP/I6IML
 OW6dgGJu3QDHLa2eCPiHN8UB46DFwFc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-363-cStsaEA_Pai9h9ATPzaSbA-1; Mon, 20 Jun 2022 06:06:23 -0400
X-MC-Unique: cStsaEA_Pai9h9ATPzaSbA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D078E80013E;
 Mon, 20 Jun 2022 10:06:22 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 050A940314B;
 Mon, 20 Jun 2022 10:06:21 +0000 (UTC)
Date: Mon, 20 Jun 2022 11:06:19 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Cc: selinux@lists.fedoraproject.org, QEMU <qemu-devel@nongnu.org>,
 rmetrich@redhat.com
Subject: Re: qemu-ga guest-exec & SELinux
Message-ID: <YrBGm4Aar1DMmy1H@redhat.com>
References: <CAJ+F1C+8y2yNjf4GHirtHSxGASPHy9n7u++39WDhcgDn2p_M8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ+F1C+8y2yNjf4GHirtHSxGASPHy9n7u++39WDhcgDn2p_M8Q@mail.gmail.com>
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

On Mon, Jun 20, 2022 at 01:44:05PM +0400, Marc-André Lureau wrote:
> Hi!
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=2093355 ("AVCs when trying to
> execute a command through qemu-ga ("guest-exec" command)") describes an
> issue with fedora/rhel SELinux rules, where some program executions are
> denied.
> 
> qemu-ga has "virt_qemu_ga_t" context, and is not allowed to execute
> binaries that are not "bin_t", iiuc. The suggestion from Renaud Métrich is
> for qemu-ga exec command to launch the user program through an helper
> program that would have the virt_qemu_ga_unconfined_exec_t context, and
> appropriate rules in selinux (similar to fsfreeze-hook rules), so any
> program can be executed. qemu-ga would thus ship and use that helper, in
> all OS, to avoid varying code paths.
> 
> Does that sound reasonable or should we try to find a solution with SELinux
> rules instead?

I thought was did not allow qemu-ga to execute binaries at all, regardless
of whether they're bin_t or not.  The 'guest-exec' command is essentially
a giant hole that defeats the purpose of confining qemu-ga with SELinux
at all IMHO.

IMHO execution of external commands should only be allowed after toggling
a SELinux boolean tunable.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


