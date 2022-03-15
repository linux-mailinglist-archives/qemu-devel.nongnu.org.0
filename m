Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDB24D9E2F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 15:55:43 +0100 (CET)
Received: from localhost ([::1]:59236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU8aM-0001Gy-GZ
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 10:55:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nU8Oq-0002fa-LQ
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 10:43:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nU8Oo-0001g4-RX
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 10:43:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647355426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H3Y1eIuJE5MHxgIwEc5Fk8JyYg2+dU4dKOkAeXX524I=;
 b=VgJq8Z+eT/dEvmPQmUnztxZInUh/pJlJy8Sg89lLrB+7HogMpRC7ecwqOT37t/i8vVN8Aw
 lvvrPWfUoQgtxZcm6gQVnJ1mD4rSjtUMKUlCqNwyfGztlUu+CFFNR7/GC2Uos8sRoucrBE
 gBoLna+B2VN8Mv1zfzT0eV2kkdYEgcI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-552-6t54DpkdO-mMtdvZzz0Pxg-1; Tue, 15 Mar 2022 10:43:45 -0400
X-MC-Unique: 6t54DpkdO-mMtdvZzz0Pxg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9DFC6811E76;
 Tue, 15 Mar 2022 14:43:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A695555C90;
 Tue, 15 Mar 2022 14:43:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 417E921E66D4; Tue, 15 Mar 2022 15:43:41 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH 3/3] Use g_new() & friends where that makes obvious sense
References: <20220314160108.1440470-1-armbru@redhat.com>
 <20220314160108.1440470-4-armbru@redhat.com>
 <87y21c401e.fsf@linaro.org> <875yofl3k3.fsf@pond.sub.org>
 <02307072-4bff-dbbb-67fb-ca9800c34b3c@gmail.com>
Date: Tue, 15 Mar 2022 15:43:41 +0100
In-Reply-To: <02307072-4bff-dbbb-67fb-ca9800c34b3c@gmail.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 15 Mar 2022 15:07:36
 +0100")
Message-ID: <875yofjmxu.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Reinoud Zandijk <reinoud@netbsd.org>,
 Eric Blake <eblake@redhat.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Juan Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>,
 Paul Durrant <paul@xen.org>, Magnus Damm <magnus.damm@gmail.com>,
 Kamil Rytarowski <kamil@netbsd.org>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 =?utf-8?Q?Herv=C3=A9?= Poussineau <hpoussin@reactos.org>,
 Michael Roth <michael.roth@amd.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Amit Shah <amit@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, haxm-team@intel.com,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Fabien Chouteau <chouteau@adacore.com>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Keith Busch <kbusch@kernel.org>,
 qemu-ppc@nongnu.org, David Hildenbrand <david@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 qemu-block@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-s390x@nongnu.org, Patrick Venture <venture@google.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Corey Minyard <cminyard@mvista.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Igor Mammedov <imammedo@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philippe.mathieu.daude@gmail.com> writes:

> On 15/3/22 14:59, Markus Armbruster wrote:
>> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>>=20
>>> Markus Armbruster <armbru@redhat.com> writes:
>>>
>>>> g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
>>>> for two reasons.  One, it catches multiplication overflowing size_t.
>>>> Two, it returns T * rather than void *, which lets the compiler catch
>>>> more type errors.
>>>>
>>> <snip>
>>>> diff --git a/semihosting/config.c b/semihosting/config.c
>>>> index 137171b717..6d48ec9566 100644
>>>> --- a/semihosting/config.c
>>>> +++ b/semihosting/config.c
>>>> @@ -98,7 +98,7 @@ static int add_semihosting_arg(void *opaque,
>>>>       if (strcmp(name, "arg") =3D=3D 0) {
>>>>           s->argc++;
>>>>           /* one extra element as g_strjoinv() expects NULL-terminated=
 array */
>>>> -        s->argv =3D g_realloc(s->argv, (s->argc + 1) * sizeof(void *)=
);
>>>> +        s->argv =3D g_renew(void *, s->argv, s->argc + 1);
>>>
>>> This did indeed break CI because s->argv is an array of *char:
>>>
>>> ../semihosting/config.c:101:17: error: assignment to =E2=80=98const cha=
r **=E2=80=99 from incompatible pointer type =E2=80=98void **=E2=80=99 [-We=
rror=3Dincompatible-pointer-types]
>>>    101 |         s->argv =3D g_renew(void *, s->argv, s->argc + 1);
>>>        |                 ^
>>> cc1: all warnings being treated as errors
>>>
>>> So it did the job of type checking but failed to build ;-)
>>
>> You found a hole in my compile testing, thanks!
>>
>> I got confused about the configuration of my build trees.  Catching such
>> mistakes is what CI is for :)
>
> FYI Alex fixed this here:
> https://lore.kernel.org/qemu-devel/20220315121251.2280317-8-alex.bennee@l=
inaro.org/
>
> So your series could go on top (modulo the Coverity change).

I dropped this hunk in v2.

Whether my v2 or Alex's series goes in first doesn't matter.


