Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 532BC6D4B2A
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 16:56:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjLap-0002o8-IX; Mon, 03 Apr 2023 10:55:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pjLan-0002nk-V4
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 10:55:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pjLam-0002kO-4x
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 10:55:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680533731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5gPObiWENA9vveWWrWPkBSYV+HErfBasOwTA6nLpBJ0=;
 b=AhvqWx/1M6M8Cxs++LrM6N5cLTkIVnGhNNP30FGS0GURE9KansccWI7cUnL08xeEvsKbiI
 N6ZUty+mFTnosmIJObQ6iIm8tSBWsYuNsCyhW8AVuAxKcICnTjHMbH9E03BJMpXcj3sj9e
 BtpHflrrj/mpUIwIMjYbbO0oCX01MKQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-2GoGCOxhPHO_xzDJhtCarw-1; Mon, 03 Apr 2023 10:55:27 -0400
X-MC-Unique: 2GoGCOxhPHO_xzDJhtCarw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90C131C12987;
 Mon,  3 Apr 2023 14:55:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F4021121314;
 Mon,  3 Apr 2023 14:55:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 50CD621E6926; Mon,  3 Apr 2023 16:55:23 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org,  Thomas Huth <thuth@redhat.com>,  Warner Losh
 <imp@bsdimp.com>,  Ryo ONODERA <ryoon@netbsd.org>,  Kevin Wolf
 <kwolf@redhat.com>,  Beraldo Leal <bleal@redhat.com>,  Wainer dos Santos
 Moschetta <wainersm@redhat.com>,  Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,  Kyle
 Evans <kevans@freebsd.org>,  Reinoud Zandijk <reinoud@netbsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: [PATCH 04/11] qemu-options: finesse the recommendations around
 -blockdev
References: <20230330101141.30199-1-alex.bennee@linaro.org>
 <20230330101141.30199-5-alex.bennee@linaro.org>
 <871ql1lc2z.fsf@pond.sub.org> <87mt3pm6tf.fsf@linaro.org>
Date: Mon, 03 Apr 2023 16:55:23 +0200
In-Reply-To: <87mt3pm6tf.fsf@linaro.org> ("Alex =?utf-8?Q?Benn=C3=A9e=22's?=
 message of "Mon, 03 Apr 2023 14:16:36 +0100")
Message-ID: <871ql19fs4.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Markus Armbruster <armbru@redhat.com> writes:
>
>> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>>
>>> We are a bit premature in recommending -blockdev/-device as the best
>>> way to configure block devices, especially in the common case.
>>> Improve the language to hopefully make things clearer.
>>>
>>> Suggested-by: Michael Tokarev <mjt@tls.msk.ru>
>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>> ---
>>>  qemu-options.hx | 8 ++++++--
>>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/qemu-options.hx b/qemu-options.hx
>>> index 59bdf67a2c..9a69ed838e 100644
>>> --- a/qemu-options.hx
>>> +++ b/qemu-options.hx
>>> @@ -1143,10 +1143,14 @@ have gone through several iterations as the fea=
ture set and complexity
>>>  of the block layer have grown. Many online guides to QEMU often
>>>  reference older and deprecated options, which can lead to confusion.
>>>=20=20
>>> -The recommended modern way to describe disks is to use a combination of
>>> +The most explicit way to describe disks is to use a combination of
>>>  ``-device`` to specify the hardware device and ``-blockdev`` to
>>>  describe the backend. The device defines what the guest sees and the
>>> -backend describes how QEMU handles the data.
>>> +backend describes how QEMU handles the data. The ``-drive`` option
>>> +combines the device and backend into a single command line options
>>> +which is useful in the majority of cases.
>>
>> -drive may look simpler from afar, but it really is a hot mess.  Sadly,
>> we can't get rid of it until we find a replacement for configuring
>> onboard block devices.  We might be able to clean it up some if we
>> accept compatibility breaks.  A new convenience option would be less
>> confusing, I guess.
>
> This is only a partial revert of the original wording which others have
> pointed out was a little too prescriptive. I believe the case of
> snapshot was one where a pure device/blockdev command line is hard to
> use.=20
>
>>>                                            Older options like ``-hda``
>>> +bake in a lot of assumptions from the days when QEMU was emulating a
>>> +legacy PC, they are not recommended for modern configurations.
>>>=20=20
>>>  ERST
>>
>> These older options and the non-option argument are simple macros for
>> -drive:
>>
>>     IMG-FILE                    -drive index=3D0,file=3DIMG-FILE,media=
=3Ddisk
>>     -hda IMG-FILE               -drive index=3D0,file=3DIMG-FILE,media=
=3Ddisk
>>     -hdb IMG-FILE               -drive index=3D1,file=3DIMG-FILE,media=
=3Ddisk
>>     -hdc IMG-FILE               -drive index=3D2,file=3DIMG-FILE,media=
=3Ddisk
>>     -hdd IMG-FILE               -drive index=3D3,file=3DIMG-FILE,media=
=3Ddisk
>>     -cdrom IMG-FILE             -drive index=3D2,file=3DIMG-FILE,media=
=3Dcdrom
>>     -fda IMG-FILE               -drive if=3Dfloppy,index=3D0,file=3DIMG-=
FILE
>>     -fdb IMG-FILE               -drive if=3Dfloppy,index=3D1,file=3DIMG-=
FILE
>>     -mtdblock IMG-FILE          -drive if=3Dmtd,file=3DIMG-FILE
>>     -sd IMG-FILE                -drive if=3Dsd,file=3DIMG-FILE
>>     -pflash IMG-FILE            -drive if=3Dpflash,file=3DIMG-FILE
>>
>> What assumptions do you have in mind?
>
> I was under the impression things like -hda wouldn't work say on an Arm
> machine because you don't know what sort of interface you might be
> using and -hda implies IDE. Where is this macro substitution done?

qemu_init() calls drive_add() for all these options.

drive_add(TYPE, INDEX, FILE, OPTSTR) creates a QemuOpts in group
"drive".  It sets "if" to if_name[TYPE] unless TYPE is IF_DEFAULT,
"index" to INDEX unless it's negative, and "file" to FILE unless it's
null.  Then it parses OPTSTR on top.

For -hdX, the call looks like

                drive_add(IF_DEFAULT, popt->index - QEMU_OPTION_hda, optarg,
                          HD_OPTS);

We pass IF_DEFAULT, so "if" remains unset.  "index" is set to 0 for
-hda, 1, for -hdb and so forth.  "file" is set to the option argument.
Since HD_OPTS is "media=3Ddisk", we set "media" to "disk".

The QemuOpts in config group "drive" get passed to drive_new() via
drive_init_func().  Unset "if" defaults to the current machine's class's
block_default_type.

If a machine doesn't set this member explicitly, it remains zero, which
is IF_NONE.  Documented in blockdev.h:

    typedef enum {
        IF_DEFAULT =3D -1,            /* for use with drive_add() only */
        /*
         * IF_NONE must be zero, because we want MachineClass member
--->     * block_default_type to default-initialize to IF_NONE
         */
        IF_NONE =3D 0,
        IF_IDE, IF_SCSI, IF_FLOPPY, IF_PFLASH, IF_MTD, IF_SD, IF_VIRTIO, IF=
_XEN,
        IF_COUNT
    } BlockInterfaceType;

Questions?

>> I think you need at least Kevin's Acked-by for this.
>
> In the ideal world I could convince the block maintainers to write a new
> section to the manual that explains the theory behind the block
> subsystem and how things interact and are put together. Until then this
> is merely a sticking plaster to make the manual a little more
> authoritative than then numerous example command lines our users blindly
> copy from online blog posts.
>
> Of course we could* always ask our new AI overlords:
>
[...]

> * just because we could doesn't mean we should

Heh!


