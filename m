Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F7E5087F0
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 14:17:14 +0200 (CEST)
Received: from localhost ([::1]:50078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh9Gj-00073T-Ab
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 08:17:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nh98r-0003uU-S1
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 08:09:05 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:40856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nh98q-0006Ei-D9
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 08:09:05 -0400
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-118-n7qscaryOxKb-tE9qcOq5w-1; Wed, 20 Apr 2022 08:08:58 -0400
X-MC-Unique: n7qscaryOxKb-tE9qcOq5w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 063503C025B3;
 Wed, 20 Apr 2022 12:08:58 +0000 (UTC)
Received: from bahia (unknown [10.39.192.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DEF8FDCC485;
 Wed, 20 Apr 2022 12:08:56 +0000 (UTC)
Date: Wed, 20 Apr 2022 14:08:55 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH 2/5] 9pfs: fix qemu_mknodat(S_IFSOCK) on macOS
Message-ID: <20220420140855.18069bd9@bahia>
In-Reply-To: <2487103.vv5bNdeIv8@silver>
References: <cover.1650370026.git.qemu_oss@crudebyte.com>
 <2e88acab7b3f998ceff7232b5e3d6a8a6d2a6f8b.1650370026.git.qemu_oss@crudebyte.com>
 <20220420110946.3dbe6f50@bahia> <2487103.vv5bNdeIv8@silver>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>, Will Cohen <wwcohen@gmail.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 20 Apr 2022 12:28:01 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Mittwoch, 20. April 2022 11:09:46 CEST Greg Kurz wrote:
> > On Tue, 19 Apr 2022 13:41:03 +0200
> > 
> > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > > mknod() on macOS does not support creating sockets, so divert to
> > > call sequence socket(), bind() and chmod() respectively if S_IFSOCK
> > > was passed with mode argument.
> > 
> > Hmm... thinking again about this one : QEMU on linux calls the libc
> > version of mknodat() which doesn't seem to support S_IFSOCK according
> > to the mknod(3P) manual page. So I'm not sure there's something to
> > be actually fixed here... what's the observed behavior on linux ?
> 
> It's unclear to me where you got that from. In all Linux man pages I looked up 
> so far it said S_IFSOCK was supported. But I also tested this now with 
> security_model=none on a Linux host and it works as expected, i.e. it creates 
> a file of type socket on the Linux host filesystem.
> 
> We are really talking about a Linux host, right?
> 

Yes but you can forget this remark. I've checked the glibc sources
and it directly calls the syscall... I guess I got confused by the
mknod(3P) manual page. Sorry for the noise :-)

> Best regards,
> Christian Schoenebeck
> 
> 


