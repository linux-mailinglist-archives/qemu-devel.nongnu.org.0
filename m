Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B951040005C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 15:20:51 +0200 (CEST)
Received: from localhost ([::1]:55750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM97i-0002mU-N7
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 09:20:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mM8vz-0007E0-6l
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:08:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mM8vs-0001N9-R3
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:08:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630674516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x3io3UvUovjAdfZ7RHRled/vbsNdjTXT+GZWQGvZLjM=;
 b=bcHZnym1GhrcFF9rQGRXly5PX63pm4kqQfqbO41RsydXhkRL7DKFRx40+CCV4URNMu1J1l
 R1W++39RKp88s57vpvodXDmdsUEQrhH4RG36reV3o6z3LR5km0UOhF+ah0ge6WSHjZNpeX
 YKb0Mzcif56QZ9Lvh24pFUW/cK8mwgY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-OppHm1isNkCzM0g-qwWv8w-1; Fri, 03 Sep 2021 09:08:33 -0400
X-MC-Unique: OppHm1isNkCzM0g-qwWv8w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C1816D5C5;
 Fri,  3 Sep 2021 13:08:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 28394779CE;
 Fri,  3 Sep 2021 13:08:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 980A811326BB; Fri,  3 Sep 2021 06:28:09 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Doug Evans <dje@google.com>
Subject: Re: [PATCH] net: Add "info neighbors" command
References: <20210902212015.1303865-1-dje@google.com>
Date: Fri, 03 Sep 2021 06:28:09 +0200
In-Reply-To: <20210902212015.1303865-1-dje@google.com> (Doug Evans's message
 of "Thu, 2 Sep 2021 14:20:15 -0700")
Message-ID: <875yvi2sh2.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_06_12=1.543,
 DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Wang <jasowang@redhat.com>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Doug Evans <dje@google.com> writes:

> This command dumps the ARP and NDP tables maintained within slirp.
> One use-case for it is showing the guest's IPv6 address(es).
>
> Signed-off-by: Doug Evans <dje@google.com>
> ---
>  hmp-commands-info.hx               | 15 +++++++
>  include/net/slirp.h                |  1 +
>  net/slirp.c                        | 15 +++++++
>  tests/acceptance/info_neighbors.py | 69 ++++++++++++++++++++++++++++++
>  4 files changed, 100 insertions(+)
>  create mode 100644 tests/acceptance/info_neighbors.py

Standard request for new HMP commands without corresponding QMP
commands: please state in the commit message why the QMP command is not
worthwhile.

HMP commands without a QMP equivalent are okay if their functionality
makes no sense in QMP, or is of use only for human users.

Example for "makes no sense in QMP": setting the current CPU, because a
QMP monitor doesn't have a current CPU.

Examples for "is of use only for human users": HMP command "help", the
integrated pocket calculator.

Debugging commands are kind of borderline.  Debugging is commonly a
human activity, where HMP is just fine.  However, humans create tools to
assist with their activities, and then QMP is useful.  While I wouldn't
encourage HMP-only for the debugging use case, I wouldn't veto it.


