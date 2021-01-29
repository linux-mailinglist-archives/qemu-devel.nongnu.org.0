Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1072E3088D5
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 13:06:07 +0100 (CET)
Received: from localhost ([::1]:50704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5SXN-0007Ep-Vf
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 07:06:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l5SUg-0005bL-3o
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 07:03:19 -0500
Received: from 4.mo52.mail-out.ovh.net ([178.33.43.201]:37260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l5SUd-000877-HV
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 07:03:17 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.214])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 0C94123AAEC;
 Fri, 29 Jan 2021 13:03:10 +0100 (CET)
Received: from kaod.org (37.59.142.105) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Fri, 29 Jan
 2021 13:03:10 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G00607334bed-9a22-4b89-adf2-3c1e92182632,
 F0B20D4B8DDBF51DA61C26A45925665B938B7F3E) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Fri, 29 Jan 2021 13:03:09 +0100
From: Greg Kurz <groug@kaod.org>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 1/6] virtiofsd: Drop ->vu_dispatch_rwlock while waiting
 for thread to exit
Message-ID: <20210129130309.1e769bdc@bahia.lan>
In-Reply-To: <20210126183336.GB3239@redhat.com>
References: <20210125180115.22936-1-vgoyal@redhat.com>
 <20210125180115.22936-2-vgoyal@redhat.com>
 <20210126165600.7bbe369d@bahia.lan>
 <20210126183336.GB3239@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: abc07160-aef3-41dd-8eaa-29074667c416
X-Ovh-Tracer-Id: 17977806764477356393
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrfedvgdefhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfedutdeijeejveehkeeileetgfelteekteehtedtieefffevhffflefftdefleejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehmshhtsehrvgguhhgrthdrtghomh
Received-SPF: pass client-ip=178.33.43.201; envelope-from=groug@kaod.org;
 helo=4.mo52.mail-out.ovh.net
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_SBL=0.141,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: mst@redhat.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 virtio-fs@redhat.com, stefanha@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Jan 2021 13:33:36 -0500
Vivek Goyal <vgoyal@redhat.com> wrote:

[...]
 
> > 
> > Also, since pthread_rwlock_wrlock() can fail, I think we should
> > always check it's return value, at least with an assert() like
> > already done elsewhere.
> 
> Will check return code of pthread_rwlock_wrlock() and probably use
> assert().
> 

It turns out that pthread_rwlock_rdlock() and pthread_rwlock_unlock() can
also fail for various reasons that would likely indicate a programming
error, but their return values are never checked anywhere.

I have a patch to address this globally in this file. Should I post it
now or you prefer this series goes first ?

> Vivek
> 
> > 
> > >      for (int i = 0; i < se->virtio_dev->nqueues; i++) {
> > >          if (!se->virtio_dev->qi[i]) {
> > >              continue;
> > > @@ -961,6 +974,7 @@ int virtio_loop(struct fuse_session *se)
> > >          fuse_log(FUSE_LOG_INFO, "%s: Stopping queue %d thread\n", __func__, i);
> > >          fv_queue_cleanup_thread(se->virtio_dev, i);
> > >      }
> > > +    pthread_rwlock_unlock(&se->virtio_dev->vu_dispatch_rwlock);
> > >  
> > >      fuse_log(FUSE_LOG_INFO, "%s: Exit\n", __func__);
> > >  
> > 
> 


