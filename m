Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F946F44A9
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 15:07:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptphz-0000q6-LP; Tue, 02 May 2023 09:06:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1ptphx-0000n8-RB
 for qemu-devel@nongnu.org; Tue, 02 May 2023 09:06:17 -0400
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1ptphv-00078V-Ud
 for qemu-devel@nongnu.org; Tue, 02 May 2023 09:06:17 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7F0561F8BE;
 Tue,  2 May 2023 13:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1683032772; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=io02gdO8cUnNqeae3uCXUJpQMXrik+L1mWqJMCSr56M=;
 b=MchL8bVXu+M7aUwhDimLllxf2ju5+KFQ088JkCy3k724jWW9CxJ0kaxaCRNRMxdE1lv77p
 1q3TexA3Y5alwotFLLYoidRivYcy+CDJ6BJ+C9igAXhymwRbm46cgEQ5V6/yy8RCgE/XwO
 qmDORvCqvAITVSs/HzG6z7oQA45rovg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1683032772;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=io02gdO8cUnNqeae3uCXUJpQMXrik+L1mWqJMCSr56M=;
 b=VaUrknuBQ/kiJigz9JFguvXls26NArRWabUGLOuByOxIYjfD8v1HjNgxRxEDDp1QWAhkRf
 lrastDi5OV/+nmBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0DFDE134FB;
 Tue,  2 May 2023 13:06:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id U3FgMsMKUWRwTwAAMHmgww
 (envelope-from <farosas@suse.de>); Tue, 02 May 2023 13:06:11 +0000
From: Fabiano Rosas <farosas@suse.de>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, =?utf-8?Q?Marc-?=
 =?utf-8?Q?Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v3] meson: Pass -j option to sphinx
In-Reply-To: <ZFDLF2nPKdvQ1Mho@redhat.com>
References: <20230428150102.13114-1-farosas@suse.de>
 <12c1fa01-9c1d-9af7-71eb-e9103346d0af@redhat.com>
 <ZFDLF2nPKdvQ1Mho@redhat.com>
Date: Tue, 02 May 2023 10:06:09 -0300
Message-ID: <87v8haj326.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=farosas@suse.de;
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

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Sat, Apr 29, 2023 at 02:33:17PM +0200, Paolo Bonzini wrote:
>> On 4/28/23 17:01, Fabiano Rosas wrote:
>> > Also make sure our plugins support parallelism and report it properly
>> > to sphinx. Particularly, implement the merge_domaindata method in
>> > DBusDomain that is used to merge in data from other subprocesses.
>> >=20
>> > before:
>> >    $ time make man html
>> >    ...
>> >    [1/2] Generating docs/QEMU manual with a custom command
>> >    [2/2] Generating docs/QEMU man pages with a custom command
>> >=20
>> >    real    0m43.157s
>> >    user    0m42.642s
>> >    sys     0m0.576s
>> >=20
>> > after:
>> >    $ time make man html
>> >    ...
>> >    [1/2] Generating docs/QEMU manual with a custom command
>> >    [2/2] Generating docs/QEMU man pages with a custom command
>> >=20
>> >    real    0m25.014s
>> >    user    0m51.288s
>> >    sys     0m2.085s
>>=20
>> The 'nproc' fallback will potentially cause twice #CPUs processes to be
>> active, since sphinx will run in parallel with everything else.
>>=20
>> Is this result with "-j auto", and if so with which computer?  If the
>> speedup is only 2x as it seems to be from the "time" above, I'd rather h=
ave
>> "-j 2" only so that sphinx doesn't risk killing the machine...

Tested with -j auto and -j16 on my 16 cpu i7-11850H.

>
> Why would it kill the machine ? If there are two sphinx processes
> concurrent, thus overcomitting available CPUs, the scheduler will
> just end up giving them shorter timeslice OS.

One other thing I noticed is that we're not actually running the two
documentation targets in parallel. The man pages have a dependency on
the html pages. I'm not sure if that is legitimate.

  sphinxmans +=3D custom_target('QEMU man pages',
                              build_by_default: build_docs,
                              output: these_man_pages,
HERE -->                      input: this_manual,
                              install: build_docs,
                              install_dir: install_dirs,
                              command: [SPHINX_ARGS, '-b', 'man', '-d', pri=
vate_dir,
                                        input_dir, meson.current_build_dir(=
)])

Removing that line gains us about 10 more seconds. However there are
some annoying differences in the man pages produced such as quotation
marks using a different character. I'm still investigating.

