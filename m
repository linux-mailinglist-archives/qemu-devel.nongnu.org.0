Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E45E26AB75
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jul 2019 17:13:04 +0200 (CEST)
Received: from localhost ([::1]:50014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnP8a-00083o-6i
	for lists+qemu-devel@lfdr.de; Tue, 16 Jul 2019 11:13:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56196)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hnP8M-0007cb-0f
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 11:12:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hnP8K-00045m-6Y
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 11:12:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48510)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>)
 id 1hnP8F-0003xM-T8; Tue, 16 Jul 2019 11:12:44 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C8D4D3087930;
 Tue, 16 Jul 2019 15:12:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-111.ams2.redhat.com
 [10.36.116.111])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A4686012C;
 Tue, 16 Jul 2019 15:12:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0B68511386A0; Tue, 16 Jul 2019 17:12:36 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20190715121338.20600-1-philmd@redhat.com>
 <20190715121338.20600-3-philmd@redhat.com>
 <87o91u2mk7.fsf@dusky.pond.sub.org> <20190716140443.GE2770@work-vm>
Date: Tue, 16 Jul 2019 17:12:35 +0200
In-Reply-To: <20190716140443.GE2770@work-vm> (David Alan Gilbert's message of
 "Tue, 16 Jul 2019 15:04:43 +0100")
Message-ID: <87h87m109o.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Tue, 16 Jul 2019 15:12:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v5 2/5] hw/block/pflash_cfi01: Use the
 correct READ_ARRAY value
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:

> * Markus Armbruster (armbru@redhat.com) wrote:
>> Philippe asked me to have a look at this one, so here goes.
>>=20
>> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>>=20
>> > In the document [*] the "Read Array Flowchart", the READ_ARRAY
>> > command has a value of 0xff.
>> >
>> > Use the correct value in the pflash model.
>> >
>> > There is no change of behavior in the guest, because:
>> > - when the guest were sending 0xFF, the reset_flash label
>> >   was setting the command value as 0x00
>> > - 0x00 was used internally for READ_ARRAY
>>=20
>> *Groan*
>>=20
>> Is this cleanup, or does it fix an observable bug?
>>=20
>> > To keep migration with older versions behaving correctly, we
>> > decide to always migrate the READ_ARRAY as 0x00.
>> >
>> > If the CFI open standard decide to assign a new command of value
>> > 0x00, this model is flawed because it uses this value internally.
>> > If a guest eventually requires this new CFI feature, a different
>> > model will be required (or this same model but breaking backward
>> > migration). So it is safe to keep migrating READ_ARRAY as 0x00.
>>=20
>> We could perhaps keep migration working for "benign" device states, with
>> judicious use of subsections.  We'll cross that bridge when we get to
>> it.
>>=20
>> > [*] "Common Flash Interface (CFI) and Command Sets"
>> >     (Intel Application Note 646)
>> >     Appendix B "Basic Command Set"
>> >
>> > Reviewed-by: John Snow <jsnow@redhat.com>
>> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> > Regression-tested-by: Laszlo Ersek <lersek@redhat.com>
>> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> > ---
>> > v3: Handle migrating the 'cmd' field.
>> > v4: Handle migrating to older QEMU (Dave)
>> > v5: Add a paragraph about why this model is flawed due to
>> >     historically using READ_ARRAY as 0x00 (Dave, Peter).
>> >
>> > Since Laszlo stated he did not test migration [*], I'm keeping his
>> > test tag, because the change with v2 has no impact in the tests
>> > he ran.
>> >
>> > Likewise I'm keeping John and Alistair tags, but I'd like an extra
>> > review for the migration change, thanks!
>> >
>> > [*] https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg00679.html
>> > ---
>> >  hw/block/pflash_cfi01.c | 57 ++++++++++++++++++++++++++++++++++-------
>> >  1 file changed, 48 insertions(+), 9 deletions(-)
>> >
>> > diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
>> > index 9e34fd4e82..85bb2132c0 100644
>> > --- a/hw/block/pflash_cfi01.c
>> > +++ b/hw/block/pflash_cfi01.c
>> > @@ -96,6 +96,37 @@ struct PFlashCFI01 {
>> >      bool old_multiple_chip_handling;
>> >  };
>> >=20=20
>> > +static int pflash_pre_save(void *opaque)
>> > +{
>> > +    PFlashCFI01 *s =3D opaque;
>> > +
>> > +    /*
>> > +     * Previous to QEMU v4.1 an incorrect value of 0x00 was used for =
the
>> > +     * READ_ARRAY command. To preserve migrating to these older versi=
on,
>> > +     * always migrate the READ_ARRAY command as 0x00.
>> > +     */
>> > +    if (s->cmd =3D=3D 0xff) {
>> > +        s->cmd =3D 0x00;
>> > +    }
>> > +
>> > +    return 0;
>> > +}
>> > +
>> > +static int pflash_post_save(void *opaque)
>> > +{
>> > +    PFlashCFI01 *s =3D opaque;
>> > +
>> > +    /*
>> > +     * If migration failed, the guest will continue to run.
>> > +     * Restore the correct READ_ARRAY value.
>> > +     */
>> > +    if (s->cmd =3D=3D 0x00) {
>> > +        s->cmd =3D 0xff;
>> > +    }
>> > +
>> > +    return 0;
>> > +}
>>=20
>> Uh, this gives me a queasy feeling.  Perhaps David can assuage it.
>
> See the previous 4 versions of discussion....

Jumped in at v5; sorry about that.

>> I figure the intent is to migrate PFlashCFI01 member @cmd value 0xFF as
>> 0x00, for migration compatibility to and from older versions.
>>=20
>> You do this by monkey-patching it to 0x00 before migration, and to 0xFF
>> afterwards.  On the incoming side, you replace 0x00 by 0xFF, in
>> pflash_post_load() below.
>>=20
>> Questions:
>>=20
>> * Can anything but the code that sends @cmd see the temporary 0x00 value
>>   between pflash_pre_save() and pflash_post_save()
>
> It is the same pflash data structure; but all CPUs are stopped and we're
> just walking the list of devices serialising them; so no nothing should
> be seeing that value.

Sounds good.

> (There is another way to do this, which is to produce a temporary
> structure at this point, populate the temporary structure and migrate
> that)

Not necessary.

The uh-ohs below still need assuaging, not necessarily yours.

> Dave
>
>> * Consider the matrix source \in { old, new } x dest \in { old, new } x
>>   @cmd on source in { 0x00, 0xFF }.  What does migration put into @cmd
>>   on dest?  Eight cases:
>>=20
>>   source @cmd  ->  wire  ->  dest @cmd
>>     old  0x00  ->  0x00  ->  old  0x00  (1)
>>                              new  0xFF  (2)
>>     old  0xFF  ->  0xFF  ->  old  0xFF  (3)
>>                              new  0xFF  (4)
>>     new  0x00  ->  0x00  ->  old  0x00  (5)
>>                              new  0xFF  (6)
>>     new  0xFF  ->  0x00  ->  old  0x00  (7)
>>                              new  0xFF  (8)
>>=20
>>   Old -> old (cases 1 and 3) is unaffected by this patch.
>>=20
>>   New -> new leaves 0xFF unchanged (8).  It changes 0x00 to 0xFF (6).
>>   Uh-oh.  Can this happen?  Rephrasing the question: can @cmd ever be
>>   0x00 with this patch applied?
>>=20
>>   Old -> new leaves 0xFF unchanged (4).  It changes 0x00 to 0xFF (2),
>>   which I think is intentional.
>>=20
>>   New -> old leaves 0x00 unchanged (5).  It changes 0xFF to 0x00 (7),
>>   which I think is intentional.
>>=20
>>   Old -> new -> old leaves 0x00 unchanged.  Good.  It changes 0xFF to
>>   0x00.  Uh-oh.  Can @cmd ever be 0xFF before this patch?
>>=20
>>   New -> old -> new leaves 0xFF unchanged.  Good.  It changes 0x00 to
>>   0xFF.  Same uh-oh as for new -> new.
>>=20
>> > +
>> >  static int pflash_post_load(void *opaque, int version_id);
>> >=20=20
>> >  static const VMStateDescription vmstate_pflash =3D {
>> > @@ -103,6 +134,8 @@ static const VMStateDescription vmstate_pflash =3D=
 {
>> >      .version_id =3D 1,
>> >      .minimum_version_id =3D 1,
>> >      .post_load =3D pflash_post_load,
>> > +    .pre_save =3D pflash_pre_save,
>> > +    .post_save =3D pflash_post_save,
>> >      .fields =3D (VMStateField[]) {
>> >          VMSTATE_UINT8(wcycle, PFlashCFI01),
>> >          VMSTATE_UINT8(cmd, PFlashCFI01),
>> > @@ -277,10 +310,9 @@ static uint32_t pflash_read(PFlashCFI01 *pfl, hwa=
ddr offset,
>> >          /* This should never happen : reset state & treat it as a rea=
d */
>> >          DPRINTF("%s: unknown command state: %x\n", __func__, pfl->cmd=
);
>> >          pfl->wcycle =3D 0;
>> > -        pfl->cmd =3D 0;
>> > +        pfl->cmd =3D 0xff;
>> >          /* fall through to read code */
>> > -    case 0x00:
>> > -        /* Flash area read */
>> > +    case 0xff: /* Read Array */
>> >          ret =3D pflash_data_read(pfl, offset, width, be);
>> >          break;
>>=20
>> On 0xFF, we no longer zap pfl->wcycle and pfl->cmd.
>>=20
>> On 0x00, we do.
>>=20
>> We zap pfl->cmd to 0xFF instead of 0x00.  Same below after label
>> error_flash and reset_flash.  Related: initialization to 0xFF instead of
>> 0x00 in pflash_cfi01_realize().  I *guess* these changes together ensure
>> pfl->cmd can't become 0x00.  Correct?
>>=20
>> >      case 0x10: /* Single byte program */
>> > @@ -448,8 +480,6 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr =
offset,
>> >      case 0:
>> >          /* read mode */
>> >          switch (cmd) {
>> > -        case 0x00: /* ??? */
>> > -            goto reset_flash;
>>=20
>> On 0x00, we now use default: goto error_flash.  Can this happen?
>>=20
>> >          case 0x10: /* Single Byte Program */
>> >          case 0x40: /* Single Byte Program */
>> >              DPRINTF("%s: Single Byte Program\n", __func__);
>> > @@ -526,7 +556,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr =
offset,
>> >              if (cmd =3D=3D 0xd0) { /* confirm */
>> >                  pfl->wcycle =3D 0;
>> >                  pfl->status |=3D 0x80;
>> > -            } else if (cmd =3D=3D 0xff) { /* read array mode */
>> > +            } else if (cmd =3D=3D 0xff) { /* Read Array */
>> >                  goto reset_flash;
>> >              } else
>> >                  goto error_flash;
>> > @@ -553,7 +583,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr =
offset,
>> >              } else if (cmd =3D=3D 0x01) {
>> >                  pfl->wcycle =3D 0;
>> >                  pfl->status |=3D 0x80;
>> > -            } else if (cmd =3D=3D 0xff) {
>> > +            } else if (cmd =3D=3D 0xff) { /* read array mode */
>>=20
>> Your new comment is phrased the way you corrected in the previous hunk.
>> Intentional?
>>=20
>> >                  goto reset_flash;
>> >              } else {
>> >                  DPRINTF("%s: Unknown (un)locking command\n", __func__=
);
>> > @@ -645,7 +675,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr =
offset,
>>     error_flash:
>>        qemu_log_mask(LOG_UNIMP, "%s: Unimplemented flash cmd sequence "
>>                      "(offset " TARGET_FMT_plx ", wcycle 0x%x cmd 0x%x v=
alue 0x%x)"
>>                      "\n", __func__, offset, pfl->wcycle, pfl->cmd, valu=
e);
>>=20
>>     reset_flash:
>> >      trace_pflash_reset();
>> >      memory_region_rom_device_set_romd(&pfl->mem, true);
>> >      pfl->wcycle =3D 0;
>> > -    pfl->cmd =3D 0;
>> > +    pfl->cmd =3D 0xff;
>> >  }
>> >=20=20
>> >=20=20
>> > @@ -761,7 +791,7 @@ static void pflash_cfi01_realize(DeviceState *dev,=
 Error **errp)
>> >      }
>> >=20=20
>> >      pfl->wcycle =3D 0;
>> > -    pfl->cmd =3D 0;
>> > +    pfl->cmd =3D 0xff;
>> >      pfl->status =3D 0;
>> >      /* Hardcoded CFI table */
>> >      /* Standard "QRY" string */
>> > @@ -1001,5 +1031,14 @@ static int pflash_post_load(void *opaque, int v=
ersion_id)
>> >          pfl->vmstate =3D qemu_add_vm_change_state_handler(postload_up=
date_cb,
>> >                                                          pfl);
>> >      }
>> > +
>> > +    /*
>> > +     * Previous to QEMU v4.1 an incorrect value of 0x00 was used for =
the
>> > +     * READ_ARRAY command.
>> > +     */
>> > +    if (pfl->cmd =3D=3D 0x00) {
>> > +        pfl->cmd =3D 0xff;
>> > +    }
>> > +
>> >      return 0;
>> >  }
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

