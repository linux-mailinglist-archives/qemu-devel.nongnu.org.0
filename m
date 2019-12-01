Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2429110E37F
	for <lists+qemu-devel@lfdr.de>; Sun,  1 Dec 2019 21:57:22 +0100 (CET)
Received: from localhost ([::1]:55454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ibWHQ-0005QB-N9
	for lists+qemu-devel@lfdr.de; Sun, 01 Dec 2019 15:57:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48616)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <davem@davemloft.net>) id 1ibWGe-0004yC-Tk
 for qemu-devel@nongnu.org; Sun, 01 Dec 2019 15:56:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <davem@davemloft.net>) id 1ibWGe-0005kM-1a
 for qemu-devel@nongnu.org; Sun, 01 Dec 2019 15:56:32 -0500
Received: from shards.monkeyblade.net ([2620:137:e000::1:9]:50328)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <davem@davemloft.net>) id 1ibWGd-0005f1-Sq
 for qemu-devel@nongnu.org; Sun, 01 Dec 2019 15:56:32 -0500
Received: from localhost (unknown [IPv6:2601:601:9f00:1c3::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 59A8114F64DD2;
 Sun,  1 Dec 2019 12:56:24 -0800 (PST)
Date: Sun, 01 Dec 2019 12:56:21 -0800 (PST)
Message-Id: <20191201.125621.1568040486743628333.davem@davemloft.net>
To: dsahern@gmail.com
Subject: Re: [RFC net-next 08/18] tun: run offloaded XDP program in Tx path
From: David Miller <davem@davemloft.net>
In-Reply-To: <f39536e4-1492-04e6-1293-302cc75e81bf@gmail.com>
References: <20191126100744.5083-1-prashantbhole.linux@gmail.com>
 <20191126100744.5083-9-prashantbhole.linux@gmail.com>
 <f39536e4-1492-04e6-1293-302cc75e81bf@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Sun, 01 Dec 2019 12:56:25 -0800 (PST)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2620:137:e000::1:9
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
Cc: songliubraving@fb.com, jakub.kicinski@netronome.com, hawk@kernel.org,
 daniel@iogearbox.net, mst@redhat.com, netdev@vger.kernel.org,
 jasowang@redhat.com, john.fastabend@gmail.com, ast@kernel.org,
 qemu-devel@nongnu.org, prashantbhole.linux@gmail.com, kvm@vger.kernel.org,
 yhs@fb.com, andriin@fb.com, kafai@fb.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Ahern <dsahern@gmail.com>
Date: Sun, 1 Dec 2019 09:39:54 -0700

> Below you just drop the packet which is going to be a bad user
> experience. A better user experience is to detect XDP return codes a
> program uses, catch those that are not supported for this use case and
> fail the install of the program.

This is not universally possible.

Return codes can be calculated dynamically, come from maps potentially
shared with other bpf programs, etc.

So unfortunately this suggestion is not tenable.

