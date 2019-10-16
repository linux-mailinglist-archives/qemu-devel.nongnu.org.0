Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 531A5D9BE5
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Oct 2019 22:41:51 +0200 (CEST)
Received: from localhost ([::1]:48060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKq7B-0008Fg-Tb
	for lists+qemu-devel@lfdr.de; Wed, 16 Oct 2019 16:41:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42566)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iKq6C-0007oN-TU
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 16:40:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iKq6A-0006vw-Ex
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 16:40:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36961)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iKq6A-0006vf-5Z
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 16:40:46 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D9562307BD27;
 Wed, 16 Oct 2019 20:40:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.118.123])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A57960BF7;
 Wed, 16 Oct 2019 20:40:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 673591138619; Wed, 16 Oct 2019 22:40:29 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v9 04/15] hw/i386/pc: replace use of strtol with
 qemu_strtol in x86_load_linux()
References: <20191015112346.45554-1-slp@redhat.com>
 <20191015112346.45554-5-slp@redhat.com>
 <b7baa2ab-210b-e7ef-399e-4dbbbc0ee0aa@redhat.com>
Date: Wed, 16 Oct 2019 22:40:29 +0200
In-Reply-To: <b7baa2ab-210b-e7ef-399e-4dbbbc0ee0aa@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 15 Oct 2019 13:36:09
 +0200")
Message-ID: <87wod4pgoy.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Wed, 16 Oct 2019 20:40:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: "Daniel P . Berrange" <berrange@redhat.com>, ehabkost@redhat.com,
 Sergio Lopez <slp@redhat.com>, mst@redhat.com, qemu-devel@nongnu.org,
 kraxel@redhat.com, imammedo@redhat.com, pbonzini@redhat.com, rth@twiddle.net,
 lersek@redhat.com, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Hi Sergio,
>
> On 10/15/19 1:23 PM, Sergio Lopez wrote:
>> Follow checkpatch.pl recommendation and replace the use of strtol with
>> qemu_strtol in x86_load_linux().
>
> "with qemu_strtoui"
>
>>
>> Signed-off-by: Sergio Lopez <slp@redhat.com>
>> ---
>>   hw/i386/pc.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>> index 77e86bfc3d..c8608b8007 100644
>> --- a/hw/i386/pc.c
>> +++ b/hw/i386/pc.c
>> @@ -68,6 +68,7 @@
>>   #include "qemu/config-file.h"
>>   #include "qemu/error-report.h"
>>   #include "qemu/option.h"
>> +#include "qemu/cutils.h"
>>   #include "hw/acpi/acpi.h"
>>   #include "hw/acpi/cpu_hotplug.h"
>>   #include "hw/boards.h"
>> @@ -1202,6 +1203,7 @@ static void x86_load_linux(PCMachineState *pcms,
>>       vmode =3D strstr(kernel_cmdline, "vga=3D");
>>       if (vmode) {
>>           unsigned int video_mode;
>> +        int ret;
>>           /* skip "vga=3D" */
>>           vmode +=3D 4;
>>           if (!strncmp(vmode, "normal", 6)) {
>> @@ -1211,7 +1213,12 @@ static void x86_load_linux(PCMachineState *pcms,
>>           } else if (!strncmp(vmode, "ask", 3)) {
>>               video_mode =3D 0xfffd;
>>           } else {
>> -            video_mode =3D strtol(vmode, NULL, 0);
>> +            ret =3D qemu_strtoui(vmode, NULL, 0, &video_mode);
>> +            if (ret !=3D 0) {
>> +                fprintf(stderr, "qemu: can't parse 'vga' parameter: %s\=
n",
>> +                        strerror(-ret));
>
> (Cc'ing Markus/Daniel just in case)
>
> I'm wondering if using fprintf() is appropriate, thinking about
> instantiating a machine via libvirt, is this error reported to the
> user?
>
> I first thought about using error_report() instead:
>
>     error_report("qemu: can't parse 'vga' parameter: %s",
>                  strerror(-ret));

Make that

     error_report("can't parse 'vga' parameter: %s", strerror(-ret));

> But this API is meaningful when used in console/monitor. We can't get
> here from the monitor,

True, but error_report() should be used anyway, because (1) it makes
intent more obvious, and (2) it uses a uniform, featureful error format.

With the proposed fprintf(), we get

    qemu: can't parse 'vga' parameter: Numerical result out of range

With error_report():

* we report the *actual* argv[0] instead of "qemu"

* we obey -msg timestamp=3Don

* if "[PATCHv2 1/2] util/qemu-error: add guest name helper with -msg
  options" gets accepted, we obey -msg guest-name=3Don, too

* we have a common way to point to the offending command line argument
  or configuration file line (not worth doing here)

Please use error_report().

[...]

