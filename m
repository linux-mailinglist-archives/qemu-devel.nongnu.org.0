Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A7539003C
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 13:42:51 +0200 (CEST)
Received: from localhost ([::1]:44218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llVSU-0005CG-N2
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 07:42:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1llVRC-0004VA-7C
 for qemu-devel@nongnu.org; Tue, 25 May 2021 07:41:30 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:42233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1llVR9-00051s-Rr
 for qemu-devel@nongnu.org; Tue, 25 May 2021 07:41:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=giMMg/3j8t9W6rnZHHwXtMgWn/s9QZtPEA15eE7OW/0=; b=BToyv2MkK1jlrEF6UCGKPYU9ZM
 bhRXtfAyXtyMjYLHeRp2yw3S33CVGkkL2ClREK17guoLZojFHvtrizYupmZPpF6WFXaxkzdECE90V
 5xuA1vuyOCcmxqzwWqEvC2u8YlywUSEb8DHVsX5UY8mN0M4mttNVvurtvQqCyeS0eSnOed8H+Ww/1
 ztGQDoKBdWnb6QhNAeMnriseyzDXwAbZTw7VcwN+63+8qoyebhYR1/yOvX468YeYNPnx3zZLvpHM5
 S4uh3cmGRcyL48v2zl7NB+fLN0HPRzhbQd3B1xuwvDWRYasTqi3n5ghuXRKgmOtTdEAAAq27vYHWC
 xBvkzmiSAM8ToUHFQF1QcVe21Pss96Q7HARKb2+57dih2dFfWbiqR9gJzO7gi1baPgF1xPqZufTZe
 ZVHT2jR9Su9WXUZCn9rTegtjOnUFF4OYo6hyPCWL6Pij3npf8doZvup8GN6peKIwgx7GChZ2chnB+
 INv56bKnHfWAe9nLuiy+fqGDJEZRsqtgBL0hDGt4jMzdHswB/FCHxN3VSZslswh2BDslyjMI1wcqN
 Njh17Zy3DHh+zKYm7SdgJoks2GJWXYfYCCf9YS16eMc/fc7o2HFWfTbXXypuZMdn9C7U733CTDEsI
 6wm/k3DYk1LQpDPEPE3QIv0EH5NxQ/scYhBQlzyNw=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: 9pfs: scope of rename_lock?
Date: Tue, 25 May 2021 13:41:22 +0200
Message-ID: <3482348.c50Dd4UUo8@silver>
In-Reply-To: <20210521135947.6ea005e5@bahia.lan>
References: <3386244.1hTsTelUFx@silver> <20210521135947.6ea005e5@bahia.lan>
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

On Freitag, 21. Mai 2021 13:59:47 CEST Greg Kurz wrote:
> On Sun, 16 May 2021 19:06:44 +0200
> 
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > Hi Greg,
> > 
> > while reviewing the 9p code base for further optimizations, I stumbled
> > over
> > the 'rename_lock' introduced by 02cb7f3a2 and wondered about what exactly
> > it shall protect?
> > 
> > As far as I understand it, the original intention at introduction
> > (aforementioned 02cb7f3a2) was to protect
> > 
> > 	1. fidp->path variable
> > 	
> > 	and
> > 	
> > 	2.  *ANY* filesystem path from being renamed during the *entire* 
duration
> > 	
> > 	    of some concurrent 9p operation.
> > 
> > So because of (2.) it was introduced as a global lock. But (2.) is a dead
> > end approach anyway, isn't it?
> 
> I agree that this looks terrible.
> 
> > Therefore my question: rename_lock is currently a global lock. Wouldn't it
> > make more sense to transform it from a global lock from struct V9fsState
> > ->
> > struct V9fsFidState and just let it protect that fidp->path variable
> > locally there?
> 
> Nothing comes to the top of my mind right now... Maybe Aneesh (Cc'd) can
> shed some light on:
> 
> commit 02cb7f3a256517cbf3136caff2863fbafc57b540
> Author: Aneesh Kumar K.V <aneesh.kumar@linux.vnet.ibm.com>
> Date:   Tue May 24 15:10:56 2011 +0530
> 
>     hw/9pfs: Use read-write lock for protecting fid path.
> 
>     On rename we take the write lock and this ensure path
>     doesn't change as we operate on them.
> 
>     Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.vnet.ibm.com>
> 
> 
> Why are we serializing all operations on all fid paths with a single
> global lock ?

I started to work on a patch set on this.

I try to get rid of that rename_lock entirely by letting the worker threads 
only access temporary copies e.g. of the fid path instead of allowing the 
worker threads to access main thread owned structures directly like it is the 
case ATM.

I also noticed that the rename_lock scheme is quite inconsistent right now 
anyway. E.g. some of the fs v9fs_co_*() functions accessing main thread owned 
structures don't take the lock at all. Some for good reasons, some not.

So this week I will give the described approach above a test spin and then we 
will see how this impacts performance in practice before actually posting any 
patch set here.

Best regards,
Christian Schoenebeck



