Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E9929CF2A
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Oct 2020 10:20:31 +0100 (CET)
Received: from localhost ([::1]:48048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXhd8-0007Sv-OE
	for lists+qemu-devel@lfdr.de; Wed, 28 Oct 2020 05:20:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kXhbb-0006vu-V5
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 05:18:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kXhba-0007En-Bf
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 05:18:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603876733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OwODio9QtbutypCfLRX3TMkLq9nj2hreOcfN+gYtXgI=;
 b=KJvvqUiR0VD+VjD2kX9L8YXLx8+kTHT68T/cGpStdxau34BanT43XgM12eown/gGA08k4d
 FRJlVnx+Zw8xTysf9jicbbLh5ETvjcZmmuMzLaPAIrnp1UvGsS+xy7kwrGuPK9uk4Q7G4D
 9G40eJJ90U/RnkF9qQpevAQhJ31Vp1E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-KlKFwwoCPyaTPxW8YY6sIQ-1; Wed, 28 Oct 2020 05:18:52 -0400
X-MC-Unique: KlKFwwoCPyaTPxW8YY6sIQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EDD6DCFF2C;
 Wed, 28 Oct 2020 09:18:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7133C5B4C5;
 Wed, 28 Oct 2020 09:18:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E3B1F113865F; Wed, 28 Oct 2020 10:18:45 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 4/4] qemu-storage-daemon: QAPIfy --chardev
References: <20201026101005.2940615-1-armbru@redhat.com>
 <20201026101005.2940615-5-armbru@redhat.com>
Date: Wed, 28 Oct 2020 10:18:45 +0100
In-Reply-To: <20201026101005.2940615-5-armbru@redhat.com> (Markus Armbruster's
 message of "Mon, 26 Oct 2020 11:10:05 +0100")
Message-ID: <87wnzazp1m.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/28 01:50:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, marcandre.lureau@redhat.com, qemu-block@nongnu.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> writes:

> From: Kevin Wolf <kwolf@redhat.com>
>
> This removes the dependency on QemuOpts from the --chardev option of
> the storage daemon.
>
> Help on option parameters is still wrong.  Marked FIXME.
>
> There are quite a few differences between qemu-system-FOO -chardev,
> QMP chardev-add, and qemu-storage-daemon --chardev:
[...]
> * Backend type "socket":
[...]
>   - Accidentally different defaults: qemu-system-FOO -chardev defaults
>     to tight=true, QMP chardev-add defaults to tight=false in
>     QMP (this is a bug in commit 776b97d3).  qemu-storage-daemon
>     follows QMP.

It's even worse than that.  I'll start a new thread.

[...]


