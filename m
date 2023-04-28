Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA5D6F1D9A
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 19:48:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psSAa-0007dc-Uy; Fri, 28 Apr 2023 13:46:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1psSAY-0007dN-JM
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 13:46:06 -0400
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1psSAV-0002MI-D8
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 13:46:06 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C5ECF1F8D4;
 Fri, 28 Apr 2023 17:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682703940; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+FULDWD+1hCHO/UC4VP07r7eCa4/VoAL/r76idvuvdE=;
 b=BZJGM1T+P8GLACSDsbcI2iOPDplp2empYjg6abO0PhL6wdzUoWsJC8i/1HIbW3OFW2zuDR
 2bYIWh+FVCVrnqoAzW/aBuBjaEMysen0aFE3yawPVdengt3lgnmJCYvCqjRdqa5oMJTmds
 Tj3jCpZ2ZlYCKHuc4+v0d40TjE51TM4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682703940;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+FULDWD+1hCHO/UC4VP07r7eCa4/VoAL/r76idvuvdE=;
 b=9mr4aT08AqBES7Nr4HoOvE6J0u92zwHhUM0h02jfEdZ23+bodgGnKRwUZqUjosaYJB0UZo
 S61zPAv/5vGmtSDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 55807138FA;
 Fri, 28 Apr 2023 17:45:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PD0CCEQGTGR/HwAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 28 Apr 2023 17:45:40 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v3] meson: Pass -j option to sphinx
In-Reply-To: <87r0s4gc8g.fsf@pond.sub.org>
References: <20230428150102.13114-1-farosas@suse.de>
 <87r0s4gc8g.fsf@pond.sub.org>
Date: Fri, 28 Apr 2023 14:45:37 -0300
Message-ID: <87pm7nsxxa.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=195.135.220.29; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Markus Armbruster <armbru@redhat.com> writes:

> Fabiano Rosas <farosas@suse.de> writes:
>
>> Save a bit of build time by passing the number of jobs option to
>> sphinx.
>>
>> We cannot use the -j option from make because meson does not support
>> setting build time parameters for custom targets. Use nproc instead or
>> the equivalent sphinx option "-j auto", if that is available.
>>
>> Also make sure our plugins support parallelism and report it properly
>> to sphinx. Particularly, implement the merge_domaindata method in
>> DBusDomain that is used to merge in data from other subprocesses.
>>
>> before:
>>   $ time make man html
>>   ...
>>   [1/2] Generating docs/QEMU manual with a custom command
>>   [2/2] Generating docs/QEMU man pages with a custom command
>>
>>   real    0m43.157s
>>   user    0m42.642s
>>   sys     0m0.576s
>>
>> after:
>>   $ time make man html
>>   ...
>>   [1/2] Generating docs/QEMU manual with a custom command
>>   [2/2] Generating docs/QEMU man pages with a custom command
>>
>>   real    0m25.014s
>>   user    0m51.288s
>>   sys     0m2.085s
>
> Thanks for tackling this!  sphinx-build is so slow I disable doc
> building unless I'm working on docs.
>
>> Tested-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>> ---
>>  docs/meson.build           | 12 ++++++++++++
>>  docs/sphinx/dbusdomain.py  |  4 ++++
>>  docs/sphinx/fakedbusdoc.py |  5 +++++
>>  docs/sphinx/qmp_lexer.py   |  5 +++++
>>  4 files changed, 26 insertions(+)
>>
>> diff --git a/docs/meson.build b/docs/meson.build
>> index f220800e3e..138ec6ce6f 100644
>> --- a/docs/meson.build
>> +++ b/docs/meson.build
>> @@ -10,6 +10,18 @@ if sphinx_build.found()
>>      SPHINX_ARGS +=3D [ '-W', '-Dkerneldoc_werror=3D1' ]
>>    endif
>>=20=20
>> +  sphinx_version =3D run_command(SPHINX_ARGS + ['--version'],
>> +                               check: true).stdout().split()[1]
>> +  if sphinx_version.version_compare('>=3D5.1.2')
>
> Where do you get 5.1.2 from?  I have 5.0.2, and -j auto appears to work
> fine.  The manual page says "Changed in version 1.7: Support auto
> argument."
>

Ouch, I was looking at the readthedocs repository which has a similar
change.

So I think we could probably just hardcode the option. Most distros will
have a more recent sphinx version.
https://repology.org/project/python:sphinx/versions

Let me try to figure out what gitlab is using. I know it is less than 4
because our docs don't show some of the dbus parts:

https://www.qemu.org/docs/master/interop/dbus-display.html

>> +    SPHINX_ARGS +=3D ['-j', 'auto']
>> +  else
>> +    nproc =3D find_program('nproc')
>> +    if nproc.found()
>> +      jobs =3D run_command(nproc, check: true).stdout()
>> +      SPHINX_ARGS +=3D ['-j', jobs]
>> +    endif
>> +  endif
>> +
>>    # This is a bit awkward but works: create a trivial document and
>>    # try to run it with our configuration file (which enforces a
>>    # version requirement). This will fail if sphinx-build is too old.
>
> [...]

