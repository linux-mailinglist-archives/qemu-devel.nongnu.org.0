Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B29617A93C
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Mar 2020 16:51:47 +0100 (CET)
Received: from localhost ([::1]:51524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9smo-0003wQ-4o
	for lists+qemu-devel@lfdr.de; Thu, 05 Mar 2020 10:51:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51864)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1j9slu-0003Jo-6i
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 10:50:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1j9sls-0008VS-0f
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 10:50:49 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44445
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1j9slr-0008V8-RQ
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 10:50:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583423447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kn4V+HA3oaF3k5ycWm6hg1BvF1Da9ZkkfEYm4PSYo1Q=;
 b=EJOXW4YQP5e+jch6puHtpHGGX1iLpDPT6OrC1OT4y9fkPlFaWF81BhOUG7zeONFCdjIhID
 /brhJvB0bsoGjEQc0FeQEiKOnMzA7fceIPAKMZpNUdpQUL2QisfrXqHgSHiIoScWA+0Rdy
 zaEOl+HKtheT+a+zmsTz1xbZmfaNN9M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-LBnK5yBzNI-Fy4Hao4emZg-1; Thu, 05 Mar 2020 10:50:43 -0500
X-MC-Unique: LBnK5yBzNI-Fy4Hao4emZg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1029D938B4;
 Thu,  5 Mar 2020 15:50:41 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B45B73896;
 Thu,  5 Mar 2020 15:50:28 +0000 (UTC)
Date: Thu, 5 Mar 2020 15:50:25 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Jag Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v5 34/50] multi-process/mon: choose HMP commands based on
 target
Message-ID: <20200305155025.GK3130@work-vm>
References: <cover.1582576372.git.jag.raman@oracle.com>
 <bf5c4efc14dc27a778509ff31190c82862af9fa1.1582576372.git.jag.raman@oracle.com>
 <20200305103910.GE3130@work-vm>
 <7359dbdd-2685-9452-8763-15022dd3f829@oracle.com>
MIME-Version: 1.0
In-Reply-To: <7359dbdd-2685-9452-8763-15022dd3f829@oracle.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, swapnil.ingle@nutanix.com,
 john.g.johnson@oracle.com, qemu-devel@nongnu.org, kraxel@redhat.com,
 quintela@redhat.com, mst@redhat.com, armbru@redhat.com,
 kanth.ghatraju@oracle.com, felipe@nutanix.com, thuth@redhat.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, liran.alon@oracle.com,
 stefanha@redhat.com, thanos.makatos@nutanix.com, rth@twiddle.net,
 kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Jag Raman (jag.raman@oracle.com) wrote:
>=20
>=20
> On 3/5/2020 5:39 AM, Dr. David Alan Gilbert wrote:
> > * Jagannathan Raman (jag.raman@oracle.com) wrote:
> > > From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> > >=20
> > > Add "targets" field to HMP command definition to select the targets
> > > which would be supported by each command
> > >=20
> > > Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> > > Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> > > Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> > > ---
> > >   hmp-commands-info.hx | 10 ++++++++++
> > >   hmp-commands.hx      | 20 ++++++++++++++++++++
> > >   scripts/hxtool       | 44 +++++++++++++++++++++++++++++++++++++++++=
+--
> > >   3 files changed, 72 insertions(+), 2 deletions(-)
> > >   mode change 100644 =3D> 100755 scripts/hxtool
> > >=20
> > > diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> > > index 257ee7d..631cc76 100644
> > > --- a/hmp-commands-info.hx
> > > +++ b/hmp-commands-info.hx
> > > @@ -19,6 +19,7 @@ ETEXI
> > >           .params     =3D "",
> > >           .help       =3D "show the version of QEMU",
> > >           .cmd        =3D hmp_info_version,
> > > +        .targets    =3D "scsi",
> > >           .flags      =3D "p",
> > >       },
> > > @@ -48,6 +49,7 @@ ETEXI
> > >           .params     =3D "",
> > >           .help       =3D "show the character devices",
> > >           .cmd        =3D hmp_info_chardev,
> > > +        .targets    =3D "scsi",
> >=20
> > I'm a bit confused what this means; is this saying that the scsi-remote
> > will respond to 'info chardev' ?  Why would it be interested in info
> > chardev?
>=20
> We found that QMP/HMP monitor is initialized as a chardev in QEMU. So we
> could use this to get info about the monitors attached to the remote
> process.

Ah OK.

> >=20
> > >           .flags      =3D "p",
> > >       },
> > > @@ -64,6 +66,7 @@ ETEXI
> > >           .help       =3D "show info of one block device or all block=
 devices "
> > >                         "(-n: show named nodes; -v: show details)",
> > >           .cmd        =3D hmp_info_block,
> > > +        .targets    =3D "scsi",
> > >       },
> > >   STEXI
> > > @@ -78,6 +81,7 @@ ETEXI
> > >           .params     =3D "",
> > >           .help       =3D "show block device statistics",
> > >           .cmd        =3D hmp_info_blockstats,
> > > +        .targets    =3D "scsi",
> > >       },
> > >   STEXI
> > > @@ -92,6 +96,7 @@ ETEXI
> > >           .params     =3D "",
> > >           .help       =3D "show progress of ongoing block device oper=
ations",
> > >           .cmd        =3D hmp_info_block_jobs,
> > > +        .targets    =3D "scsi",
> > >       },
> > >   STEXI
> > > @@ -167,6 +172,7 @@ ETEXI
> > >           .params     =3D "",
> > >           .help       =3D "show the command line history",
> > >           .cmd        =3D hmp_info_history,
> > > +        .targets    =3D "scsi",
> > >           .flags      =3D "p",
> > >       },
> > > @@ -224,6 +230,7 @@ ETEXI
> > >           .params     =3D "",
> > >           .help       =3D "show PCI info",
> > >           .cmd        =3D hmp_info_pci,
> > > +        .targets    =3D "scsi",
> > >       },
> > >   STEXI
> > > @@ -630,6 +637,7 @@ ETEXI
> > >           .params     =3D "",
> > >           .help       =3D "show device tree",
> > >           .cmd        =3D hmp_info_qtree,
> > > +        .targets    =3D "scsi",
> > >       },
> > >   STEXI
> > > @@ -644,6 +652,7 @@ ETEXI
> > >           .params     =3D "",
> > >           .help       =3D "show qdev device model list",
> > >           .cmd        =3D hmp_info_qdm,
> > > +        .targets    =3D "scsi",
> > >       },
> > >   STEXI
> > > @@ -658,6 +667,7 @@ ETEXI
> > >           .params     =3D "[path]",
> > >           .help       =3D "show QOM composition tree",
> > >           .cmd        =3D hmp_info_qom_tree,
> > > +        .targets    =3D "scsi",
> > >           .flags      =3D "p",
> > >       },
> > > diff --git a/hmp-commands.hx b/hmp-commands.hx
> > > index dc23185..ecc6169 100644
> > > --- a/hmp-commands.hx
> > > +++ b/hmp-commands.hx
> > > @@ -49,6 +49,7 @@ ETEXI
> > >           .params     =3D "",
> > >           .help       =3D "quit the emulator",
> > >           .cmd        =3D hmp_quit,
> > > +        .targets    =3D "scsi",
> > >       },
> > >   STEXI
> > > @@ -82,6 +83,7 @@ ETEXI
> > >           .params     =3D "device size",
> > >           .help       =3D "resize a block image",
> > >           .cmd        =3D hmp_block_resize,
> > > +        .targets    =3D "scsi",
> > >       },
> > >   STEXI
> > > @@ -99,6 +101,7 @@ ETEXI
> > >           .params     =3D "device [speed [base]]",
> > >           .help       =3D "copy data from a backing file into a block=
 device",
> > >           .cmd        =3D hmp_block_stream,
> > > +        .targets    =3D "scsi",
> > >       },
> > >   STEXI
> > > @@ -113,6 +116,7 @@ ETEXI
> > >           .params     =3D "device speed",
> > >           .help       =3D "set maximum speed for a background block o=
peration",
> > >           .cmd        =3D hmp_block_job_set_speed,
> > > +        .targets    =3D "scsi",
> > >       },
> > >   STEXI
> > > @@ -129,6 +133,7 @@ ETEXI
> > >                         "\n\t\t\t if you want to abort the operation =
immediately"
> > >                         "\n\t\t\t instead of keep running until data =
is in sync)",
> > >           .cmd        =3D hmp_block_job_cancel,
> > > +        .targets    =3D "scsi",
> > >       },
> > >   STEXI
> > > @@ -143,6 +148,7 @@ ETEXI
> > >           .params     =3D "device",
> > >           .help       =3D "stop an active background block operation"=
,
> > >           .cmd        =3D hmp_block_job_complete,
> > > +        .targets    =3D "scsi",
> > >       },
> > >   STEXI
> > > @@ -158,6 +164,7 @@ ETEXI
> > >           .params     =3D "device",
> > >           .help       =3D "pause an active background block operation=
",
> > >           .cmd        =3D hmp_block_job_pause,
> > > +        .targets    =3D "scsi",
> > >       },
> > >   STEXI
> > > @@ -172,6 +179,7 @@ ETEXI
> > >           .params     =3D "device",
> > >           .help       =3D "resume a paused background block operation=
",
> > >           .cmd        =3D hmp_block_job_resume,
> > > +        .targets    =3D "scsi",
> > >       },
> > >   STEXI
> > > @@ -186,6 +194,7 @@ ETEXI
> > >           .params     =3D "[-f] device",
> > >           .help       =3D "eject a removable medium (use -f to force =
it)",
> > >           .cmd        =3D hmp_eject,
> > > +        .targets    =3D "scsi",
> > >       },
> > >   STEXI
> > > @@ -200,6 +209,7 @@ ETEXI
> > >           .params     =3D "device",
> > >           .help       =3D "remove host block device",
> > >           .cmd        =3D hmp_drive_del,
> > > +        .targets    =3D "scsi",
> > >       },
> > >   STEXI
> > > @@ -219,6 +229,7 @@ ETEXI
> > >           .params     =3D "device filename [format [read-only-mode]]"=
,
> > >           .help       =3D "change a removable medium, optional format=
",
> > >           .cmd        =3D hmp_change,
> > > +        .targets    =3D "scsi",
> > >       },
> > >   STEXI
> > > @@ -732,6 +743,7 @@ ETEXI
> > >           .help       =3D "add device, like -device on the command li=
ne",
> > >           .cmd        =3D hmp_device_add,
> > >           .command_completion =3D device_add_completion,
> > > +        .targets    =3D "scsi",
> > >       },
> > >   STEXI
> > > @@ -747,6 +759,7 @@ ETEXI
> > >           .help       =3D "remove device",
> > >           .cmd        =3D hmp_device_del,
> > >           .command_completion =3D device_del_completion,
> > > +        .targets    =3D "scsi",
> > >       },
> > >   STEXI
> > > @@ -1351,6 +1364,7 @@ ETEXI
> > >                         "The -c flag requests QEMU to compress backup=
 data\n\t\t\t"
> > >                         "(if the target format supports it).\n\t\t\t"=
,
> > >           .cmd        =3D hmp_drive_backup,
> > > +        .targets    =3D "scsi",
> > >       },
> > >   STEXI
> > >   @item drive_backup
> > > @@ -1368,6 +1382,7 @@ ETEXI
> > >                         "[,readonly=3Don|off][,copy-on-read=3Don|off]=
",
> > >           .help       =3D "add drive to PCI storage controller",
> > >           .cmd        =3D hmp_drive_add,
> > > +        .targets    =3D "scsi",
> > >       },
> > >   STEXI
> > > @@ -1816,6 +1831,7 @@ ETEXI
> > >           .help       =3D "add chardev",
> > >           .cmd        =3D hmp_chardev_add,
> > >           .command_completion =3D chardev_add_completion,
> > > +        .targets    =3D "scsi",
> > >       },
> > >   STEXI
> > > @@ -1831,6 +1847,7 @@ ETEXI
> > >           .params     =3D "id args",
> > >           .help       =3D "change chardev",
> > >           .cmd        =3D hmp_chardev_change,
> > > +        .targets    =3D "scsi",
> > >       },
> > >   STEXI
> > > @@ -1848,6 +1865,7 @@ ETEXI
> > >           .help       =3D "remove chardev",
> > >           .cmd        =3D hmp_chardev_remove,
> > >           .command_completion =3D chardev_remove_completion,
> > > +        .targets    =3D "scsi",
> > >       },
> > >   STEXI
> > > @@ -1864,6 +1882,7 @@ ETEXI
> > >           .help       =3D "send a break on chardev",
> > >           .cmd        =3D hmp_chardev_send_break,
> > >           .command_completion =3D chardev_remove_completion,
> > > +        .targets    =3D "scsi",
> > >       },
> > >   STEXI
> > > @@ -1940,6 +1959,7 @@ ETEXI
> > >           .params     =3D "[subcommand]",
> > >           .help       =3D "show various information about the system =
state",
> > >           .cmd        =3D hmp_info_help,
> > > +        .targets    =3D "scsi",
> > >           .sub_table  =3D hmp_info_cmds,
> > >           .flags      =3D "p",
> > >       },
> > > diff --git a/scripts/hxtool b/scripts/hxtool
> > > old mode 100644
> > > new mode 100755
> > > index 0003e7b..802cbd4
> > > --- a/scripts/hxtool
> > > +++ b/scripts/hxtool
> > > @@ -10,7 +10,14 @@ hxtoh()
> > >               STEXI*|ETEXI*|SRST*|ERST*) flag=3D$(($flag^1))
> > >               ;;
> > >               *)
> > > -            test $flag -eq 1 && printf "%s\n" "$str"
> > > +            # Skip line that has ".targets" as it is for multi-proce=
ss targets based hmp
> > > +            # commands generation.
> > > +            echo $str | grep -q '.targets'
> > > +            if [ $? -eq 0 ]; then
> > > +                continue
> > > +            else
> > > +                test $flag -eq 1 && printf "%s\n" "$str"
> > > +            fi
> > >               ;;
> > >           esac
> > >       done
> > > @@ -84,16 +91,49 @@ hxtotexi()
> > >               print_texi_heading "$(expr "$str" : "ARCHHEADING(\(.*\)=
,.*)")"
> > >               ;;
> > >               *)
> > > -            test $flag -eq 1 && printf '%s\n' "$str"
> > > +            # Skip line that has ".targets" as it is for multi-proce=
ss targets based hmp
> > > +            # commands generation.
> > > +            echo $str | grep -q '.targetss'
> >=20
> > One extra 's' ?
>=20
> Thanks, we'll fix it.
>=20
> --
> Jag
>=20
> >=20
> > > +            if [ $? -eq 0 ]; then
> > > +                continue
> > > +            else
> > > +                test $flag -eq 1 && printf '%s\n' "$str"
> > > +            fi
> > >               ;;
> > >           esac
> > >           line=3D$((line+1))
> > >       done
> > >   }
> > > +hxtoh_tgt()
> > > +{
> > > +    section=3D""
> > > +    flag=3D1
> > > +    use_section=3D0
> > > +    while read -r str; do
> > > +        # Print section if it has ".targets" and the second argument=
 passed to the
> > > +        # script, such as "scsi".
> > > +        echo "$str" | grep -q -E ".targets.*$1"
> > > +        if [ $? -eq 0 ]; then
> > > +            use_section=3D1
> > > +            continue
> > > +        fi
> > > +        case $str in
> > > +            HXCOMM*)
> > > +            ;;
> > > +            STEXI*|ETEXI*) flag=3D$(($flag^1)); test $use_section -e=
q 1 && printf '%s' "$section"; section=3D""; use_section=3D0
> > > +            ;;
> > > +            *)
> > > +            test $flag -eq 1 && section=3D"${section} ${str} ${IFS}"
> > > +            ;;
> > > +        esac
> > > +    done
> > > +}
> > > +
> > >   case "$1" in
> > >   "-h") hxtoh ;;
> > >   "-t") hxtotexi ;;
> > > +"-tgt") hxtoh_tgt $2 ;;
> > >   *) exit 1 ;;
> > >   esac
> > > --=20
> > > 1.8.3.1
> > >=20
> > --
> > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> >=20
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


