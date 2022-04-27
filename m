Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3917C51153A
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 13:20:13 +0200 (CEST)
Received: from localhost ([::1]:57300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njfiO-0000jk-Bh
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 07:20:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1njfgy-0007lI-TR
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 07:18:45 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:45695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1njfgw-0007RU-MS
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 07:18:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=K0ai7lRUkEpwybf8xKQncs4jy4RuGbOkU0jjT+tjHFM=; b=IIPh+GXE9en1iq8m9Ho2sNpGBb
 h6itdeOkRTqJvd3zY3lxo0K7qp1VOeeWv8aMgHWVcvFnMovamlIVCWGyp9FUJDivdlsZKCDsjoeQg
 9eaBVo4LXglIxaJYTlVVLFFkdu0uXcVstNnIAZddI8bfqpp7yOx0XMVu1Tk77w1+081hXwrIhRTnr
 NXqU/kArT53LVyu0U2M8eevvHBwT7WEni40XNoOFbtpaS0nscMsh5G3lcxeCCJrq1KZXOVSHqBrLz
 K3GrkwPCfJqCrpA/2WWDm4GXbjwXAIyyt8uWhBgvcQ4AZ/N6uoX0A5pOLQuqIw/33DCUhGie2F8o+
 E6Q3AopTxERE+EDFaGY7Y/RE5SwzNZK9KkwCuxk9NGzf4UohnFB8bQVuGKhXMudzU2K5UPT6e3HSA
 IYcbLbOBx7DCAKrwWEHiaPytQ4PFKmjUJlgc/EvZ55FEIkKLFd8YIhek1Yz06jwyJCJlkWhaWVtbP
 aqRiT/U6A+Y4IA1yPQN3Tt/xR8GdqIn/F/quIWSKqFlalXcSK6kSsVLRC8vMsp/pBBHO5on1PkFPk
 aIT5RMINUNJ/E/q4hc6a1I6LILKILliYOHlLYRx6c7S2P+cNnu7iBuMYKCFjWkeRZ26twmQToMiib
 4rfYXlsfdJ70MUL63CmQdAtJAyDfoq7guByi72oc0=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Greg Kurz <groug@kaod.org>
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH] 9pfs: local: Do not follow symlink in _nofollow
Date: Wed, 27 Apr 2022 13:18:39 +0200
Message-ID: <1715982.RfpNsu2uEI@silver>
In-Reply-To: <20220427122151.6a22267b@bahia>
References: <20220427024545.18298-1-akihiko.odaki@gmail.com>
 <3805748.cZurrHcIA4@silver> <20220427122151.6a22267b@bahia>
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

On Mittwoch, 27. April 2022 12:21:51 CEST Greg Kurz wrote:
> On Wed, 27 Apr 2022 10:46:31 +0200
> 
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > On Mittwoch, 27. April 2022 04:45:45 CEST Akihiko Odaki wrote:
> > > Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> > > ---
> > > 
> > >  hw/9pfs/9p-local.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
> > > index d42ce6d8b82..def8afdb4d6 100644
> > > --- a/hw/9pfs/9p-local.c
> > > +++ b/hw/9pfs/9p-local.c
> > > @@ -365,7 +365,7 @@ static int fchmodat_nofollow(int dirfd, const char
> > > *name, mode_t mode) if (fd == -1) {
> > > 
> > >          /* In case the file is writable-only and isn't a directory. */
> > >          if (errno == EACCES) {
> > > 
> > > -            fd = openat_file(dirfd, name, O_WRONLY, 0);
> > > +            fd = openat_file(dirfd, name, O_WRONLY | O_NOFOLLOW, 0);
> > 
> > O_NOFOLLOW flag is always added inside openat_file() implementation:
> > 
> > https://github.com/qemu/qemu/blob/master/hw/9pfs/9p-util.h#L60
> > 
> > So this change is not necessary AFAICS.
> 
> Right, and with macOS in mind, maybe fchmodat(AT_SYMLINK_NOFOLLOW) just
> works unlike with linux ?

Yep, fchmodat(AT_SYMLINK_NOFOLLOW) seems to work on macOS! Like you already 
suggested on the other thread, it would make sense to move current 
implementation of fchmodat_nofollow() to 9p-util-linux.h/.c and let macOS just 
use fchmodat(AT_SYMLINK_NOFOLLOW) instead.

Best regards,
Christian Schoenebeck



