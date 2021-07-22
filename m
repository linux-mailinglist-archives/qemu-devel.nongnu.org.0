Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D813D1FA2
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 10:09:33 +0200 (CEST)
Received: from localhost ([::1]:48904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Tlr-0000bK-MB
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 04:09:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <reinoud@13thmonkey.org>)
 id 1m6Th7-0006cf-LB
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 04:04:38 -0400
Received: from 13thmonkey.org ([80.100.255.32]:61694
 helo=dropje.13thmonkey.org) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <reinoud@13thmonkey.org>) id 1m6Th5-0008B0-DD
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 04:04:36 -0400
Received: by dropje.13thmonkey.org (Postfix, from userid 103)
 id 75A08C1EEA6; Thu, 22 Jul 2021 10:04:32 +0200 (CEST)
Date: Thu, 22 Jul 2021 10:04:32 +0200
From: Reinoud Zandijk <reinoud@NetBSD.org>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 08/16] whpx nvmm: Drop useless migrate_del_blocker()
Message-ID: <YPkmkGniEQUw3h31@dropje.13thmonkey.org>
References: <20210720125408.387910-1-armbru@redhat.com>
 <20210720125408.387910-9-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210720125408.387910-9-armbru@redhat.com>
Received-SPF: pass client-ip=80.100.255.32;
 envelope-from=reinoud@13thmonkey.org; helo=dropje.13thmonkey.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Sunil Muthuswamy <sunilmut@microsoft.com>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 20, 2021 at 02:54:00PM +0200, Markus Armbruster wrote:
> There is nothing to delete after migrate_add_blocker() failed.  Trying
> anyway is safe, but useless.  Don't.
> 
> Cc: Sunil Muthuswamy <sunilmut@microsoft.com>
> Cc: Kamil Rytarowski <kamil@netbsd.org>
> Cc: Reinoud Zandijk <reinoud@netbsd.org>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  target/i386/nvmm/nvmm-all.c | 1 -
>  target/i386/whpx/whpx-all.c | 1 -
>  2 files changed, 2 deletions(-)
> 
> diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
> index dfa690d65d..7bb0d9e30e 100644
> --- a/target/i386/nvmm/nvmm-all.c
> +++ b/target/i386/nvmm/nvmm-all.c
> @@ -929,7 +929,6 @@ nvmm_init_vcpu(CPUState *cpu)
>          (void)migrate_add_blocker(nvmm_migration_blocker, &local_error);
>          if (local_error) {
>              error_report_err(local_error);
> -            migrate_del_blocker(nvmm_migration_blocker);
>              error_free(nvmm_migration_blocker);
>              return -EINVAL;
>          }

Reviewed-by: Reinoud Zandijk <reinoud@NetBSD.org>        

No problem with it


