Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 329715705EB
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 16:41:24 +0200 (CEST)
Received: from localhost ([::1]:57768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAubD-00023T-9h
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 10:41:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oAuEl-0000M9-BL
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 10:18:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oAuEi-0007xF-WD
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 10:18:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657549088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jVdW6bXsI2pcj+5Ed2FkGPgX9m+p5y74573Cjcg0SSw=;
 b=aix+nMqK5cA4hhDcsnczxaj2joaTcmTx26e8RQp3WT2pa4p66bVOkVM4tlfSeMYKfzB6d5
 stYiyEzV0iYnD+MutiiNIxc0FkwkaWCdo0rIAYNpa3n2ionAjwdT1vQQNn5dQ0BNNrRrOB
 /Yf5zzEq44f/Cu0yxCeLaRWZ9Fdjp3s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-536-9HwE7ps5Pe6u9MeE2I7p3g-1; Mon, 11 Jul 2022 10:18:04 -0400
X-MC-Unique: 9HwE7ps5Pe6u9MeE2I7p3g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 436E8101A56C;
 Mon, 11 Jul 2022 14:18:04 +0000 (UTC)
Received: from localhost (unknown [10.39.192.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C7891492C3B;
 Mon, 11 Jul 2022 14:18:03 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: =?utf-8?Q?V=C3=ADctor?= Colombo <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 victor.colombo@eldorado.org.br, mst@redhat.com, pbonzini@redhat.com,
 farosas@linux.ibm.com
Subject: Re: [RFC PATCH v2 1/2] target/ppc: Implement hashst and hashchk
In-Reply-To: <20220711134258.63147-2-victor.colombo@eldorado.org.br>
Organization: Red Hat GmbH
References: <20220711134258.63147-1-victor.colombo@eldorado.org.br>
 <20220711134258.63147-2-victor.colombo@eldorado.org.br>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date: Mon, 11 Jul 2022 16:18:02 +0200
Message-ID: <87tu7n68dh.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Mon, Jul 11 2022, V=C3=ADctor Colombo <victor.colombo@eldorado.org.br> w=
rote:

> Implementation for instructions hashst and hashchk, which were added
> in Power ISA 3.1B.
>
> It was decided to implement the hash algorithm from ground up in this
> patch exactly as described in Power ISA.
>
> Signed-off-by: V=C3=ADctor Colombo <victor.colombo@eldorado.org.br>
> ---
>  linux-headers/asm-powerpc/kvm.h            |  2 +
>  target/ppc/cpu.h                           |  1 +
>  target/ppc/cpu_init.c                      |  4 ++
>  target/ppc/excp_helper.c                   | 80 ++++++++++++++++++++++
>  target/ppc/helper.h                        |  2 +
>  target/ppc/insn32.decode                   |  8 +++
>  target/ppc/translate.c                     |  5 ++
>  target/ppc/translate/fixedpoint-impl.c.inc | 32 +++++++++
>  8 files changed, 134 insertions(+)
>
> diff --git a/linux-headers/asm-powerpc/kvm.h b/linux-headers/asm-powerpc/=
kvm.h
> index 9f18fa090f..dd58d574bf 100644
> --- a/linux-headers/asm-powerpc/kvm.h
> +++ b/linux-headers/asm-powerpc/kvm.h
> @@ -646,6 +646,8 @@ struct kvm_ppc_cpu_char {
>  #define KVM_REG_PPC_SIER3	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc3)
>  #define KVM_REG_PPC_DAWR1	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc4)
>  #define KVM_REG_PPC_DAWRX1	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc5)
> +/* FIXME: KVM hasn't exposed these registers yet */
> +#define KVM_REG_PPC_HASHKEYR    (KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x00)
>=20=20
>  /* Transactional Memory checkpointed state:
>   * This is all GPRs, all VSX regs and a subset of SPRs

<editorial>
Please split any header updates into a separate patch (a full header
update or, if the changes are not yet included in Linux, a placeholder
patch. Thank you :)
</editorial>


