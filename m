Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EDE4B5557
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 16:52:05 +0100 (CET)
Received: from localhost ([::1]:59672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJde1-0005ip-0V
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 10:52:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vt@altlinux.org>) id 1nJca6-00087j-73
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 09:43:58 -0500
Received: from vmicros1.altlinux.org ([194.107.17.57]:38388)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vt@altlinux.org>) id 1nJca3-0002VJ-PT
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 09:43:57 -0500
Received: from imap.altlinux.org (imap.altlinux.org [194.107.17.38])
 by vmicros1.altlinux.org (Postfix) with ESMTP id CBC4B72C905;
 Mon, 14 Feb 2022 17:43:51 +0300 (MSK)
Received: from altlinux.org (sole.flsd.net [185.75.180.6])
 by imap.altlinux.org (Postfix) with ESMTPSA id AF4BF4A46EA;
 Mon, 14 Feb 2022 17:43:51 +0300 (MSK)
Date: Mon, 14 Feb 2022 17:43:51 +0300
From: Vitaly Chikunov <vt@altlinux.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PULL 0/5] 9p queue 2022-02-10
Message-ID: <20220214144351.dp57o6jyfvliwkos@altlinux.org>
References: <cover.1644492115.git.qemu_oss@crudebyte.com>
 <2037112.271zI61438@silver> <20220214113653.087a06e2@bahia>
 <2442070.WHyy189egQ@silver>
MIME-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Disposition: inline
In-Reply-To: <2442070.WHyy189egQ@silver>
Received-SPF: pass client-ip=194.107.17.57; envelope-from=vt@altlinux.org;
 helo=vmicros1.altlinux.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Dmitry V . Levin" <ldv@altlinux.org>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Christian,

On Mon, Feb 14, 2022 at 12:44:48PM +0100, Christian Schoenebeck wrote:
> On Montag, 14. Februar 2022 11:36:53 CET Greg Kurz wrote:
> > The synth backend should be fixed to honor d_reclen, or
> > at least to allocate with g_new0().
> 
> Yes, I overlooked that this is not initialized with zero already.
> 
> With g_new0() d_reclen would be zero and qemu_dirent_dup() would then fallback 
> to the portable branch (as I assumed it already would):

Perhaps, this additional change should be added (I only found two instances of
V9fsSynthOpenState allocation):

diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
--- a/hw/9pfs/9p-synth.c
+++ b/hw/9pfs/9p-synth.c
@@ -182,7 +182,7 @@ static int synth_opendir(FsContext *ctx,
     V9fsSynthOpenState *synth_open;
     V9fsSynthNode *node = *(V9fsSynthNode **)fs_path->data;
 
-    synth_open = g_malloc(sizeof(*synth_open));
+    synth_open = g_malloc0(sizeof(*synth_open));
     synth_open->node = node;
     node->open_count++;
     fs->private = synth_open;
@@ -266,7 +266,7 @@ static int synth_open(FsContext *ctx, V9fsPath *fs_path,
     V9fsSynthOpenState *synth_open;
     V9fsSynthNode *node = *(V9fsSynthNode **)fs_path->data;
 
-    synth_open = g_malloc(sizeof(*synth_open));
+    synth_open = g_malloc0(sizeof(*synth_open));
     synth_open->node = node;
     node->open_count++;
     fs->private = synth_open;

> Additionally I would add NAME_MAX to the V9fsSynthOpenState allocation size, 
> because it is known that some systems define dirent as flex-array (zero d_name 
> size).

(To be precise) not just zero, but 1 byte. Also, to remind, for some
filesystems, such as CIFS, actual d_name size could be longer than NAME_MAX.
Because of that struct dirent cannot be allocated statically or with simple
sizeof.

> 
> I know Greg would not favour this solution (using g_new0), but it's the most 
> minimalistic and most portable solution. So I would favour it for now.

Why g_new0 and not just g_malloc0? This is smallest code change, which seems
appropriate for a bug fix.

Thanks,

> 
> A cleaner solution on the long-term would be turning V9fsSynthOpenState's 
> 'dent' member into a pointer and adding a new function to osdep like:
> 
> struct dirent *
> qemu_dirent_new(const char* name) {
>     ...
> }
> 
> But I would like to postpone that qemu_dirent_new() solution, e.g. because I 
> guess some people would probably not like qemu_dirent_new() to have in osdep, 
> as it is probably not a general purpose function, and I am not keen putting 
> qemu_dirent_new() into a different location than qemu_dirent_dup(), because it 
> would raise the danger that system dependent code might deviate in future.
> 
> Best regards,
> Christian Schoenebeck
> 

