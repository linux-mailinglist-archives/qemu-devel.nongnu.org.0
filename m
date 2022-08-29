Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B15415A418C
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 05:45:04 +0200 (CEST)
Received: from localhost ([::1]:35194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSVhv-0002sp-54
	for lists+qemu-devel@lfdr.de; Sun, 28 Aug 2022 23:45:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oSVYy-00061s-Dl; Sun, 28 Aug 2022 23:35:48 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:44123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oSVYr-0005DC-QJ; Sun, 28 Aug 2022 23:35:48 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4MGGKq39dvz4xDn; Mon, 29 Aug 2022 13:35:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1661744127;
 bh=nXCFwMTptL8164bHiSj/7LBIDNVWmnHxyHA1jvuJEXo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LxgIyqozKJEq8PwD2wOsD0D4p8l58iUznenJntkm1kb7Ozvegp0OXlWquEBPcvmCg
 9LvxRQXFR2Lk4d9IDDcL6P/ReG7LkAqRw1L1CFIe2UK87mDJlhlzOxc4SgQ/gcyd3i
 k5z87f3vEBJLAfqfjWVh0oxkq1zDuji44M14DTf4=
Date: Mon, 29 Aug 2022 13:34:35 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org,
 alistair.francis@wdc.com, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH for-7.2 v4 15/21] qmp/hmp, device_tree.c: introduce 'info
 fdt' command
Message-ID: <YwwzyxSCB8rP/usi@yekko>
References: <20220826141150.7201-1-danielhb413@gmail.com>
 <20220826141150.7201-16-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FloNXYmf1TGm/w7b"
Content-Disposition: inline
In-Reply-To: <20220826141150.7201-16-danielhb413@gmail.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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


--FloNXYmf1TGm/w7b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 26, 2022 at 11:11:44AM -0300, Daniel Henrique Barboza wrote:
> Reading the FDT requires that the user saves the fdt_blob and then use
> 'dtc' to read the contents. Saving the file and using 'dtc' is a strong
> use case when we need to compare two FDTs, but it's a lot of steps if
> you want to do quick check on a certain node or property.
>=20
> 'info fdt' retrieves FDT nodes (and properties, later on) and print it
> to the user. This can be used to check the FDT on running machines
> without having to save the blob and use 'dtc'.
>=20
> The implementation is based on the premise that the machine thas a FDT
> created using libfdt and pointed by 'machine->fdt'. As long as this
> pre-requisite is met the machine should be able to support it.
>=20
> For now we're going to add the required QMP/HMP boilerplate and the
> capability of printing the name of the properties of a given node. Next
> patches will extend 'info fdt' to be able to print nodes recursively,
> and then individual properties.
>=20
> This command will always be executed in-band (i.e. holding BQL),
> avoiding potential race conditions with machines that might change the
> FDT during runtime (e.g. PowerPC 'pseries' machine).
>=20
> 'info fdt' is not something that we expect to be used aside from debuggin=
g,
> so we're implementing it in QMP as 'x-query-fdt'.
>=20
> This is an example of 'info fdt' fetching the '/chosen' node of the
> pSeries machine:
>=20
> (qemu) info fdt /chosen
> chosen {
>     ibm,architecture-vec-5;
>     rng-seed;
>     ibm,arch-vec-5-platform-support;
>     linux,pci-probe-only;
>     stdout-path;
>     linux,stdout-path;
>     qemu,graphic-depth;
>     qemu,graphic-height;
>     qemu,graphic-width;
> };
>=20
> And the same node for the aarch64 'virt' machine:
>=20
> (qemu) info fdt /chosen
> chosen {
>     stdout-path;
>     rng-seed;
>     kaslr-seed;
> };

So, I'm reasonably convinced allowing dumping the whole dtb from
qmp/hmp is useful.  I'm less convined that info fdt is worth the
additional complexity it incurs.  Note that as well as being able to
decompile a whole dtb using dtc, you can also extract and list
specific properties from a dtb blob using the 'fdtget' tool which is
part of the dtc tree.

>=20
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hmp-commands-info.hx         | 13 ++++++++++
>  include/monitor/hmp.h        |  1 +
>  include/sysemu/device_tree.h |  4 +++
>  monitor/hmp-cmds.c           | 13 ++++++++++
>  monitor/qmp-cmds.c           | 12 +++++++++
>  qapi/machine.json            | 19 +++++++++++++++
>  softmmu/device_tree.c        | 47 ++++++++++++++++++++++++++++++++++++
>  7 files changed, 109 insertions(+)
>=20
> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> index 188d9ece3b..743b48865d 100644
> --- a/hmp-commands-info.hx
> +++ b/hmp-commands-info.hx
> @@ -921,3 +921,16 @@ SRST
>    ``stats``
>      Show runtime-collected statistics
>  ERST
> +
> +    {
> +        .name       =3D "fdt",
> +        .args_type  =3D "nodepath:s",
> +        .params     =3D "nodepath",
> +        .help       =3D "show firmware device tree node given its path",
> +        .cmd        =3D hmp_info_fdt,
> +    },
> +
> +SRST
> +  ``info fdt``
> +    Show a firmware device tree node given its path. Requires libfdt.
> +ERST
> diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
> index d7f324da59..c0883dd1e3 100644
> --- a/include/monitor/hmp.h
> +++ b/include/monitor/hmp.h
> @@ -135,6 +135,7 @@ void hmp_set_vcpu_dirty_limit(Monitor *mon, const QDi=
ct *qdict);
>  void hmp_cancel_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
>  void hmp_info_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
>  void hmp_dumpdtb(Monitor *mon, const QDict *qdict);
> +void hmp_info_fdt(Monitor *mon, const QDict *qdict);
>  void hmp_human_readable_text_helper(Monitor *mon,
>                                      HumanReadableText *(*qmp_handler)(Er=
ror **));
>  void hmp_info_stats(Monitor *mon, const QDict *qdict);
> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
> index bf7684e4ed..057d13e397 100644
> --- a/include/sysemu/device_tree.h
> +++ b/include/sysemu/device_tree.h
> @@ -14,6 +14,8 @@
>  #ifndef DEVICE_TREE_H
>  #define DEVICE_TREE_H
> =20
> +#include "qapi/qapi-types-common.h"
> +
>  void *create_device_tree(int *sizep);
>  void *load_device_tree(const char *filename_path, int *sizep);
>  #ifdef CONFIG_LINUX
> @@ -137,6 +139,8 @@ int qemu_fdt_add_path(void *fdt, const char *path);
> =20
>  void qemu_fdt_dumpdtb(void *fdt, int size);
>  void qemu_fdt_qmp_dumpdtb(const char *filename, Error **errp);
> +HumanReadableText *qemu_fdt_qmp_query_fdt(const char *nodepath,
> +                                          Error **errp);
> =20
>  /**
>   * qemu_fdt_setprop_sized_cells_from_array:
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 1c7bfd3b9d..93a4103afa 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -2484,3 +2484,16 @@ void hmp_dumpdtb(Monitor *mon, const QDict *qdict)
>          hmp_handle_error(mon, local_err);
>      }
>  }
> +
> +void hmp_info_fdt(Monitor *mon, const QDict *qdict)
> +{
> +    const char *nodepath =3D qdict_get_str(qdict, "nodepath");
> +    Error *err =3D NULL;
> +    g_autoptr(HumanReadableText) info =3D qmp_x_query_fdt(nodepath, &err=
);
> +
> +    if (hmp_handle_error(mon, err)) {
> +        return;
> +    }
> +
> +    monitor_printf(mon, "%s", info->human_readable_text);
> +}
> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> index 8415aca08c..db2c6aa7da 100644
> --- a/monitor/qmp-cmds.c
> +++ b/monitor/qmp-cmds.c
> @@ -603,9 +603,21 @@ void qmp_dumpdtb(const char *filename, Error **errp)
>  {
>      return qemu_fdt_qmp_dumpdtb(filename, errp);
>  }
> +
> +HumanReadableText *qmp_x_query_fdt(const char *nodepath, Error **errp)
> +{
> +    return qemu_fdt_qmp_query_fdt(nodepath, errp);
> +}
>  #else
>  void qmp_dumpdtb(const char *filename, Error **errp)
>  {
>      error_setg(errp, "dumpdtb requires libfdt");
>  }
> +
> +HumanReadableText *qmp_x_query_fdt(const char *nodepath, Error **errp)
> +{
> +    error_setg(errp, "this command requires libfdt");
> +
> +    return NULL;
> +}
>  #endif
> diff --git a/qapi/machine.json b/qapi/machine.json
> index aeb013f3dd..96cff541ca 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1681,3 +1681,22 @@
>  ##
>  { 'command': 'dumpdtb',
>    'data': { 'filename': 'str' } }
> +
> +##
> +# @x-query-fdt:
> +#
> +# Query for FDT element (node or property). Requires 'libfdt'.
> +#
> +# @nodepath: the path of the FDT node to be retrieved
> +#
> +# Features:
> +# @unstable: This command is meant for debugging.
> +#
> +# Returns: FDT node
> +#
> +# Since: 7.2
> +##
> +{ 'command': 'x-query-fdt',
> +  'data': { 'nodepath': 'str' },
> +  'returns': 'HumanReadableText',
> +  'features': [ 'unstable' ]  }
> diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
> index cd487ddd4d..6b15f6ace2 100644
> --- a/softmmu/device_tree.c
> +++ b/softmmu/device_tree.c
> @@ -18,6 +18,7 @@
>  #endif
> =20
>  #include "qapi/error.h"
> +#include "qapi/type-helpers.h"
>  #include "qemu/error-report.h"
>  #include "qemu/option.h"
>  #include "qemu/bswap.h"
> @@ -661,3 +662,49 @@ void qemu_fdt_qmp_dumpdtb(const char *filename, Erro=
r **errp)
> =20
>      error_setg(errp, "Error when saving machine FDT to file %s", filenam=
e);
>  }
> +
> +static void fdt_format_node(GString *buf, int node, int depth)
> +{
> +    const struct fdt_property *prop =3D NULL;
> +    const char *propname =3D NULL;
> +    void *fdt =3D current_machine->fdt;
> +    int padding =3D depth * 4;
> +    int property =3D 0;
> +    int prop_size;
> +
> +    g_string_append_printf(buf, "%*s%s {\n", padding, "",
> +                           fdt_get_name(fdt, node, NULL));
> +
> +    padding +=3D 4;
> +
> +    fdt_for_each_property_offset(property, fdt, node) {
> +        prop =3D fdt_get_property_by_offset(fdt, property, &prop_size);
> +        propname =3D fdt_string(fdt, fdt32_to_cpu(prop->nameoff));
> +
> +        g_string_append_printf(buf, "%*s%s;\n", padding, "", propname);
> +    }
> +
> +    padding -=3D 4;
> +    g_string_append_printf(buf, "%*s};\n", padding, "");
> +}
> +
> +HumanReadableText *qemu_fdt_qmp_query_fdt(const char *nodepath, Error **=
errp)
> +{
> +    g_autoptr(GString) buf =3D g_string_new("");
> +    int node;
> +
> +    if (!current_machine->fdt) {
> +        error_setg(errp, "Unable to find the machine FDT");
> +        return NULL;
> +    }
> +
> +    node =3D fdt_path_offset(current_machine->fdt, nodepath);
> +    if (node < 0) {
> +        error_setg(errp, "node '%s' not found in FDT", nodepath);
> +        return NULL;
> +    }
> +
> +    fdt_format_node(buf, node, 0);
> +
> +    return human_readable_text_from_str(buf);
> +}

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--FloNXYmf1TGm/w7b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmMMM8UACgkQgypY4gEw
YSLm0w/9Fxg1Nmr85dtTCQeuByaAJ+tpLkEERT2QlYDBkmYdSoxXR7046ihwn0i0
FAmW88sIbu961LFG4F0mZQan4gV02tGXLmyy0toOFcAuRPTZHWuoZ16lnZtgTssm
BmtsgSyKTBqrGxov9uvYLzCUaEnbdeNzFquM0B7ltiadsTZRK87TcGnE8WcBL2CX
Koqrbl4j+LYJzcsrfvLzhFUYpChrtc3eB65IGCPPAUpm7CbsY5MA1+rydPcJZem5
z5pqSDoN2wLObBKTRwUxH98j6Ok1BU69siL02863XTDbpScdqu0YYy8Znpa+eDuo
ByRgUcsX3gUi9VKBOjEX114MJU8gdWoUjqGQts+It02LiJnQ23VeDKu+MP2ZA0Ah
cyVtBzKQegdhgKPPcM8bDVUw9Utc/jR3uUc+X5iZw2QDRgYYvP2grreQibH+YWSv
E9rbMJzjQ66hFCoUQePvAXcjH9gQfo+tIgQ3nC9w9/+QynrchzUBPlsn5Mekg4/Z
SXbPMhL4trPMCjvrSje4+UTVU0dAjhZDOb2fMy7FI3IWGenEG5ZMrUdpPVJ609FC
Bs+DSK5ajBpSffAaxjF+IO1bGXgVssOMkru/YFPsynlOK61eDYTKQerlxenhgpnU
uzEF0QAfF/JaZ5P9n9PSZDfg+01qN48HLV4trO1LANoPEyD6hks=
=DuRq
-----END PGP SIGNATURE-----

--FloNXYmf1TGm/w7b--

