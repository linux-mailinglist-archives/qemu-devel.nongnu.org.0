Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B69976D5023
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 20:19:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjOkX-0004yA-9H; Mon, 03 Apr 2023 14:17:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pjOkV-0004xl-BP
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 14:17:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pjOkT-0005SA-UP
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 14:17:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680545864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5uLE7zjqBICXjlH8JMOkaik6Yad+Dg1Q76bn45edDEQ=;
 b=ZP1FNTOtbRfi7EEpyi0RdYEVcXTKHU5XogYqyyPaGLSbNDvoB3JaHViYO2XZZrLgQX2ACx
 dMUTq3yecrcfEkSKtjDWFNoCC+x1xGR0ItuN/BluBzgX910wKynIKd8dG/qkHF3rRnh5uA
 itvLG4gDF4BD/lzqmatlz51psi5e5aw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-53-wnbKu8TIO5iHpl_yUMN5ew-1; Mon, 03 Apr 2023 14:17:39 -0400
X-MC-Unique: wnbKu8TIO5iHpl_yUMN5ew-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 971803814587;
 Mon,  3 Apr 2023 18:17:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 65F6735453;
 Mon,  3 Apr 2023 18:17:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6139C21E6926; Mon,  3 Apr 2023 20:17:37 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,  Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,  qemu-devel@nongnu.org,  Warner Losh
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
 <871ql19fs4.fsf@pond.sub.org>
 <21d10332-f109-15aa-b282-bc31c07b364c@redhat.com>
Date: Mon, 03 Apr 2023 20:17:37 +0200
In-Reply-To: <21d10332-f109-15aa-b282-bc31c07b364c@redhat.com> (Thomas Huth's
 message of "Mon, 3 Apr 2023 18:31:04 +0200")
Message-ID: <875yac4ypq.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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

Thomas Huth <thuth@redhat.com> writes:

> On 03/04/2023 16.55, Markus Armbruster wrote:
>> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>>=20
>>> Markus Armbruster <armbru@redhat.com> writes:
>>>
>>>> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
> ...
>>> I was under the impression things like -hda wouldn't work say on an Arm
>>> machine because you don't know what sort of interface you might be
>>> using and -hda implies IDE. Where is this macro substitution done?
>>=20
>> qemu_init() calls drive_add() for all these options.
>>=20
>> drive_add(TYPE, INDEX, FILE, OPTSTR) creates a QemuOpts in group
>> "drive".  It sets "if" to if_name[TYPE] unless TYPE is IF_DEFAULT,
>> "index" to INDEX unless it's negative, and "file" to FILE unless it's
>> null.  Then it parses OPTSTR on top.
>>=20
>> For -hdX, the call looks like
>>=20
>>                  drive_add(IF_DEFAULT, popt->index - QEMU_OPTION_hda, op=
targ,
>>                            HD_OPTS);
>>=20
>> We pass IF_DEFAULT, so "if" remains unset.  "index" is set to 0 for
>> -hda, 1, for -hdb and so forth.  "file" is set to the option argument.
>> Since HD_OPTS is "media=3Ddisk", we set "media" to "disk".
>>=20
>> The QemuOpts in config group "drive" get passed to drive_new() via
>> drive_init_func().  Unset "if" defaults to the current machine's class's
>> block_default_type.
>>=20
>> If a machine doesn't set this member explicitly, it remains zero, which
>> is IF_NONE.  Documented in blockdev.h:
>>=20
>>      typedef enum {
>>          IF_DEFAULT =3D -1,            /* for use with drive_add() only =
*/
>>          /*
>>           * IF_NONE must be zero, because we want MachineClass member
>> --->     * block_default_type to default-initialize to IF_NONE
>>           */
>>          IF_NONE =3D 0,
>>          IF_IDE, IF_SCSI, IF_FLOPPY, IF_PFLASH, IF_MTD, IF_SD, IF_VIRTIO=
, IF_XEN,
>>          IF_COUNT
>>      } BlockInterfaceType;
>>=20
>> Questions?
>
> How's the average user supposed to know that? Our qemu-options.hx just sa=
ys:=20
> "-hda/-hdb file  use 'file' as IDE hard disk 0/1 image"...

Ancient doc bug.  Should have been updated in commit 2d0d2837dcf
(Support default block interfaces per QEMUMachine) back in 2012.


