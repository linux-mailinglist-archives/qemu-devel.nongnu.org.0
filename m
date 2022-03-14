Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 576B74D8C40
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 20:22:35 +0100 (CET)
Received: from localhost ([::1]:49486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTqH4-0004e9-Dh
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 15:22:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nTqEc-0001ye-44
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 15:20:02 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:33459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nTqEa-0007FK-2L
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 15:20:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=uQloMrUoxE6M0ZJDrv4mz5ToxbWK+8sJpOPE7idh8JM=; b=AgHu/p40R8Hu0D0tS8l/+w/74+
 CMSq6wbQTUFzZAlJd3vAVrwooetkJVkA3jtmvhKfuk/HINL3JOa00Aj3SevvHDD6HW3k5F25igYbR
 +OVNgEEZH24JRXEOpfThUhoAGKVVUDh3Omlh+LbRiybJwllDnAdLEiPqVJnQx1719r0Ijgld+VOZV
 YClpjjG7iC9iQeLIc5OgoxBw59akntfUDHUJbWo3kHLaiL6RoYqwu8fR1hHL3duLTEw45jTzwdLT5
 qs9UxMNBAwUorT29gkqgQkY61Y9D2bpcEKv2eUl0DBZsz01fxHXvzIuZvnZlxEEldbiPtYhEE8wDw
 piLSiMQUzZPqPKSC/yn9c5c/Txo89mfFle55W+LXWTE1mjkwXWNKObER9H02zy0kXDf9xxsxsdJGD
 4wCYvNXwo3oP+W2KN37EQaqIE4JtKsTB1Vcx3RftdTpuZ4qNZnJr3D3wgrjamEqSwwfzFHl1CbWoc
 2/DffYpvFzQZvYG62F7pJHEpYlFD8w80eSdNsrSfT+glsxSyetcyPUhbnJ2+5jJXdYRLMxjjNMQSv
 L5zOX6lAkDHbH4VHE266UBdIe19agw0joKbiDXCUp83PxOi30l9d05w1tJWUz9TxeEVHnSh7JM+/d
 zJqeWLSR1YU6R3QXOz4uCU1rWM/p992QpYbxeBQCg=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH 2/3] 9pfs: Use g_new() & friends where that makes obvious
 sense
Date: Mon, 14 Mar 2022 20:19:57 +0100
Message-ID: <26570451.lufq64tyZG@silver>
In-Reply-To: <78a0febe-348a-8398-c57a-4b58038d041d@gmail.com>
References: <20220314160108.1440470-1-armbru@redhat.com>
 <2292394.T0kE68JRDY@silver> <78a0febe-348a-8398-c57a-4b58038d041d@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Montag, 14. M=E4rz 2022 19:46:59 CET Philippe Mathieu-Daud=E9 wrote:
> Hi Christian,

Hi Philippe,

> On 14/3/22 17:42, Christian Schoenebeck wrote:
> > On Montag, 14. M=E4rz 2022 17:01:07 CET Markus Armbruster wrote:
> >> g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
> >> for two reasons.  One, it catches multiplication overflowing size_t.
> >> Two, it returns T * rather than void *, which lets the compiler catch
> >> more type errors.
> >>=20
> >> This commit only touches allocations with size arguments of the form
> >> sizeof(T).
> >>=20
> >> Patch created mechanically with:
> >>      $ spatch --in-place --sp-file scripts/coccinelle/use-g_new-etc.co=
cci
> >>      \
> >>     =20
> >> 	     --macro-file scripts/cocci-macro-file.h FILES...
> >>=20
> >> Except this uncovers a typing error:
> >>      ../hw/9pfs/9p.c:855:13: warning: incompatible pointer types
> >>      assigning to
> >>=20
> >> 'QpfEntry *' from 'QppEntry *' [-Wincompatible-pointer-types] val =3D
> >> g_new0(QppEntry, 1);
> >>=20
> >> 		^ ~~~~~~~~~~~~~~~~~~~
> >> 	=09
> >>      1 warning generated.
> >>=20
> >> Harmless, because QppEntry is larger than QpfEntry.  Fix to allocate a
> >> QpfEntry instead.
> >>=20
> >> Cc: Greg Kurz <groug@kaod.org>
> >> Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>
> >> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> >> ---
> >=20
> > Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
>=20
> FYI your domain is also quarantined by Google:
> ARC-Authentication-Results: i=3D1; mx.google.com;
>         dkim=3Dfail header.i=3D@crudebyte.com header.s=3Dlizzy header.b=
=3Dolij9WvS;
>         spf=3Dsoftfail (google.com: domain of transitioning
> qemu_oss@crudebyte.com does not designate 172.105.152.211 as permitted
> sender) smtp.mailfrom=3Dqemu_oss@crudebyte.com;
>         dmarc=3Dfail (p=3DQUARANTINE sp=3DQUARANTINE dis=3DQUARANTINE)

Reverse lookup of 172.105.152.211 sais it is atlanta189.amsat.org, which is=
=20
not affiliated with crudebyte.com in any way, and it is therefore not allow=
ed=20
to send emails on behalf of this domain.

Markus had a huge CC list in this series, so my guess is that my email went=
=20
through some ML which touched my original email's DKIM signed headers=20
(probably prefixed the subject line) before sending it out to list members,=
=20
eventually causing the message to be quarantined

=2D> i.e. a ML configuration issue, not a problem with this domain.

Best regards,
Christian Schoenebeck

> header.from=3Dcrudebyte.com
> Received-SPF: softfail (google.com: domain of transitioning
> qemu_oss@crudebyte.com does not designate 172.105.152.211 as permitted
> sender) client-ip=3D172.105.152.211;
> Authentication-Results: mx.google.com;
>         dkim=3Dfail header.i=3D@crudebyte.com header.s=3Dlizzy header.b=
=3Dolij9WvS;
>         spf=3Dsoftfail (google.com: domain of transitioning
> qemu_oss@crudebyte.com does not designate 172.105.152.211 as permitted
> sender) smtp.mailfrom=3Dqemu_oss@crudebyte.com;
>         dmarc=3Dfail (p=3DQUARANTINE sp=3DQUARANTINE dis=3DQUARANTINE)
> header.from=3Dcrudebyte.com
> X-Rspamd-Queue-Id: AC61617709E
> X-Spamd-Result: default: False [-2.01 / 7.00];
> BAYES_HAM(-3.00)[100.00%]; SUSPICIOUS_RECIPS(1.50)[];
> DMARC_POLICY_ALLOW(-0.50)[crudebyte.com,quarantine];
> MID_RHS_NOT_FQDN(0.50)[]; R_DKIM_ALLOW(-0.20)[crudebyte.com:s=3Dlizzy];
> R_SPF_ALLOW(-0.20)[+ip4:91.194.90.13]; MIME_GOOD(-0.10)[text/plain];
> MX_GOOD(-0.01)[]; RCVD_COUNT_ZERO(0.00)[0]; ASN(0.00)[asn:51167,
> ipnet:91.194.90.0/23, country:DE]; MIME_TRACE(0.00)[0:+];
> FREEMAIL_CC(0.00)[redhat.com,linaro.org,gmail.com,vger.kernel.org,irrelev=
ant
> .dk,adacore.com,anisinha.ca,netbsd.org,microsoft.com,kernel.org,lists.xen=
pro
> ject.org,users.sourceforge.jp,xen.org,huawei.com,reactos.org,amd.com,citr=
ix.
> com,syrmia.com,ilande.co.uk,intel.com,kaod.org,nongnu.org,ispras.ru,gibso=
n.d
> ropbear.id.au,habkost.net,virtuozzo.com,google.com,amsat.org,tribudubois.=
net
> ,mvista.com]; FROM_EQ_ENVFROM(0.00)[]; NEURAL_HAM(-0.00)[-0.923];
> ARC_NA(0.00)[]; DKIM_TRACE(0.00)[crudebyte.com:+]; FROM_HAS_DN(0.00)[];
> RCPT_COUNT_GT_50(0.00)[66]; TO_DN_SOME(0.00)[];
> TO_MATCH_ENVRCPT_SOME(0.00)[]; TAGGED_RCPT(0.00)[];
> RCVD_IN_DNSWL_FAIL(0.00)[91.194.90.13:server fail]
> X-Rspamd-Server: atlanta189



