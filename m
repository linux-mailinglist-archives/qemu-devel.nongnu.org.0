Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E5D2DE37C
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 14:51:46 +0100 (CET)
Received: from localhost ([::1]:35786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqGAb-0000n1-U5
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 08:51:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqG8Y-0007g2-9l
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 08:49:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqG8S-0001Og-R3
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 08:49:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608299370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jMlBkhmuBYU3E0VKR2d05TIAXm6MX/PiLQigmX8rEx4=;
 b=LJqJyzsyNu2gQ+KC2C84RVOrPmcvkCN4nLF/Cp7lFsWF1/70E8kMSOCVd2bPuP6GHY+vue
 L1+V0Oct+PoS4eQ8baAhGqznYv+a34chpo80VvB7o+nCubHmfoWvgX80469KU52IgW5iH2
 BEIzIOOGC5uVUUWs++nFS/Bi8u6acJk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-2Bb5OrcOO4uxNOZunfTKkg-1; Fri, 18 Dec 2020 08:49:28 -0500
X-MC-Unique: 2Bb5OrcOO4uxNOZunfTKkg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5DC8100559B;
 Fri, 18 Dec 2020 13:49:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 871AF17577;
 Fri, 18 Dec 2020 13:49:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 12E7C1130358; Fri, 18 Dec 2020 14:49:26 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH 1/9] block/vpc: Make vpc_open() read the full dynamic
 header
References: <20201217162003.1102738-1-armbru@redhat.com>
 <20201217162003.1102738-2-armbru@redhat.com>
 <c47aef12-38cd-fd21-7fdb-af3be0af1833@redhat.com>
Date: Fri, 18 Dec 2020 14:49:26 +0100
In-Reply-To: <c47aef12-38cd-fd21-7fdb-af3be0af1833@redhat.com> (Max Reitz's
 message of "Fri, 18 Dec 2020 11:19:46 +0100")
Message-ID: <878s9v9qc9.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, mrezanin@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Max Reitz <mreitz@redhat.com> writes:

> On 17.12.20 17:19, Markus Armbruster wrote:
>> The dynamic header's size is 1024 bytes.
>>=20
>> vpc_open() reads only the 512 bytes of the dynamic header into buf[].
>> Works, because it doesn't actually access the second half.  However, a
>> colleague told me that GCC 11 warns:
>>=20
>>      ../block/vpc.c:358:51: error: array subscript 'struct VHDDynDiskHea=
der[0]' is partly outside array bounds of 'uint8_t[512]' [-Werror=3Darray-b=
ounds]
>>=20
>> Clean up to read the full header.
>>=20
>> Rename buf[] to dyndisk_header_buf[] while there.
>>=20
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>   block/vpc.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/block/vpc.c b/block/vpc.c
>> index 1ab55f9287..2fcf3f6283 100644
>> --- a/block/vpc.c
>> +++ b/block/vpc.c
>> @@ -220,7 +220,7 @@ static int vpc_open(BlockDriverState *bs, QDict *opt=
ions, int flags,
>>       QemuOpts *opts =3D NULL;
>>       Error *local_err =3D NULL;
>>       bool use_chs;
>> -    uint8_t buf[HEADER_SIZE];
>> +    uint8_t dyndisk_header_buf[1024];
>
> Perhaps this should be heap-allocated, but I don=E2=80=99t know whether q=
emu has=20
> ever established a (perhaps just inofficial) threshold on what goes on=20
> the stack and what goes on the heap.

There is no official per-function limit.  I generally don't worry about
a few kilobytes unless it's recursive.  We have many, many functions
with stack frames in the order of a kilobyte.  Our coroutine and thread
stacks are reasonable (corotine stacks are 1MiB, the default thread
stack size 2MiB on x86-64, and I can't see code that sets a different
size).

>>       uint32_t checksum;
>>       uint64_t computed_size;
>>       uint64_t pagetable_size;
>> @@ -340,14 +340,14 @@ static int vpc_open(BlockDriverState *bs, QDict *o=
ptions, int flags,
>>       }
>>  =20
>>       if (disk_type =3D=3D VHD_DYNAMIC) {
>> -        ret =3D bdrv_pread(bs->file, be64_to_cpu(footer->data_offset), =
buf,
>> -                         HEADER_SIZE);
>> +        ret =3D bdrv_pread(bs->file, be64_to_cpu(footer->data_offset),
>> +                         dyndisk_header_buf, 1024);
>
> sizeof() would be better, but I see that=E2=80=99s what patch 6 is for.

Yes, but sizeof what?  VHDDynDiskHeader becomes usable for that only in
PATCH 5.

I chose to separate the buffers first, and only then tidy up their use.

>>           if (ret < 0) {
>>               error_setg(errp, "Error reading dynamic VHD header");
>>               goto fail;
>>           }
>>  =20
>> -        dyndisk_header =3D (VHDDynDiskHeader *) buf;
>> +        dyndisk_header =3D (VHDDynDiskHeader *)dyndisk_header_buf;
>>  =20
>>           if (strncmp(dyndisk_header->magic, "cxsparse", 8)) {
>>               error_setg(errp, "Invalid header magic");
>
> Reviewed-by: Max Reitz <mreitz@redhat.com>

Thanks!


