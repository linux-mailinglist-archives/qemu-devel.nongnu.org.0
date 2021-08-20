Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D623F2C82
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 14:53:26 +0200 (CEST)
Received: from localhost ([::1]:60262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH41V-0002CT-DX
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 08:53:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mH3y4-0000GY-Az
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 08:49:56 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:41337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mH3y0-00013D-RZ
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 08:49:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=QPEPUtV35sHQnkaLNNYy7EXHKfqibH06jtJUW6Ulv7o=; b=C7Odaxk0QVgr/gX9pzb/hhZl5m
 GRRW/D1PHE/n0hC3+eOzEsAAeq7jJTkaS4tl3YTxWJP/H/4BpPcn5RaSOdjP1pTqIC5dh6aQka/Wu
 mmNW5KeZ4Rkmg4IayIyaokY4UbA7UJQB/rGizTKPdHK0pmmSb9TXtFyFk1YFQyBD8KZ1uG5l5AiAF
 hqybtj6u0bc5rE8bqSz/tahwxIxTaSvjLJhW13DpUj1Iuz4vUarbeiiZq8iBetQTGt3bIXG5WNh8U
 acTKmkmE+/0RCT27mwnEYjvolMxc7q8+D2EJB4Bk392/EjLFeUTPkwp3PximMUw5xeIgLznwGK6dX
 y9SW6Q9DFVinTrtG8qLTPyNNMOPwhsyRkDVrbsA5rTlIjkVYziJszYIHr6Vr6tojYW+ZRofuy5f2L
 LK8+GjY44YDBOkrzB6ghEiYJp7iagRy3RJb+e+b7i1T3xeOF8TvbEuOfIGMyfh2bYcO3Z++scqCLb
 GYlzlPz8Awsr3FD3J4FmE0nzqfzlGqI72fdJR0kYUMPIPqMeKDRIL8U1nNkcYMiB3DmHcTC0nsXPb
 l3l9XSuMFIUCXptjhLtwXxicAdreWP4IYesoKEV5XUJe/7j6iMqgf6uCNJk9Rluo2FrcktCyfhQJn
 sJ7xbMofNJ5up8f5pywwrcMNV6EqgI/AJniLNKNHw=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 2/2] hw/9pfs: use g_autofree in v9fs_walk() where possible
Date: Fri, 20 Aug 2021 14:49:45 +0200
Message-ID: <18948984.SbZjAMnHUt@silver>
In-Reply-To: <20210820143411.0553aee5@bahia.lan>
References: <cover.1629208359.git.qemu_oss@crudebyte.com>
 <12832142.34yICVTDIk@silver> <20210820143411.0553aee5@bahia.lan>
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

On Freitag, 20. August 2021 14:34:11 CEST Greg Kurz wrote:
> On Fri, 20 Aug 2021 14:23:26 +0200
> 
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > On Freitag, 20. August 2021 12:40:31 CEST Greg Kurz wrote:
> > > On Tue, 17 Aug 2021 15:46:50 +0200
> > > 
> > > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > > > Suggested-by: Greg Kurz <groug@kaod.org>
> > > > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > > ---
> > > > 
> > > >  hw/9pfs/9p.c | 7 +++----
> > > >  1 file changed, 3 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> > > > index 4d642ab12a..c857b31321 100644
> > > > --- a/hw/9pfs/9p.c
> > > > +++ b/hw/9pfs/9p.c
> > > > @@ -1703,11 +1703,12 @@ static bool same_stat_id(const struct stat *a,
> > > > const struct stat *b)>
> > > > 
> > > >  static void coroutine_fn v9fs_walk(void *opaque)
> > > >  {
> > > >  
> > > >      int name_idx;
> > > > 
> > > > -    V9fsQID *qids = NULL;
> > > > +    g_autofree V9fsQID *qids = NULL;
> > > > 
> > > >      int i, err = 0;
> > > >      V9fsPath dpath, path, *pathes = NULL;
> > > >      uint16_t nwnames;
> > > > 
> > > > -    struct stat stbuf, fidst, *stbufs = NULL;
> > > > +    struct stat stbuf, fidst;
> > > > +    g_autofree struct stat *stbufs = NULL;
> > > > 
> > > >      size_t offset = 7;
> > > >      int32_t fid, newfid;
> > > >      V9fsString *wnames = NULL;
> > > > 
> > > > @@ -1872,8 +1873,6 @@ out_nofid:
> > > >              v9fs_path_free(&pathes[name_idx]);
> > > >          
> > > >          }
> > > >          g_free(wnames);
> > > > 
> > > > -        g_free(qids);
> > > > -        g_free(stbufs);
> > > > 
> > > >          g_free(pathes);
> > > 
> > > It seems that wnames and pathes could be converted to
> > > g_autofree as well or I'm missing something ?
> > 
> > Yeah, I mentioned that in the cover letter. Those two are omitted in this
> > patch because they contain dynamically allocated memory per array element
> > which need to be freed individually before freeing the array.
> > 
> > So those two would probably require custom cleanup handlers.
> 
> The freeing of the individual elements is already handled in the loop above
> the g_free() calls. The wnames and pathes pointers can thus be treated like
> the other ones.

Yes I know. I was just considering to make that in a safer way that would 
allow simple returns in future without goto out_something; branches. But yes, 
as it is right now they could be converted in the exact same way yet.

Best regards,
Christian Schoenebeck



