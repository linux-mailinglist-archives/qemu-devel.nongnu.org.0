Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E68341BEF
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 13:06:07 +0100 (CET)
Received: from localhost ([::1]:41326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNDtG-00014Z-5s
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 08:06:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lNDqs-0008W8-2W
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 08:03:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lNDqp-0005y6-6l
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 08:03:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616155414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X8vpHL/3mD6SxS/B4iCCZD3oKOKvuVAi2nVFI2qwVBQ=;
 b=J2cViaT79vodXB8WMN1AUt04igcfKSduhTmtlwEEoBhMVA8oOrHdUxx5+xtuXkjQXGhKmJ
 xZkSjbCoR8PclWFHMHrFYItDSow0khqgjjbyjVve8r+hlVA+vD9cyp8Qwaw/rHvzOORWnI
 R9j4y1qu0P35qXJ9H/gr2oQ3lyywoUQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-wLBXHbaQMG24qEBXgSzSkw-1; Fri, 19 Mar 2021 08:03:32 -0400
X-MC-Unique: wLBXHbaQMG24qEBXgSzSkw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34DDA87504E;
 Fri, 19 Mar 2021 12:03:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 07AC75C1BB;
 Fri, 19 Mar 2021 12:03:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8E84811386A7; Fri, 19 Mar 2021 13:03:29 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: Misleading configure failure GLIB_SIZEOF_SIZE_T
References: <87v99oiq13.fsf@dusky.pond.sub.org>
 <CAFEAcA8597jFxaNLdwEtM0Q9o6Wjx1JrGdeaePkkEDJz5-Y=ow@mail.gmail.com>
 <87zgyzmqg3.fsf@dusky.pond.sub.org>
 <a404bba1-1635-c173-c882-71f3aaab743e@redhat.com>
Date: Fri, 19 Mar 2021 13:03:29 +0100
In-Reply-To: <a404bba1-1635-c173-c882-71f3aaab743e@redhat.com> (Paolo
 Bonzini's message of "Fri, 19 Mar 2021 12:29:25 +0100")
Message-ID: <87zgyzl59q.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. =?utf-8?Q?Berrang?= =?utf-8?Q?=C3=A9?=" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 19/03/21 10:40, Markus Armbruster wrote:
>>      $ cc -std=gnu99 -Wall -m64 -mcx16 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv -o config-temp/qemu-conf.exe config-temp/qemu-conf.c -m64
>>      $ echo $?
>>      0
>> The test program doesn't actually need libc, so not having
>> glibc-static
>> installed doesn't bother the linker.
>
> I guess the bug is that the invocation does not use -static?

I totally missed that %-}

With -static, cc fails nicely:

    $ cc -std=gnu99 -Wall -m64 -mcx16 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv -o config-temp/qemu-conf.exe config-temp/qemu-conf.c -m64 -static
    /usr/bin/ld: cannot find -lc
    collect2: error: ld returned 1 exit status

Good.  Next test: I install glibc-static and uninstall glib2-static.

    $ ./config.status 

    ERROR: sizeof(size_t) doesn't match GLIB_SIZEOF_SIZE_T.
           You probably need to set PKG_CONFIG_LIBDIR
           to point to the right pkg-config files for your
           build target

*Boing*


