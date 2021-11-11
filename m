Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B8B44D1E4
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 07:19:36 +0100 (CET)
Received: from localhost ([::1]:44868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml3Qt-0000dD-KS
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 01:19:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ml3Ix-0006O3-MV
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 01:11:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ml3Ir-0004j7-6Z
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 01:11:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636611076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YfjMvCSgEZpKpoAWnIRZkxU5PbePFdn8oZmIO2E4v+4=;
 b=Nh14SzRBhM9LoJO2gaqlC2oMdkZQKriE8LH75AwleOu8JCSVuR2QIja02hJ8Tau4tIiR5B
 7vPBw/U8+QzCk4YTqa8uOLQLMN515vn74nKI23U3D/C8KCm1cMDMfdrKlIFuc0dQbixHOv
 oEvoF7z/W0iNfDWKWmKdohmzJAH7QKM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-WXIpIKP5PHCjN5v2wlmFig-1; Thu, 11 Nov 2021 01:11:14 -0500
X-MC-Unique: WXIpIKP5PHCjN5v2wlmFig-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B05DE102CB77
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 06:11:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D3F95C1B4;
 Thu, 11 Nov 2021 06:11:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0A63C11380A7; Thu, 11 Nov 2021 07:11:12 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] qmp: Stabilize preconfig
References: <b31f442d28920447690a6b8cee865bdbacde1283.1635160056.git.mprivozn@redhat.com>
 <87bl3dfg9v.fsf@dusky.pond.sub.org>
 <bb896561-9d0c-6c6c-4bdb-5e7ef5ed71d5@redhat.com>
 <YYAATW1JQmzpDPhu@redhat.com> <87zgqlzmxi.fsf@dusky.pond.sub.org>
 <c4ac9bcc-90ae-302f-d5d4-b95f1419a7a0@redhat.com>
Date: Thu, 11 Nov 2021 07:11:11 +0100
In-Reply-To: <c4ac9bcc-90ae-302f-d5d4-b95f1419a7a0@redhat.com> (Paolo
 Bonzini's message of "Wed, 10 Nov 2021 22:56:23 +0100")
Message-ID: <87pmr7rzls.fsf@dusky.pond.sub.org>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Michal =?utf-8?B?UHLDrXZvem7DrWs=?= <mprivozn@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

>> On 11/3/21 09:02, Markus Armbruster wrote:
>>> I wonder whether we really have to step through three states
>>>
>>>           x-exit-preconfig  cont
>>>      preconfig ---> pre run ---> run
>>>
>>> and not two
>>>
>>>              cont
>>>      pre run ---> run
>
> Devices would be hotplugged between x-exit-preconfig and cont, and

Cold plugged!

> part of the machine until x-exit-preconfig; so there is a need for
> something like x-exit-preconfig.

Can you briefly explain why device_add doesn't work before
x-exit-preconfig and does after?

> In my prototype of a QMP-only binary, the idea would be that there
> wouldn't be a single x-exit-preconfig command, but "cont", 
> "migrate-incoming", "finish-machine-init" (the stable replacement for
> x-exit-preconfig) and "loadvm" would all complete the configuration of 
> the machine.  "finish-machine-init" would do nothing else, the others
> would continue with whatever they were supposed to do.
>
>>> Which of the queries you need work only between x-exit-preconfig and -S?
>> Well before x-exit-preconfig, QMP only permits a very small number
>> of commands - QEMU has loosened that up a bit, but I don't think anyone
>> has checked whether there's enough to cover libvirt's current usage yet.
>
> Indeed I looked at the commands that operate on the backends, but not
> that much at query commands.
>
> Paolo


