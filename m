Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E6C3B1D48
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 17:10:34 +0200 (CEST)
Received: from localhost ([::1]:50766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw4WP-00059G-Q7
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 11:10:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lw4V4-0002I1-KZ
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 11:09:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lw4V2-0000Ti-Ql
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 11:09:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624460948;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JN2LaPG6f+ix8RS2CIzM68EBveSYYqoZwrs9h/z8B6Y=;
 b=OF6P//LIKPfAZOneAJYDwgjE/8YgzywKO1jntH+rcCNm9TJWzQbTUyGWiq4PzgbG9DiqAv
 Qo11XWpE5d5H99Vysu8+DUa5lOju93jkq91l9sEOJzVrhBimFpTUhYV1cbMy1wgR9AD76L
 TdC+5d/o+2Rzb88fplHNtK3KWht8d7A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-s4grTEVzPmWxR0m8-N0Gow-1; Wed, 23 Jun 2021 11:09:04 -0400
X-MC-Unique: s4grTEVzPmWxR0m8-N0Gow-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 578D479EDD
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 15:09:03 +0000 (UTC)
Received: from redhat.com (ovpn-114-176.ams2.redhat.com [10.36.114.176])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E74C760C05;
 Wed, 23 Jun 2021 15:09:01 +0000 (UTC)
Date: Wed, 23 Jun 2021 16:08:59 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: Auditing QEMU to replace NULL with &error_abort
Message-ID: <YNNOi22ZQaKibqSO@redhat.com>
References: <7132e6a4-8d3a-828e-1c08-b17954445341@redhat.com>
 <87k0mk4vyg.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87k0mk4vyg.fsf@dusky.pond.sub.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 23, 2021 at 02:16:55PM +0200, Markus Armbruster wrote:
> &error_abort has been a clear win for us.  &error_fatal too, when used
> judiciously.  Marc-André tried to get both into GLib, unsuccessfully[2].

...snip...

> [2] https://gitlab.gnome.org/GNOME/glib/-/issues/2288

This doesn't actually suggest adding error_abort/fatal to GLib. Rather
it adds a general callback hook to GLib. Biggest complaints there
are around the callback concept and difficulty of safely using it,
which I can't disagree with.

I wonder if we would have more luck if we explicitly proposed the
error_abort/fatal concept to GLib instead. At least that would not
hit any of the complaints raised about the callback.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


