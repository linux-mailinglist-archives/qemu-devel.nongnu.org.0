Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48818268427
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Sep 2020 07:40:49 +0200 (CEST)
Received: from localhost ([::1]:40308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHhEO-00055n-Ck
	for lists+qemu-devel@lfdr.de; Mon, 14 Sep 2020 01:40:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kHhCy-0004Vo-NS
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 01:39:20 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:60607
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kHhCw-0007ba-UY
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 01:39:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600061957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gshfXR60jLxTDHcYe5IrbczWjEKXZxju1xPJuz2Ek+8=;
 b=OCBNtzHGF9ycnaD+YO34JajK1of/cqOkLO15CHX9GXWzpzw40mcmAsFq6/mu8f+ypXhjQS
 n6ZOfHSHC1H93lqQENgz+VFA30mw69smLzg8lAPaagv811rLtyYOATpZ0WMq2N2LDGE6fO
 r+GLQU5zbSzCNIl75mPUZTvQ4bQwJSE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-yGNGdn_QNwimY5P1e5s-_A-1; Mon, 14 Sep 2020 01:39:13 -0400
X-MC-Unique: yGNGdn_QNwimY5P1e5s-_A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75817802B7B;
 Mon, 14 Sep 2020 05:39:12 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-134.ams2.redhat.com [10.36.112.134])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BEBC5747B0;
 Mon, 14 Sep 2020 05:39:10 +0000 (UTC)
Subject: Re: Moving to C11? (was Re: Redefinition of typedefs (C11 feature))
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20200911184919.GV1618070@habkost.net>
 <CAFEAcA-dnKVyUQ3_ZifdDvrpCbKB1zciuu224BbB1WRV0npxzw@mail.gmail.com>
 <20200911200649.GW1618070@habkost.net>
 <e2e2a955-693d-1372-f2e2-c58b7f88d0d7@redhat.com>
 <20200913025151.GX1618070@habkost.net>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <329a1ae1-7b74-4045-3305-0577fcbb447a@redhat.com>
Date: Mon, 14 Sep 2020 07:39:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200913025151.GX1618070@habkost.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=205.139.110.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/14 01:39:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.695,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/09/2020 04.51, Eduardo Habkost wrote:
> On Sat, Sep 12, 2020 at 08:45:19AM +0200, Thomas Huth wrote:
>> On 11/09/2020 22.06, Eduardo Habkost wrote:
>>> On Fri, Sep 11, 2020 at 08:06:10PM +0100, Peter Maydell wrote:
>>>> On Fri, 11 Sep 2020 at 19:49, Eduardo Habkost <ehabkost@redhat.com> wrote:
>>>>>
>>>>> I'm wondering: do our supported build host platforms all include
>>>>> compilers that are new enough to let us redefine typedefs?
>>>>>
>>>>> The ability to redefine typedefs is a C11 feature which would be
>>>>> very useful for simplifying our QOM boilerplate code.  The
>>>>> feature is supported by GCC since 2011 (v4.6.0)[1], and by clang
>>>>> since 2012 (v3.1)[2].
>>>>
>>>> In configure we mandate either GCC v4.8 or better, or
>>>> clang v3.4 or better, or XCode Clang v5.1 or better
>>>> (Apple uses a different version numbering setup to upstream).
>>>> So you should probably double-check that that xcode clang has
>>>> what you want, but it looks like we're good to go otherwise.
>>>
>>> Can anybody confirm if the following is accurate?
>>>
>>> https://gist.github.com/yamaya/2924292#file-xcode-clang-vers-L67
>>> # Xcode 5.1 (5B130a)
>>> Apple LLVM version 5.1 (clang-503.0.38) (based on LLVM 3.4svn)
>>> Target: x86_64-apple-darwin13.1.0
>>> Thread model: posix
>>>
>>> If we know we have GCC 4.8+ or clang 3.4+, can we move to C11 and
>>> start using -std=gnu11?
>>
>> You don't have to switch to gnu11, redefintions of typedefs are already
>> fine in gnu99, they are a gnu extension there to the c99 standard.
>>
>> See also:
>> https://git.qemu.org/?p=qemu.git;a=commitdiff;h=7be41675f7cb16b
>>
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg585581.html
> 
> They still trigger a warning with gnu99 on clang:
> 
> $ clang --version
> clang version 10.0.0 (Fedora 10.0.0-2.fc32)
> Target: x86_64-unknown-linux-gnu
> Thread model: posix
> InstalledDir: /usr/bin
> $ cat test.c
> typedef struct A A;
> typedef struct A A;
> $ clang -std=gnu11 -c test.c
> $ clang -std=gnu99 -c test.c
> test.c:2:18: warning: redefinition of typedef 'A' is a C11 feature [-Wtypedef-redefinition]
> typedef struct A A;

Ah, right, I forgot about that ... so for clang, we silence that warning
via CFLAGS in the configure script. See commit e6e90feedb706b1.

 Thomas


