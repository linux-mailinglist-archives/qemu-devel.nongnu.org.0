Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE2F6B23B9
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 13:11:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paF5K-0005fL-RC; Thu, 09 Mar 2023 07:09:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1paF56-0005YT-2C
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 07:09:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1paF4x-00020Q-BC
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 07:09:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678363740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5wl46vJAXtysbBdlXItabw6SmUTLGPw7jwifH23AR2U=;
 b=JAimUf/OB4o14fH6NV327npwT8M2sXSeqGFML7YaIqK23YmpvRsSEohqpy4bRKGj+0QnoQ
 l/hAlhQ6KQcBS6ahd3OwWD+9Dc8R3M4118rRF+uys7xzAfmkoJ7IUOzEF11A2sfMjGUw/o
 KmIgbHDxq4KUDsGPNT0fy6gniaFA0sE=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-367-a1WP1GMLNE27Ed_4-NT7cw-1; Thu, 09 Mar 2023 07:08:58 -0500
X-MC-Unique: a1WP1GMLNE27Ed_4-NT7cw-1
Received: by mail-vs1-f71.google.com with SMTP id
 y12-20020a67d20c000000b0041ecbf3defcso552078vsi.16
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 04:08:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678363737;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5wl46vJAXtysbBdlXItabw6SmUTLGPw7jwifH23AR2U=;
 b=A3o8SKjwLlbEkx9K9BwVTjPrzQ3I7MjAF9A7iRyKAFnw8+e0pGl22YCxbssv4UwEWU
 xO3FuL2pOqngYlDQRnxsuLJqmrId7K3TQcL3GY+0uykY2ncvIbqasiwwp1g4s8b4u7T3
 CZ0sCvYnDOGwlLztbNXYUw+LW0BkeW5XSY++TvUM1a+xM5py6gCzXeUmaUQoB8xbXbAA
 FH58Dx9aH3fFAzEdODcmtPfe7BVquXOHsGXnxQrl/i/G68vxLi/tSnFIfXMiGxSqUyMY
 u+DKKNjUh9gR20z5YpLl8k478J5tzNfWJU76WErDwb6uqXwZJPvHHkfH0diaxtPDXWVw
 93OA==
X-Gm-Message-State: AO0yUKWQyKVXVh4HaMMmTcrmd55BqF55ti8n/HYd92nFl3bShfxftAsU
 tHQbr8bSMF2FzcgKMI99QIgjOWGOJMjTBDUKrNKgzPMyznUupJbICXuIe/lCuENimsL5UAJJtLR
 SSSx8ytatbODn9hoQ4Hin0HMXrQkp8Wc=
X-Received: by 2002:a67:b142:0:b0:41b:dc0c:a668 with SMTP id
 z2-20020a67b142000000b0041bdc0ca668mr14612463vsl.7.1678363737752; 
 Thu, 09 Mar 2023 04:08:57 -0800 (PST)
X-Google-Smtp-Source: AK7set/KYfFbs/4NU6PboAs+3I04QRcUHLvbwtg4wYaLCrzcT6hM4MxAPQ6ScOmyaz5owgiqB0HWKHhaCrQVbR3Bxak=
X-Received: by 2002:a67:b142:0:b0:41b:dc0c:a668 with SMTP id
 z2-20020a67b142000000b0041bdc0ca668mr14612454vsl.7.1678363737477; Thu, 09 Mar
 2023 04:08:57 -0800 (PST)
MIME-Version: 1.0
References: <20230309114430.33684-1-hreitz@redhat.com>
 <88de2e68-61e2-9397-b202-d611247002ba@redhat.com>
In-Reply-To: <88de2e68-61e2-9397-b202-d611247002ba@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 9 Mar 2023 13:08:46 +0100
Message-ID: <CABgObfZkSt6-0-vKkUtiWUy1TtHS_kEiYM2wRh+MfjTXmW497A@mail.gmail.com>
Subject: Re: [PATCH for-8.0] ide: Fix manual in-flight count for TRIM BH
To: Hanna Czenczek <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Fiona Ebner <f.ebner@proxmox.com>, 
 John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Thu, Mar 9, 2023 at 1:05=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com> =
wrote:
> I think having to do this is problematic, because the blk_drain should
> leave no pending operation.
>
> Here it seems okay because you do it in a controlled situation, but the
> main thread can also issue blk_drain(), or worse bdrv_drained_begin(),
> and there would be pending I/O operations when it returns.
>
> Unfortunately I don't have a solution (I'm not considering the idea of
> using disable_request_queuing and having even more atomics magic in
> block/block-backend.c), but I'll read the thread.

Hmm, what about making blk_aio_prwv non-static and calling
bdrv_co_pdiscard directly from IDE?

Paolo


