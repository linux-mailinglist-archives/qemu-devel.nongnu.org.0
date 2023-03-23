Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B3B6C6B84
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 15:50:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfMFJ-0004om-2Q; Thu, 23 Mar 2023 10:48:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pfMFG-0004oZ-Oh
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 10:48:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pfMFD-0006VS-Lx
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 10:48:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679582926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=EpSvuQHfaW8TSP00AVFonKR2Y9iU2wHj4zVxxZemmKI=;
 b=ifuwFH52lfpoh+u0veaY8plYSOoZr/+VWxxurU5Mxe0EcV06oIVCv9GyBxC3n40FiaL7yH
 aaaNdc7BzmAhZUacXAGdPShcb2vxQn1qxVgLy+v8QXBd+YsnYPOLABmkW92Dg0vhB1mr9U
 MW25IFB8Ul/NYXXgSlcCl1kmyQbAWs4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-fjAb-ak9Ng-8tSp1f2ZqwQ-1; Thu, 23 Mar 2023 10:48:44 -0400
X-MC-Unique: fjAb-ak9Ng-8tSp1f2ZqwQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B86038221C8;
 Thu, 23 Mar 2023 14:48:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 114EB463DFB;
 Thu, 23 Mar 2023 14:48:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E4B9E21E6926; Thu, 23 Mar 2023 15:48:41 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?utf-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>,
 Victor Toso <victortoso@redhat.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: qapi: [RFC] Doc comment convention for @arg: sections
Date: Thu, 23 Mar 2023 15:48:41 +0100
Message-ID: <87v8irv7zq.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The QAPI schema doc comment language provides special syntax for command
and event arguments, struct and union members, alternate branches,
enumeration values, and features: "sections" starting with @arg:.

By convention, we format them like this:

    # @arg: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
    #       do eiusmod tempor incididunt ut labore et dolore magna
    #       aliqua.

Okay for names as short as "name", but we have much longer ones.  Their
description gets squeezed against the right margin, like this:

    # @dirty-sync-missed-zero-copy: Number of times dirty RAM synchronization could
    #                               not avoid copying dirty pages. This is between
    #                               0 and @dirty-sync-count * @multifd-channels.
    #                               (since 7.1)

The description is effectively 50 characters wide.  Easy enough to read,
but awkward to write.

The awkward squeeze against the right margin makes people go beyond it,
which produces two undesirables: arguments about style, and descriptions
that are unnecessarily hard to read, like this one:

    # @postcopy-vcpu-blocktime: list of the postcopy blocktime per vCPU.  This is
    #                           only present when the postcopy-blocktime migration capability
    #                           is enabled. (Since 3.0)

Ugly, too.

I'd like to change the convention to

    # @arg:
    #     Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
    #     do eiusmod tempor incididunt ut labore et dolore magna aliqua.

    # @dirty-sync-missed-zero-copy:
    #     Number of times dirty RAM synchronization could not avoid
    #     copying dirty pages.  This is between 0 and @dirty-sync-count
    #     * @multifd-channels.  (since 7.1)

    # @postcopy-vcpu-blocktime:
    #     list of the postcopy blocktime per vCPU.  This is only present
    #     when the postcopy-blocktime migration capability is
    #     enabled.  (Since 3.0)

We may want to keep short descriptions one the same line, like

    # @multifd-bytes: The number of bytes sent through multifd (since 3.0)

We could instead do

    # @arg: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
    #     do eiusmod tempor incididunt ut labore et dolore magna aliqua.

Another option would be

    # @arg:
    # Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
    # eiusmod tempor incididunt ut labore et dolore magna aliqua.

or even

    # @arg: Lorem ipsum dolor sit amet, consectetur adipiscing elit,
    # sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

but I find these less readable.

A bulk reformatting of doc comments will mess up git-blame, which will
be kind of painful[*].  But so is the status quo.

Thoughts?



[*] Yes, I'm aware of (and grateful for) --ignore-rev & friends.  It's
still kind of painful.


