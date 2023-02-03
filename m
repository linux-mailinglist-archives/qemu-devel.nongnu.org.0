Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C375168A45A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 22:12:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO3Kw-0006k7-83; Fri, 03 Feb 2023 16:11:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pO3Ku-0006jk-Dz
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 16:11:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pO3Kp-0004Qu-GC
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 16:11:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675458662;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A0rQOHFGUegWcCYQ68/azu944T2ZXKjAPKhBouTIs7c=;
 b=PbvGJztoXwqFrpGt+lYJ4NmeEs34YYw1usVY4mk2DxIIMTEJ7kV52iEfrAKg2JS/7AeadL
 ap8+yFInBITINcd44QgKCW5APpYraLK/Ya+7Ce94bGDyY8QPZmiUrxMVPM9e5SorB+os2s
 sn8sMEaRfXfC6Kw3HhATSdkSVsAZgas=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-47-bQhMjl41PTKoL2JPlhMkUw-1; Fri, 03 Feb 2023 16:10:59 -0500
X-MC-Unique: bQhMjl41PTKoL2JPlhMkUw-1
Received: by mail-wm1-f70.google.com with SMTP id
 bg24-20020a05600c3c9800b003db0ddddb6fso3289266wmb.0
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 13:10:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A0rQOHFGUegWcCYQ68/azu944T2ZXKjAPKhBouTIs7c=;
 b=smpeSxw9pMAgEf7xuE1qphL2Tvu+0A7xZQrt5oNsbdyD4VsOdJM7OnzhQMlCbIz+pB
 U6YloR7kZ9Ffx/liFXkAtWhKjAnDEWwvA7JaPUjLlRTTpMLCaFWDAYv+9VSBQrE5TE1v
 HSc8t/QOS47zNpb5tQzQ3R4oTgVPGmBcpyJ7H63crZc5AACoIizSITna9TLZyQeskzv3
 AgoYiyoQF0ReYtE1AlJiUrscD2CBNKUN2HFVnpnClnvntuxip8xHVo8MFsOzweVa6OP8
 U8rQKhCXHyJf75HXq8+u1h+cavpwXKXunTnEuM88l7Odvsegt3cYfx36lOBPuzABWFyB
 GPqg==
X-Gm-Message-State: AO0yUKX4FEDQJVh4aq2u5whlzB7KhoomVFQ0zHpbZnWVruTQ4TPeCsRf
 D0WeY0rcb2QRwRv8e7pLE7G16SoGuFqOF6AMkmIfbXdnD9T2qQgeFB4HyKQ1+HKJS24RK7KORWB
 5zRwh+LvAmgmln+4=
X-Received: by 2002:a05:6000:10f:b0:2bf:bf36:1604 with SMTP id
 o15-20020a056000010f00b002bfbf361604mr9819513wrx.35.1675458655239; 
 Fri, 03 Feb 2023 13:10:55 -0800 (PST)
X-Google-Smtp-Source: AK7set9UCzZBjIskmTloqnkpRhIisLMimhfa01yIR8MvRK9osX7vutr5RmpYofV+jKVY1RejvnmGfA==
X-Received: by 2002:a05:6000:10f:b0:2bf:bf36:1604 with SMTP id
 o15-20020a056000010f00b002bfbf361604mr9819487wrx.35.1675458654901; 
 Fri, 03 Feb 2023 13:10:54 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 f2-20020a5d50c2000000b00267bcb1bbe5sm2820308wrt.56.2023.02.03.13.10.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 13:10:54 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Qemu-block <qemu-block@nongnu.org>,
 qemu-devel@nongnu.org,  Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,  Peter
 Maydell <peter.maydell@linaro.org>,  Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <philmd@linaro.org>,  Stefan Hajnoczi <stefanha@redhat.com>,  Richard
 Henderson <richard.henderson@linaro.org>,  hreitz@redhat.com,
 dgilbert@redhat.com, Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 6/6] gitlab-ci.d/buildtest: Disintegrate the
 build-coroutine-sigaltstack job
In-Reply-To: <Y9z5TohXERGuQ6TS@redhat.com> (Kevin Wolf's message of "Fri, 3
 Feb 2023 13:08:46 +0100")
References: <20230130104446.1286773-1-thuth@redhat.com>
 <20230130104446.1286773-7-thuth@redhat.com>
 <Y9eizgN9UYo5kbgx@redhat.com>
 <fc5dba59-4993-ee66-a94b-a550bdced396@redhat.com>
 <Y9z5TohXERGuQ6TS@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 03 Feb 2023 22:10:53 +0100
Message-ID: <87wn4ye9pe.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Kevin Wolf <kwolf@redhat.com> wrote:
> Am 03.02.2023 um 12:23 hat Thomas Huth geschrieben:
>> On 30/01/2023 11.58, Daniel P. Berrang=C3=A9 wrote:
>> > On Mon, Jan 30, 2023 at 11:44:46AM +0100, Thomas Huth wrote:
>> > > We can get rid of the build-coroutine-sigaltstack job by moving
>> > > the configure flags that should be tested here to other jobs:
>> > > Move --with-coroutine=3Dsigaltstack to the build-without-defaults job
>> > > and --enable-trace-backends=3Dftrace to the cross-s390x-kvm-only job.
>> >=20
>> > The biggest user of coroutines is the block layer. So we probably
>> > ought to have coroutines aligned with a job that triggers the
>> > 'make check-block' for iotests.  IIUC,  the without-defaults
>> > job won't do that. How about, arbitrarily, using either the
>> > 'check-system-debian' or 'check-system-ubuntu' job. Those distros
>> > are closely related, so getting sigaltstack vs ucontext coverage
>> > between them is a good win, and they both trigger the block jobs
>> > IIUC.
>>=20
>> I gave it a try with the ubuntu job, but this apparently trips up the io=
tests:
>>=20
>>  https://gitlab.com/thuth/qemu/-/jobs/3705965062#L212
>>=20
>> Does anybody have a clue what could be going wrong here?
>
> I'm not sure how changing the coroutine backend could cause it, but
> primarily this looks like an assertion failure in migration code.

Adding Peter here, as he is the last one touching that code O:-)

> Dave, Juan, any ideas what this assertion checks and why it could be
> failing?

Really no.

+QEMU_PROG: ../migration/ram.c:874: pss_find_next_dirty: Assertion `pss->ho=
st_page_end' failed.
+./common.rc: line 195: 78727 Aborted                 (core dumped) ( if [ =
-n "${QEMU_NEED_PID}" ]; then
+    echo $BASHPID > "${QEMU_TEST_DIR}/qemu-${_QEMU_HANDLE}.pid";
+fi; GDB=3D""; if [ -n "${GDB_OPTIONS}" ]; then
+    GDB=3D"gdbserver ${GDB_OPTIONS}";
+fi; VALGRIND_QEMU=3D"${VALGRIND_QEMU_VM}" _qemu_proc_exec "${VALGRIND_LOGF=
ILE}" $GDB "$QEMU_PROG" $QEMU_OPTIONS "$@" )

pss_find_next_dirty() is only called from three places:

find . -type f -exec grep --color=3Dauto -nH --null -e pss_find_next_dirty =
\{\} +
./ram.c.847: * pss_find_next_dirty: find the next dirty page of current ram=
block
./ram.c.857:static void pss_find_next_dirty(PageSearchStatus *pss)
./ram.c.1562:    pss_find_next_dirty(pss);
./ram.c.2391:        pss_find_next_dirty(pss);
./ram.c.2476:        pss_find_next_dirty(pss);

I can't see how this can be affected by coroutines changes.

What is the test that is failing, and what is the change that I have to
do to try to reproduce it?

Later, Juan.


