Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEACE39195C
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 15:59:07 +0200 (CEST)
Received: from localhost ([::1]:55756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llu3p-0005CH-8y
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 09:59:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1llu2T-0004Ug-8O
 for qemu-devel@nongnu.org; Wed, 26 May 2021 09:57:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1llu2R-0006eZ-ID
 for qemu-devel@nongnu.org; Wed, 26 May 2021 09:57:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622037454;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ET+n7zJ6+79jdo/del87aZsDKTKzfc5hYmJ1dq1Igwo=;
 b=SVL1jMHTUbzstMgvg/BMGMNxUAvld8O6BhZl+3z51X8olzRai2xgEQrnB9+9MfsIn9YB6r
 PvTVXwOwNbh4aP49CrPxPrkXQ9pMq4sPKjtHpzyH6qTxVRCco/am5YeOQluLNcn5fD0jf7
 PJNHv3QdjLcYqtBCYObkqBnGkoFHtw0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-iJgz3Aq1OeejjeofQRZ-bA-1; Wed, 26 May 2021 09:57:27 -0400
X-MC-Unique: iJgz3Aq1OeejjeofQRZ-bA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63E411854E2A;
 Wed, 26 May 2021 13:57:26 +0000 (UTC)
Received: from redhat.com (ovpn-115-19.ams2.redhat.com [10.36.115.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DD2975D9C6;
 Wed, 26 May 2021 13:57:24 +0000 (UTC)
Date: Wed, 26 May 2021 14:57:21 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Doug Evans <dje@google.com>
Subject: Re: RFC: IPv6 hostfwd command line syntax [was Re: [PATCH v6 2/4]
 util/qemu-sockets.c: Split host:port parsing out of inet_parse]
Message-ID: <YK5TweOui5bwJ6vl@redhat.com>
References: <20210415033925.1290401-1-dje@google.com>
 <20210415033925.1290401-3-dje@google.com>
 <CAJ+F1CJUzAbZmfY59x6YYLWba-TMyZYwW7Pqu75zs93qbscr3Q@mail.gmail.com>
 <CADPb22TW5GkwcF_08R1KBr+NKBGLOHBwFqHPOJKVgiDa6w2VKA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADPb22TW5GkwcF_08R1KBr+NKBGLOHBwFqHPOJKVgiDa6w2VKA@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 25, 2021 at 12:37:21PM -0700, Doug Evans wrote:
> Hi.
> 
> I want to confirm the command line syntax y'all want for ipv6 host
> forwarding.
> 
> IIUC, the command line syntax is required to be consistent with the use of
> "ipv6=on|off" elsewhere.
> Can you confirm that's correct?
> 
> If so, how does one apply "ipv6=on" to the "::60022-:22" hostfwd spec in
> the following example:
> 
> $ qemu-system-x86_64 [...] --nic user,id=n1,model=e1000,hostfwd=::60022-:22
> 
> ?

Probably easier if we start from the HMP  hostfwd_add command which takes

  hostfwd_add  ::60022-:22

With that, adding the flags is obvious

  hostfwd_add  ::60022-:22,ipv6=on|off,ipv4=on|off

IIUC, that can be handled in the slirp_hostfwd() method impl.

The question is then how this works on the CLI. IIUC ,the "hostfwd=XXX"
ARG value is passed to slirp_hostfwd() eventually, so the change for
the HMP parsing will "just work".

The complication is that the comma is ambiguous between the --net arg
parsing, and the hostfwd parsing. So you would end up having to escape
the commas (ie replace , with ,,):

 --nic user,id=n1,model=e1000,hostfwd=::60022-:22,,ipv6=on,,ipv4=on

If you forget to escape the commas, then the flag ends up applying
to the --nic instead, where ipv4/ipv6 are indeed value for other
reasons.

This kind of sucks, but that's where we are with the old fashioned
design of --nic parsing


Not sure if someone else has better ideas here ?

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


