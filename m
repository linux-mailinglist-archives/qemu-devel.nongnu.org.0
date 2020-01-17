Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F292C1409B8
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jan 2020 13:29:14 +0100 (CET)
Received: from localhost ([::1]:56338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isQkT-00010x-O3
	for lists+qemu-devel@lfdr.de; Fri, 17 Jan 2020 07:29:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41407)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1isQiI-0007my-1p
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 07:26:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1isQiG-0005pd-HK
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 07:26:57 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:57619 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1isQiG-0005iT-6U; Fri, 17 Jan 2020 07:26:56 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47zgKg3KbFz9sRk; Fri, 17 Jan 2020 23:26:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1579264007;
 bh=rk9Itq8vbp7FveWXWx9e02tHcnkIffI2ETdmkVwG88w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KUUY8jMH+zdCbHltp+FHOKw2k5FBsAGUgcl/Wfnl/4gIkcOONK+XOp/sTyxy+hTk2
 De3MeUzwLndrpaWpuEWasPkhrvY4OQ+xOa2k2KYgivK6Zt4mBTUMmCKLdvtV1NmGEF
 e0inKTeyEHN28iTIqK/vJirNYEKWl606taEBsoSs=
Date: Fri, 17 Jan 2020 19:24:50 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH v6 1/3] target/ppc: Clarify the meaning of return values
 in kvm_handle_debug
Message-ID: <20200117092450.GX54439@umbus>
References: <20200110151344.278471-1-farosas@linux.ibm.com>
 <20200110151344.278471-2-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7WMexqIhC8AwFtpM"
Content-Disposition: inline
In-Reply-To: <20200110151344.278471-2-farosas@linux.ibm.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--7WMexqIhC8AwFtpM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2020 at 12:13:42PM -0300, Fabiano Rosas wrote:
> The kvm_handle_debug function can return 0 to go back into the guest
> or return 1 to notify the gdbstub thread and pass control to GDB.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Good change regardless of the rest of the series.  Applied to
ppc-for-5.0.

> ---
>  target/ppc/kvm.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>=20
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index d1c334f0e3..0bd4a8d399 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -53,6 +53,9 @@
> =20
>  #define PROC_DEVTREE_CPU      "/proc/device-tree/cpus/"
> =20
> +#define DEBUG_RETURN_GUEST 0
> +#define DEBUG_RETURN_GDB   1
> +
>  const KVMCapabilityInfo kvm_arch_required_capabilities[] =3D {
>      KVM_CAP_LAST_INFO
>  };
> @@ -1570,7 +1573,7 @@ void kvm_arch_update_guest_debug(CPUState *cs, stru=
ct kvm_guest_debug *dbg)
>  static int kvm_handle_hw_breakpoint(CPUState *cs,
>                                      struct kvm_debug_exit_arch *arch_inf=
o)
>  {
> -    int handle =3D 0;
> +    int handle =3D DEBUG_RETURN_GUEST;
>      int n;
>      int flag =3D 0;
> =20
> @@ -1578,13 +1581,13 @@ static int kvm_handle_hw_breakpoint(CPUState *cs,
>          if (arch_info->status & KVMPPC_DEBUG_BREAKPOINT) {
>              n =3D find_hw_breakpoint(arch_info->address, GDB_BREAKPOINT_=
HW);
>              if (n >=3D 0) {
> -                handle =3D 1;
> +                handle =3D DEBUG_RETURN_GDB;
>              }
>          } else if (arch_info->status & (KVMPPC_DEBUG_WATCH_READ |
>                                          KVMPPC_DEBUG_WATCH_WRITE)) {
>              n =3D find_hw_watchpoint(arch_info->address,  &flag);
>              if (n >=3D 0) {
> -                handle =3D 1;
> +                handle =3D DEBUG_RETURN_GDB;
>                  cs->watchpoint_hit =3D &hw_watchpoint;
>                  hw_watchpoint.vaddr =3D hw_debug_points[n].addr;
>                  hw_watchpoint.flags =3D flag;
> @@ -1596,12 +1599,12 @@ static int kvm_handle_hw_breakpoint(CPUState *cs,
> =20
>  static int kvm_handle_singlestep(void)
>  {
> -    return 1;
> +    return DEBUG_RETURN_GDB;
>  }
> =20
>  static int kvm_handle_sw_breakpoint(void)
>  {
> -    return 1;
> +    return DEBUG_RETURN_GDB;
>  }
> =20
>  static int kvm_handle_debug(PowerPCCPU *cpu, struct kvm_run *run)
> @@ -1653,7 +1656,7 @@ static int kvm_handle_debug(PowerPCCPU *cpu, struct=
 kvm_run *run)
>      env->error_code =3D POWERPC_EXCP_INVAL;
>      ppc_cpu_do_interrupt(cs);
> =20
> -    return 0;
> +    return DEBUG_RETURN_GUEST;
>  }
> =20
>  int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--7WMexqIhC8AwFtpM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl4hfWIACgkQbDjKyiDZ
s5JwSw//WLfWPfxlEgtvIyH1siO95CtVyj39Nws7/4xQZQv2ajG1PaCV690AmfGY
HB9K+D/1QiYJeXbWMj7+FrcIJnfzi+MLWfdv4RFCZkXKj+vYXmOpk/PTVZLqvT9N
Q8wuqyffFme6VzThoEHpzI73im+u2Mxx8WZHxEf2GETaVx9cFTmp1plURdbis7S7
yTp07YGVIUZ6bNxiqmajZObt2VntpZ0Zn7HzeDA9BkbGdYdnNTdvgi/dKzqCWmjp
1l0Qin5u7pTfsozrot7Vwb7ZznH3aVgwmfFZ88uzNS7fYB/+pXYFgF03+q5bThrk
w3HnlskeJPpP8/eJmfbDnaP0k2aG26pzDtNpSxNwISlWNjeNf3ZYfP3NrHmBL/SA
ignrMBoyp1OsJmn6XtW0vkVsD1iiJ6prCu2+HcGMTQG/AQ6bVJPg2eO+M/V/e9Fq
15uz1pIvnMwYxrGCglJpuuuxcHQEcdpgbQKqHuXb4V+nTTL9bZy4vX6Mtz+eEEHm
gGoXCBfg05JWVM2DDxyBzglM+hM0O6g5LbEJggQlYX+mpTyfwVhnoxYPnY5hmcx6
AF726XpVCU/Kxd52IQRrVDWW/7IPkP0fUhFCCqYaAC6tR8XFcbxlmBCpDaPq93Hw
7bDVhOUBAbL+IqeE8SIBGsx5Ki1JIA41sAt+1aPRJvwBU4VMQLc=
=hjmR
-----END PGP SIGNATURE-----

--7WMexqIhC8AwFtpM--

