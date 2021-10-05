Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F560421F0F
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 08:48:13 +0200 (CEST)
Received: from localhost ([::1]:56810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXeFI-0002k0-8n
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 02:48:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mXeCA-0001ie-H1
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 02:44:58 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:35684
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mXeC8-00019X-Jx
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 02:44:58 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-UUeanvICM5CZDEZMHxkAJA-1; Tue, 05 Oct 2021 02:44:50 -0400
X-MC-Unique: UUeanvICM5CZDEZMHxkAJA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46F671023F4D;
 Tue,  5 Oct 2021 06:44:49 +0000 (UTC)
Received: from bahia.huguette (unknown [10.39.192.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F0C3D60BF4;
 Tue,  5 Oct 2021 06:44:47 +0000 (UTC)
Date: Tue, 5 Oct 2021 08:44:46 +0200
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v2] target/ppc: Fix the test raising the decrementer
 exception
Message-ID: <20211005084446.6a8cefee@bahia.huguette>
In-Reply-To: <20211005053324.441132-1-clg@kaod.org>
References: <20211005053324.441132-1-clg@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-1.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 5 Oct 2021 07:33:24 +0200
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> Commit 4d9b8ef9b5ab ("target/ppc: Fix 64-bit decrementer") introduced
> new int64t variables and broke the test triggering the decrementer
> exception. Revert partially the change to evaluate both clause of the
> if statement.
>=20
> Reported-by: Coverity CID 1464061
> Fixes: 4d9b8ef9b5ab ("target/ppc: Fix 64-bit decrementer")
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/ppc/ppc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
> index f5d012f860af..a724b0bb5ecb 100644
> --- a/hw/ppc/ppc.c
> +++ b/hw/ppc/ppc.c
> @@ -848,7 +848,7 @@ static void __cpu_ppc_store_decr(PowerPCCPU *cpu, uin=
t64_t *nextp,
>       * On MSB edge based DEC implementations the MSB going from 0 -> 1 t=
riggers
>       * an edge interrupt, so raise it here too.
>       */
> -    if ((signed_value < 3) ||
> +    if ((value < 3) ||
>          ((tb_env->flags & PPC_DECR_UNDERFLOW_LEVEL) && signed_value < 0)=
 ||
>          ((tb_env->flags & PPC_DECR_UNDERFLOW_TRIGGERED) && signed_value =
< 0
>            && signed_decr >=3D 0)) {


