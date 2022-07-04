Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C165656FD
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 15:23:32 +0200 (CEST)
Received: from localhost ([::1]:42764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8M31-0006OK-GY
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 09:23:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8LkQ-0000ZK-B9
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:04:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8LkO-0008Vx-Q3
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:04:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656939856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lmycx7bsrVhMXpfcF2e1TxltBdYsiDeRvPuJuucz56g=;
 b=cXl6sGUi3FHsOQroWp0STR4H9ZXwepU6vqyz5CMJgmQ7+17NM+xCZ2GWVQpvEhig7kFoGs
 iYAZNZI+LMQwb3SbOUYmYay3PXL4xDiWJhQOVApdYFJKrPEAZeoNU57J9wULmUGcfs9h8g
 KH8M+st0WqHPXKU2V4cz3WV+zTfVZFc=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-386-CJEre8p7Oke6_q8WiGtn1Q-1; Mon, 04 Jul 2022 09:04:15 -0400
X-MC-Unique: CJEre8p7Oke6_q8WiGtn1Q-1
Received: by mail-il1-f198.google.com with SMTP id
 w15-20020a056e021a6f00b002d8eef284f0so4151549ilv.6
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:04:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lmycx7bsrVhMXpfcF2e1TxltBdYsiDeRvPuJuucz56g=;
 b=1xzi8VB61++6nvCGZ4yc2xSZBSi8dLshwb+3espX8hKBgxaRNGA2AYJJk9b5MEFck4
 n2aFXUG6x5Z4YewZYwkKq2Z8sUino3Lvi7tpgfSAFoE7wH2fVndZSh+qp7D5tclFDTPT
 chvQSKLLg7P+YgEEVXZvFq2V01P2c7tf1cm6WSPr71pA34CHXRY5AWv+OYNAw2xlzvF3
 X30/ODQuwrUXFu9HF2QSr3rSoy/196wkQYot2/pEqkWoT0Qv6jPefi1yeRSOnDpECkFX
 laxu0q1S/wSu5eAjxW1NbvK6My8em5WmBJarLMVhG54a9AnDM7fjuK+0j1jZMo/2iXkH
 Su6g==
X-Gm-Message-State: AJIora9BHnscaku3le4LGssL7FC2zMsdRiZNQ8OIpMEMpHeAdjcODLlE
 6j5hytRahptbyRVCF4cbnWtHv1UXX+G1J89rmyIzcSlaqvh82tFMAZMcrAGaCyPvPJy+mNvWAY6
 +HRdDn3hDbk6Tosowv9BjZIoCQ1W4Gow=
X-Received: by 2002:a05:6638:271f:b0:33c:c07e:3034 with SMTP id
 m31-20020a056638271f00b0033cc07e3034mr18426832jav.263.1656939854494; 
 Mon, 04 Jul 2022 06:04:14 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tWf0OBMLEUcApaJFX5W313Oaadyi5mCM6AHCx5xfv5/QYbS2UeqJmzquOencC0LaPgNGqdqFEOrpyy/0cN+2Y=
X-Received: by 2002:a05:6638:271f:b0:33c:c07e:3034 with SMTP id
 m31-20020a056638271f00b0033cc07e3034mr18426821jav.263.1656939854250; Mon, 04
 Jul 2022 06:04:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220509103019.215041-1-pbonzini@redhat.com>
 <20220509103019.215041-26-pbonzini@redhat.com>
In-Reply-To: <20220509103019.215041-26-pbonzini@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Mon, 4 Jul 2022 14:03:38 +0100
Message-ID: <CAELaAXxtwY_yeDBb6czDz7a2jBhFa14OKjPH1FdHE4OTX-SwSA@mail.gmail.com>
Subject: Re: [PATCH v2 25/26] migration: add missing coroutine_fn annotations
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Juan Quintela <quintela@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, May 9, 2022 at 12:13 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  migration/migration.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Alberto Faria <afaria@redhat.com>


