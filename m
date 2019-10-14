Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8EFD5FC4
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Oct 2019 12:08:07 +0200 (CEST)
Received: from localhost ([::1]:46424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iJxGo-000259-HR
	for lists+qemu-devel@lfdr.de; Mon, 14 Oct 2019 06:08:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38895)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iJxFh-00018v-SX
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 06:06:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iJxFg-0007gq-O0
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 06:06:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35942)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1iJxFg-0007gC-IY
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 06:06:56 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D04A8301D671
 for <qemu-devel@nongnu.org>; Mon, 14 Oct 2019 10:06:55 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.36.118.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C50E260A35;
 Mon, 14 Oct 2019 10:06:54 +0000 (UTC)
Date: Mon, 14 Oct 2019 12:06:53 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v4 4/4] qapi: Allow introspecting fix for savevm's
 cooperation with blockdev
Message-ID: <20191014100653.GE7173@localhost.localdomain>
References: <20191011085027.28606-1-armbru@redhat.com>
 <20191011085027.28606-5-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191011085027.28606-5-armbru@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Mon, 14 Oct 2019 10:06:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: pkrempa@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 11.10.2019 um 10:50 hat Markus Armbruster geschrieben:
> From: Peter Krempa <pkrempa@redhat.com>
> 
> 'savevm' was buggy as it considered all monitor-owned block device
> nodes for snapshot. With the introduction of -blockdev, the common
> usage made all nodes including protocol and backing file nodes be
> monitor-owned and thus considered for snapshot.
> 
> This is a problem since the 'file' protocol nodes can't have internal
> snapshots and it does not make sense to take snapshot of nodes
> representing backing files.
> 
> This was fixed by commit 05f4aced658a02b02. Clients need to be able to
> detect whether this fix is present.
> 
> Since savevm does not have an QMP alternative, add the feature for the
> 'human-monitor-command' backdoor which is used to call this command in
> modern use.
> 
> Signed-off-by: Peter Krempa <pkrempa@redhat.com>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  qapi/misc.json | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/qapi/misc.json b/qapi/misc.json
> index 6bd11f50e6..35dca86ce7 100644
> --- a/qapi/misc.json
> +++ b/qapi/misc.json
> @@ -1020,6 +1020,13 @@
>  #
>  # @cpu-index: The CPU to use for commands that require an implicit CPU
>  #
> +# Features:
> +

I think you want a # in this empty line.

> +# @savevm-monitor-nodes: If present, HMP command savevm only snapshots
> +#                        monitor-owned nodes if they have no parents.
> +#                        This allows the use of 'savevm' with
> +#                        -blockdev. (since 4.2)
> +#
>  # Returns: the output of the command as a string
>  #
>  # Since: 0.14.0
> @@ -1047,7 +1054,8 @@
>  ##
>  { 'command': 'human-monitor-command',
>    'data': {'command-line': 'str', '*cpu-index': 'int'},
> -  'returns': 'str' }
> +  'returns': 'str',
> +  'features': [ 'savevm-monitor-nodes' ] }

With this fixed:

Reviewed-by: Kevin Wolf <kwolf@redhat.com>

