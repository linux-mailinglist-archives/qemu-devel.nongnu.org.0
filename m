Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0D1565693
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 15:08:46 +0200 (CEST)
Received: from localhost ([::1]:43464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Loj-0003wO-U3
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 09:08:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8Lgp-0005uW-OW
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:00:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8Lgo-0007vb-6t
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:00:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656939633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3BrbE/k2crfud1Rv1pV5WjuqBgj7Zi8fI7c1voHDTIo=;
 b=NiG+j0CLvmlwSosEyIYTIGiE20fLh3YGT1JbPddPD//x++gNvku9OA64C+KwwzPMKGvTRq
 fRVfxCdSCL2C+Lb6DAAWhMOXY9WVwncmtwxGdVrKma24U8oVQ2xaWeNJlMS2yToNzIqYXc
 uVSLJnW+LTVFbBV+ME4Av0lniOD6y0k=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-8UJTMy2GPS2x2q0NZfmbiA-1; Mon, 04 Jul 2022 09:00:32 -0400
X-MC-Unique: 8UJTMy2GPS2x2q0NZfmbiA-1
Received: by mail-io1-f71.google.com with SMTP id
 r18-20020a6bd912000000b00675a6c915c9so5598010ioc.10
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:00:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3BrbE/k2crfud1Rv1pV5WjuqBgj7Zi8fI7c1voHDTIo=;
 b=B1c3t9b5yJ0YwfnHNx2nHN5nBmt+QYZfaON/l9lKaEQAH5qRT+JHhJo9GPplDNvSUl
 6dBUhIObWatPy7wjqwkD8tx43/SPGnnOUTk/z7HP6cialofGoaPK095IzfyxjyHFerfZ
 bYEzifRv7yI1iZXGYJTqVgTbHYgsHyLhkC09IjyjbsRAhOCvkwBVyEaqYC+rcT2b6zRT
 c30/CAraEBFnnUpAecruj0tt9QXgK5dbMKyfsnBy1X6ZCEjPVCip3Fii8yFxYG7rH2HH
 baPxopiF9nAJjreNiJ6mQG2XMoz9bfidVJYouzw4ZqA23hg/BGkrfojdc+iCrsNpDwgB
 n/2w==
X-Gm-Message-State: AJIora+D6vHUWKMMQLxW2GsTGRWF1dK6wwIAitlgIcNzKkYhErlfQkEh
 q6zuVdZzbWQJ80yxyzOFtkobQBtMtmEcZVsGYhqpctdAY7UZT7ouD/FtnBQiLkHiWWQ++LtzF2Q
 pmmE1n9tx5gXSWqZFDrvVEO0CRMcnjkI=
X-Received: by 2002:a05:6602:2a4b:b0:675:a6c9:6424 with SMTP id
 k11-20020a0566022a4b00b00675a6c96424mr12867589iov.38.1656939631657; 
 Mon, 04 Jul 2022 06:00:31 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sRCqvpGxAG6hGj37WbfSC2n78t6+JqVpP3XniHEtGXMxzx6uauKt/AuhHZWMZAXZgyq9n563bmv5O4n9eTOOI=
X-Received: by 2002:a05:6602:2a4b:b0:675:a6c9:6424 with SMTP id
 k11-20020a0566022a4b00b00675a6c96424mr12867577iov.38.1656939631495; Mon, 04
 Jul 2022 06:00:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220509103019.215041-1-pbonzini@redhat.com>
 <20220509103019.215041-16-pbonzini@redhat.com>
In-Reply-To: <20220509103019.215041-16-pbonzini@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Mon, 4 Jul 2022 13:59:55 +0100
Message-ID: <CAELaAXwn5bWbxYUaXgSP1DZy6SFyTsOa3TDg4+sasJnb+jSAgg@mail.gmail.com>
Subject: Re: [PATCH v2 15/26] copy-before-write: add missing coroutine_fn
 annotations
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
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

On Mon, May 9, 2022 at 11:57 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/copy-before-write.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Some overly long lines.

Reviewed-by: Alberto Faria <afaria@redhat.com>


