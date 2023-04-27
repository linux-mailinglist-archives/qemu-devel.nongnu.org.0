Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B02326F0BB2
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 20:03:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps5wI-0002Ln-0E; Thu, 27 Apr 2023 14:01:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1ps5wG-0002LY-25
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 14:01:52 -0400
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1ps5wA-00080n-Iw
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 14:01:47 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AC2B421BD8;
 Thu, 27 Apr 2023 18:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682618504; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yYlVKOi4uyFdyF8G9BPDmkfh6lYZ75+8wIqPxwArTp0=;
 b=RlRRoVbvSn6x1nfEX494rBlF1V5UwUvwxdkfz2wKpDOB1l+Lg2gFKYpqngpJ9/0Y0yrdma
 haGWIcZCUjH42fuch1RSbeMyZbnYPgB2iVqPQF+gvWgfbtvYiYsIJKvDkWPdPP0T3hSDoC
 VOaYqsvgrntIqIPSclJHIEngyJGi1Mc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682618504;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yYlVKOi4uyFdyF8G9BPDmkfh6lYZ75+8wIqPxwArTp0=;
 b=HwCOTf+DI/MUHvjDiDNhvKbb/WWNLN/NTyUFNKmuFdXA0+oTE/k7IPfKpgdmWMBzPVqOBN
 E9c9Xg43ZsYHkLCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 37BBA138F9;
 Thu, 27 Apr 2023 18:01:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id FhbJAIi4SmQHBgAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 27 Apr 2023 18:01:44 +0000
From: Fabiano Rosas <farosas@suse.de>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth
 <thuth@redhat.com>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2] meson: Pass -j option to sphinx
In-Reply-To: <ZEqx9DfCkqz/Qj07@redhat.com>
References: <20230427172516.19003-1-farosas@suse.de>
 <ZEqx9DfCkqz/Qj07@redhat.com>
Date: Thu, 27 Apr 2023 15:01:41 -0300
Message-ID: <87sfclyzju.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=195.135.220.28; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
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

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Thu, Apr 27, 2023 at 02:25:16PM -0300, Fabiano Rosas wrote:
>> Save a bit of build time by passing the number of jobs option to
>> sphinx.
>>=20
>> We cannot use the -j option from make because meson does not support
>> setting build time parameters for custom targets. Use nproc instead or
>> the equivalent sphinx option "-j auto", if that is available.
>>=20
>> Also make sure our plugins support parallelism and report it properly
>> to sphinx. Particularly, implement the merge_domaindata method in
>> DBusDomain that is used to merge in data from other subprocesses.
>>=20
>> before:
>>   $ time make man html
>>   ...
>>   [1/2] Generating docs/QEMU manual with a custom command
>>   [2/2] Generating docs/QEMU man pages with a custom command
>>=20
>>   real    0m43.157s
>>   user    0m42.642s
>>   sys     0m0.576s
>>=20
>> after:
>>   $ time make man html
>>   ...
>>   [1/2] Generating docs/QEMU manual with a custom command
>>   [2/2] Generating docs/QEMU man pages with a custom command
>>=20
>>   real    0m25.014s
>>   user    0m51.288s
>>   sys     0m2.085s
>
> On my 12 CPU laptop I see a similar magnitude benefit - about
> 20 seconds is cut from the docs build time - 50 down to 30 secs.
>
> Watching the CPU usage I see sphinx is not very good at keeping
> all CPUs busy. For perhaps 2 seconds I'll see  8 sphinx processes
> burning CPUs, but the majority of the time it'll only be 1 or 2
> sphinx processes.
>
> IOW, we do get a benefit, but it is not nearly as good as one
> might hope for given the number of CPUs potentially available.
>
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>> ---
>>  docs/meson.build           | 12 ++++++++++++
>>  docs/sphinx/dbusdomain.py  |  4 ++++
>>  docs/sphinx/fakedbusdoc.py |  5 +++++
>>  docs/sphinx/qmp_lexer.py   |  5 +++++
>>  4 files changed, 26 insertions(+)
>
> Tested-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>
>>=20
>> diff --git a/docs/meson.build b/docs/meson.build
>> index f220800e3e..9e4bed6fa0 100644
>> --- a/docs/meson.build
>> +++ b/docs/meson.build
>> @@ -10,6 +10,18 @@ if sphinx_build.found()
>>      SPHINX_ARGS +=3D [ '-W', '-Dkerneldoc_werror=3D1' ]
>>    endif
>>=20=20
>> +  sphinx_version =3D run_command(SPHINX_ARGS + ['--version'],
>> +                               check: false).stdout().split()[1]
>> +  if sphinx_version.version_compare('>=3D5.1.2')
>> +    SPHINX_ARGS +=3D ['-j', 'auto']
>> +  else
>> +    nproc =3D find_program('nproc')
>> +    if nproc.found()
>> +      jobs =3D run_command(nproc, check:false).stdout()
>> +      SPHINX_ARGS +=3D ['-j', jobs]
>> +    endif
>> +  endif
>
> ANy reason for check: false in these 2 run_command calls ?
>

No, I haven't thought about it. I'll change them to true.


