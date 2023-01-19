Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AC3673354
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 09:08:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIPvj-0000rW-NY; Thu, 19 Jan 2023 03:05:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pIPvg-0000qr-Vc
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 03:05:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pIPvZ-0001mv-EA
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 03:05:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674115457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7KqcHxV7KaSpKXsQcUIQpSDC/qQLf9L9eUslM2twUFk=;
 b=cDZoGRISWx2gtfAq3mdPg8VAZb33xdlL4XobUKCvn3X6yVO28EOVwTr3xLo2Vx0itPXGYI
 q/MqPYXc024sZe7RSjSAXYfJ4sh3V6QEm/fFkvFxbAEHeZgVN4moncc0hNbPtNZacK+PPo
 CqvLVFX60hP8lEy3ugJ3PrkQUMbHsOM=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-653-z3BtCU6CPL2zBBVuEE2IZw-1; Thu, 19 Jan 2023 03:04:16 -0500
X-MC-Unique: z3BtCU6CPL2zBBVuEE2IZw-1
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-15a1e0ce4dbso754904fac.21
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 00:04:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7KqcHxV7KaSpKXsQcUIQpSDC/qQLf9L9eUslM2twUFk=;
 b=TNsH/FbAriBdZ+jY8ATDqafX9JrqNk32epFoOVmy92BqBC9YgvM5iNjqyyF3cb6CgB
 uab2LjtVHn9lUsmsfqPCKUT14Kx3P6vLo2FU4rNTt8cc2VMs7BgyUY260dOc1mrxN/Ys
 UlX17xavo/NRc1WDD/oj4juyfjRehZt+GDb+ymhmfq/46XHL0Z4UtAieHuZIj7G22Xcx
 WAfgf3oSnjs9cQeJoA+T6IX5A7WeYyDXlhkdK0GJed0zBMRMD752e34nsJ6k05Be0vaY
 fZc6vzU47DZIT3TZ29Y7BUBTKZcFkbzexEu6fHcldq+ULNc9bZCplx5e+x1PYcTbHBLn
 7a8Q==
X-Gm-Message-State: AFqh2kraeEDz00lCIron4ClmmP8ZpJt3Lent92UJE5UzIeQAUP2rMlBs
 AclVwkuhWxCZr6Np4RAAc+aZQ4trQOEfu64LtgIczVSg0qnHN/Ea8YMZnTC8BfGEqtUl5c76mqp
 YTShWWmN8hplbwzcciaWVWxgPmP2Wyuk=
X-Received: by 2002:a05:6808:b2f:b0:363:a978:6d41 with SMTP id
 t15-20020a0568080b2f00b00363a9786d41mr586706oij.280.1674115455172; 
 Thu, 19 Jan 2023 00:04:15 -0800 (PST)
X-Google-Smtp-Source: AMrXdXttBOcMJyUfs9E4kmJ/t5jDG7bUEOlzgrXM3KQUguSUT6AIuLhI2kX8PcgS/d9tKEOh4STlY3Zd0BFDGlCjWOo=
X-Received: by 2002:a05:6808:b2f:b0:363:a978:6d41 with SMTP id
 t15-20020a0568080b2f00b00363a9786d41mr586693oij.280.1674115450765; Thu, 19
 Jan 2023 00:04:10 -0800 (PST)
MIME-Version: 1.0
References: <20230116031431.1378346-1-cyruscyliu@gmail.com>
 <30269eb2-1c3b-50c5-9a5b-d1d19ceb68e4@linaro.org>
In-Reply-To: <30269eb2-1c3b-50c5-9a5b-d1d19ceb68e4@linaro.org>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 19 Jan 2023 16:03:59 +0800
Message-ID: <CACGkMEtbFWMNESNrGEQCEZVyt8xeayrxvP_peh8bJtJWXe9h+A@mail.gmail.com>
Subject: Re: [PATCH v2] hw/net/lan9118: log [read|write]b when mode_16bit is
 enabled rather than abort
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Qiang Liu <cyruscyliu@gmail.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Jan 16, 2023 at 4:31 PM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> On 16/1/23 04:14, Qiang Liu wrote:
> > This patch replaces hw_error to guest error log for [read|write]b
> > accesses when mode_16bit is enabled. This avoids aborting qemu.
> >
> > Fixes: 1248f8d4cbc3 ("hw/lan9118: Add basic 16-bit mode support.")
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1433
> > Reported-by: Qiang Liu <cyruscyliu@gmail.com>
> > Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
> > Suggested-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > ---
> > v2 removes BADF() macro and the "hw/hw.h" inclusion
>
> Thanks!
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Queued.

Thanks

>
> > ---
> >   hw/net/lan9118.c | 17 ++++++++---------
> >   1 file changed, 8 insertions(+), 9 deletions(-)
>


