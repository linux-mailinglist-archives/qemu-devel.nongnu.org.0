Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 824EB3716CA
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 16:40:22 +0200 (CEST)
Received: from localhost ([::1]:45910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldZkD-0003JV-BX
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 10:40:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1ldZif-0002Yo-1x
 for qemu-devel@nongnu.org; Mon, 03 May 2021 10:38:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1ldZic-0001Ts-Pj
 for qemu-devel@nongnu.org; Mon, 03 May 2021 10:38:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620052721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uuUnRPeVUA8M2u4vDXVIkMoM6IZK2ppAKUA0ILabg2I=;
 b=MXpSNWvR7sbWFB+4aJbL/8Wk+UKpf+5gzEawRr1hwk/lvfn00XM13pIXxlpmM+r7a2epWi
 0bsxKuuPEVDZb2kdhK2ufP9zeqjGFsbg/v+10ipOR6RP4p08kuraZWAdF0jszh7XpCjSbJ
 mzBBiom/MJU1XGa39gW+sKSFc1Cu51A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-UNoZYiLaOQuU_THwwAoqfA-1; Mon, 03 May 2021 10:38:39 -0400
X-MC-Unique: UNoZYiLaOQuU_THwwAoqfA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E3CB80293C;
 Mon,  3 May 2021 14:38:39 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-107.ams2.redhat.com
 [10.36.114.107])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B4841001901;
 Mon,  3 May 2021 14:38:36 +0000 (UTC)
Subject: Re: [PATCH v3 04/15] qemu-iotests: add option to attach gdbserver
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210414170352.29927-1-eesposit@redhat.com>
 <20210414170352.29927-5-eesposit@redhat.com>
 <e06a8560-641b-bf10-230c-fa99a21998c8@redhat.com>
 <4189f418-ef3f-bb94-585a-5efc95ef1257@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <d9de9b97-d923-5cfa-9396-47a795ed1310@redhat.com>
Date: Mon, 3 May 2021 16:38:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <4189f418-ef3f-bb94-585a-5efc95ef1257@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30.04.21 23:03, Emanuele Giuseppe Esposito wrote:
> 
> 
> On 30/04/2021 13:38, Max Reitz wrote:
>> On 14.04.21 19:03, Emanuele Giuseppe Esposito wrote:
>>> Add -gdb flag and GDB_QEMU environmental variable
>>> to python tests to attach a gdbserver to each qemu instance.
>>
>> Well, this patch doesn’t do this, but OK.
> 
> Maybe "define" rather than "add"? In the sense of defining the "-gdb" 
> option, which is what it actually does.

That’s possible, but I think better would be to contrast it with what 
this patch doesn’t do, but what one could think when reading this 
description.

I.e. to say “Add/define -gdb flag [...] to each qemu instance.  This 
patch only adds and parses this flag, it does not yet add the 
implementation for it.”

>> Out of interest: Why gdbserver and not “just” gdb?  On Fedora, those 
>> are separate packages, so I don’t have gdbserver installed, that’s why 
>> I’m asking.
> 
> As far as I have tried, using only gdb with ./check is very hard to use, 
> because the stdout is filtered out by the script.
> So invoking gdb attaches it to QEMU, but it is not possible to start 
> execution (run command) or interact with it, because of the python 
> script filtering. This leaves the test hanging.
> 
> gdbserver is just something that a gdb client can attach to (for 
> example, in another console or even in another host) for example with 
> the command
> # gdb -iex "target remote localhost:12345" . This provides a nice and 
> separate gdb monitor to the client.

All right.  I thought gdb could be used as a server, too, but...  Looks 
like it can’t.  (Like, I thought, you could do something like
“gdb -ex 'listen localhost:12345' $cmd”.  But seems like there is no 
server built into gdb proper.)

Max


