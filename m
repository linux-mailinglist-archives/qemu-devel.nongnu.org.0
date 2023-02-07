Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E37C068D3CC
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 11:12:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPKxA-00036v-DD; Tue, 07 Feb 2023 05:11:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pPKwx-0002iN-4Q
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 05:11:44 -0500
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pPKws-0003eR-O3
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 05:11:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=S19dR+LzrqbUeNRNw9cufB1QXyR1ZrGhu0ADT3c2djg=; b=TLY9qP4JTN4wo6APUPwPeinPGD
 PiR6n7kr0lPmLic8FQBXb2uKa1Ci0ejs3QAh+9s7wHiVRapwrZVLqONB8q+yv+Mt8diDi6j+yPMwg
 TPXSE2gmMhxX8d2LTvl3xYo/mYRpgq13T9d5XIuBFZEiauCigpDB4om0efAVooq6pDXPgygi9+u7P
 GYjvDUspNcd9ibv6uYp0VCXT1nOJV8k524me52LMLuQ21Qfo2sx/p5cQzdJYCP86097AV5Q5svQXv
 tWGRlh61WEkaEjV3U2gAISX4bvnI5phAs39y9h7BCSI6CrAEu42KIomTbwHkTlPmg6uYReGDByGhi
 Nk++dn7dcA8OhschICmL94GaglS0pmIX5UyVV/B+MG3brYL4GYtzrBRHcYrgwxZaeqG/wke6RJ6TQ
 yKZap2W9VN72t56hCyG3nA11mkDjLGs8Z6d8jfbjXaoG9T0AohhPzqgfbBPDKP+D4jFu+sDKrZM4s
 nw+7lPqxbDHdTP8tttvpmCQ1PAujr+WfNeV4TQYspv0I5eVZJZHsWyA/8t6JItzkQYr/AEa1Ir2f2
 fL/bWaCCP+N84xapqcHyQoePfHnoxq68FT43wKKFPtO3Ftt1sIgjaeZB1H07dTZ0WAKpZDiVLF49J
 qj/3e5VV+u351vYGkvKvtkrK0f3G2BKF+mnWElQXA=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Greg Kurz <groug@kaod.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "Meng, Bin" <Bin.Meng@windriver.com>,
 =?ISO-8859-1?Q?Marc=2DAndr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Daniel =?ISO-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 "Shi, Guohuai" <Guohuai.Shi@windriver.com>
Subject: Re: [PATCH v4 04/16] hw/9pfs: Implement Windows specific xxxdir() APIs
Date: Tue, 07 Feb 2023 11:11:31 +0100
Message-ID: <4342819.egquFENVeL@silver>
In-Reply-To: <MN2PR11MB4173960A520976B15946CCEBEFDA9@MN2PR11MB4173.namprd11.prod.outlook.com>
References: <20230130095202.2773186-1-bin.meng@windriver.com>
 <3667674.co3Lnhysxx@silver>
 <MN2PR11MB4173960A520976B15946CCEBEFDA9@MN2PR11MB4173.namprd11.prod.outlook.com>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Monday, February 6, 2023 6:37:16 AM CET Shi, Guohuai wrote:
[...]
> > I know, it's an n-square performance issue and what I already wrote in the
> > summary of the linked original suggestion [1] in v3 before, quote:
> > 
> >   + Relatively straight-forward to implement.
> > 
> >   + No (major) changes in 9pfs code base required.
> > 
> >   - Still n-square performance issue (neglectable to land Windows host
> > support
> >     IMO).
> > 
> >   o Consistency assured for "most" cases, except one: if hardlinks are
> >     inserted in between then it might fail
> 
> readdir() on Linux host may also return the deleted entries.
> And POSIX specification does not mention about the consistency issue.

POSIX explicitly specifies that 1. new and 2. deleted entries may or may not
appear in result and leaves that implementation specific. That was never our
concern.

And yes, POSIX does not explicitly discuss consistency concerning entries that
have neither been added or removed, but this expectation is implied. In
practice double entries are probably less of an issue, client might be able to
handle that without misbehaviour (haven't checked this at all yet), but if the
implementation would lead to chances that entries may *never* appear to
clients at all, even after refreshing periodically, I mean how could you work
with a file system like that?

> NTFS file id is the $MFT index id. It will keen unique until file is deleted.
> But the index id may be reuse if delete and re-create many files.
> 
> Saving file id instead of name will make consistency better, but may not cover all status.
> Because read directory is not a "atomic" operation.

I don't see an issue with that, because these are entries that were either
added or removed, we don't care about them. And their file IDs would not
affect fetching the other directory entries that have not been touched in
between.

And we are also not questioning atomicity here, but consistency.

> > [1] https://lore.kernel.org/qemu-devel/2468168.SvRIHAoRfs@silver/
> > 
> > The idea was to use that just as a starting point to land Windows host support
> > ASAP, slower on large dirs compared to other solutions, yes, but with
> > guaranteed correct and deterministic behaviour. And then on the long run
> > we would of course replace that with a more performant solution.
> > 
> > I mean, this is really simple to implement, so I would at least test it. If it really
> > runs horribly slow we could still discuss faster solutions, which are however
> > all much more tricky.
> > 
> 
> I did a basic test on Windows host, here is the code:
> 
>     st = clock();
>     pDir = opendir_win32(TEST_DIR);
> 
>     if (pDir == NULL)
>         return -1;
>     
>     while ((pEnt = readdir_win32(pDir)) != NULL)
>     {
>         totals++;
>     }
>     closedir_win32(pDir);
>     ed = clock();
> 
>     printf("total = %d clocks = %d %d\n", totals, ed - st, CLOCKS_PER_SEC);
> 
> My local storage is SSD disk.
> 
> Run this test for 100, 1000, 10000 entries.
> For file name cache solution, the time cost is: 2, 9, 44 (in ms).
> For file id cache solution, the time cost: 3, 438, 4338 (in ms).
> I already used OpenFileById() to make it faster instead of CreateFile(). If I use CreateFile, it need more than 80 seconds.
> 
> The performance looks like not good. 
> And actually, it would be worse in 9pfs.
> Because in current design, 9pfs  may seek forward and seek back several times during reading directory, which may cause the performance worse.

Poor performance, yes, probably a bit worse than I would have expected.

So it is about choosing your poison (potential crash vs. poor performance).

I mean, I am not keen into suggesting any kind of bike shredding for you on
this issue, but if this is merged, then people expect it to behave reliably
and not allowing a guest to crash QEMU host process by simply creating a large
number of directory entries on guest.

I was also considering to make it a QEMU option, but OTOH, this is a temporary
situation and those options would be wiped once we have an oppropriate
solution a bit later.

I am open for suggestions. Could we probably just mark Windows host support as
experimental for now, is that even allowed by QEMU policies?

> > > So I think store all name entries would be better than store all file ID.
> > 
> > As already discussed, NTFS allows up to (2^32 - 1) = 4,294,967,295 entries per
> > directory. So caching only one directory (entirely) in RAM can already exceed
> > the available RAM, which would crash QEMU. Multiplied by an expected
> > amount of directory lookups by client and we even get into much higher
> > categories, even with much smaller individual directory sizes.
> > 
> 
> Windows file id structure is 24 bytes, which is not a small structure.
> If you think the performance is acceptable, I can rework this commit based on file id.



