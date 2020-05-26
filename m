Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F037A1B0761
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Apr 2020 13:25:04 +0200 (CEST)
Received: from localhost ([::1]:33606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jQUXw-00022A-2z
	for lists+qemu-devel@lfdr.de; Mon, 20 Apr 2020 07:25:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36880 helo=eggs1p.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fw@deneb.enyo.de>) id 1jQUXD-0001dN-A9
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 07:24:19 -0400
Received: from Debian-exim by eggs1p.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <fw@deneb.enyo.de>) id 1jQUWx-0007it-Er
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 07:24:18 -0400
Received: from albireo.enyo.de ([37.24.231.21]:39842)
 by eggs1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fw@deneb.enyo.de>) id 1jQUWw-0007eo-VY
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 07:24:03 -0400
Received: from [172.17.203.2] (helo=deneb.enyo.de)
 by albireo.enyo.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 id 1jQUWn-00057d-MO; Mon, 20 Apr 2020 11:23:53 +0000
Received: from fw by deneb.enyo.de with local (Exim 4.92)
 (envelope-from <fw@deneb.enyo.de>)
 id 1jQUWn-0002tR-Jr; Mon, 20 Apr 2020 13:23:53 +0200
From: Florian Weimer <fw@deneb.enyo.de>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] fcntl: Add 32bit filesystem mode
References: <20200331133536.3328-1-linus.walleij@linaro.org>
 <CAFEAcA9Gep1HN+7WJHencp9g2uUBLhagxdgjHf-16AOdP5oOjg@mail.gmail.com>
Date: Mon, 20 Apr 2020 13:23:53 +0200
In-Reply-To: <CAFEAcA9Gep1HN+7WJHencp9g2uUBLhagxdgjHf-16AOdP5oOjg@mail.gmail.com>
 (Peter Maydell's message of "Mon, 20 Apr 2020 12:19:17 +0100")
Message-ID: <87v9luwgc6.fsf@mid.deneb.enyo.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=37.24.231.21; envelope-from=fw@deneb.enyo.de;
 helo=albireo.enyo.de
X-detected-operating-system: by eggs1p.gnu.org: First seen = 2020/04/20
 07:23:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 37.24.231.21
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
Cc: Theodore Ts'o <tytso@mit.edu>, Linux API <linux-api@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Andy Lutomirski <luto@kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Maydell:

> We open fd 3 to read '.'; we issue the new fcntl, which
> succeeds. Then there's some unrelated stuff operating on
> stdout. Then we do a getdents64(), but the d_off values
> we get back are still 64 bits. The guest binary doesn't
> like those, so it fails. My expectation was that we would
> get back d_off values here that were in the 32 bit range.

What's your file system?

I think not all of them have 32-bit hashes (some of them probably
can't, particularly in the network-based file system case).

