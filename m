Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B113371E7
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 13:00:46 +0100 (CET)
Received: from localhost ([::1]:56900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKJzh-0001Pv-KO
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 07:00:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lKJyd-0000wU-FA
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 06:59:39 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:45641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lKJya-0000jk-QR
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 06:59:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=ITPDf0QOy72qbUnB2Q6wcSFH3vxBCzw8UMTx3Zhz6zA=; b=tBO2tXCZUtYZSLMl/rdsrU4Xg0
 4bg6WDl0tiniuR31wgbaTuuUqFLYP/0dsiUO+WfsbjK0ZmxF26+WExqa991g0Xz/CgMj68tepM/c/
 CNFPYx+o3N5RYpUva9D8h0Ylpp8KPVXkqh0rrGFUyZlASXg6II3nRhm/QV6EA4rSmn+uGkSPRTwbX
 vSELNg4yyBchELFC6KpeSLbGe7/Y7Vak4fK1cyunFMC+gBBIEmV8+2gCppep8/BihQquklQY2KvG1
 tOvqJmWmk/jqO0zaWalmAdTskThSbtb7VhbGhEuqb/7IwQe0/ihqBScOt9igjlBK4cf8tXNaszEUi
 PwzWxF5nlRoig4OnnNCvHmMc3ZoKNlJVx3hCa+3AErsyHM7BWMsNI/5RnQD09swKir85uGZ7UTP4v
 ERtuK6VW/IPPOrr4HfSb0uWXUIAIeeqHNu0nP28tod2fiT2iHSIQoYWAuA6qn0qmkMWsUguG8AdQz
 pisQ9jhYQRXaRqas/xiFfjhpLkitHOhDbhn2SSHg+P9/nmwdT3cVrnQSWtmGeCTHX0sqxLmbaCdhh
 xzyHagE2EmtSuF8FH1Rq3suAk7KE2DZyo3T+G4jBUWoYDte6Mk/mjTQzOXn/bfX0z9dye0aHb0HVj
 PgnE9TeZVXxiWzpeZLo7kyxCLFzUFef75t3dqRSC0=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 8/9] hw/9pfs/9p-synth: Replaced qemu_mutex_lock with
 QEMU_LOCK_GUARD
Date: Thu, 11 Mar 2021 12:59:13 +0100
Message-ID: <2070220.8au7kWUZml@silver>
In-Reply-To: <20210311125245.5127cd6d@bahia.lan>
References: <20210311031538.5325-1-ma.mandourr@gmail.com>
 <2248579.lIZarMFqrv@silver> <20210311125245.5127cd6d@bahia.lan>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Donnerstag, 11. M=E4rz 2021 12:52:45 CET Greg Kurz wrote:
> On Thu, 11 Mar 2021 11:49:06 +0100
>=20
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > On Donnerstag, 11. M=E4rz 2021 04:15:37 CET Mahmoud Mandour wrote:
> > > Replaced a call to qemu_mutex_lock and its respective call to
> > > qemu_mutex_unlock and used QEMU_LOCK_GUARD macro in their place.
> > > This simplifies the code by removing the call required to unlock
> > > and also eliminates goto paths.
> > >=20
> > > Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> > > ---
> > >=20
> > >  hw/9pfs/9p-synth.c | 12 ++++--------
> > >  1 file changed, 4 insertions(+), 8 deletions(-)
> > >=20
> > > diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
> > > index 7eb210ffa8..473ef914b0 100644
> > > --- a/hw/9pfs/9p-synth.c
> > > +++ b/hw/9pfs/9p-synth.c
> > > @@ -79,11 +79,11 @@ int qemu_v9fs_synth_mkdir(V9fsSynthNode *parent, =
int
> > > mode, if (!parent) {
> > >=20
> > >          parent =3D &synth_root;
> > >     =20
> > >      }
> > >=20
> > > -    qemu_mutex_lock(&synth_mutex);
> > > +    QEMU_LOCK_GUARD(&synth_mutex);
> > >=20
> > >      QLIST_FOREACH(tmp, &parent->child, sibling) {
> > >     =20
> > >          if (!strcmp(tmp->name, name)) {
> > >         =20
> > >              ret =3D EEXIST;
> > >=20
> > > -            goto err_out;
> > > +            return ret;
> > >=20
> > >          }
> > >     =20
> > >      }
> > >      /* Add the name */
> > >=20
> > > @@ -94,8 +94,6 @@ int qemu_v9fs_synth_mkdir(V9fsSynthNode *parent, int
> > > mode, node->attr, node->attr->inode);
> > >=20
> > >      *result =3D node;
> > >      ret =3D 0;
> > >=20
> > > -err_out:
> > > -    qemu_mutex_unlock(&synth_mutex);
> > >=20
> > >      return ret;
> > > =20
> > >  }
> > >=20
> > > @@ -116,11 +114,11 @@ int qemu_v9fs_synth_add_file(V9fsSynthNode
> > > *parent,
> > > int mode, parent =3D &synth_root;
> > >=20
> > >      }
> > >=20
> > > -    qemu_mutex_lock(&synth_mutex);
> > > +    QEMU_LOCK_GUARD(&synth_mutex);
> > >=20
> > >      QLIST_FOREACH(tmp, &parent->child, sibling) {
> > >     =20
> > >          if (!strcmp(tmp->name, name)) {
> > >         =20
> > >              ret =3D EEXIST;
> > >=20
> > > -            goto err_out;
> > > +            return ret;
> > >=20
> > >          }
> > >     =20
> > >      }
> > >      /* Add file type and remove write bits */
> > >=20
> > > @@ -136,8 +134,6 @@ int qemu_v9fs_synth_add_file(V9fsSynthNode *paren=
t,
> > > int
> > > mode, pstrcpy(node->name, sizeof(node->name), name);
> > >=20
> > >      QLIST_INSERT_HEAD_RCU(&parent->child, node, sibling);
> > >      ret =3D 0;
> > >=20
> > > -err_out:
> > > -    qemu_mutex_unlock(&synth_mutex);
> > >=20
> > >      return ret;
> > > =20
> > >  }
> >=20
> > Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> >=20
> > Greg, I suggest I'll push this onto my queue as you seem to be busy.
>=20
> This cleanup spans over multiple subsystems but I think it makes more
> sense to keep all these patches together. Let's wait for everyone to
> ack/review and then we'll decide how to merge the patches.

Sure, makes sense.




