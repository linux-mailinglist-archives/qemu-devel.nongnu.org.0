Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA9C83453
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Aug 2019 16:52:01 +0200 (CEST)
Received: from localhost ([::1]:33916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hv0oi-0005wN-OW
	for lists+qemu-devel@lfdr.de; Tue, 06 Aug 2019 10:52:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46953)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1hv0o6-0005Wa-NB
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 10:51:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hv0o5-000204-Jq
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 10:51:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51924)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hv0o5-0001zh-Bt
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 10:51:21 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8DEDA31D8AC;
 Tue,  6 Aug 2019 14:51:20 +0000 (UTC)
Received: from work-vm (ovpn-117-206.ams2.redhat.com [10.36.117.206])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 98C0A60A35;
 Tue,  6 Aug 2019 14:51:19 +0000 (UTC)
Date: Tue, 6 Aug 2019 15:51:17 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190806145117.GF3066@work-vm>
References: <20190806004648.8659-1-richardw.yang@linux.intel.com>
 <20190806004648.8659-2-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190806004648.8659-2-richardw.yang@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Tue, 06 Aug 2019 14:51:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 1/2] migration/postcopy: simplify
 calculation of run_start and fixup_start_addr
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
Cc: qemu-devel@nongnu.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Wei Yang (richardw.yang@linux.intel.com) wrote:
> The purpose of the calculation is to find a HostPage which is partially
> dirty.
>=20
>   * fixup_start_addr points to the start of the HostPage to discard
>   * run_start points to the next HostPage to check
>=20
> While in the middle stage, there would two cases for run_start:
>=20
>   * aligned with HostPage means this is not partially dirty
>   * not aligned means this is partially dirty
>=20
> When it is aligned, no work and calculation is necessary. run_start
> already points to the start of next HostPage and is ready to continue.
>=20
> When it is not aligned, the calculation could be simplified with:
>=20
>   * fixup_start_addr =3D QEMU_ALIGN_DOWN(run_start, host_ratio)
>   * run_start =3D QEMU_ALIGN_UP(run_start, host_ratio)
>=20
> By doing so, run_start always points to the next HostPage to check.
> fixup_start_addr always points to the HostPage to discard.
>=20
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>

Yes that's a lot shorter;  note it doess it on top of your cleanup
=66rom a couple of weeks back.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>


> ---
>  migration/ram.c | 34 +++++++---------------------------
>  1 file changed, 7 insertions(+), 27 deletions(-)
>=20
> diff --git a/migration/ram.c b/migration/ram.c
> index c9585487ac..d86661a015 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -2956,7 +2956,6 @@ static void postcopy_chunk_hostpages_pass(Migration=
State *ms, bool unsent_pass,
>      }
> =20
>      while (run_start < pages) {
> -        unsigned long fixup_start_addr;
>          unsigned long host_offset;
> =20
>          /*
> @@ -2964,45 +2963,26 @@ static void postcopy_chunk_hostpages_pass(Migrati=
onState *ms, bool unsent_pass,
>           * page, then we need to fixup this host page.
>           */
>          host_offset =3D run_start % host_ratio;
> -        if (host_offset) {
> -            fixup_start_addr =3D run_start - host_offset;
> -            /*
> -             * This host page has gone, the next loop iteration starts
> -             * from after the fixup
> -             */
> -            run_start =3D fixup_start_addr + host_ratio;
> -        } else {
> +        if (!host_offset) {
>              /* Find the end of this run */
> -            unsigned long run_end;
>              if (unsent_pass) {
> -                run_end =3D find_next_bit(unsentmap, pages, run_start + =
1);
> +                run_start =3D find_next_bit(unsentmap, pages, run_start =
+ 1);
>              } else {
> -                run_end =3D find_next_zero_bit(bitmap, pages, run_start =
+ 1);
> +                run_start =3D find_next_zero_bit(bitmap, pages, run_star=
t + 1);
>              }
>              /*
>               * If the end isn't at the start of a host page, then the
>               * run doesn't finish at the end of a host page
>               * and we need to discard.
>               */
> -            host_offset =3D run_end % host_ratio;
> -            if (host_offset) {
> -                fixup_start_addr =3D run_end - host_offset;
> -                /*
> -                 * This host page has gone, the next loop iteration star=
ts
> -                 * from after the fixup
> -                 */
> -                run_start =3D fixup_start_addr + host_ratio;
> -            } else {
> -                /*
> -                 * No discards on this iteration, next loop starts from
> -                 * next sent/dirty page
> -                 */
> -                run_start =3D run_end + 1;
> -            }
> +            host_offset =3D run_start % host_ratio;
>          }
> =20
>          if (host_offset) {
>              unsigned long page;
> +            unsigned long fixup_start_addr =3D QEMU_ALIGN_DOWN(run_start,
> +                                                             host_ratio);
> +            run_start =3D QEMU_ALIGN_UP(run_start, host_ratio);
> =20
>              /* Tell the destination to discard this page */
>              if (unsent_pass || !test_bit(fixup_start_addr, unsentmap)) {
> --=20
> 2.17.1
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

