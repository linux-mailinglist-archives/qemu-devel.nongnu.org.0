Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3912FF17E
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 18:12:30 +0100 (CET)
Received: from localhost ([::1]:37432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2dVV-0006kG-ES
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 12:12:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l2dP7-00089L-VB
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 12:05:53 -0500
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:38699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l2dP3-0000yG-NS
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 12:05:53 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.90])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id B7EFF845BE6D;
 Thu, 21 Jan 2021 18:05:47 +0100 (CET)
Received: from kaod.org (37.59.142.106) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Thu, 21 Jan
 2021 18:05:20 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R00664626fc4-3408-424c-9bec-70a2f874b449,
 A41C5EF03AA0D3A03B7528971392D1AB75695B26) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Thu, 21 Jan 2021 18:05:16 +0100
From: Greg Kurz <groug@kaod.org>
To: <qemu-devel@nongnu.org>
Subject: Re: [PATCH 0/3] 9pfs: Improve unreclaim logic
Message-ID: <20210121180516.038884c1@bahia.lan>
In-Reply-To: <20210118142300.801516-1-groug@kaod.org>
References: <20210118142300.801516-1-groug@kaod.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: a665cd41-eeb5-4fe9-8f31-9d0f86aa725c
X-Ovh-Tracer-Id: 12993729350516316570
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudeggddutddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepvedvveeugeeiveefgeefleehfeevleetvefhgfffteeuudeftdeiueeuieevkeeknecuffhomhgrihhnpehgihhtlhgrsgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhupghoshhssegtrhhuuggvsgihthgvrdgtohhm
Received-SPF: pass client-ip=79.137.123.220; envelope-from=groug@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 18 Jan 2021 15:22:57 +0100
Greg Kurz <groug@kaod.org> wrote:

> clone of "master"
> 

Drat... this text seems to have leaked from stgit and replaced
the one I had written in git publish:

---

We currently restart the unreclaim loop all over when we detect
that the current iteration yielded execution. This is because
a new fid might have been added to the head of the list.

This is sub-optimal : add new fids to the end of the list instead
to avoid that.

---

I'll have to sort this out...

> Greg Kurz (3):
>   9pfs: Convert V9fsFidState::clunked to bool
>   9pfs: Convert V9fsFidState::fid_list to QSIMPLEQ
>   9pfs: Improve unreclaim loop
> 
>  hw/9pfs/9p.c | 83 +++++++++++++++++++++++++++++-----------------------
>  hw/9pfs/9p.h |  6 ++--
>  2 files changed, 50 insertions(+), 39 deletions(-)
> 

I've applied patches 1 and 2 to:

https://gitlab.com/gkurz/qemu/-/tree/9p-next

