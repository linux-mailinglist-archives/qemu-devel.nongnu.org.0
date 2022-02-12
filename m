Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9C64B35BB
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 15:55:28 +0100 (CET)
Received: from localhost ([::1]:54016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIto6-00014R-Mm
	for lists+qemu-devel@lfdr.de; Sat, 12 Feb 2022 09:55:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schoenebeck@crudebyte.com>)
 id 1nIsDz-0008SL-54; Sat, 12 Feb 2022 08:14:03 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:42101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schoenebeck@crudebyte.com>)
 id 1nIsDv-0007He-7j; Sat, 12 Feb 2022 08:14:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=dTPe30bsmnXmUz8v4Ui7RXdqD0wo7g2KMayUkMtjZT0=; b=AlPGsFh8j5LVE7X/7Faq7Ers35
 s3390I9WF+ouduTnohdYK15GUyWuN/tsVD1cACnC35NH6kpaWyexsX3tP9Y/BQ5BBhrvz6/aeviwP
 YBk+oFK8hlhv86L3P+kKc2a8SDCvcHeEPYTur5pBFrxmRT/rW5ZgqoSXSxYI0tH5sVCbOFvRloUBX
 NcQ4ob0sryOjiUcKgv1Y3Ch+i3Sr63feHwERRWcoTtAprHf7PPNWz+xJE1Y/LAS34DVzOjJcbNU+R
 pi//zlVtgFrQBjfHfmlEYy/IWK3LiPtoJoNAOaDaxwI2sQZi9/qRf7arGV3zm/gZzQ+MXr9824Iu5
 J6lGdvIZjFD4C3dKuDDkdl7PXtXDELplJO/jEHvdJB+H9KvuXWlozUv1aSmMOvKbvSZfbwies3vD3
 OXIuj8hSmB2qQ+QknTPcNurJxd1Ru9uZbEWBKkVa53JAcIC7N59DcESVEj3XbVw5P6fARLTo03e8c
 ua52mx1WCC69xMFxNsBh4KbzMX9h917shgjI/lWWirHL670Xc2dUK0LxYs/3c/w4YIvFWB8Sk+KS2
 0QcbWbUIZTDknUtxXuSTqzMwlbBsFsBn08H4dE/ak+DpJHE7ek7pYcXh226l1kQk5NbxT8rE8/KeJ
 zRMCfthTmJCh41oS/JwhaQEwyas1XGTcNxb1NEJe8=;
From: Christian Schoenebeck <schoenebeck@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 richard.henderson@linaro.org, eblake@redhat.com
Subject: Re: [PULL 0/7] nbd: handle AioContext change correctly
Date: Sat, 12 Feb 2022 14:13:43 +0100
Message-ID: <54823717.cdBbltbcZa@silver>
In-Reply-To: <101e60ea-b752-887b-8b8e-f73561266357@virtuozzo.com>
References: <20220209140258.364649-1-vsementsov@virtuozzo.com>
 <CAFEAcA-12iJfa7F-zGBb--V3yehi3iV2A6u_BPuEFb-9kjHBVw@mail.gmail.com>
 <101e60ea-b752-887b-8b8e-f73561266357@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=schoenebeck@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 12 Feb 2022 09:49:47 -0500
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

On Freitag, 11. Februar 2022 14:04:44 CET Vladimir Sementsov-Ogievskiy wrote:
> 11.02.2022 15:52, Peter Maydell wrote:
> > On Wed, 9 Feb 2022 at 14:03, Vladimir Sementsov-Ogievskiy
> > 
> > <vsementsov@virtuozzo.com> wrote:
> >> The following changes since commit 
0a301624c2f4ced3331ffd5bce85b4274fe132af:
> >>    Merge remote-tracking branch
> >>    'remotes/pmaydell/tags/pull-target-arm-20220208' into staging
> >>    (2022-02-08 11:40:08 +0000)>> 
> >> are available in the Git repository at:
> >>    https://src.openvz.org/scm/~vsementsov/qemu.git
> >>    tags/pull-nbd-2022-02-09
> >> 
> >> for you to fetch changes up to 1bd4523c2ded28b7805b971b9d3d746beabd0a94:
> >>    iotests/281: Let NBD connection yield in iothread (2022-02-09 14:15:29
> >>    +0100)>> 
> >> ----------------------------------------------------------------
> >> nbd: handle AioContext change correctly
> > 
> > Hi; this pullreq is OK content-wise, but the commits are missing
> > your Signed-off-by: line as the submaintainer/submitter of the
> > pull request. Could you add them and resend, please?
> 
> Oops, sorry. I thought I'm already an experienced maintainer and don't need
> to re-read "Submitting a Pull Request" instruction every time. I was
> wrong:)

Assuming you are using pwclient to pull patchtes, just add

signoff=on

to your .pwclientrc config file to automatically add your signoff tag to 
pulled patches. Additionally I would recommend adding:

msgid=on

which will add the email message id of each patch, so that people can review 
the discussions on qemu-devel later on if needed. On Linux kernel side it's 
now more common to add a Link: tag, which is a bit more convenient as people 
can just click on it to get to the discussion. Not sure if there is config 
option for pwclient for that as well.

Best regards,
Christian Schoenebeck



