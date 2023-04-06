Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 248716D9436
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 12:34:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkMvc-0000vR-Mj; Thu, 06 Apr 2023 06:33:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pkMvZ-0000uy-Cm
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 06:33:13 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pkMvX-0003Ap-RB
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 06:33:12 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id f188so27152421ybb.3
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 03:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680777190;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mqlnxqpV2NrEC/WUGnGc9rNQge8tUbFlILyuOiKjh/4=;
 b=URoLVYU9IDLyI2y6TpmMH3ah8rmqAwe+gtFq7KMqjC4OMaJ6jPPJY+t9yjIT8mgott
 e+2Q8ljoPouIEBfiTr2UbdxKmtEcpNhKBz5gh6Y9pem9sbCEfq6mIoeu2TkdGKtOKNDs
 NyygJPRs3OPzsrPZtqL6mbetOwevSzEUoPk0+b+f9Ef97H4hbJyCtcDHkxdX71R3efk9
 E+u76DJR1MPj4v6pBLvYZOK/F6G4JKOGeQgy+E5qJK5FfBdmZcKYCCYLEjbdb6XH+KrW
 55IVREkOb/J68o4x4LyIVWaeqdUHZuvEvXg77fPZScBEMLydQ6wA/CFcxnHEGURg1f1q
 DlPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680777190;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mqlnxqpV2NrEC/WUGnGc9rNQge8tUbFlILyuOiKjh/4=;
 b=B6T/NTAWGec3CwkBZe/KAXmZipa6CRvMX/nuzxUkt9+5/bevtnkScK9Un6yHeyABvq
 nteaGQvzcyyVyWTuw9cvIWzt2NeoNrbPTVt9R9MF8sNp8F/rKTIIt23jYDSAtbqYyxD5
 PRd6TKJMmSpk1RHb87ast07Wm/xVW+EoRIH68Xcxb/aj1dGnmqmTsGhZCmBGLoJ74a/2
 Fj/8YCppM610fvUgK9G/xxs+tNhUwR70jNSAlwVC8P3vuyc9lRw9oHvFZWRrvccADw9i
 0TxGWJyhpaEnK6vADV28u8+kIdaFe45cWyjinwMZsZlccm1OWHTiYD0vd6E6yll+tFpd
 szxQ==
X-Gm-Message-State: AAQBX9cOvdSbfCo6K4wrET3dMlCdGouojJzgxyqhSdDUOL4sWt1Y1qYA
 1wRdDHEyEI8qp1JLdnEpZOJT6mEZY0BFc2La9ofuo1A3
X-Google-Smtp-Source: AKy350Y66ugAa2e8qA5bxc20vX1hnp6020ZGzy52taRY3MgxPBmfKj+kfGMZ4Ql83vctl03/890EbLXP+27vk2bayjg=
X-Received: by 2002:a25:cfc8:0:b0:b73:caa7:f05e with SMTP id
 f191-20020a25cfc8000000b00b73caa7f05emr1788124ybg.2.1680777190379; Thu, 06
 Apr 2023 03:33:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230406100759.240870-2-pbonzini@redhat.com>
In-Reply-To: <20230406100759.240870-2-pbonzini@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 6 Apr 2023 06:32:58 -0400
Message-ID: <CAJSP0QVmJ4j9YTB96070tjEnzsLzvp=qMpwkBrdNsb+NJMwMew@mail.gmail.com>
Subject: Re: [PATCH for-8.1] block-backend: remove qatomic_mb_read()
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Thu, 6 Apr 2023 at 06:08, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> There is already a barrier in AIO_WAIT_WHILE_INTERNAL(), thus the
> qatomic_mb_read() is not adding anything.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/block-backend.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

