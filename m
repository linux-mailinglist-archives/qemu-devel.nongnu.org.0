Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DC8358384
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 14:44:09 +0200 (CEST)
Received: from localhost ([::1]:44084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUU11-0007Wl-IE
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 08:44:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lUTwx-00066a-NS
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 08:39:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lUTwu-0002rv-88
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 08:39:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617885590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eLGmKoAhpOIqUZ562hxhQQkQAt6nuqREzQ8HKOHdAN0=;
 b=KO12CdPqkoasZjzuXko7qsLqmH6tGRH245Ak5doxRSOS6T2gmeQIDEdrAmUSEZgo/xxR8D
 by8zAzVa94ur+5LYY0gfh5XsYy7cdomaW1Ij1Y05yZMS9hsJV7verCIFfqyzQjam2iOx9l
 kr/Dx7zjErIIme9rEgLLOYb4p5QTocg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-bwFIs9FiPM2U2kO5-T-Dhg-1; Thu, 08 Apr 2021 08:39:49 -0400
X-MC-Unique: bwFIs9FiPM2U2kO5-T-Dhg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B9CDBBEE2;
 Thu,  8 Apr 2021 12:39:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E7D1160864;
 Thu,  8 Apr 2021 12:39:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4E4681132D66; Thu,  8 Apr 2021 14:39:46 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH v2 00/11] qemu_iotests: improve debugging options
References: <20210407135021.48330-1-eesposit@redhat.com>
 <87wntdchbw.fsf@dusky.pond.sub.org>
 <d580fb77-7e50-7af6-ad03-c28c94cd36f1@redhat.com>
Date: Thu, 08 Apr 2021 14:39:46 +0200
In-Reply-To: <d580fb77-7e50-7af6-ad03-c28c94cd36f1@redhat.com> (Emanuele
 Giuseppe Esposito's message of "Thu, 8 Apr 2021 13:15:12 +0200")
Message-ID: <875z0xar1p.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

> On 08/04/2021 10:26, Markus Armbruster wrote:
>> Emanuele Giuseppe Esposito <eesposit@redhat.com> writes:
>> 
>>> This series adds the option to attach gdbserver and valgrind
>>> to the QEMU binary running in qemu_iotests.
>>> It also allows to redirect QEMU binaries output of the python tests
>>> to the stdout, instead of a log file.
>>>
>>> Patches 1-6 introduce the -gdb option to both python and bash tests,
>>> 7-10 extend the already existing -valgrind flag to work also on
>>> python tests, and patch 11 introduces -p to enable logging to stdout.
>>>
>>> In particular, patches 1,2,4,8 focus on extending the QMP socket timers
>>> when using gdb/valgrind, otherwise the python tests will fail due to
>>> delays in the QMP responses.
>>>
>>> This series is tested on the previous serie
>>> "qemu-iotests: quality of life improvements"
>>> but independent from it, so it can be applied separately.
>>>
>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> 
>> How discoverable are these goodies for developers with only superficial
>> knowledge of iotests?
>> 
>
> Not really sure what you mean, but
>
> ./check --help now shows:
>
>> -p         enable prints
>> -gdb       start gdbserver with $GDB_QEMU options. Default is localhost:12345
>
> Which I guess should be clear enough? Btw two-three weeks ago I didn't 
> know anything about these tests either.
>
> I agree I can make -p more clear, saying "enable qemu binary prints to 
> stdout", and move -valgrind to the "optional arguments" instead of 
> "bash-only"

Yes, please (this is not a demand).

docs/devel/testing.rst section "QEMU iotests" is the place to explain
things in more detail than --help, if that's useful.  Right now it
simply points to check -h.


