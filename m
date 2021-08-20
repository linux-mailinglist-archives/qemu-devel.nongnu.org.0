Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF47B3F2C02
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 14:24:58 +0200 (CEST)
Received: from localhost ([::1]:39852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH3Zx-000409-LT
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 08:24:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mH3YZ-0002dH-2a
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 08:23:32 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:45885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mH3YX-0003u0-HP
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 08:23:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=+XtXuUsbO2Yps7+W6U0+FWDjexbq2MYsZ1D7Q4mncQE=; b=ABPMfcXDazK6rYMkVhK/EHHtks
 NPMqhYFy3gA3k54pQ/2dT9KSUGEkyk59YUV0Ol8z5XabHpoZ+Kdhg6QEf0AZVPDACb/EzafyLvu1b
 qIqrodVfrHF13BcO9NV/64wTNkFSWOPM6YSCCxr6LqcgKymoMgfHULNh+j6OGr3puTq/AoAvZd6ns
 1yYquw8b8JV+4EpJyfWecg0ziiWgzp8I0RB6EO+LpTdpxNtyIzcZbatht/uk9vBNN1kT+je7buTzo
 RSe2FKIfpqzpjmprWvOJxVkmZu7kHPVInfdfPfIS71EFK3WiT03cGgIaqBcsA+0b+8Y5OagCc6j5b
 KLzk0ouf+YmeshcjJH+cv/5DzRTyafrFTn2f7KEFrgEHITLP1z5AWACacE2UyV6pgETKbhwtP5pp3
 OEIqH0nRNS7gD2ysxkRN3ukVztx2AGXTcnyHRRzULNlSPhi5jLLzYgS/FDFY7IgJsCPgVxbxxo3Wx
 2C2wFeTWu1Nwb5myZrDpXnbup8JlFN6qR3+dnZHYSA+Vnz9ZZ2fX74HwV1PX3Twl2JWHQsWGfByJp
 GBG9kAWWSYK75TOHVVAcisZH7bojhZUNLDTuT4rkyMRdlhkEO466f2QZaDm37W/MxpdkBZSiu/Bix
 sDK88yRrimIZhFbLB5UZPXSi7PDvJZ7afj3Eg3bOc=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 2/2] hw/9pfs: use g_autofree in v9fs_walk() where possible
Date: Fri, 20 Aug 2021 14:23:26 +0200
Message-ID: <12832142.34yICVTDIk@silver>
In-Reply-To: <20210820124031.6ea5e042@bahia.lan>
References: <cover.1629208359.git.qemu_oss@crudebyte.com>
 <b51670d2a39399535a035f6bc77c3cbeed85edae.1629208359.git.qemu_oss@crudebyte.com>
 <20210820124031.6ea5e042@bahia.lan>
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

On Freitag, 20. August 2021 12:40:31 CEST Greg Kurz wrote:
> On Tue, 17 Aug 2021 15:46:50 +0200
> 
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > Suggested-by: Greg Kurz <groug@kaod.org>
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > ---
> > 
> >  hw/9pfs/9p.c | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> > 
> > diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> > index 4d642ab12a..c857b31321 100644
> > --- a/hw/9pfs/9p.c
> > +++ b/hw/9pfs/9p.c
> > @@ -1703,11 +1703,12 @@ static bool same_stat_id(const struct stat *a,
> > const struct stat *b)> 
> >  static void coroutine_fn v9fs_walk(void *opaque)
> >  {
> >  
> >      int name_idx;
> > 
> > -    V9fsQID *qids = NULL;
> > +    g_autofree V9fsQID *qids = NULL;
> > 
> >      int i, err = 0;
> >      V9fsPath dpath, path, *pathes = NULL;
> >      uint16_t nwnames;
> > 
> > -    struct stat stbuf, fidst, *stbufs = NULL;
> > +    struct stat stbuf, fidst;
> > +    g_autofree struct stat *stbufs = NULL;
> > 
> >      size_t offset = 7;
> >      int32_t fid, newfid;
> >      V9fsString *wnames = NULL;
> > 
> > @@ -1872,8 +1873,6 @@ out_nofid:
> >              v9fs_path_free(&pathes[name_idx]);
> >          
> >          }
> >          g_free(wnames);
> > 
> > -        g_free(qids);
> > -        g_free(stbufs);
> > 
> >          g_free(pathes);
> 
> It seems that wnames and pathes could be converted to
> g_autofree as well or I'm missing something ?

Yeah, I mentioned that in the cover letter. Those two are omitted in this 
patch because they contain dynamically allocated memory per array element 
which need to be freed individually before freeing the array.

So those two would probably require custom cleanup handlers.

> 
> Feel free to add my R-b with or without that extra change.
> 
> Reviewed-by: Greg Kurz <groug@kaod.org>

Thanks!

> 
> >      }
> >  
> >  }

Best regards,
Christian Schoenebeck



