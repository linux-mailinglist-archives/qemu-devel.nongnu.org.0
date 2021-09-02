Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1503FF6ED
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 00:11:01 +0200 (CEST)
Received: from localhost ([::1]:54664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLuvE-0006J7-51
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 18:11:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1mLutM-0004wC-19
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 18:09:04 -0400
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e]:34342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1mLutD-0005CC-Bq
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 18:09:03 -0400
Received: by mail-vs1-xe2e.google.com with SMTP id x137so2853042vsx.1
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 15:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7yhm8IquLoGF/NdNdfIB7SDB8HBzpdYyhYrcsBhyCDk=;
 b=ucPSLapxdngi7HQetve984rsEqWdwVxB5lSgAtuE4wAPCYfbTqVXCgCgqFRTJGQxD3
 hNfx1fVpY8J4Y6XhlheRI1zG1p1H1/bBUUPi2tQCos2+TmYfPeRmt+794psqlKeSy8la
 vd8oTC8CfRtFVPSLSyOd7QGkCAHoH0noZCGph37vUVPHWqfLTx5+wNOrm+feCyBxWY/7
 JC+iPKw5MkQkSuFK2is7ZIoNrGZttG/v/hxoLkdzrq+kAKbLxf+682zoORUa7TNRJXMu
 3iKH32seApOq6R+715uCFES5e9kT0DaexruBu5l3aU/em4EWn7drso+PE1fjlEQ2acPe
 7Vlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7yhm8IquLoGF/NdNdfIB7SDB8HBzpdYyhYrcsBhyCDk=;
 b=tRlizvtQdHMIxAoFc07CwJ0NptX4wP/sw/MjmTwZjVMDfWzc6Nlxm/Cb8VrwMN9Oj1
 fbn2/GoyETqKql/mKVMa/KUX235DNf4LL9rEtHHFjtKA6ilCP1BG5UG6HT0hexwuSkUv
 5RtVXm9vr2YR+Y2E/WLqvB6bnyQICTpIH3D0L3ayt4tH+fAA7AkvWHrlMzMHdroKde9t
 NOtxKXbGvKLC7QAWi1cRdMSoSBv/IlSofs3ryqvt8/hlYPnAXUYR70b8+QlNDxp4itiY
 ZV+qcnHZ8ao5N4SaZMXz+OV75FqvFMyzHbdMLI15WvrkjnUSzzNI17kOCJMUjYiMHiw3
 8dDg==
X-Gm-Message-State: AOAM533TAjAN29NoQU0EIwQzvacVRQPWlfIzXD9vsSvFbl35tjIZE5C7
 T0vJrDqiBFlHuW1hjZWy4GQ+N+cJgjPGkeUHx9VzYg==
X-Google-Smtp-Source: ABdhPJyBFrdAJqW9OB6eEax+cAelCvO0e+jfd8OL4u1RVE1nWE7b2HX+0nz7RsHbE71HOewkTp5CD8QICV2aMtR0Mnw=
X-Received: by 2002:a05:6102:222c:: with SMTP id
 d12mr139348vsb.22.1630620534170; 
 Thu, 02 Sep 2021 15:08:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210902212015.1303865-1-dje@google.com>
In-Reply-To: <20210902212015.1303865-1-dje@google.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 2 Sep 2021 15:08:43 -0700
Message-ID: <CAO=notz1O6evFDkrxkeEkYdTJdJy-H1fbOrJJwbkefvgc=B7fg@mail.gmail.com>
Subject: Re: [PATCH] net: Add "info neighbors" command
To: Doug Evans <dje@google.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Wang <jasowang@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000b44afd05cb0a6d03"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2e;
 envelope-from=venture@google.com; helo=mail-vs1-xe2e.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b44afd05cb0a6d03
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 2, 2021 at 2:21 PM Doug Evans <dje@google.com> wrote:

> This command dumps the ARP and NDP tables maintained within slirp.
> One use-case for it is showing the guest's IPv6 address(es).
>
> Signed-off-by: Doug Evans <dje@google.com>
>
Reviewed-by: Patrick Venture <venture@google.com>

> ---
>  hmp-commands-info.hx               | 15 +++++++
>  include/net/slirp.h                |  1 +
>  net/slirp.c                        | 15 +++++++
>  tests/acceptance/info_neighbors.py | 69 ++++++++++++++++++++++++++++++
>  4 files changed, 100 insertions(+)
>  create mode 100644 tests/acceptance/info_neighbors.py
>
> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> index 27206ac049..386f09f163 100644
> --- a/hmp-commands-info.hx
> +++ b/hmp-commands-info.hx
> @@ -512,6 +512,21 @@ SRST
>      Show user network stack connection states.
>  ERST
>
> +#if defined(CONFIG_SLIRP)
> +    {
> +        .name       = "neighbors",
> +        .args_type  = "",
> +        .params     = "",
> +        .help       = "show the ARP and NDP tables",
> +        .cmd        = hmp_info_neighbors,
> +    },
> +#endif
> +
> +SRST
> +  ``info neighbors``
> +    Show the ARP and NDP tables.
> +ERST
> +
>      {
>          .name       = "migrate",
>          .args_type  = "",
> diff --git a/include/net/slirp.h b/include/net/slirp.h
> index bad3e1e241..b9ccfda1e7 100644
> --- a/include/net/slirp.h
> +++ b/include/net/slirp.h
> @@ -31,6 +31,7 @@ void hmp_hostfwd_add(Monitor *mon, const QDict *qdict);
>  void hmp_hostfwd_remove(Monitor *mon, const QDict *qdict);
>
>  void hmp_info_usernet(Monitor *mon, const QDict *qdict);
> +void hmp_info_neighbors(Monitor *mon, const QDict *qdict);
>
>  #endif
>
> diff --git a/net/slirp.c b/net/slirp.c
> index ad3a838e0b..29a4cd3fe1 100644
> --- a/net/slirp.c
> +++ b/net/slirp.c
> @@ -1028,6 +1028,21 @@ void hmp_info_usernet(Monitor *mon, const QDict
> *qdict)
>      }
>  }
>
> +void hmp_info_neighbors(Monitor *mon, const QDict *qdict)
> +{
> +    SlirpState *s;
> +
> +    QTAILQ_FOREACH(s, &slirp_stacks, entry) {
> +        int id;
> +        bool got_hub_id = net_hub_id_for_client(&s->nc, &id) == 0;
> +        char *info = slirp_neighbor_info(s->slirp);
> +        monitor_printf(mon, "Hub %d (%s):\n%s",
> +                       got_hub_id ? id : -1,
> +                       s->nc.name, info);
> +        g_free(info);
> +    }
> +}
> +
>  static void
>  net_init_slirp_configs(const StringList *fwd, int flags)
>  {
> diff --git a/tests/acceptance/info_neighbors.py
> b/tests/acceptance/info_neighbors.py
> new file mode 100644
> index 0000000000..ff79ec3ff3
> --- /dev/null
> +++ b/tests/acceptance/info_neighbors.py
> @@ -0,0 +1,69 @@
> +# Test for the hmp command "info neighbors"
> +#
> +# Copyright 2021 Google LLC
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or
> +# later.  See the COPYING file in the top-level directory.
> +
> +import re
> +
> +from avocado_qemu import LinuxTest
> +from avocado_qemu import Test
> +
> +VNET_HUB_HEADER = 'Hub -1 (vnet):'
> +NEIGHBOR_HEADER_REGEX = '^ *Table *MacAddr *IP Address$'
> +
> +def trim(text):
> +    return " ".join(text.split())
> +
> +def hmc(test, cmd):
> +    return test.vm.command('human-monitor-command', command_line=cmd)
> +
> +def get_neighbors(test):
> +    output = hmc(test, 'info neighbors').splitlines()
> +    if len(output) < 2:
> +        test.fail("Insufficient output from 'info neighbors'")
> +    test.assertEquals(output[0], VNET_HUB_HEADER)
> +    test.assertTrue(re.fullmatch(NEIGHBOR_HEADER_REGEX, output[1]))
> +    return output[2:]
> +
> +class InfoNeighborsNone(Test):
> +
> +    def test_no_neighbors(self):
> +        self.vm.add_args('-nodefaults',
> +                         '-netdev', 'user,id=vnet',
> +                         '-device', 'virtio-net,netdev=vnet')
> +        self.vm.launch()
> +        neighbors = get_neighbors(self)
> +        self.assertEquals(len(neighbors), 0)
> +
> +class InfoNeighbors(LinuxTest):
> +
> +    def test_neighbors(self):
> +        """
> +        :avocado: tags=arch:x86_64
> +        :avocado: tags=machine:pc
> +        :avocado: tags=accel:kvm
> +        """
> +        self.require_accelerator('kvm')
> +        self.vm.add_args("-accel", "kvm")
> +        self.vm.add_args('-nographic',
> +                         '-m', '1024')
> +        self.launch_and_wait()
> +
> +        # Ensure there's some packets to the guest and back.
> +        self.ssh_command('pwd')
> +
> +        # We should now be aware of the guest as a neighbor.
> +        expected_ipv4_neighbor = 'ARP 52:54:00:12:34:56 10.0.2.15'
> +        # The default ipv6 net is fec0. Both fe80 and fec0 can appear.
> +        expected_ipv6_neighbors = [
> +            'NDP 52:54:00:12:34:56 fe80::5054:ff:fe12:3456',
> +            'NDP 52:54:00:12:34:56 fec0::5054:ff:fe12:3456'
> +        ]
> +        neighbors = get_neighbors(self)
> +        self.assertTrue(len(neighbors) >= 2 and len(neighbors) <= 3)
> +        # IPv4 is output first.
> +        self.assertEquals(trim(neighbors[0]), expected_ipv4_neighbor)
> +        for neighbor in neighbors[1:]:
> +            self.assertTrue(trim(neighbor) in expected_ipv6_neighbors)
> --
> 2.33.0.153.gba50c8fa24-goog
>
>
>

--000000000000b44afd05cb0a6d03
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 2, 2021 at 2:21 PM Doug E=
vans &lt;<a href=3D"mailto:dje@google.com">dje@google.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">This command dumps=
 the ARP and NDP tables maintained within slirp.<br>
One use-case for it is showing the guest&#39;s IPv6 address(es).<br>
<br>
Signed-off-by: Doug Evans &lt;<a href=3D"mailto:dje@google.com" target=3D"_=
blank">dje@google.com</a>&gt;<br></blockquote><div>Reviewed-by: Patrick Ven=
ture &lt;<a href=3D"mailto:venture@google.com">venture@google.com</a>&gt;=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0hmp-commands-info.hx=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 15 +++++++<br>
=C2=A0include/net/slirp.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 1 +<br>
=C2=A0net/slirp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 15 +++++++<br>
=C2=A0tests/acceptance/info_neighbors.py | 69 +++++++++++++++++++++++++++++=
+<br>
=C2=A04 files changed, 100 insertions(+)<br>
=C2=A0create mode 100644 tests/acceptance/info_neighbors.py<br>
<br>
diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx<br>
index 27206ac049..386f09f163 100644<br>
--- a/hmp-commands-info.hx<br>
+++ b/hmp-commands-info.hx<br>
@@ -512,6 +512,21 @@ SRST<br>
=C2=A0 =C2=A0 =C2=A0Show user network stack connection states.<br>
=C2=A0ERST<br>
<br>
+#if defined(CONFIG_SLIRP)<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;neig=
hbors&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .args_type=C2=A0 =3D &quot;&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .params=C2=A0 =C2=A0 =C2=A0=3D &quot;&quot;,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .help=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;show=
 the ARP and NDP tables&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cmd=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D hmp_info_n=
eighbors,<br>
+=C2=A0 =C2=A0 },<br>
+#endif<br>
+<br>
+SRST<br>
+=C2=A0 ``info neighbors``<br>
+=C2=A0 =C2=A0 Show the ARP and NDP tables.<br>
+ERST<br>
+<br>
=C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot=
;migrate&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.args_type=C2=A0 =3D &quot;&quot;,<br>
diff --git a/include/net/slirp.h b/include/net/slirp.h<br>
index bad3e1e241..b9ccfda1e7 100644<br>
--- a/include/net/slirp.h<br>
+++ b/include/net/slirp.h<br>
@@ -31,6 +31,7 @@ void hmp_hostfwd_add(Monitor *mon, const QDict *qdict);<b=
r>
=C2=A0void hmp_hostfwd_remove(Monitor *mon, const QDict *qdict);<br>
<br>
=C2=A0void hmp_info_usernet(Monitor *mon, const QDict *qdict);<br>
+void hmp_info_neighbors(Monitor *mon, const QDict *qdict);<br>
<br>
=C2=A0#endif<br>
<br>
diff --git a/net/slirp.c b/net/slirp.c<br>
index ad3a838e0b..29a4cd3fe1 100644<br>
--- a/net/slirp.c<br>
+++ b/net/slirp.c<br>
@@ -1028,6 +1028,21 @@ void hmp_info_usernet(Monitor *mon, const QDict *qdi=
ct)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
+void hmp_info_neighbors(Monitor *mon, const QDict *qdict)<br>
+{<br>
+=C2=A0 =C2=A0 SlirpState *s;<br>
+<br>
+=C2=A0 =C2=A0 QTAILQ_FOREACH(s, &amp;slirp_stacks, entry) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 int id;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool got_hub_id =3D net_hub_id_for_client(&amp=
;s-&gt;nc, &amp;id) =3D=3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *info =3D slirp_neighbor_info(s-&gt;slirp=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 monitor_printf(mon, &quot;Hub %d (%s):\n%s&quo=
t;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0got_hub_id ? id : -1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0s-&gt;<a href=3D"http://nc.name" rel=3D"noreferrer" target=3D"_bl=
ank">nc.name</a>, info);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(info);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
=C2=A0static void<br>
=C2=A0net_init_slirp_configs(const StringList *fwd, int flags)<br>
=C2=A0{<br>
diff --git a/tests/acceptance/info_neighbors.py b/tests/acceptance/info_nei=
ghbors.py<br>
new file mode 100644<br>
index 0000000000..ff79ec3ff3<br>
--- /dev/null<br>
+++ b/tests/acceptance/info_neighbors.py<br>
@@ -0,0 +1,69 @@<br>
+# Test for the hmp command &quot;info neighbors&quot;<br>
+#<br>
+# Copyright 2021 Google LLC<br>
+#<br>
+# This work is licensed under the terms of the GNU GPL, version 2 or<br>
+# later.=C2=A0 See the COPYING file in the top-level directory.<br>
+<br>
+import re<br>
+<br>
+from avocado_qemu import LinuxTest<br>
+from avocado_qemu import Test<br>
+<br>
+VNET_HUB_HEADER =3D &#39;Hub -1 (vnet):&#39;<br>
+NEIGHBOR_HEADER_REGEX =3D &#39;^ *Table *MacAddr *IP Address$&#39;<br>
+<br>
+def trim(text):<br>
+=C2=A0 =C2=A0 return &quot; &quot;.join(text.split())<br>
+<br>
+def hmc(test, cmd):<br>
+=C2=A0 =C2=A0 return test.vm.command(&#39;human-monitor-command&#39;, comm=
and_line=3Dcmd)<br>
+<br>
+def get_neighbors(test):<br>
+=C2=A0 =C2=A0 output =3D hmc(test, &#39;info neighbors&#39;).splitlines()<=
br>
+=C2=A0 =C2=A0 if len(output) &lt; 2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 test.fail(&quot;Insufficient output from &#39;=
info neighbors&#39;&quot;)<br>
+=C2=A0 =C2=A0 test.assertEquals(output[0], VNET_HUB_HEADER)<br>
+=C2=A0 =C2=A0 test.assertTrue(re.fullmatch(NEIGHBOR_HEADER_REGEX, output[1=
]))<br>
+=C2=A0 =C2=A0 return output[2:]<br>
+<br>
+class InfoNeighborsNone(Test):<br>
+<br>
+=C2=A0 =C2=A0 def test_no_neighbors(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-nodefaults&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;-netdev&#39;, &#39;user,id=3Dvnet&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;-device&#39;, &#39;virtio-net,netdev=3Dvnet&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.launch()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 neighbors =3D get_neighbors(self)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEquals(len(neighbors), 0)<br>
+<br>
+class InfoNeighbors(LinuxTest):<br>
+<br>
+=C2=A0 =C2=A0 def test_neighbors(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Darch:x86_64<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Dmachine:pc<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Daccel:kvm<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.require_accelerator(&#39;kvm&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&quot;-accel&quot;, &quot;kvm=
&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-nographic&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;-m&#39;, &#39;1024&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.launch_and_wait()<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Ensure there&#39;s some packets to the guest=
 and back.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.ssh_command(&#39;pwd&#39;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # We should now be aware of the guest as a nei=
ghbor.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 expected_ipv4_neighbor =3D &#39;ARP 52:54:00:1=
2:34:56 10.0.2.15&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # The default ipv6 net is fec0. Both fe80 and =
fec0 can appear.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 expected_ipv6_neighbors =3D [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;NDP 52:54:00:12:34:56 fe80:=
:5054:ff:fe12:3456&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;NDP 52:54:00:12:34:56 fec0:=
:5054:ff:fe12:3456&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 neighbors =3D get_neighbors(self)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(len(neighbors) &gt;=3D 2 and l=
en(neighbors) &lt;=3D 3)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # IPv4 is output first.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEquals(trim(neighbors[0]), expected=
_ipv4_neighbor)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for neighbor in neighbors[1:]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(trim(neighbor) i=
n expected_ipv6_neighbors)<br>
-- <br>
2.33.0.153.gba50c8fa24-goog<br>
<br>
<br>
</blockquote></div></div>

--000000000000b44afd05cb0a6d03--

