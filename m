Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD30F508521
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 11:40:32 +0200 (CEST)
Received: from localhost ([::1]:41156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh6p5-0005IE-8W
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 05:40:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nh6ng-0004LY-8f; Wed, 20 Apr 2022 05:39:04 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:43587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nh6ne-0006sl-9F; Wed, 20 Apr 2022 05:39:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=LXSkIyogEFk8Us9mo0HUhXKqX5caLwyUH7qc1zBng38=; b=RxwJql7ZLnL5KIN5k+9igmZAyF
 PR+ATKi6huYKRckI/nNhViU6V1pBGLsYQBlEl2ZF66Qf0SsJ1/LJuuF2l0KLE/MYIcDKL1X1C1pEJ
 BjT3NeHwUpEPGfGZYjB7pw8Xs7laoTx7C0sy0RN+V1Sk8PM6wDoPqo5OC7t0jQFA88wbOsDgoCBKO
 0SfUOmTAL8jCWD0q+1qWghFhn7XxBH50/ePTWz9u+OckbsRSJux15vcAitZseDxgTb4e5NakJamSM
 uc87kJxqUliB2BDHovz4sJLkUsLF90zCxVowYA+7t/Ns8E+f9tZ4ozYSzrdyK3ZFff6291nzpyokL
 NfPj15KJvU9yCHhxsTn5/8ma/R3j0yiGakxj9Kz1xDq9wqtocRakJMAALM/bBZPaIl9m4G4YrtkVX
 s8dvlcxNiG+pj+bmyORO82N4yu/Em88zcPJVlC7F5fAzj4BssiwU9AqTcbAOOwHVvL3nrlFyRpB8n
 /TEPa2S+MTqts6CsO9NdvxTLqT8Yc6R/4iaNVsLupg9v4nkxBcpvRDd7Zw2xWsZ80DmiAu8VP8xFo
 Y+h4+Uv42dzJ5oQ3BXVgb+dROoY7ZKxRBIv8s3DDtZZYBM68dlpJyQHeWsylNb+3LOROTO9GlcWdl
 v2HWnTqM+2TwV6v7/ZL8eU6xwZB1r+zy8kHDihmoQ=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>, Greg Kurz <groug@kaod.org>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>, Will Cohen <wwcohen@gmail.com>
Subject: Re: [PATCH 1/5] 9pfs: fix qemu_mknodat(S_IFREG) on macOS
Date: Wed, 20 Apr 2022 11:38:58 +0200
Message-ID: <1975704.alDGDoh6Bm@silver>
In-Reply-To: <20220420104005.742b818b@bahia>
References: <cover.1650370026.git.qemu_oss@crudebyte.com>
 <280dfc7a-7985-3c01-c1ac-5fe15825c95a@gmail.com>
 <20220420104005.742b818b@bahia>
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

On Mittwoch, 20. April 2022 10:40:05 CEST Greg Kurz wrote:
> On Wed, 20 Apr 2022 11:03:52 +0900
> 
> Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
> > On 2022/04/19 20:40, Christian Schoenebeck wrote:
> > > mknod() on macOS does not support creating regular files, so
> > > divert to openat_file() if S_IFREG is passed with mode argument.
> > > 
> > > Furthermore, 'man 2 mknodat' on Linux says: "Zero file type is
> > > equivalent to type S_IFREG".
> > > 
> > > Link: https://lore.kernel.org/qemu-devel/17933734.zYzKuhC07K@silver/
> > > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > ---
> > > 
> > >   hw/9pfs/9p-util-darwin.c | 4 ++++
> > >   1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c
> > > index bec0253474..53e0625501 100644
> > > --- a/hw/9pfs/9p-util-darwin.c
> > > +++ b/hw/9pfs/9p-util-darwin.c
> > > @@ -77,6 +77,10 @@ int fsetxattrat_nofollow(int dirfd, const char
> > > *filename, const char *name,> > 
> > >   int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t
> > >   dev)
> > >   {
> > >   
> > >       int preserved_errno, err;
> > > 
> > > +
> > > +    if (S_ISREG(mode) || !(mode & S_IFMT)) {
> > > +        return openat_file(dirfd, filename, O_CREAT, mode);
> > > +    }
> > > 
> > >       if (!pthread_fchdir_np) {
> > >       
> > >           error_report_once("pthread_fchdir_np() not available on this
> > >           version of macOS"); return -ENOTSUP;
> > 
> > openat_file returns a file descriptor on success while mknodat returns 0
> > on success. The inconsistency should be handled.
> 
> And most importantly that file descriptor must be closed !

Good spot, both of you! Revising -> v2.

Thanks guys!

Best regards,
Christian Schoenebeck



