Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2EA401DAA
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 17:33:34 +0200 (CEST)
Received: from localhost ([::1]:59568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNGcn-000104-87
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 11:33:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mNGbi-0008Fg-SH
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 11:32:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mNGbh-0002Fp-5v
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 11:32:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630942344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7Hq5JstX+g17Mg7XXxITiBVdafju0/Ho48db/Z0+J4o=;
 b=Cix9kWyxsSGpTkjRjo+ixhUFdFAZNjK6CzIFljM2BXcLNlH/W8Guy5fT5EaIA2P2Xki3qX
 B2FJirN/Dv3eBrgzko41wmOUV11cprQHrDesLb/7wHTzEWF6XGsd10s4i3c11e3gwtjKCC
 kAbGZcYtn8LGMuVSJFy/ZMVkgNY20jM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-cbglug9vMPak8PkoaXZgww-1; Mon, 06 Sep 2021 11:32:20 -0400
X-MC-Unique: cbglug9vMPak8PkoaXZgww-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7535107ACCD
 for <qemu-devel@nongnu.org>; Mon,  6 Sep 2021 15:32:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B90E45C22B;
 Mon,  6 Sep 2021 15:32:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4A2771138606; Mon,  6 Sep 2021 17:32:18 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v3 0/6] qapi: Add support for aliases
References: <20210812161131.92017-1-kwolf@redhat.com>
Date: Mon, 06 Sep 2021 17:32:18 +0200
In-Reply-To: <20210812161131.92017-1-kwolf@redhat.com> (Kevin Wolf's message
 of "Thu, 12 Aug 2021 18:11:25 +0200")
Message-ID: <8735qhd8jh.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> This series introduces alias definitions for QAPI object types (structs
> and unions).
>
> This allows using the same QAPI type and visitor even when the syntax
> has some variations between different external interfaces such as QMP
> and the command line.
>
> It also provides a new tool for evolving the schema while maintaining
> backwards compatibility (possibly during a deprecation period).
>
> The first user is intended to be a QAPIfied -chardev command line
> option, for which I'll send a separate series. A git tag is available
> that contains both this series and the chardev changes that make use of
> it:
>
>     https://repo.or.cz/qemu/kevin.git qapi-alias-chardev-v3

Review complete.  Let's discuss my findings, decide what we'd rather
improve on top, then see whether the remainder needs a respin.

> v3:
> - Mention the new functions in the big comment in visitor.h. However,
>   since the comment is about users of the visitor rather than the
>   generated code, it seems like to wrong place to go into details.
> - Updated commit message for patch 3 ('Simplify full_name_nth() ...')
> - Patch 4 ('qapi: Apply aliases in qobject-input-visitor'):
>     - Multiple matching wildcard aliases are considered conflicting now
>     - Improved comments for several functions
>     - Renamed bool *implicit_object into *is_alias_prefix, which
>       describes better what it is rather than what it is used for
>     - Simplified alias_present() into input_present()
>     - Fixed potential use of wrong StackObject in error message
> - Patch 5 ('qapi: Add support for aliases'):
>     - Made QAPISchemaAlias a QAPISchemaMember
>     - Check validity of alias source paths (must exist in at least one
>       variant, no optional objects in the path of a wildcard alias, no
>       alias loops)

I love this one, thanks!

> - Many new tests cases, both positive and negative, including unit tests
>   of the generated visit functions

Tests look good now.

> - Coding style changes
> - Rebased documentation (.txt -> .rst conversion in master)

[...]


