Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F74F295CC9
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Oct 2020 12:37:26 +0200 (CEST)
Received: from localhost ([::1]:54272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVXyH-0007h2-7z
	for lists+qemu-devel@lfdr.de; Thu, 22 Oct 2020 06:37:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kVXvD-0005zX-Dr
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 06:34:15 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:47179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kVXvA-0002o4-OR
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 06:34:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=r0VihkCi2LeprsraEEkrwXy/E7IQ4S8BDOk9Lmi6rv0=; b=L9qYkMuDL5o8XN2m1OkO0ljSmN
 9HvDJ7KZP3RcbyFatG32uqB0Y2nsu3kiUhmr59I3SmtasLD763plIIFqb/r/ewsx2n5fvJxKvO7HF
 IeRB/pdY3z0J68Ie3WgrddbXZ4F1ds3oU89+srGrBkbcOCZyPtEpXP0aAljMxwAarTmWmCsCeu+xB
 HC7qCvXFnsuV/dGFbJUIKgVGHB/McQEREloGlMp4onlpUwq15tWtAhCEtdPMv7O2s9xkbssk6SCJK
 x8m+FN1LOJWoX8wYgj785aYGIlENvwuC1p2cKULkVogfnTmo+NirfX+ey3FKPpvEkzTA5MlG1cgO8
 39xVqWCQ==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v2 3/8] tests/9pfs: add local Tlcreate test
Date: Thu, 22 Oct 2020 12:34:09 +0200
Message-ID: <12057098.r4HSQLx7n3@silver>
In-Reply-To: <20201022105146.70f8efb3@bahia.lan>
References: <cover.1603285620.git.qemu_oss@crudebyte.com>
 <269cae0c00af941a3a4ae78f1e319f93462a7eb4.1603285620.git.qemu_oss@crudebyte.com>
 <20201022105146.70f8efb3@bahia.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=91.194.90.13; envelope-from=qemu_oss@crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/22 06:34:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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

On Donnerstag, 22. Oktober 2020 10:51:46 CEST Greg Kurz wrote:
> On Wed, 21 Oct 2020 14:25:33 +0200
> 
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > This test case uses a Tlcreate 9p request to create a regular file inside
> > host's test directory.
> > 
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > ---
> 
> Just one remark, see below.
> 
> Reviewed-by: Greg Kurz <groug@kaod.org>
> 
> >  tests/qtest/virtio-9p-test.c | 77 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 77 insertions(+)
> > 
> > diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
> > index abd7e44648..c030bc2a6c 100644
> > --- a/tests/qtest/virtio-9p-test.c
> > +++ b/tests/qtest/virtio-9p-test.c
> > @@ -258,6 +258,7 @@ static const char *rmessage_name(uint8_t id)
> > 
> >          id == P9_RLOPEN ? "RLOPEN" :
> >          id == P9_RWRITE ? "RWRITE" :
> > 
> >          id == P9_RMKDIR ? "RMKDIR" :
> > +        id == P9_RLCREATE ? "RLCREATE" :
> >          id == P9_RUNLINKAT ? "RUNLINKAT" :
> >          id == P9_RFLUSH ? "RFLUSH" :
> > 
> >          id == P9_RREADDIR ? "READDIR" :
> > @@ -694,6 +695,44 @@ static void v9fs_rmkdir(P9Req *req, v9fs_qid *qid)
> > 
> >      v9fs_req_free(req);
> >  
> >  }
> > 
> > +/* size[4] Tlcreate tag[2] fid[4] name[s] flags[4] mode[4] gid[4] */
> > +static P9Req *v9fs_tlcreate(QVirtio9P *v9p, uint32_t fid, const char
> > *name, +                            uint32_t flags, uint32_t mode,
> > uint32_t gid, +                            uint16_t tag)
> > +{
> > +    P9Req *req;
> > +
> > +    uint32_t body_size = 4 + 4 + 4 + 4;
> > +    uint16_t string_size = v9fs_string_size(name);
> > +
> > +    g_assert_cmpint(body_size, <=, UINT32_MAX - string_size);
> > +    body_size += string_size;
> > +
> > +    req = v9fs_req_init(v9p, body_size, P9_TLCREATE, tag);
> > +    v9fs_uint32_write(req, fid);
> > +    v9fs_string_write(req, name);
> > +    v9fs_uint32_write(req, flags);
> > +    v9fs_uint32_write(req, mode);
> > +    v9fs_uint32_write(req, gid);
> > +    v9fs_req_send(req);
> > +    return req;
> > +}
> > +
> > +/* size[4] Rlcreate tag[2] qid[13] iounit[4] */
> > +static void v9fs_rlcreate(P9Req *req, v9fs_qid *qid, uint32_t *iounit)
> > +{
> > +    v9fs_req_recv(req, P9_RLCREATE);
> > +    if (qid) {
> > +        v9fs_memread(req, qid, 13);
> > +    } else {
> > +        v9fs_memskip(req, 13);
> > +    }
> > +    if (iounit) {
> > +        v9fs_uint32_read(req, iounit);
> > +    }
> > +    v9fs_req_free(req);
> > +}
> > +
> > 
> >  /* size[4] Tunlinkat tag[2] dirfd[4] name[s] flags[4] */
> >  static P9Req *v9fs_tunlinkat(QVirtio9P *v9p, uint32_t dirfd, const char
> >  *name,>  
> >                               uint32_t flags, uint16_t tag)
> > 
> > @@ -1032,6 +1071,24 @@ static void do_mkdir(QVirtio9P *v9p, const char
> > *path, const char *cname)> 
> >      g_free(name);
> >  
> >  }
> > 
> > +/* create a regular file with Tlcreate and return file's fid */
> > +static uint32_t do_lcreate(QVirtio9P *v9p, const char *path,
> > +                           const char *cname)
> > +{
> > +    char *const name = g_strdup(cname);
> > +    uint32_t fid;
> > +    P9Req *req;
> > +
> > +    fid = do_walk(v9p, path);
> > +
> > +    req = v9fs_tlcreate(v9p, fid, name, 0, 0750, 0, 0);
> 
> Maybe it could make sense to make the mode a parameter of
> do_lcreate() in case someone wants to write a test case
> around that ? Same remark applies to do_mkdir() actually.
> 
> No need to change this now anyway.

Yeah, I thought about that for a moment, but decided if that's really needed 
one day, it'll be a trivial change, especially under the assumption that there 
will be probably not a lot of code using this function, even on the long-term.

Thanks for looking at these patches!

Best regards,
Christian Schoenebeck



