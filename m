Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BD632137A
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 10:54:15 +0100 (CET)
Received: from localhost ([::1]:45318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE7uw-0006Z5-1E
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 04:54:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=Mgfk=HY=linuxfoundation.org=gregkh@kernel.org>)
 id 1lE7ty-00067a-1G
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 04:53:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:35394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=Mgfk=HY=linuxfoundation.org=gregkh@kernel.org>)
 id 1lE7tv-0003V4-Fk
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 04:53:13 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5CA8864E2F;
 Mon, 22 Feb 2021 09:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1613987588;
 bh=BBG3yknKL0hoGSOg1hNme7zrwWCbVtcVbJuDn0H9qRo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=2va3FjJtSZQupCjTYVzMxAyUZVVUbxhp9YPh7MLb2J8qpkpWPJQkQsuAXiQgnH5CW
 Y5PLKhfUqtCh3HifYAoGZ5ytxKRb7Wch2FiOaymmYibhqwjnJQjGZyPk4u2oZHrHeP
 QivH9UJCqqPRIVf9GwsBgmnDCZ9JQ/cBjnUJGlW4=
Date: Mon, 22 Feb 2021 10:53:06 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Adrian Catangiu <acatan@amazon.com>
Subject: Re: [PATCH v6 1/2] drivers/misc: sysgenid: add system generation id
 driver
Message-ID: <YDN/AvsplZ7R8OTR@kroah.com>
References: <1613986886-29493-1-git-send-email-acatan@amazon.com>
 <1613986886-29493-2-git-send-email-acatan@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1613986886-29493-2-git-send-email-acatan@amazon.com>
Received-SPF: pass client-ip=198.145.29.99;
 envelope-from=SRS0=Mgfk=HY=linuxfoundation.org=gregkh@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Jason@zx2c4.com, areber@redhat.com, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, ghammer@redhat.com, vijaysun@ca.ibm.com,
 0x7f454c46@gmail.com, qemu-devel@nongnu.org, mhocko@kernel.org,
 dgunigun@redhat.com, avagin@gmail.com, pavel@ucw.cz, ptikhomirov@virtuozzo.com,
 linux-s390@vger.kernel.org, corbet@lwn.net, mpe@ellerman.id.au, mst@redhat.com,
 ebiggers@kernel.org, borntraeger@de.ibm.com, sblbir@amazon.com,
 bonzini@gnu.org, arnd@arndb.de, jannh@google.com, raduweis@amazon.com,
 asmehra@redhat.com, graf@amazon.com, rppt@kernel.org, luto@kernel.org,
 gil@azul.com, oridgar@gmail.com, colmmacc@amazon.com, tytso@mit.edu,
 ovzxemul@gmail.com, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 ebiederm@xmission.com, rafael@kernel.org, w@1wt.eu, dwmw@amazon.co.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 22, 2021 at 11:41:25AM +0200, Adrian Catangiu wrote:
> The driver also generates a `SYSGENID=%u` uevent containing the new
> system generation counter/id value every time it changes. Unlike the
> filesystem interface, the uevent has no synchronization guarantees
> therefore it should not be used by any sensitive system components.

No, please no.  It is not ok to start sending random uevents all the
time to userspace for individual drivers like this.  Especially for a
misc device.

As you say "has no synchromization guarantees", then why use it at all?

Please drop it.

thanks,

greg k-h

