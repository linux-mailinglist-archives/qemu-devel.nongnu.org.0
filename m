Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D25A16F066B
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 15:12:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps1Q7-0005Nx-6f; Thu, 27 Apr 2023 09:12:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1ps1Pz-0005NZ-LM
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 09:12:15 -0400
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1ps1Pw-0000wu-Pa
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 09:12:14 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1316E21B30;
 Thu, 27 Apr 2023 13:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682601129; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PIP26LRooR4aw4/wSjUqUgczx/ao5b+eWH5anwWQE/Q=;
 b=S1MHWFw4XpWsi0hglUU8RG+hp2tChy/Rr67D5ZWNUNFbvbvntLrPIH/35fzZaVTTff6ubr
 RI8z6lynA/OSBBL8bE8Hz+3x0YQhGJbuvZh6Iie5BO3GgBbIFfCIBangaJ/k21Fvi6avuV
 osSo9TmlPUk61pBMVvwHEMcO54YRBnk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682601129;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PIP26LRooR4aw4/wSjUqUgczx/ao5b+eWH5anwWQE/Q=;
 b=TdYPl35dEMROvs+VtHs6wxbxKIzi7NsVOp/aTlVgjklhQY59xfmrrcAW8YD99WxdERVOJr
 y/d30OJP0zqRLyCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8D519138F9;
 Thu, 27 Apr 2023 13:12:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id lKWfFah0SmT3bQAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 27 Apr 2023 13:12:08 +0000
From: Fabiano Rosas <farosas@suse.de>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau <marcandre.lureau@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>
Subject: Re: [PATCH] meson: Pass -j option to sphinx
In-Reply-To: <ZEpjgDbIZZ5H89N8@redhat.com>
References: <20230426160347.8860-1-farosas@suse.de>
 <ZEpjgDbIZZ5H89N8@redhat.com>
Date: Thu, 27 Apr 2023 10:12:06 -0300
Message-ID: <87cz3ppizd.fsf@suse.de>
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

> On Wed, Apr 26, 2023 at 01:03:46PM -0300, Fabiano Rosas wrote:
>> Save a bit of build time by passing the number of jobs option to
>> sphinx.
>>=20
>> To avoid warnings from sphinx, alter our plugins to inform whether
>> they support parallelism. The two plugins touched are quite simple and
>> I don't see anything that would indicate they do not support being
>> called in parallel, so return True for both reads and writes.
>>=20
>> before:
>>  $ time make -j16 man html
>>  ...
>>  [1/2] Generating docs/QEMU manual with a custom command
>>  [2/2] Generating docs/QEMU man pages with a custom command
>>=20
>>  real    0m49.770s
>>  user    0m49.425s
>>  sys     0m0.716s
>>=20
>> after:
>>  $ time make -j16 man html
>>  ...
>>  [1/2] Generating docs/QEMU manual with a custom command (wrapped by mes=
on because command contains newlines)
>>  [2/2] Generating docs/QEMU man pages with a custom command (wrapped by =
meson because command contains newlines)
>>  real    0m30.153s
>>  user    1m5.945s
>>  sys     0m2.440s
>
> When I test this on Fedora 38, the docs build hangs forever.
>
> I ran sphinx directly and see it prints a traceback and then
> fails to exit after this error
>
> Traceback (most recent call last):
>   File "/usr/lib/python3.11/site-packages/sphinx/util/parallel.py", line =
105, in join
>     if not self._join_one():
>            ^^^^^^^^^^^^^^^^
>   File "/usr/lib/python3.11/site-packages/sphinx/util/parallel.py", line =
129, in _join_one
>     self._result_funcs.pop(tid)(self._args.pop(tid), result)
>   File "/usr/lib/python3.11/site-packages/sphinx/builders/__init__.py", l=
ine 478, in merge
>     self.env.merge_info_from(docs, env, self.app)
>   File "/usr/lib/python3.11/site-packages/sphinx/environment/__init__.py"=
, line 366, in merge_info_from
>     domain.merge_domaindata(docnames, other.domaindata[domainname])
>   File "/usr/lib/python3.11/site-packages/sphinx/domains/__init__.py", li=
ne 295, in merge_domaindata
>     raise NotImplementedError('merge_domaindata must be implemented in %s=
 '
> NotImplementedError: merge_domaindata must be implemented in <class 'dbus=
domain.DBusDomain'> to be able to do parallel builds!
>
> During handling of the above exception, another exception occurred:
>
> Traceback (most recent call last):
>   File "/usr/lib/python3.11/site-packages/sphinx/cmd/build.py", line 281,=
 in build_main
>     app.build(args.force_all, args.filenames)
>   File "/usr/lib/python3.11/site-packages/sphinx/application.py", line 34=
7, in build
>     self.builder.build_update()
>   File "/usr/lib/python3.11/site-packages/sphinx/builders/__init__.py", l=
ine 310, in build_update
>     self.build(to_build,
>

Ah it seems the DBus plugin is only in effect when using sphinx > 4.
I'll try to reproduce and see what it takes to implement this
merge_domaindata. Thanks for testing.

