Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05669278DC6
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Sep 2020 18:14:31 +0200 (CEST)
Received: from localhost ([::1]:40192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLqMg-0004Ai-1n
	for lists+qemu-devel@lfdr.de; Fri, 25 Sep 2020 12:14:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kLqDv-00024y-Pr
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 12:05:29 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:40703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kLqDr-0003y5-Qq
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 12:05:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=c67lafeT8pvBCjlA1iVegcBQYEjZ3KBj1IoX8n6PGHQ=; b=OGQ6DF3KX407eA+3tmLxeStyc7
 Qf4AixR2K1EmoOBPleA4hw3K9xChj9Vrx8KnlYYaJhfngCTHLJTL/H4obn9NboPqyDaTodsJDUeAj
 LlIgpEGXFz3hA9RPLKS5mm2ypvWfNBcIgzgCQvqDIeE+uA4toxjaYo+DnbrSAzr++SfHe2G5fvzSH
 g/fT7G2AOzZ/lH6D1+vcRzqS/QI/2GNJuQilPZJHtEoA8neepMPZN1qmHWPSuZDDPuf7UzYYYLzWa
 WcjOck5aUUCdu2Du6JL5BIcpG/0XnP6aUsolrhwdza8CZMR17RV110Ylve2znGlZCrxuoLr8l9FYK
 mwyVSL/g==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, "Venegas Munoz,
 Jose Carlos" <jose.carlos.venegas.munoz@intel.com>,
 "cdupontd@redhat.com" <cdupontd@redhat.com>,
 virtio-fs-list <virtio-fs@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Shinde, Archana M" <archana.m.shinde@intel.com>,
 Vivek Goyal <vgoyal@redhat.com>
Subject: Re: virtiofs vs 9p performance(Re: tools/virtiofs: Multi threading
 seems to hurt performance)
Date: Fri, 25 Sep 2020 18:05:17 +0200
Message-ID: <7085634.CctCyd8GvG@silver>
In-Reply-To: <20200925130538.GK2873@work-vm>
References: <20200918213436.GA3520@redhat.com> <4973513.bp6ERB8pJA@silver>
 <20200925130538.GK2873@work-vm>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=91.194.90.13; envelope-from=qemu_oss@crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/25 11:47:23
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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

On Freitag, 25. September 2020 15:05:38 CEST Dr. David Alan Gilbert wrote:
> > > 9p ( mount -t 9p -o trans=virtio kernel /mnt
> > > -oversion=9p2000.L,cache=mmap,msize=1048576 ) test: (g=0): rw=randrw,
> > 
> > Bottleneck ------------------------------^
> > 
> > By increasing 'msize' you would encounter better 9P I/O results.
> 
> OK, I thought that was bigger than the default;  what number should I
> use?

It depends on the underlying storage hardware. In other words: you have to try 
increasing the 'msize' value to a point where you no longer notice a negative 
performance impact (or almost). Which is fortunately quite easy to test on 
guest like:

	dd if=/dev/zero of=test.dat bs=1G count=12
	time cat test.dat > /dev/null

I would start with an absolute minimum msize of 10MB. I would recommend 
something around 100MB maybe for a mechanical hard drive. With a PCIe flash 
you probably would rather pick several hundred MB or even more.

That unpleasant 'msize' issue is a limitation of the 9p protocol: client 
(guest) must suggest the value of msize on connection to server (host). Server 
can only lower, but not raise it. And the client in turn obviously cannot see 
host's storage device(s), so client is unable to pick a good value by itself. 
So it's a suboptimal handshake issue right now.

Many users don't even know this 'msize' parameter exists and hence run with 
the Linux kernel's default value of just 8kB. For QEMU 5.2 I addressed this by 
logging a performance warning on host side for making users at least aware 
about this issue. The long-term plan is to pass a good msize value from host 
to guest via virtio (like it's already done for the available export tags) and 
the Linux kernel would default to that instead.

Best regards,
Christian Schoenebeck



