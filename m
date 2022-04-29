Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C105514F51
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 17:27:01 +0200 (CEST)
Received: from localhost ([::1]:46796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkSWK-0003WF-F3
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 11:27:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nkSQ8-0006N0-Vq; Fri, 29 Apr 2022 11:20:37 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:37009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nkSQ6-0005rP-TB; Fri, 29 Apr 2022 11:20:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=vtbcRWHywXW71hArFJI6Z6zizXLCbVZxHuGLIUmsLYc=; b=Sw3PgNIlRW8poYJQS1GiCOtjQW
 r7A7cHVx2b4+sCiF9/EW+gZRhwbkfxVbU2bzYJjMxqL4l4n8eqLpcO1lO77ELAR63vuQlKBVfzwPV
 9SmXZWh0IxkNECSfdYvNvjSrYkuQZvAtTXsc+PhIp6sys86CFiHs2O4tTyup1RXpmvy86hJPMnvg0
 VKqI3rchN+50hPPZZ5Q+53L1iD0sYy0g7haxorI/Jo/+U7sxyNeeL78JT32pFiZ28snyeIwrPGx9Y
 GbjEqJWzk7oh+6t5yijBQJYYJ4bBXB32q+N+y8HVfjW/dgo6p/VyFTNReWlI5g2/+z8UpaZ6vyMHw
 jV29BGAV6cwq4wmyzOqgb3d6s8adaJnZI/25H3lPK3OsKDHUsKs0BuJFhiVfb2IPugxWPNlNOwJ8s
 Bw5JnxHOcXI9obBagR6uGPwa60JFyLAxZwluFk2bVmgm9IQ1Hda+t0TQnVpAJ/SEzHJoOr0KWxBYt
 OIgKxpMDBTjjkEc37DMYrnYzhlTnmhTvuzUQQLYGL72xTGyV95c6bUnssHCCXxRbSQDNGgsT1y8L9
 2oE/FqcFVe6xO2aYF4J+4voA6Wg/xXrk+C9IqspbIhdZcwyFzxeUfrDhEHVYVmdf3FgYVkGxAbhXk
 RuSRjePQOefwazjiJ2a3WC980LDEf+m6iJ0xeS/IU=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Greg Kurz <groug@kaod.org>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>, Will Cohen <wwcohen@gmail.com>, 
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH v5 2/6] 9pfs: fix qemu_mknodat(S_IFSOCK) on macOS
Date: Fri, 29 Apr 2022 17:20:26 +0200
Message-ID: <1652707.ZjVTVKMb3i@silver>
In-Reply-To: <20220429163507.2e822089@bahia>
References: <cover.1651228000.git.qemu_oss@crudebyte.com>
 <5815688.WPY9AJzlUa@silver> <20220429163507.2e822089@bahia>
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

On Freitag, 29. April 2022 16:35:07 CEST Greg Kurz wrote:
> On Fri, 29 Apr 2022 15:50:35 +0200
> 
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > On Freitag, 29. April 2022 14:56:50 CEST Greg Kurz wrote:
> > > On Fri, 29 Apr 2022 12:25:11 +0200
> > > 
> > > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > > > mknod() on macOS does not support creating sockets, so divert to
> > > > call sequence socket(), bind() and fchmodat() respectively if S_IFSOCK
> > > > was passed with mode argument.
> > > > 
> > > > Link: https://lore.kernel.org/qemu-devel/17933734.zYzKuhC07K@silver/
> > > > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > > ---
> > > > 
> > > >  hw/9pfs/9p-util-darwin.c | 42
> > > >  +++++++++++++++++++++++++++++++++++++++-
> > > >  1 file changed, 41 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c
> > > > index e24d09763a..619c403ba7 100644
> > > > --- a/hw/9pfs/9p-util-darwin.c
> > > > +++ b/hw/9pfs/9p-util-darwin.c
> > > > @@ -74,6 +74,42 @@ int fsetxattrat_nofollow(int dirfd, const char
> > > > *filename, const char *name,>
> > > > 
> > > >   */
> > > >  
> > > >  #if defined CONFIG_PTHREAD_FCHDIR_NP
> > > > 
> > > > +static int create_socket_file_at_cwd(const char *filename, mode_t
> > > > mode) {
> > > > +    int fd, err;
> > > > +    struct sockaddr_un addr = {
> > > > +        .sun_family = AF_UNIX
> > > > +    };
> > > > +
> > > > +    err = snprintf(addr.sun_path, sizeof(addr.sun_path), "./%s",
> > > > filename); +    if (err < 0 || err >= sizeof(addr.sun_path)) {
> > > 
> > > According to POSIX [1]:
> > > 
> > > The snprintf() function shall fail if:
> > > 
> > > [EOVERFLOW]
> > > [CX] [Option Start] The value of n is greater than {INT_MAX}. [Option
> > > End]
> > > 
> > > [1]
> > > https://pubs.opengroup.org/onlinepubs/9699919799/functions/snprintf.htm
> > > l
> > > 
> > > Since we're passing sizeof(addr.sun_path), I'm pretty sure snprintf()
> > > cannot fail. No big deal.
> > 
> > The question is whom you would want to trust on this? POSIX? ISO-C? Clang?
> > BSD? Apple? And for how long into future? I mean in general yes, I would
> > not
> To improve overall portability across all possible hosts, I'd stick to
> POSIX semantics but here this is macOS only code so you can assume
> this is Apple's snprintf().
> 
> > expect it to fail with -1 here either, but there are various different API
> > docs on snprintf() out there, and most of them don't even bother to
> > enumarate which encoding errors may happen. And I'm pretty sure if I'd
> > drop the negative err check here, then Akihiko would slap me for
> > unforeseeable additional error cases on snprintf() that may be added in
> > future.
> 
> /o\ ;-)
> 
> > Apple's documentation on snprintf() BTW just says:
> >   "These functions return a negative value if an error occurs."
> 
> How valuable this is !!! ;-)
> 
> > So Apple does not even restrict the return value to -1 on errrors, you
> > would also need to expect other negative values.
> > 
> > So on doubt, I leave this negative result check for now. ;-)
> 
> Fair enough.

Hey, don't shoot the servant! I'm just trying to find compromises that aim to 
suit as many people as possible, as always. :)

Best regards,
Christian Schoenebeck



