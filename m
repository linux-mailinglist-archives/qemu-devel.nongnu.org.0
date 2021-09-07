Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 424814029AB
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 15:23:57 +0200 (CEST)
Received: from localhost ([::1]:40646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNb4u-0001Ea-6z
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 09:23:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mNaaH-0000lk-UR
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:52:17 -0400
Received: from relay64.bu.edu ([128.197.228.104]:43741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mNaaF-0001WW-6Z
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:52:17 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 187Cp8AZ001193
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 7 Sep 2021 08:51:11 -0400
Date: Tue, 7 Sep 2021 08:51:08 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] fuzz: fix unbound variable in build.sh
Message-ID: <20210907125108.44h7vpprunbb7yy4@mozz.bu.edu>
References: <20210907110841.3341786-1-alxndr@bu.edu>
 <8995d50d-dbd5-c37c-6bd0-477e2f58d1aa@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8995d50d-dbd5-c37c-6bd0-477e2f58d1aa@redhat.com>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-Spam_score_int: 13
X-Spam_score: 1.3
X-Spam_bar: +
X-Spam_report: (1.3 / 5.0 requ) HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Qiuhao Li <Qiuhao.Li@outlook.com>, qemu-devel@nongnu.org,
 Darren Kenny <darren.kenny@oracle.com>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210907 1432, Thomas Huth wrote:
> On 07/09/2021 13.08, Alexander Bulekov wrote:
> > /src/build.sh: line 76: GITLAB_CI: unbound variable
> > Fix that.
> > 
> > Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> > ---
> > 
> > This change is in preparation to revert:
> > 7602748c ("qemu: manually build glib (#5919)") on OSS-Fuzz.
> > Reverting as-is produces an unbound variable complaint when we try to
> > build the fuzzers in the OSS-Fuzz container.
> > 
> >   scripts/oss-fuzz/build.sh | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/scripts/oss-fuzz/build.sh b/scripts/oss-fuzz/build.sh
> > index 98b56e0521..5ddc769c9c 100755
> > --- a/scripts/oss-fuzz/build.sh
> > +++ b/scripts/oss-fuzz/build.sh
> > @@ -73,7 +73,7 @@ if ! make "-j$(nproc)" qemu-fuzz-i386; then
> >             "\nFor example: CC=clang CXX=clang++ $0"
> >   fi
> > -if [ "$GITLAB_CI" != "true" ]; then
> > +if [ -z ${GITLAB_CI+x} ]; then
> 
> My bash-foo is really not the best, but shouldn't there be a colon in there,
> i.e. ${GITLAB_CI:+x} ?

I think the difference is that GITLAB_CI+x only checks if GITLAB_CI is
set, while GITLAB_CI:+x checks that it is set and non-null.
https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_06_02

I don't think that makes much of a difference here.

-Alex
> 
>  Thomas
> 
> 
> >       for i in $(ldd ./qemu-fuzz-i386 | cut -f3 -d' '); do
> >           cp "$i" "$DEST_DIR/lib/"
> >       done
> > 
> 

