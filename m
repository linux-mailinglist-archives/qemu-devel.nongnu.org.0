Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 999975688CC
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 14:58:01 +0200 (CEST)
Received: from localhost ([::1]:55668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o94bQ-0003wh-8z
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 08:58:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o94ZQ-00031N-7h
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 08:55:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o94ZN-0002xz-Ny
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 08:55:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657112152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iq+ETD4tSicRiYZVkYskB7+pZdDIIDuXpXa+o1d75J0=;
 b=HBr3cTu9k4VssGqR0G76zrVkiGx/yoMLGaG1hhAL6HASgbL//Wyv9Z+1YdDjdl1GpeViPb
 BLZaUiSrW0XQFznlRU3mgTlhJKmoDU6yIExl56I8DPEdLIBFUfBJJdrjaY/g2W4kK9qV5v
 LTFWCWA0u15rYe7SbyX07NWbJRql7Qk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-KBrFYzTEPSejoX8fkoCrmg-1; Wed, 06 Jul 2022 08:55:49 -0400
X-MC-Unique: KBrFYzTEPSejoX8fkoCrmg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53F9F18E0BF2;
 Wed,  6 Jul 2022 12:55:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ED49F18EC9;
 Wed,  6 Jul 2022 12:55:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BB27E21E690D; Wed,  6 Jul 2022 14:55:47 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Cc: zhenwei pi <pizhenwei@bytedance.com>,  Michael Roth
 <michael.roth@amd.com>,  Konstantin Kostiuk <kkostiuk@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [PATCH v3 1/1] qga: add command 'guest-get-cpustats'
References: <20220706095111.686295-1-pizhenwei@bytedance.com>
 <20220706095111.686295-2-pizhenwei@bytedance.com>
 <CAMxuvayE_zn_ZckKyjra6F7jfg9mm0r8V0t_qO2_wV82oJ7xCA@mail.gmail.com>
Date: Wed, 06 Jul 2022 14:55:47 +0200
In-Reply-To: <CAMxuvayE_zn_ZckKyjra6F7jfg9mm0r8V0t_qO2_wV82oJ7xCA@mail.gmail.com>
 (=?utf-8?Q?=22Marc-Andr=C3=A9?= Lureau"'s message of "Wed, 6 Jul 2022
 14:59:04 +0400")
Message-ID: <87fsjemmcs.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> writes:

> Hi
>
> On Wed, Jul 6, 2022 at 1:56 PM zhenwei pi <pizhenwei@bytedance.com> wrote:
>>
>> A vCPU thread always reaches 100% utilization when:
>> - guest uses idle=3Dpoll
>> - disable HLT vm-exit
>> - enable MWAIT
>>
>> Add new guest agent command 'guest-get-cpustats' to get guest CPU
>> statistics, we can know the guest workload and how busy the CPU is.
>>
>> To avoid compiling error like:
>> qga/qga-qapi-types.h:948:28: error: expected member name or ';'
>>  after declaration specifiers
>>         GuestLinuxCpuStats linux;
>>         ~~~~~~~~~~~~~~~~~~ ^
>> <built-in>:336:15: note: expanded from here

What actually happens here: the compiler predefines macro linux like

    #define linux 1

>> Also add 'linux' into polluted_words.

Does polluted_words cover all of the predefined macros then?
Checking...

    $ gcc -E -dD - </dev/null 2>&1 | grep 'define [^_]'
    #define linux 1
    #define unix 1

Yes.  We don't care about the ones starting with '_'.

> That looks good to me, although you may want to split the scripts/qapi ch=
ange.
>
> Markus, what do you think?

I'd very much prefer a separate patch.  Suggested commit message:

    qapi: Avoid generating C identifier 'linux'

    'linux' is not usable as identifier, because C compilers targeting
    Linux predefine it as a macro expanding to 1.  Add it to
    @polluted_words.  'unix' is already there.

>> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

[...]

>> diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
>> index 489273574a..737b059e62 100644
>> --- a/scripts/qapi/common.py
>> +++ b/scripts/qapi/common.py
>> @@ -114,7 +114,7 @@ def c_name(name: str, protect: bool =3D True) -> str:
>>                       'and', 'and_eq', 'bitand', 'bitor', 'compl', 'not',
>>                       'not_eq', 'or', 'or_eq', 'xor', 'xor_eq'])
>>      # namespace pollution:
>> -    polluted_words =3D set(['unix', 'errno', 'mips', 'sparc', 'i386'])
>> +    polluted_words =3D set(['unix', 'errno', 'mips', 'sparc', 'i386', '=
linux'])
>>      name =3D re.sub(r'[^A-Za-z0-9_]', '_', name)
>>      if protect and (name in (c89_words | c99_words | c11_words | gcc_wo=
rds
>>                               | cpp_words | polluted_words)
>> --
>> 2.20.1
>>


