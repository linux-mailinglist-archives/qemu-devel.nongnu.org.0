Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4293511C5A
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 18:19:56 +0200 (CEST)
Received: from localhost ([::1]:36022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njkOR-00070u-S3
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 12:19:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1njkNB-00063v-Cf; Wed, 27 Apr 2022 12:18:37 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:34247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1njkN9-0007p5-EK; Wed, 27 Apr 2022 12:18:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=qmjuHRe7iMeasEb9ggMSDjFPB53cap4ZgcAhfQCLKdE=; b=uGC/0+yWLnrj+BtCWsZ2vnKRTd
 c3HyRhh2zdf+aMaC0wxFCup2s1fY0eS9UVexPkLFFVkk+sm8D2FqB9YHggDpuCk6wbhYpdzoTCFHm
 9dkNFkelM0RanhmXyfh5P+kcvFWY9xCq3hVnv8/ZN1OuRCPpm2Gp4zreMSf4y+csw9VAuCg7RatnA
 dhTTvX2gzA5Lfmgr+wEsBhbfC/e08DtmJN8ISlbPPDLQrDqCI0e9zBWhzRbtKVzEECzxb+qPS4/Qu
 q64O+hj4kaLA2CGCviYgx4fYBzHHXZdvDtM8rW+8zD+yDe2g7PPsHqzArnCTZYFmSlRgxtbg/6zci
 cnaEhEXxvGXdr45lKBINiRy80euH1pDQKCqW3UplZG6bRU0Kmb3zdtWJIXMAOj2i0ie4c8bxA9Mv3
 Fy7R4ytBLtFGW+3w9LXc676Q5LHqkVfLXbm4LPRsuHhGvJ0nZTkLpdC40P5viGQjNRhZ8tZAIzpGE
 pXZBmRwCrZSFh1lM2ROLXLPOAzjz3tiMiLEhgwZOIpyOCcDel2xYCpC4dMUYG9p4fuVu/fwyGBVDf
 brOwIqFDgFsWOdCsLfAeWV5nZx0J+CNT0kFTfeZfLj0AIx8rushhRmq98zGZsqmrVvv+tFrjUY+5+
 Py6/VJpPc3tXsKZckJ7OrOvCn5DZODTS0HRUbRDgo=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Greg Kurz <groug@kaod.org>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>, Will Cohen <wwcohen@gmail.com>, 
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH v2 2/5] 9pfs: fix qemu_mknodat(S_IFSOCK) on macOS
Date: Wed, 27 Apr 2022 18:18:31 +0200
Message-ID: <2323649.gZi5zFeIBc@silver>
In-Reply-To: <20220427153142.071063f1@bahia>
References: <cover.1650553693.git.qemu_oss@crudebyte.com>
 <9545176.94nLgIBNA9@silver> <20220427153142.071063f1@bahia>
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

On Mittwoch, 27. April 2022 15:31:42 CEST Greg Kurz wrote:
> On Wed, 27 Apr 2022 14:32:53 +0200
> 
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > On Mittwoch, 27. April 2022 12:18:10 CEST Greg Kurz wrote:
> > > On Wed, 27 Apr 2022 11:27:28 +0900
> > > 
> > > Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
> > > > On 2022/04/26 21:38, Greg Kurz wrote:
[...]
> > > > Considering the transient states are tolerated in 9pfs, we need to
> > > > design this function to be tolerant with transient states as well. The
> > > > use of chmod() is not safe when we consider about transient states. A
> > > > malicious actor may replace the file at the path with a symlink which
> > > > may escape the shared directory and chmod() will naively follow it.
> > > 
> > > You get a point here. Thanks for your tenacity ! :-)
> > 
> > Yep, I send a v4 with fchmodat_nofollow() instead of chmod(), thanks!
> > 
> > BTW, why is it actually allowed for client to create a symlink pointing
> > outside exported directory tree with security_model=passthrough/none? Did
> > anybody want that?
> 
> The target argument to symlink() is merely a string that is stored in
> the inode. It is only evaluated as a path at the time an action is
> made on the link. Checking at symlink() time is thus useless.
> 
> Anyway, we're safe on this side since it's the client's job to
> resolve links and we explicitly don't follow them in the server.

I wouldn't call it useless, because it is easier to keep exactly 1 hole
stuffed instead of being forced to continuously stuff N holes as new ones may
popup up over time, as this case shows (mea culpa).

So you are trading (probably minor) performance for security.

But my question was actually meant seriously: whether there was anybody in the
past who probably actually wanted to create relative symlinks outside the
exported tree. For instance for another service with wider host filesystem
access.

[...]
> > > This brings up a new problem I hadn't realized before : the
> > > fchmodat_nofollow() implementation in 9p-local.c is really
> > > a linux only thing to cope with AT_SYMLINK_NOFOLLOW not being
> > > supported with fchmodat(). It looks that this should move to
> > > 9p-util-linux.c and a proper version should be added for macOS
> > > in 9p-util-darwin.c
> > 
> > Like already agreed on the other thread, yes, that makes sense. But I
> > think
> > this can be handled with a follow-up, separate from this series.
> 
> Fair enough if you want to handle fchmodat_nofollow() later but you
> must at least use fchmodat(AT_SYMLINK_NOFOLLOW) in this patch
> instead of chmod().

Sounds like a quick and easy workaround. However looking at 'man fchmodat' on
macOS, this probably does not exactly do what you wanted it to, at least not
in this particular case:

     AT_SYMLINK_NOFOLLOW
             If path names a symbolic link, then the mode of the symbolic link is changed.

     AT_SYMLINK_NOFOLLOW_ANY
             If path names a symbolic link, then the mode of the symbolic link is changed and
             if if the path has any other symbolic links, an error is returned.

So if somebody replaced the socket file by a 1st order symlink, you would
adjust the symlink's permissions with both AT_SYMLINK_NOFOLLOW as well as with 
AT_SYMLINK_NOFOLLOW_ANY. I mean it's better than chmod(), but acceptable?

Using our existing fchmodat_nofollow() instead is no viable alternative
either, as it uses operations that are not supported on socket files on macOS
(tested).

Best regards,
Christian Schoenebeck



