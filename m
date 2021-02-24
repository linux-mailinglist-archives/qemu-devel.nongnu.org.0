Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA478323F70
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 16:19:07 +0100 (CET)
Received: from localhost ([::1]:58046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEvwQ-0004xk-NW
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 10:19:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lEvuT-0003c1-CN
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 10:17:05 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:38101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lEvuQ-000870-2V
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 10:17:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=/y6xFzyCzw1KT1sJVP9w0ePufQ9CHZv14Yo6pv/8g4s=; b=lPaezqxKKhgEdyb2GpcJ7yFIjl
 ztGSuf6Rn/WteaZ3Oj3ZwnFFAChUJWeyUEu6HxWonSS3LF0NsMJOWdTDPlC555Az9Mj7akIHAKR6x
 6dOkznyj5KZLIwMGqrx9YaHAzP/xg/fCTm1WK2+DLoAY5owuBTzAKRXcNm+HMv9FAAxED/gW4bJL+
 zVkhnY/jF9pRj7LExnfAPhb0dMRYRijDKBZhKABA/SiHGQEu2R2748brJ8RlSLv+wFBuqNEjSS1o8
 czR7nVCx0qOipRdXf0VpW4fhCu4zU073NViCLWrk1bHGpq1zJVLaVARrhb4cWr+KqaLM/MXBWuPtc
 2EvAOaM22f4fFSC6Uy60LZZXtzQ/AcqE3KfRaFk80lOaWd6fayTHA0urUjf1zo9ChDW7X5ZYsa5mZ
 kmJ5BGieBhfq/rdVpcarA5Yj1vj5FoiDIvzCwtl13AOqjhUYcXnJlJ6qzHI4CGKndxPxtJL4uDxZ2
 mhH4AObrOSAt9W871eHOq3ysC41NERxeecRhLYjAteTbwWWIVWpFWDMSCcqRuj9LAzCPXYdrA0MI2
 8/yzb5pZmkMs6Mq0leUhZoAuNG8RbwQEkLiK9KIFiKkW94g7P8fc9a2hwTnI5LQY3Q9IOx9QulDCE
 eA6+C1b+0UcNYLQb8bPHu9yPveIsDMbEQA5tU4tAQ=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>, "Shinde,
 Archana M" <archana.m.shinde@intel.com>, "Venegas Munoz,
 Jose Carlos" <jose.carlos.venegas.munoz@intel.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 virtio-fs-list <virtio-fs@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "cdupontd@redhat.com" <cdupontd@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
 Dominique Martinet <asmadeus@codewreck.org>,
 v9fs-developer@lists.sourceforge.net
Subject: Re: Can not set high msize with virtio-9p (Was: Re: virtiofs vs 9p
 performance)
Date: Wed, 24 Feb 2021 16:16:52 +0100
Message-ID: <2006960.IAZaadA1hq@silver>
In-Reply-To: <20210223090531-mutt-send-email-mst@kernel.org>
References: <20200918213436.GA3520@redhat.com> <6115734.fQeFoySBn5@silver>
 <20210223090531-mutt-send-email-mst@kernel.org>
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

On Dienstag, 23. Februar 2021 15:07:31 CET Michael S. Tsirkin wrote:
> > Michael, Dominique,
> > 
> > we are wondering here about the message size limitation of just 5 kiB in
> > the 9p Linux client (using virtio transport) which imposes a performance
> > bottleneck, introduced by this kernel commit:
> > 
> > commit b49d8b5d7007a673796f3f99688b46931293873e
> > Author: Aneesh Kumar K.V <aneesh.kumar@linux.vnet.ibm.com>
> > Date:   Wed Aug 17 16:56:04 2011 +0000
> > 
> >     net/9p: Fix kernel crash with msize 512K
> >     
> >     With msize equal to 512K (PAGE_SIZE * VIRTQUEUE_NUM), we hit multiple
> >     crashes. This patch fix those.
> >     
> >     Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.vnet.ibm.com>
> >     Signed-off-by: Eric Van Hensbergen <ericvh@gmail.com>
> 
> Well the change I see is:
> 
> -       .maxsize = PAGE_SIZE*VIRTQUEUE_NUM,
> +       .maxsize = PAGE_SIZE * (VIRTQUEUE_NUM - 3),
> 
> 
> so how come you say it changes 512K to 5K?
> Looks more like 500K to me.

Misapprehension + typo(s) in my previous message, sorry Michael. That's 500k 
of course (not 5k), yes.

Let me rephrase that question: are you aware of something in virtio that would 
per se mandate an absolute hard coded message size limit (e.g. from virtio 
specs perspective or maybe some compatibility issue)?

If not, we would try getting rid of that hard coded limit of the 9p client on 
kernel side in the first place, because the kernel's 9p client already has a 
dynamic runtime option 'msize' and that hard coded enforced limit (500k) is a 
performance bottleneck like I said.

Best regards,
Christian Schoenebeck



