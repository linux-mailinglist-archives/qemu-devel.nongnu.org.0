Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD043357E06
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 10:28:01 +0200 (CEST)
Received: from localhost ([::1]:49544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUQ1A-0002uA-9T
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 04:28:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lUQ05-0002Oy-A9
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 04:26:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lUQ02-0005Si-Br
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 04:26:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617870409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dopAHahe8PR2OWUD+uHqQeeU0JnRMjQquH0PLJ//U1U=;
 b=KjhariAOJI6VTyHeMgXF869HcXD2wRNFCwVLm4M/u2T9jH+zUbVxGQYWnDiwOKStyedqmd
 bVVHK62WkGqNqhVKFMzUGp5oKcA2DdpzB4yYZ+h+kYVtnHxoPnyXhAd6xm/gCxNEIXGDI6
 W3HzCYpXKCvn6A9JveVzMyXE23Av6HI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-JnRyIWT6McKhVm62URuFUg-1; Thu, 08 Apr 2021 04:26:46 -0400
X-MC-Unique: JnRyIWT6McKhVm62URuFUg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E9781883521;
 Thu,  8 Apr 2021 08:26:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D954F1037E85;
 Thu,  8 Apr 2021 08:26:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 450C4113865F; Thu,  8 Apr 2021 10:26:43 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH v2 00/11] qemu_iotests: improve debugging options
References: <20210407135021.48330-1-eesposit@redhat.com>
Date: Thu, 08 Apr 2021 10:26:43 +0200
In-Reply-To: <20210407135021.48330-1-eesposit@redhat.com> (Emanuele Giuseppe
 Esposito's message of "Wed, 7 Apr 2021 15:50:10 +0200")
Message-ID: <87wntdchbw.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Emanuele Giuseppe Esposito <eesposit@redhat.com> writes:

> This series adds the option to attach gdbserver and valgrind
> to the QEMU binary running in qemu_iotests.
> It also allows to redirect QEMU binaries output of the python tests
> to the stdout, instead of a log file.
>
> Patches 1-6 introduce the -gdb option to both python and bash tests, 
> 7-10 extend the already existing -valgrind flag to work also on 
> python tests, and patch 11 introduces -p to enable logging to stdout.
>
> In particular, patches 1,2,4,8 focus on extending the QMP socket timers
> when using gdb/valgrind, otherwise the python tests will fail due to
> delays in the QMP responses.
>
> This series is tested on the previous serie
> "qemu-iotests: quality of life improvements"
> but independent from it, so it can be applied separately.
>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

How discoverable are these goodies for developers with only superficial
knowledge of iotests?


