Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5112D4866
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 18:56:48 +0100 (CET)
Received: from localhost ([::1]:49952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn3hn-0007AF-AN
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 12:56:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kn3TJ-00022O-Cs; Wed, 09 Dec 2020 12:41:49 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:33562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kn3TH-0007J2-Nz; Wed, 09 Dec 2020 12:41:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=N3uBH36JDrW10IvFdxGhtJ2MS0aGjVmU6MbMGICAjLg=; 
 b=em7fYeIY6RJb61wEa1pmiIgS6Qy4q/q5Ek28jqfhKHBIxix9BwodV277UG6q2ShuWGw8XFwZyUOANcWnmWYptgIlWwi2oU092xb5VAjdJ1P0WI9GD68E4NqjiZhjYJ1u7ywQrnqOVbIwgsXxGEx5Xb2oZLH6cHiTpacQczFFq+wD9MaatxHGrEaE5NZTxgKASLpqP/qetTRLi1ngscbpYD1f/wUms8o/yZRHnUgQS4DW5VsUBku4o+KtLO0S+ZeaKnVVHMpBwnnUz5j7a/twURy1REo8LM5nQD+tYtCHZPbi7RVYC+YCaKSFeE3fCD+GDSkzubKOYos7+l3d6zmlyA==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1kn3TE-0005xd-FP; Wed, 09 Dec 2020 18:41:44 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1kn3TE-0003Co-61; Wed, 09 Dec 2020 18:41:44 +0100
From: Alberto Garcia <berto@igalia.com>
To: Maxim Levitsky <mlevitsk@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 4/4] block: qcow2: remove the created file on
 initialization error
In-Reply-To: <20201209164441.867945-5-mlevitsk@redhat.com>
References: <20201209164441.867945-1-mlevitsk@redhat.com>
 <20201209164441.867945-5-mlevitsk@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Wed, 09 Dec 2020 18:41:44 +0100
Message-ID: <w51k0tqnag7.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed 09 Dec 2020 05:44:41 PM CET, Maxim Levitsky wrote:
> @@ -3847,12 +3847,13 @@ static int coroutine_fn qcow2_co_create_opts(BlockDriver *drv,
>  
>      /* Create the qcow2 image (format layer) */
>      ret = qcow2_co_create(create_options, errp);
> +
> +finish:
>      if (ret < 0) {
> -        goto finish;
> +        bdrv_co_delete_file_noerr(bs);
> +        bdrv_co_delete_file_noerr(data_bs);
>      }
>  
> -    ret = 0;

Many/most functions in qcow2.c force ret to be 0 on success, we could
also keep that here (although in practice I don't think that ret can be
greater than 0 in this case, or that the caller would care).

Either way,

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

