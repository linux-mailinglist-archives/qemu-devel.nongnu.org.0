Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AF950A759
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 19:46:12 +0200 (CEST)
Received: from localhost ([::1]:35596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhasd-0006YU-Po
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 13:46:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nhacr-0005KA-2a; Thu, 21 Apr 2022 13:29:53 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:47273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nhacp-0002VR-A2; Thu, 21 Apr 2022 13:29:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=D1OzRJDjdZv3NMA2H86vHTX86sYNC1aVGH/EmbzZfow=; b=Zc9ShLQChLxha1pQzjK/1h8qHX
 ej2BeLRQ9xf98jTjtH6ZZBHc1xDxIUArcx8YM9rwJ9AbszT7FxAK/+IwaO7xMCeslFPj53N0pox/B
 buin16aZpkCmLGWYfNNSzQUCNBNJF4HJcBtgslY/734gqlUh7Yn4j6TnJOlkEuPvLrUR9KlxdF1OB
 z3GdRP+So519BwldN46XPN3TlYGDBz66GQ8uGSbLyo4wpVRoMne7uf+8qQxbvE6D+6uN4X5G8AZLp
 5Z4lR74MYz2AYQuwQF4BsRUKvkLmW8u4OVlpMGey9O1kvyAfeaCh95Nv2qJqvg1RVNuMTV0ukKi7d
 nIYWu10rQNV8kCzFkYM0EIffhKPKFqtQYBQL7EvDnVwU7xlkcSxB7N0a+WAKlIEwqKb9hvZ7IaraY
 HR4oIhsEth7o6/qj36uuQPb87Rqm577kiTKHyuCvNfYR5uLCCrkf4sCT64Oj0w+RHVYn/XL05zqN8
 m9iRdm8Ka897JZ9khrUzv2GliHtxD/2skX78QS0mZ0VpKKSayYG+iVnfliVpPQpJW7CsbwkElszhs
 LoW2eL5jhTl9vWUVf8bM46pBs/74z1s4htoPA2UfEFTrHA7vkybCf1D2OjnvWa/ahfAgBh0KAYc3b
 S4VvRWAhFT44EMLLUtWZW4sqsr/uvM56srjexzcsM=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org, qemu-stable@nongnu.org
Cc: Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>, Will Cohen <wwcohen@gmail.com>, 
 Akihiko Odaki <akihiko.odaki@gmail.com>, Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v2 2/5] 9pfs: fix qemu_mknodat(S_IFSOCK) on macOS
Date: Thu, 21 Apr 2022 19:29:47 +0200
Message-ID: <3959650.Udx1F4Wk6a@silver>
In-Reply-To: <20220421183631.3260fc3e@bahia>
References: <cover.1650553693.git.qemu_oss@crudebyte.com>
 <f6d632fc82d4750b73c83a2f1d1b9972cf3e26bb.1650553693.git.qemu_oss@crudebyte.com>
 <20220421183631.3260fc3e@bahia>
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

On Donnerstag, 21. April 2022 18:36:31 CEST Greg Kurz wrote:
> On Thu, 21 Apr 2022 17:07:43 +0200
> 
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > mknod() on macOS does not support creating sockets, so divert to
> > call sequence socket(), bind() and chmod() respectively if S_IFSOCK
> > was passed with mode argument.
> > 
> > Link: https://lore.kernel.org/qemu-devel/17933734.zYzKuhC07K@silver/
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > Reviewed-by: Will Cohen <wwcohen@gmail.com>
> > ---
> > 
> >  hw/9pfs/9p-util-darwin.c | 27 ++++++++++++++++++++++++++-
> >  1 file changed, 26 insertions(+), 1 deletion(-)
> > 
> > diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c
> > index e24d09763a..39308f2a45 100644
> > --- a/hw/9pfs/9p-util-darwin.c
> > +++ b/hw/9pfs/9p-util-darwin.c
> > @@ -74,6 +74,27 @@ int fsetxattrat_nofollow(int dirfd, const char
> > *filename, const char *name,> 
> >   */
> >  
> >  #if defined CONFIG_PTHREAD_FCHDIR_NP
> > 
> > +static int create_socket_file_at_cwd(const char *filename, mode_t mode) {
> > +    int fd, err;
> > +    struct sockaddr_un addr = {
> > +        .sun_family = AF_UNIX
> > +    };
> > +
> > +    fd = socket(PF_UNIX, SOCK_DGRAM, 0);
> > +    if (fd == -1) {
> > +        return fd;
> > +    }
> > +    snprintf(addr.sun_path, sizeof(addr.sun_path), "./%s", filename);
> > +    err = bind(fd, (struct sockaddr *) &addr, sizeof(addr));
> > +    if (err == -1) {
> > +        goto out;
> > +    }
> > +    err = chmod(addr.sun_path, mode);
> > +out:
> > +    close(fd);
> 
> You need close_preserve_errno() here.
> 
> Rest LGTM, so with that fixed, you can add:
> 
> Reviewed-by: Greg Kurz <groug@kaod.org>

Right, unlike patch 1, we might come from an error path here when closing.

I'll just s/close/close_preserve_errno/ this on my end before queuing, without 
sending a v3, unless somebody finds something else in this series.

Thanks!

Best regards,
Christian Schoenebeck



