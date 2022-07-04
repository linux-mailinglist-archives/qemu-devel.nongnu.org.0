Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CDC565718
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 15:26:25 +0200 (CEST)
Received: from localhost ([::1]:47240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8M5o-0001FS-GT
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 09:26:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8LkM-0000YO-6x
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:04:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8LkJ-0008U2-PI
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:04:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656939851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NLUGTdYQkIjDDbScKIecgeeJYS+xxyLnzGMihIeqILI=;
 b=HzNoIhJVNdHXM5GGEf2e5B5XumDQ8RnDfhJtVW65VfrreAjYGthvcGUw+VilUx7qjtnuAQ
 Rj4LasXf4cmeENG/0XatO803s8OFcy4JDeEQ51xEbjs3085pWXoITeTmD+Yi1mzA9z6U8b
 Euwi16oWR2g8O5yuFj2hRIjRooVTQkU=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-321-7Bgn9-RoM2CtEtKAPxKRaw-1; Mon, 04 Jul 2022 09:04:10 -0400
X-MC-Unique: 7Bgn9-RoM2CtEtKAPxKRaw-1
Received: by mail-io1-f69.google.com with SMTP id
 x2-20020a6bda02000000b0067590503c08so5533699iob.5
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:04:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NLUGTdYQkIjDDbScKIecgeeJYS+xxyLnzGMihIeqILI=;
 b=UlKf7XWNbSvI6BdtTeMWaqxingSFlWUMa4RVx+wXJOI8waLWxxGoGEVbt1GQWg6aL4
 HfmHEg91i583+2W1SMCiSMVH0P1Y4dRl/iYpRZRiN2GScvi1G+GaKsLaEX99lc9yT/Y8
 TMGsc8qixQlsLo1lFx5Z+a9cxpQPit114knPZJwTirMFlZV6Q5OdJLns9TOjrgxTBaW3
 sKrQ20mgg1HkioEWNeIrrq7jx6CWJwWQy6nw0J8zi5fgcbz3XgyNzIkGgivrotPDE2Mg
 NXENdlYTTUBzEVHrxemqEtJkvb76aTfjtzMOVzXBm7PZB6bKNukxvojMGwLM/xGAz8vi
 VDTA==
X-Gm-Message-State: AJIora8GMLdwoeWASAenMIBH01M0KA8v35iar3hYkcP/Ns8pCZ3cfmgf
 M/S3hdEooRUzES2RuedwgH7dx8XVh7+Q8Tza930t71ahdxognuIobSHZa1X64K+ftrDTUksXNgP
 pnk1J8aGO+pMNZufO6h2TPXSG/qI13rI=
X-Received: by 2002:a05:6e02:216b:b0:2da:c09b:179f with SMTP id
 s11-20020a056e02216b00b002dac09b179fmr16987361ilv.0.1656939849306; 
 Mon, 04 Jul 2022 06:04:09 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vc27EKdBc9vgvZcTJumKpDRd6aT98g85qqrclIrdACLWIs75groaswgnivOEZgNke3rz10lUD6eJJrJhYxiKE=
X-Received: by 2002:a05:6e02:216b:b0:2da:c09b:179f with SMTP id
 s11-20020a056e02216b00b002dac09b179fmr16987352ilv.0.1656939849101; Mon, 04
 Jul 2022 06:04:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220509103019.215041-1-pbonzini@redhat.com>
 <20220509103019.215041-25-pbonzini@redhat.com>
In-Reply-To: <20220509103019.215041-25-pbonzini@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Mon, 4 Jul 2022 14:03:32 +0100
Message-ID: <CAELaAXyxB-qvK7aOCwW97yi-fCrTdmEnU8cTOsMCFyZzt1FH9Q@mail.gmail.com>
Subject: Re: [PATCH v2 24/26] 9p: add missing coroutine_fn annotations
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Greg Kurz <groug@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Mon, May 9, 2022 at 12:09 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Acked-by: Greg Kurz <groug@kaod.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/9pfs/9p.h | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

Reviewed-by: Alberto Faria <afaria@redhat.com>


