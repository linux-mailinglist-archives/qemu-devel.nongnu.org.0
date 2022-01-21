Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FC449628D
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 17:02:16 +0100 (CET)
Received: from localhost ([::1]:36156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAwMh-0005as-O8
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 11:02:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nAwF5-0006uK-Ct
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 10:54:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nAwF2-0003q1-7w
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 10:54:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642780458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xxrIugyTb1nCS291u2v5fFwhAX28rIKKs19PU8yzisQ=;
 b=AmhxNgYCb0DR5MJPhgQ0buvAM3lw4M4MV2/SIjKCKWhuboLGlQUIXCG/2G+UZclBu73exs
 CNiDtO4O+f1LzjduOQCZ7NM2ARD+DGRVpC1lSf91Le1eDZh/fbeFjSHeGH4oQ2Z+yjijEJ
 zwbhq+91WY6g5s0pgE+nB1u9LHb+mX0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-oHdBN9SSMTmrGTx_7srEyQ-1; Fri, 21 Jan 2022 10:54:15 -0500
X-MC-Unique: oHdBN9SSMTmrGTx_7srEyQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A48D83DD20;
 Fri, 21 Jan 2022 15:54:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 481CF798B7;
 Fri, 21 Jan 2022 15:54:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C97BB1136421; Fri, 21 Jan 2022 16:54:02 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Fabian Ebner <f.ebner@proxmox.com>
Subject: Re: [PATCH v7 0/4] VNC-related HMP/QMP fixes
References: <20211021100135.4146766-1-s.reiter@proxmox.com>
 <87fssl3emb.fsf@dusky.pond.sub.org>
 <87r1c5lz4s.fsf@dusky.pond.sub.org>
 <17e5677f-b20d-7b48-5946-54297ebf9780@proxmox.com>
Date: Fri, 21 Jan 2022 16:54:02 +0100
In-Reply-To: <17e5677f-b20d-7b48-5946-54297ebf9780@proxmox.com> (Fabian
 Ebner's message of "Fri, 21 Jan 2022 14:20:50 +0100")
Message-ID: <87y2392ig5.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Wolfgang Bumiller <w.bumiller@proxmox.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fabian Ebner <f.ebner@proxmox.com> writes:

> Am 28.10.21 um 21:37 schrieb Markus Armbruster:
>> Markus Armbruster <armbru@redhat.com> writes:
>> 
>
> ----8<----
>
>> diff --git a/qapi/ui.json b/qapi/ui.json
>> index 5292617b44..39ca0b5ead 100644
>> --- a/qapi/ui.json
>> +++ b/qapi/ui.json
>> @@ -69,8 +69,10 @@
>>     'base': { 'protocol': 'DisplayProtocol',
>>               'password': 'str' },
>>     'discriminator': 'protocol',
>> -  'data': { 'vnc': 'SetPasswordOptionsVnc',
>> -            'spice': 'SetPasswordOptionsSpice' } }
>> +  'data': { 'vnc': { 'type': 'SetPasswordOptionsVnc',
>> +                     'if': 'CONFIG_VNC' },
>> +            'spice': { 'type': 'SetPasswordOptionsSpice',
>> +                       'if': 'CONFIG_SPICE' } } }
>>     ##
>>   # @SetPasswordOptionsSpice:
>> @@ -155,7 +157,8 @@
>>     'base': { 'protocol': 'DisplayProtocol',
>>               'time': 'str' },
>>     'discriminator': 'protocol',
>> -  'data': { 'vnc': 'ExpirePasswordOptionsVnc' } }
>> +  'data': { 'vnc': { 'type': 'ExpirePasswordOptionsVnc',
>> +                     'if': 'CONFIG_VNC' } } }
>>   
>
> So I decided to give the #ifdef approach a go, but if I configure with
> --disable-spice --disable-vnc, even with the above conditionals, it is 
> still be possible to issue a set_password qmp command, which will then
> lead to an abort() in the generated code (and the patched 
> qmp_set_password below would do the same if it could be reached):
>
> Thread 1 (Thread 0x7f4a86701ec0 (LWP 40487) "qemu-system-x86"):
> #0  __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
> #1  0x00007f4a90d72537 in __GI_abort () at abort.c:79
> #2  0x00005583ca03cef3 in visit_type_SetPasswordOptions_members
>  (v=v@entry=0x5583cc6cccc0, obj=obj@entry=0x7ffe5bfc3ee0, 
> errp=errp@entry=0x0) at qapi/qapi-visit-ui.c:71
> #3  0x00005583ca5df72f in qmp_marshal_set_password (args=<optimized
>  out>, ret=<optimized out>, errp=0x7f4a85d96ea0) at 
> qapi/qapi-commands-ui.c:49
> #4  0x00005583ca5e89e9 in do_qmp_dispatch_bh (opaque=0x7f4a85d96eb0)
>  at ../qapi/qmp-dispatch.c:129
> #5  0x00005583ca605494 in aio_bh_call (bh=0x7f4a78009270) at
>  ../util/async.c:141
>
> Is that expected? Should I add a conditional for {set,expire}_password
> in the schema too, and add an
> #if defined(CONFIG_SPICE) || defined(CONFIG_VNC)
> around the whole {hmp,qmp}_{set,expire}_password
> functions/declarations in C?

I can have a closer look.  To make it easy, tell me how I can pull your
patches, or, if that's inconvenient for you, send them to me.

> Or maybe that's a good indication that it's really not worth it ;)?

Possibly.

> P.S. Thank you for the QAPI-related explanation in the other mail!

You're welcome!


