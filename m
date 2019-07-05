Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B88606AC
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Jul 2019 15:38:24 +0200 (CEST)
Received: from localhost ([::1]:53262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hjOPt-0004ER-AG
	for lists+qemu-devel@lfdr.de; Fri, 05 Jul 2019 09:38:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39474)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <klaus@birkelund.eu>) id 1hjOOA-0003PS-Q5
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 09:36:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <klaus@birkelund.eu>) id 1hjOO6-0004Sb-Ns
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 09:36:34 -0400
Received: from charlie.dont.surf ([128.199.63.193]:51516)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <klaus@birkelund.eu>)
 id 1hjOO3-0003pr-JL; Fri, 05 Jul 2019 09:36:27 -0400
Received: from bogfinke (ip-5-186-120-196.cgn.fibianet.dk [5.186.120.196])
 by charlie.dont.surf (Postfix) with ESMTPSA id 59B1BBF607;
 Fri,  5 Jul 2019 13:36:21 +0000 (UTC)
Date: Fri, 5 Jul 2019 15:36:17 +0200
From: Klaus Birkelund <klaus@birkelund.eu>
To: qemu-block@nongnu.org
Message-ID: <20190705133616.GA4707@bogfinke>
Mail-Followup-To: qemu-block@nongnu.org, kwolf@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, keith.busch@intel.com,
 mreitz@redhat.com, lersek@redhat.com
References: <20190705072333.17171-1-klaus@birkelund.eu>
 <20190705072333.17171-17-klaus@birkelund.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190705072333.17171-17-klaus@birkelund.eu>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 128.199.63.193
Subject: Re: [Qemu-devel] [Qemu-block] [PATCH 16/16] nvme: support multiple
 namespaces
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
Cc: kwolf@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, keith.busch@intel.com, lersek@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 05, 2019 at 09:23:33AM +0200, Klaus Birkelund Jensen wrote:
> This adds support for multiple namespaces by introducing a new 'nvme-ns'
> device model. The nvme device creates a bus named from the device name
> ('id'). The nvme-ns devices then connect to this and registers
> themselves with the nvme device.
> 
> This changes how an nvme device is created. Example with two namespaces:
> 
>   -drive file=nvme0n1.img,if=none,id=disk1
>   -drive file=nvme0n2.img,if=none,id=disk2
>   -device nvme,serial=deadbeef,id=nvme0
>   -device nvme-ns,drive=disk1,bus=nvme0,nsid=1
>   -device nvme-ns,drive=disk2,bus=nvme0,nsid=2
> 
> A maximum of 256 namespaces can be configured.
> 
 
Well that was embarrasing.

This patch breaks nvme-test.c. Which I obviously did not run.

In my defense, the test doesn't do much currently, but I'll of course
fix the test for v2.

