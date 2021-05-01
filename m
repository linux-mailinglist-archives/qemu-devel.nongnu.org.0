Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 879B93705CF
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 08:04:24 +0200 (CEST)
Received: from localhost ([::1]:40582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcijn-0007h1-D1
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 02:04:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lciit-0007I2-Rw
 for qemu-devel@nongnu.org; Sat, 01 May 2021 02:03:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lciir-0001ut-AA
 for qemu-devel@nongnu.org; Sat, 01 May 2021 02:03:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619849004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DEcMKJx1ajYF3IPF9lYHFGdtv7/nGIQcyUfat3bSDzU=;
 b=VRwmJ8qr/gxKq0z47j+JZ8BoA0/ELkO2SorMXTtM5BUPUx0taLqlVLycmx/EIoRnl/V2h7
 LNtYEA1dJatNOWRdt3LYh6iQ86N0CZTAJ1mNcKAkGrcvIs1HyeiUDi2Xk3OoINydFShzRJ
 iG+5Vf1qI6jefNvT/MUq7tA3urD1Ev0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-323h78-cMMycZ64gczFghQ-1; Sat, 01 May 2021 02:03:20 -0400
X-MC-Unique: 323h78-cMMycZ64gczFghQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A94D6801B12;
 Sat,  1 May 2021 06:03:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 793795D9CC;
 Sat,  1 May 2021 06:03:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F326A113525D; Sat,  1 May 2021 08:03:17 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] coverity-scan: list components, move model to
 scripts/coverity-scan
References: <20210430145220.303801-1-pbonzini@redhat.com>
 <CAFEAcA_snF5tQ5VaO=t=o9cz4HPm9ECRpaOLDWbkXW=zcVtiuA@mail.gmail.com>
Date: Sat, 01 May 2021 08:03:17 +0200
In-Reply-To: <CAFEAcA_snF5tQ5VaO=t=o9cz4HPm9ECRpaOLDWbkXW=zcVtiuA@mail.gmail.com>
 (Peter Maydell's message of "Fri, 30 Apr 2021 15:59:44 +0100")
Message-ID: <87k0ojkn2y.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 30 Apr 2021 at 15:52, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>> Place all files that can be useful to rebuild the Coverity
>> configuration in scripts/coverity-scan: the existing model
>> file, and the components setup.
>>
>> The Markdown syntax was tested with Pandoc (but in any case
>> is meant more as a human-readable reference than as a part
>> of documentation).
>>
>> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>  scripts/coverity-scan/COMPONENTS.md           | 154 ++++++++++++++++++
>>  .../model.c}                                  |   0
>>  2 files changed, 154 insertions(+)
>>  create mode 100644 scripts/coverity-scan/COMPONENTS.md
>>  rename scripts/{coverity-model.c => coverity-scan/model.c} (100%)
>
> MAINTAINERS has a section
>
> # Coverity model
> # M: Markus Armbruster <armbru@redhat.com>
> # S: Supported
> # F: scripts/coverity-model.c
>
> which needs updating for the file move.

With that:
Reviewed-by: Markus Armbruster <armbru@redhat.com>

> Should we just combine that with the following section?
> # Coverity Scan integration
> # M: Peter Maydell <peter.maydell@linaro.org>
> # S: Maintained
> # F: scripts/coverity-scan/

I can review model patches, but I know nothing about the Coverity Scan
integration.  You do.

As is, MAINTAINERS reflects this split in expertise.  Combining the two
sections loses that.  Do we care?

> Otherwise
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>


