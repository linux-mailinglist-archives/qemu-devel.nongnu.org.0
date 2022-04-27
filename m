Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E77511CC5
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 20:17:52 +0200 (CEST)
Received: from localhost ([::1]:35930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njmEZ-0006Qw-Gi
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 14:17:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1njmDJ-0005Pq-9I; Wed, 27 Apr 2022 14:16:35 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:43795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1njmDH-0000iB-3M; Wed, 27 Apr 2022 14:16:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=U3UktvWe/zlu7g7Mvymlvu5qmWvB9KuIH4M2rKR3Gr8=; b=fvYjKW5AsWvUwqcyqIO9MbOiIw
 s4E5b/q/sJlfE5RmP04FDsOk82Lvz0XCEPunX4X7HcnXZvQWhCZtT74PEyFTJX06rCfGmvcJc4peF
 BbORD0OwvzDg26M8Kdj5PGtqk3NDZynOEEtzwsMD7sgfTSkXggAbrHfm1/aNseIvtPLhWiIYx3vGh
 wBVeLCmO2oAqxuD9hy7xNPFTIbyulOdxKPEcMQRkKNkS5BllQXAF6ncEbrofIPjA8847rzptp43z0
 Jn4uyExB1LNY8QfIfVLQwXxYESrXCy+khMZUuCT5ZaaA1KAt6XDJCMw08QKd800026MpJbD0DWRpX
 Z2CRQpw40jcjafa67Dr8Fe0WO3Tg4AsQhH19ZQ5+Nnhq1pKSbxjqrcJ2V224c9QKLoqTp8RlWUbow
 K32dnqktnys4qCEBuq5VgjLjNn90YjBdaPrC7VHJ+eyF4Jgk/Sa/xqcUi9r2F82tGvsaWzTmVbxuj
 xqHMini2j6GUmk94V2mLqSqkWD29J+HhRftYrABI2I8aVuEyShaXOsNqLPTv2SqcV2hKKRQg53Ib0
 Gpgh9DWUNOzV0I92OFnA8ENYGThe972gHRxmd/o+1mbYTaST7UeDBdQQAqxiGE2vVIN/FAtS+G3A1
 wKBiK2FEbUTcizk69W2+xvz0PcXKfdhB+b53821Wg=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Will Cohen <wwcohen@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org, Greg Kurz <groug@kaod.org>, 
 Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH v2 2/5] 9pfs: fix qemu_mknodat(S_IFSOCK) on macOS
Date: Wed, 27 Apr 2022 20:16:26 +0200
Message-ID: <2537696.GXuhJ82tfg@silver>
In-Reply-To: <CAB26zV1Lpgp-LZ=EXcONHAVOnrPbB5ZYEucA4q5ftgrsXfuSmA@mail.gmail.com>
References: <cover.1650553693.git.qemu_oss@crudebyte.com>
 <2323649.gZi5zFeIBc@silver>
 <CAB26zV1Lpgp-LZ=EXcONHAVOnrPbB5ZYEucA4q5ftgrsXfuSmA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

On Mittwoch, 27. April 2022 19:12:15 CEST Will Cohen wrote:
> On Wed, Apr 27, 2022 at 12:18 PM Christian Schoenebeck <
> 
> qemu_oss@crudebyte.com> wrote:
> > On Mittwoch, 27. April 2022 15:31:42 CEST Greg Kurz wrote:
> > > On Wed, 27 Apr 2022 14:32:53 +0200
> > > 
> > > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > > > On Mittwoch, 27. April 2022 12:18:10 CEST Greg Kurz wrote:
> > > > > On Wed, 27 Apr 2022 11:27:28 +0900
> > > > > 
> > > > > Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
> > > > > > On 2022/04/26 21:38, Greg Kurz wrote:
> > [...]
> > 
> > > > > > Considering the transient states are tolerated in 9pfs, we need to
> > > > > > design this function to be tolerant with transient states as well.
> > 
> > The
> > 
> > > > > > use of chmod() is not safe when we consider about transient
> > 
> > states. A
> > 
> > > > > > malicious actor may replace the file at the path with a symlink
> > 
> > which
> > 
> > > > > > may escape the shared directory and chmod() will naively follow
> > > > > > it.
> > > > > 
> > > > > You get a point here. Thanks for your tenacity ! :-)
> > > > 
> > > > Yep, I send a v4 with fchmodat_nofollow() instead of chmod(), thanks!
> > > > 
> > > > BTW, why is it actually allowed for client to create a symlink
> > > > pointing
> > > > outside exported directory tree with security_model=passthrough/none?
> > 
> > Did
> > 
> > > > anybody want that?
> > > 
> > > The target argument to symlink() is merely a string that is stored in
> > > the inode. It is only evaluated as a path at the time an action is
> > > made on the link. Checking at symlink() time is thus useless.
> > > 
> > > Anyway, we're safe on this side since it's the client's job to
> > > resolve links and we explicitly don't follow them in the server.
> > 
> > I wouldn't call it useless, because it is easier to keep exactly 1 hole
> > stuffed instead of being forced to continuously stuff N holes as new ones
> > may
> > popup up over time, as this case shows (mea culpa).
> > 
> > So you are trading (probably minor) performance for security.
> > 
> > But my question was actually meant seriously: whether there was anybody in
> > the
> > past who probably actually wanted to create relative symlinks outside the
> > exported tree. For instance for another service with wider host filesystem
> > access.
> 
> For what it's worth, the inability to follow symlinks read-write outside of
> the tree appears to be, at the moment, the primary pain point for new users
> of 9pfs in containerization software (see the later comments in
> https://github.com/lima-vm/lima/pull/726 and to a lesser extent
> https://github.com/containers/podman/issues/13784).
> 
> To my knowledge, neither podman nor lima have come up with conclusive
> preferred solutions for how to address this, much less had a robust
> discussion with the QEMU team.
> The lima discussion notes that it works read-only with passthrough/none, so
> I'd suggest that if there weren't users of it before, there are now! As I
> understand it, one partial solution for downstream software that allows for
> read-write may just be to more proactively mount larger directories to
> minimize the number of external paths that symlinks might get tripped up
> on. That said, this will stop working when it comes to linking to
> additional mounts, since /Volumes on darwin will never line up with /mnt.

That's a different thing. People in those discussions were using 
security_model=mapped where symlinks on guest are virtually mapped as textual 
file content (try 'cat <symlink>' on host). So in this mode symlinks on host 
and symlinks on guest are intentionally separated from each other.

The issue I was referring to was about security_model=passthrough|none which 
has the exact same symlinks accessible both on host and guest side, and more 
specifically I meant: symlinks created by guest that would point to a location 
*above* the 9p export root. E.g. say guest has access to the following host 
directory via 9p, that is access *below* the following directory on host:

  /vm/foo/

And say guest now mounts that host directory and creates a symlink like:

  mount -t 9p foo /mnt
  cd /mnt
  ln -s ../bar bar

That symlink would now point to /bar from guest's PoV, and to /vm/bar from 
host's PoV (i.e. a location on host where guest should not have access to at 
all).

BTW some of the other issues mentioned in the linked discussion, like the 
timeout errors, are fixed with this patch set.

Best regards,
Christian Schoenebeck



