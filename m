Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF33D44CAED
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 22:02:05 +0100 (CET)
Received: from localhost ([::1]:52306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkujM-0007jr-I6
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 16:02:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mkuiG-0006mA-9D; Wed, 10 Nov 2021 16:00:56 -0500
Received: from mail-ot1-f45.google.com ([209.85.210.45]:41592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mkuiE-0001DE-06; Wed, 10 Nov 2021 16:00:55 -0500
Received: by mail-ot1-f45.google.com with SMTP id
 o15-20020a9d410f000000b0055c942cc7a0so5799652ote.8; 
 Wed, 10 Nov 2021 13:00:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2vGJEpP1W3G7q7iViElIszWRAJGezY3wnhBDgg+MyP8=;
 b=wsueaBO3EYiIJeveyLVQAG7CesFrP2qS8gdq8eZdKN/kC/wNFgFQfHF+EOHpa6FGGS
 L2HTuTXkdEhYHMG0seQaRn15AMd2NYaCrZYETIGdOuIDCTpVEJWom+Vt/k2IR3PbstuZ
 AepzdZD6byp08cjvnsILcUgQ8cHE+5O9RP4ZRro7w2wlGrGghd/+QrjFy+VRw1huzgxs
 0no1l3tWPW6myv89MT7qrMfkTnoEnhGI4j6Xfvv3zFaB/ITwj5ZXzR4Oxisj+GpLb7Uz
 GvDtSGgG5/Cwi02wh9dpZaDrjVaTASm8OryHjQrc9iferPIVdrvhaAXnwj9+2P9pvENf
 rqXw==
X-Gm-Message-State: AOAM531PoDy6Ke7TAVB3flJvnOWoNG2zwF4wXH64YoVy4bKzOGu9Le3G
 My9yGNovtvy/dK1fNcY0EfZO4NCmTWwBkn1Pma0=
X-Google-Smtp-Source: ABdhPJyrvhIbAe8mX5fKFf2aVStBA3lUx1UKC4cxNKV8EK7BwiT13B1ZY3tKcehdBLWPYAVPC7/YwdGwciGfMHDydrU=
X-Received: by 2002:a9d:1e1:: with SMTP id e88mr1793592ote.75.1636578049624;
 Wed, 10 Nov 2021 13:00:49 -0800 (PST)
MIME-Version: 1.0
References: <20211110202516.1993815-1-danielhb413@gmail.com>
 <20211110202516.1993815-2-danielhb413@gmail.com>
In-Reply-To: <20211110202516.1993815-2-danielhb413@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Wed, 10 Nov 2021 22:00:38 +0100
Message-ID: <CAAdtpL48aMufvW76gu8+D1YQ-Jyw1sfr_WRX_Z5dET6FHtSPvQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] ppc/mmu_helper.c: do not truncate 'ea' in
 booke206_invalidate_ea_tlb()
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.210.45;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ot1-f45.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 "qemu-ppc@nongnu.org list:PowerPC" <qemu-ppc@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 10, 2021 at 9:25 PM Daniel Henrique Barboza
<danielhb413@gmail.com> wrote:
>
> 'tlbivax' is implemented by gen_tlbivax_booke206() via
> gen_helper_booke206_tlbivax(). In case the TLB needs to be flushed,
> booke206_invalidate_ea_tlb() is called. All these functions, but
> booke206_invalidate_ea_tlb(), uses a 64-bit effective address 'ea'.
>
> booke206_invalidate_ea_tlb() uses an uint32_t 'ea' argument that
> truncates the original 'ea' value for apparently no particular reason.
> This function retrieves the tlb pointer by calling booke206_get_tlbm(),
> which also uses a target_ulong address as parameter - in this case, a
> truncated 'ea' address. All the surrounding logic considers the
> effective TLB address as a 64 bit value, aside from the signature of
> booke206_invalidate_ea_tlb().
>
> Last but not the least, PowerISA 2.07B section 6.11.4.9 [2] makes it
> clear that the effective address "EA" is a 64 bit value.
>
> Commit 01662f3e5133 introduced this code and no changes were made ever
> since. An user detected a problem with tlbivax [1] stating that this
> address truncation was the cause. This same behavior might be the source
> of several subtle bugs that were never caught.
>
> For all these reasons, this patch assumes that this address truncation
> is the result of a mistake/oversight of the original commit, and changes
> booke206_invalidate_ea_tlb() 'ea' argument to 'vaddr'.
>
> [1] https://gitlab.com/qemu-project/qemu/-/issues/52
> [2] https://wiki.raptorcs.com/wiki/File:PowerISA_V2.07B.pdf
>
> Fixes: 01662f3e5133 ("PPC: Implement e500 (FSL) MMU")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/52
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  target/ppc/mmu_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

