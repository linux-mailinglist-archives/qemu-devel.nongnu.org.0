Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 468D934A71E
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 13:28:25 +0100 (CET)
Received: from localhost ([::1]:49890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPlZf-0004sO-Ro
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 08:28:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lPlYW-0004SA-7T
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 08:27:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lPlYT-000726-40
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 08:27:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616761627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oONaYpSu4T3jDdleohnF2uCgl/jO3tzt6RYutf82dBE=;
 b=YxuODgKY9AkUjsKKxzxBoo3flVhqjM6CLZo8XE7txpaV6McsIFah3Phbk6KWdAHH+2iHG6
 JYiKVqcIfDk8Rlr1K0mzXD7tbhSsDyrMzK0Pu4byhrHZk/yWN0SxPqMBxitQyMU0kZsJXs
 wOgFxdN9oJQZjXuRXAf1wzQLZf+IQRs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-gEP7nR-AM52GGekJuwogNQ-1; Fri, 26 Mar 2021 08:27:05 -0400
X-MC-Unique: gEP7nR-AM52GGekJuwogNQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D45E87A82A;
 Fri, 26 Mar 2021 12:27:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B75A919727;
 Fri, 26 Mar 2021 12:27:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4091C11327E1; Fri, 26 Mar 2021 13:27:02 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH for-6.0] qapi: qom: do not use target-specific conditionals
References: <20210326100357.2715571-1-pbonzini@redhat.com>
 <87r1k2tc70.fsf@dusky.pond.sub.org>
 <87a68ae5-74fc-cb36-f78e-d40128a23e3c@redhat.com>
Date: Fri, 26 Mar 2021 13:27:02 +0100
In-Reply-To: <87a68ae5-74fc-cb36-f78e-d40128a23e3c@redhat.com> (Paolo
 Bonzini's message of "Fri, 26 Mar 2021 12:49:35 +0100")
Message-ID: <87o8f6qew9.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 26/03/21 11:57, Markus Armbruster wrote:
>>>         'rng-random':                 'RngRandomProperties',
>>>         'secret':                     'SecretProperties',
>>>         'secret_keyring':             'SecretKeyringProperties',
>>> -      'sev-guest':                  { 'type': 'SevGuestProperties',
>>> -                                      'if': 'defined(CONFIG_SEV)' },
>>> +      'sev-guest':                  'SevGuestProperties',
>>>         'throttle-group':             'ThrottleGroupProperties',
>>>         'tls-creds-anon':             'TlsCredsAnonProperties',
>>>         'tls-creds-psk':              'TlsCredsPskProperties',
>> No branch for tag value 'pef-guest', i.e. no tag-specific members.
>> There are two more: can_bus, s390_pv_guest.  I assume this is
>> intentional.
>
> Yes, they have no properties.
>
>> Links a bit of dead code into the other qemu-system-FOO, but that's
>> okay.
>> If we genuinely needed (or wanted) target-dependent -object, we'd
>> split
>> qom-target.json off qom.json, and put the target-dependent parts there,
>> including the enum and the union, with the obvious ripple effects.  Not
>> now, maybe not ever.
>> Would adding "only for CONFIG_MUMBLE" to the doc comments make
>> sense?
>> It's what we did before we had 'if'.
>
> In this specific case we had not documentation at all for objects.

... until Kevin added some when he QAPIfied.  Looks like this (copied
from qemu-qmp-ref.7)[*]:

   SevGuestProperties (Object)
       Properties for sev-guest objects.

   Members
       sev-device: string (optional)
              SEV device to use (default: "/dev/sev")

       dh-cert-file: string (optional)
              guest owners DH certificate (encoded with base64)

       session-file: string (optional)
              guest owners session parameters (encoded with base64)

       policy: int (optional)
              SEV policy value (default: 0x1)

       handle: int (optional)
              SEV firmware handle (default: 0)

       cbitpos: int (optional)
              C-bit location in page table entry (default: 0)

       reduced-phys-bits: int
              number  of  bits  in  physical addresses that become unavailable
              when SEV is enabled

   Since
       2.12

   If
       defined(CONFIG_SEV)

Your patch drops the last three lines, without a replacement.

>                                                                     We
> can add the information on relevant targets in the documentation for
> the *Properties types.

Yes, please.

Preferably with that squashed in:
Reviewed-by: Markus Armbruster <armbru@redhat.com>


[*] I lied.  It actually looks like

   If
       defined(CONFIG_SEV).SS ObjectType (Enum)

The running together of "defined(CONFIG_SEV)" and ".SS ObjectType
(Enum)" is a bug.  I'll investigate.


