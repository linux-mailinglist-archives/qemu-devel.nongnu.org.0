Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C06144BA601
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 17:33:31 +0100 (CET)
Received: from localhost ([::1]:56060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKjij-0005Ve-S6
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 11:33:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nKjft-00045f-L7; Thu, 17 Feb 2022 11:30:41 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:52319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nKjfo-0003Ss-Ug; Thu, 17 Feb 2022 11:30:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=M7AK1zKwTDtTFLQ9r9DDTNAbCAhNVnY4fcgsrE/pDuo=; b=RHz3O7IXOVSsbA5AxjdNVdCb9E
 BwVjiOPch9KA+fYQvGu+dm2wjqKV6W8zrTUjqn13xM/hVq7iYkpj1tCJqxRqMvpncBC4DKRF2EEYJ
 av8czO0K67WTJ0HyKtP9ZkRxyd20p9CRp6jBxW6GrPwz2PCMPUBFsQwbXTb4x9eeEHvlYPGYjom1P
 iKQHbDnSW59k05aApFZaxtRUitIYBBAEaCA3yATVYUsmq7OYVcMxaRHF1EkrxI/QmIhZT9hD+ZJfK
 idS8qqeKAXHQGslof0xub4Uah4Pif8/flT9BdYTYpTibIequz0rfNwxPSOvmpfAe5ygDcZssQzcNQ
 UDAsw1qalD3BsPUFOkF1yYztgQxKgGQsqG64pWxpu5IdZ4Ndz7cn1Bpebz7V3+JJ+jnuDkC+HTXjn
 vBAGMK7rvioiAN2MYfncTq8YHNA+hz6k/odcblrVhUD9yR7OzHdi4fJw27O3Tqf6F6YwPpuTxDA7I
 Oeo+uDfZI/g5KGd8d2KQbWLnqZxF6f3eyH2eFZ+XcIi2oOgYLFBXmzlNOTahaYYxEWxepNMj5jgA2
 ELvxwTFLAAaZGjoErsdRVeJrQH/5nMqwNgMnTkVNkr6E6RlosJje6B0zlB7daf+6kAMbET+mc+o1p
 eJJcW8ZT8bza4UCRcK4V+hPhg6dvny6XwytiYrCsg=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Vitaly Chikunov <vt@altlinux.org>, Greg Kurz <groug@kaod.org>,
 qemu-stable@nongnu.org, "Dmitry V . Levin" <ldv@altlinux.org>
Subject: Re: [PATCH v5] 9pfs: Fix segfault in do_readdir_many caused by struct
 dirent overread
Date: Thu, 17 Feb 2022 17:30:11 +0100
Message-ID: <2135244.TdAzAAGDzu@silver>
In-Reply-To: <20220216181821.3481527-1-vt@altlinux.org>
References: <20220216181821.3481527-1-vt@altlinux.org>
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
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mittwoch, 16. Februar 2022 19:18:21 CET Vitaly Chikunov wrote:
> `struct dirent' returned from readdir(3) could be shorter (or longer)
> than `sizeof(struct dirent)', thus memcpy of sizeof length will overread
> into unallocated page causing SIGSEGV. Example stack trace:
> 
>  #0  0x00005555559ebeed v9fs_co_readdir_many (/usr/bin/qemu-system-x86_64 +
> 0x497eed) #1  0x00005555559ec2e9 v9fs_readdir (/usr/bin/qemu-system-x86_64
> + 0x4982e9) #2  0x0000555555eb7983 coroutine_trampoline
> (/usr/bin/qemu-system-x86_64 + 0x963983) #3  0x00007ffff73e0be0 n/a (n/a +
> 0x0)
> 
> While fixing this, provide a helper for any future `struct dirent' cloning.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/841
> Cc: qemu-stable@nongnu.org
> Co-authored-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> Reviewed-by: Dmitry V. Levin <ldv@altlinux.org>
> Signed-off-by: Vitaly Chikunov <vt@altlinux.org>
> ---

Queued on 9p.next:
https://github.com/cschoenebeck/qemu/commits/9p.next

Thanks! I prepare a new PR now.

Best regards,
Christian Schoenebeck



