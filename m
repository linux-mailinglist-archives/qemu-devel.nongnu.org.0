Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F35C521280
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 12:45:14 +0200 (CEST)
Received: from localhost ([::1]:41898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noNMf-0004FJ-BY
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 06:45:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1noN58-0007T2-54
 for qemu-devel@nongnu.org; Tue, 10 May 2022 06:27:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1noN53-0002qT-Qm
 for qemu-devel@nongnu.org; Tue, 10 May 2022 06:27:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652178420;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=DEE04/z8lroXAieKBWtQK2+/O8Hfb1P9lkzYO1aoG58=;
 b=ipWLpZflfrqLvZAKQShRCg07Ah19uMuGdzZ4jI5sNh0L0HG+jGCSIC2AWgynqtjJDZaJpM
 xnLMdkVhpsCMSv/zQO0L1RXh58/1AycAis4dU0MZ6AamPTryH8CDsAEqTZ0aWrW+WNXzkY
 bbK4zCBu4Pa5jSze7zZ8i/67I5/DF2E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-219-UkbSoCU4MAOLhkmXiEA2gw-1; Tue, 10 May 2022 06:26:59 -0400
X-MC-Unique: UkbSoCU4MAOLhkmXiEA2gw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 30F82100BAAD
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 10:26:59 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.168])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4ECA5C27EAB;
 Tue, 10 May 2022 10:26:58 +0000 (UTC)
Date: Tue, 10 May 2022 11:26:56 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Victor Toso <victortoso@redhat.com>
Cc: qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [RFC PATCH v1 4/8] qapi: golang: Generate qapi's union types in Go
Message-ID: <Yno98HEL1oqzs0ZP@redhat.com>
References: <20220401224104.145961-1-victortoso@redhat.com>
 <20220401224104.145961-5-victortoso@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220401224104.145961-5-victortoso@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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

On Sat, Apr 02, 2022 at 12:41:00AM +0200, Victor Toso wrote:
> This patch handles QAPI union types and generates the equivalent data
> structures and methods in Go to handle it.
> 
> At the moment of this writing, it generates 67 structures.
> 
> The QAPI union type can be summarized by its common members that are
> defined in a @base struct and a @value. The @value type can vary and
> depends on @base's field that we call @discriminator. The
> @discriminator is always a Enum type.
> 
> Golang does not have Unions. The generation of QAPI union type in Go
> with this patch, follows similar approach to what is done for QAPI
> struct types and QAPI alternate types.

The common way to approach unions in Go is to just use a struct
where each union case is an optional field, and declare that only
one field must ever be set. ie

  type SocketAddressLegacy struct {
        // Value based on @type, possible types:
        Inet *InetSocketAddressWrapper
        Unix *UnixSocketAddressWrapper
        VSock *VsockSocketAddressWrapper
        FD *StringWrapper
  }

When deserializing from JSON we populate exactly one of the
optional fields.

When serializing to JSON process the first field that is
non-nil.

Note, you don't actually need to include the discriminator
as a field at all, since it is implicitly determined by
whichever case is non-nil.  Introducing the discriminator
as a field just provides the possibility for the programmer
to make inconsistent settings, for no gain.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


