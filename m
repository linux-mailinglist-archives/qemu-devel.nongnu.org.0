Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2508E6B244C
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 13:38:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paFWG-0005Ux-5c; Thu, 09 Mar 2023 07:37:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1paFWB-0005RS-J6
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 07:37:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1paFW9-0000i5-0c
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 07:37:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678365426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HHUpYliYbNM0ar953jdy3cmScV6iBG+lB2rO+KjyLgw=;
 b=fq77UN/8Jn7V2tHUw2cq9tbI0I19qEdWBLLCgHlTKKq1LvJKRXV51cNFAZ++axaaPwAOn8
 4twa4PM1z66TbZrqo6lX6sDEdTvieD6AFf0HT4XYFhHIZcSuN1IF7Cj2BEsXKBbWA7UJ5Z
 UzOs4UtzsZ/fB8pnZKL4G0BisfLMMbk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-17-ZRd5PR4hP8C5b4IWIZGmdQ-1; Thu, 09 Mar 2023 07:37:02 -0500
X-MC-Unique: ZRd5PR4hP8C5b4IWIZGmdQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 638BC800B23;
 Thu,  9 Mar 2023 12:37:02 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.92])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 39FA32026D4B;
 Thu,  9 Mar 2023 12:37:02 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 16C3321E6A1F; Thu,  9 Mar 2023 13:37:01 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org,  Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH v3] qapi: give available enum values as error hint
References: <20230307145825.2544850-1-marcandre.lureau@redhat.com>
 <877cvrxs81.fsf@pond.sub.org>
 <CAMxuvawh0vwZrjnqiMs9atGpXVst5ew6FjBpcEWhsanJDHCUwA@mail.gmail.com>
Date: Thu, 09 Mar 2023 13:37:01 +0100
In-Reply-To: <CAMxuvawh0vwZrjnqiMs9atGpXVst5ew6FjBpcEWhsanJDHCUwA@mail.gmail.com>
 (=?utf-8?Q?=22Marc-Andr=C3=A9?= Lureau"'s message of "Wed, 8 Mar 2023
 17:59:59 +0400")
Message-ID: <87r0tynlsi.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> writes:

> Hi
>
> On Wed, Mar 8, 2023 at 5:55=E2=80=AFPM Markus Armbruster <armbru@redhat.c=
om> wrote:
>
>> marcandre.lureau@redhat.com writes:
>>
>> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> >
>> > This allows for a more pleasant user experience.
>> >
>> > Before:
>> > $ ./qemu-system-x86_64 -display egl-headless,gl=3D
>> > qemu-system-x86_64: -display egl-headless,gl=3D: Parameter 'gl' does n=
ot accept value ''
>> >
>> > After:
>> > $ ./qemu-system-x86_64 -display egl-headless,gl=3D
>> > qemu-system-x86_64: -display egl-headless,gl=3D: Parameter 'gl' does n=
ot accept value ''
>> > Acceptable values are 'off', 'on', 'core', 'es'
>> >
>> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>>
>> Nice improvement here.
>>
>> Slightly ugly:
>>
>>     $ qemu-system-x86_64 -nic bad
>>     upstream-qemu: -nic bad: Parameter 'type' does not accept value 'bad'
>>     Acceptable values are 'none', 'nic', 'user', 'tap', 'l2tpv3', 'socke=
t', 'stream', 'dgram', 'vde', 'bridge', 'hubport', 'netmap', 'vhost-user', =
'vhost-vdpa'
>>
>> Outright annoying:
>>
>> $ upstream-qemu -object bad
>> upstream-qemu: -object bad: Parameter 'qom-type' does not accept value '=
bad'
>> Acceptable values are 'authz-list', 'authz-listfile', 'authz-pam', 'auth=
z-simple', 'can-bus', 'can-host-socketcan', 'colo-compare', 'cryptodev-back=
end', 'cryptodev-backend-builtin', 'cryptodev-backend-lkcf', 'dbus-vmstate'=
, 'filter-buffer', 'filter-dump', 'filter-mirror', 'filter-redirector', 'fi=
lter-replay', 'filter-rewriter', 'input-barrier', 'input-linux', 'iothread'=
, 'main-loop', 'memory-backend-epc', 'memory-backend-file', 'memory-backend=
-memfd', 'memory-backend-ram', 'pef-guest', 'pr-manager-helper', 'qtest', '=
rng-builtin', 'rng-egd', 'rng-random', 'secret', 'secret_keyring', 'sev-gue=
st', 'thread-context', 's390-pv-guest', 'throttle-group', 'tls-creds-anon',=
 'tls-creds-psk', 'tls-creds-x509', 'tls-cipher-suites', 'x-remote-object',=
 'x-vfio-user-server'
>>
>> Note we already let users ask for this information with -object help or
>> -object qom-type=3Dhelp.  Sadly, we can't hint at that here, because it's
>> implemented much further up the call chain, and other call chains don't.
>>
>> If HMP command sendkey didn't bypass the input visitor, the 26 screen
>> lines of hint for QKeyCode would likely scroll the error message off the
>> screen.
>>
>> Should we suppress this hint when it's too long to be useful?
>
> I don't have strong opinions.. perhaps stop after first 5 with "..." ?

A hint like "Use CMD to show the possible values" would be better, but
it's not feasible now.

Instead of cutting off after five, we cut off when the hint goes beyond
a length limit.  A bit more involved.  Up to you.

Enumerations with more than five members:

      6 BlkdebugIOType
      6 EvtchnPortType
      6 GrabToggleKeys
      6 HmatLBDataType
      6 SevState
      7 AudioFormat
      7 QCryptoHashAlgorithm
      7 SchemaMetaType
      7 WatchdogAction
      8 JSONType
      9 DisplayType
      9 InputButton
      9 JobType
      9 VncPrimaryAuth
      9 VncVencryptSubAuth
     11 JobStatus
     11 ShutdownCause
     12 AudiodevDriver
     12 QCryptoCipherAlgorithm
     12 TransactionActionKind
     14 MigrationStatus
     16 RunState
     17 NetClientDriver
     21 MigrationCapability
     22 ChardevBackendKind
     31 SysEmuTarget
     44 ObjectType
     47 BlockdevDriver
     48 BlkdebugEvent
    150 QKeyCode

Not all of them are can be visited from CLI or HMP (which is how the
hint gets used).

> (Ideally, we would have shell completion scripts that would be able to he=
lp
> us, but hey that's another level! :)

True :)


