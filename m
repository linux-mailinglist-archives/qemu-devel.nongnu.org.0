Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3400050885F
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 14:43:54 +0200 (CEST)
Received: from localhost ([::1]:54962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh9gX-0005pX-91
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 08:43:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nh9e6-0002GT-DJ; Wed, 20 Apr 2022 08:41:22 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:51225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nh9e3-00045Y-Ud; Wed, 20 Apr 2022 08:41:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=TyQtVqlvXa9JOqZCGBZZPzdWkj2nc24vREI/yurZroA=; b=V44iya0RJTdQHGgta0dxmaeG2I
 ansOo1Q267oJq+MoANsj3Q1Cv+fGNyK7N2d45bcE8qc8qFdmTRXfv9XIAZsiYU6u2TSrKWH9cGFcV
 Mf66oiEd3PsL8XBMlf8SqIJBHosYA5iM7e6NE9v71mH2cclnP4SegGIR+/cUvW6JFcQwosIHxRzq7
 nMPKlWOlWO/lStAFSZAghSQa8yLGx6jWMnuWqMUfgkvuFOhMrFukaBXipsQD4mN7K7Ur+vmB21J+/
 WFYYH2jOfof3H0IwWcpFR+h45jX7bB5/dWQOPdTwfVLAWgSbm9xwbZ8sSN1mM94/vM8PdeYIVNFBP
 K+ODXgrpJkLq6s0QP9A6qQZrJ9VRYFK7GoQefpq460JHQMwS+ImfBnJqEToCIZ1uxIn+tFAAC7MtG
 gmUndhPjU/pQpzDTYpoVLRODRVmXiDUfuI0LegreSDUKpt3hTNSZkysGFa+BjlZ6YjUUAuEkMNbqo
 93R8sGE/AILv30jA6T7XaPpmRP6V15nAVWDNHrPmHFsoVNF1wOQm89xbLkFVfMipCI47M7LDmMqKo
 zIaFkbc+a0U8X//XOFPHkDXq/bugAeqahPvw88gbf26FiPbqSKvF9mSB47f19frdAGHirCO9M3Ftx
 VmBavSKHhpheh4pyuxWZ9mc4bjjvAEJuzg95pFltU=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Greg Kurz <groug@kaod.org>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>, Will Cohen <wwcohen@gmail.com>, 
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH 2/5] 9pfs: fix qemu_mknodat(S_IFSOCK) on macOS
Date: Wed, 20 Apr 2022 14:41:15 +0200
Message-ID: <1770437.2kNnNKHEFl@silver>
In-Reply-To: <20220420141044.7016fee8@bahia>
References: <cover.1650370026.git.qemu_oss@crudebyte.com>
 <2e88acab7b3f998ceff7232b5e3d6a8a6d2a6f8b.1650370026.git.qemu_oss@crudebyte.com>
 <20220420141044.7016fee8@bahia>
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

On Mittwoch, 20. April 2022 14:10:44 CEST Greg Kurz wrote:
> On Tue, 19 Apr 2022 13:41:03 +0200
> 
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > mknod() on macOS does not support creating sockets, so divert to
> > call sequence socket(), bind() and chmod() respectively if S_IFSOCK
> > was passed with mode argument.
> > 
> > Link: https://lore.kernel.org/qemu-devel/17933734.zYzKuhC07K@silver/
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > ---
> > 
> >  hw/9pfs/9p-util-darwin.c | 24 +++++++++++++++++++++++-
> >  1 file changed, 23 insertions(+), 1 deletion(-)
> > 
> > diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c
> > index 53e0625501..252a6fc5dd 100644
> > --- a/hw/9pfs/9p-util-darwin.c
> > +++ b/hw/9pfs/9p-util-darwin.c
> > @@ -74,6 +74,24 @@ int fsetxattrat_nofollow(int dirfd, const char
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
> > +    if (fd < 0) {
> > +        return fd;
> > +    }
> > +    snprintf(addr.sun_path, sizeof(addr.sun_path), "./%s", filename);
> > +    err = bind(fd, (struct sockaddr *) &addr, sizeof(addr));
> > +    if (err < 0) {
> > +        return err;
> > +    }
> > +    return chmod(addr.sun_path, mode);
> 
> As with the other patch, you should close() the socket.

I was concerned that close(fd) might cause the socket file to disappear. But I 
just tested this now on macOS and it works fine. So will be fixed in v2.

Thanks!

Best regards,
Christian Schoenebeck



