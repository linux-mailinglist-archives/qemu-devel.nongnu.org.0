Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B57698B74
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 05:46:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSW95-0007im-Tt; Wed, 15 Feb 2023 23:45:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pSW91-0007iU-To
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 23:45:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pSW8y-0004f8-3I
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 23:45:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676522714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/H1ovZXtVBliWqbHWj/v7woZZhB8R4F0J+5t6FnGayk=;
 b=JIa4uNk2IAooFh5wQpe+GlAKFkL1SD/VL0bDA6DULvc4Fp0GxvWI42Q65pNUD8qMaP70tF
 7dgMASVffdxaZo+2SqqplJ+/4BNtMGjYv2aGSZel3mEwlv3spXQdG22VwldL4QMI5UOJUH
 aUjOsFIfaG9KnaYkmdAHgzst2uLEhqE=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-296-FHMozzvVOaWhtpj2fBUkSg-1; Wed, 15 Feb 2023 23:45:13 -0500
X-MC-Unique: FHMozzvVOaWhtpj2fBUkSg-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-163de0d817cso589593fac.13
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 20:45:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/H1ovZXtVBliWqbHWj/v7woZZhB8R4F0J+5t6FnGayk=;
 b=Fk69Kyrsj1FWilyE8Im19Wwf0Zu/8ldPGFRKB8FJ5D3rN5ybMEfH4Q8keV07Nw62ai
 vWCUd6BNhSYwIgLAs3oxof5BgwxBeEgQuuMe1TD8cwj5nMreXFrU+8T6HNyV2A+C8N3u
 PJyuhEE/wxFJh8S6VYQM6hxlOd6ffMYoU5aXzD5Qwvipn0lXA9wy17sxhn87DxXRmh5r
 4vpGscjoG2k2b1XDS9+fkjEulIKmY1dcUWW5zXK38pynaSW4kYsfPE4zeVpSAI5d/K8F
 R7vGeNJH7XXKEIi26ocoArkcgMeLMHb72dBMnq7YsZvZIfdzvjNzQtITZQm9N7YWSo8Z
 7wog==
X-Gm-Message-State: AO0yUKXc06EmEGKHDO7OfdIwNWigYzxJY/JDwhnuT76JfntkjguIssCp
 UnhHTpP1fZ0UxVICcyq1JfD0hmtivIlE0zcNfJOvoJKAAW0zwt7I7mMhIVetYUAstC9YJEEJPc4
 m6xfjTntrC7Xh7OOvAZt8j0vOcPNrips=
X-Received: by 2002:a05:6808:3186:b0:37d:5d77:e444 with SMTP id
 cd6-20020a056808318600b0037d5d77e444mr59416oib.35.1676522712095; 
 Wed, 15 Feb 2023 20:45:12 -0800 (PST)
X-Google-Smtp-Source: AK7set9vnHFiVuXnUPxt3xBzsr6xLisvhT6g4tTQ2hDmbEnZhRR2GRY6y98Rzg3CzdgPC7qkt2i3ihoG4wlvqTc/duQ=
X-Received: by 2002:a05:6808:3186:b0:37d:5d77:e444 with SMTP id
 cd6-20020a056808318600b0037d5d77e444mr59414oib.35.1676522711812; Wed, 15 Feb
 2023 20:45:11 -0800 (PST)
MIME-Version: 1.0
References: <20230214061140.36696-1-jasowang@redhat.com>
 <CAFEAcA937Q=KqVNbKO_hDDNwzbcP7BD_DQFm-rhzKGKBCp1XGA@mail.gmail.com>
 <CAFEAcA-OAe3EMA6RwZEiL+o_2Q96TO=gZ+=Pu2rdhjWqW=k62Q@mail.gmail.com>
 <ebbdc563-75b2-0f4e-6d47-0443c50a4310@redhat.com>
In-Reply-To: <ebbdc563-75b2-0f4e-6d47-0443c50a4310@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 16 Feb 2023 12:45:00 +0800
Message-ID: <CACGkMEvdgZ5NCVkh5RzOjc_DtnGX7k7dSYmcgKA0khpCBWqkrg@mail.gmail.com>
Subject: Re: [PULL 00/10] Net patches
To: Laurent Vivier <lvivier@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Qiang Liu <cyruscyliu@gmail.com>,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Wed, Feb 15, 2023 at 10:39 PM Laurent Vivier <lvivier@redhat.com> wrote:
>
> On 2/14/23 15:30, Peter Maydell wrote:
> > On Tue, 14 Feb 2023 at 14:29, Peter Maydell <peter.maydell@linaro.org> wrote:
> >>
> >> On Tue, 14 Feb 2023 at 06:11, Jason Wang <jasowang@redhat.com> wrote:
> >>>
> >>> The following changes since commit f670b3eec7f5d1ed8c4573ef244e7b8c6b32001b:
> >>>
> >>>    Merge tag 'migration-20230213-pull-request' of https://gitlab.com/juan.quintela/qemu into staging (2023-02-13 11:54:05 +0000)
> >>>
> >>> are available in the git repository at:
> >>>
> >>>    https://github.com/jasowang/qemu.git tags/net-pull-request
> >>>
> >>> for you to fetch changes up to e4b953a26da11d214f91516cb9b0542eab5afaa0:
> >>>
> >>>    vdpa: fix VHOST_BACKEND_F_IOTLB_ASID flag check (2023-02-14 14:00:30 +0800)
> >>>
> >>> ----------------------------------------------------------------
> >>>
> >>> ----------------------------------------------------------------
> >>
> >> xlnx-can-test fails on multiple CI hosts:
> >>
> >> https://gitlab.com/qemu-project/qemu/-/jobs/3767000949
> >> https://gitlab.com/qemu-project/qemu/-/jobs/3767000974
> >> https://gitlab.com/qemu-project/qemu/-/jobs/3767000994
> >> https://gitlab.com/qemu-project/qemu/-/jobs/3767000970
> >> https://gitlab.com/qemu-project/qemu/-/jobs/3767001009
> >> https://gitlab.com/qemu-project/qemu/-/jobs/3767000851
> >> https://gitlab.com/qemu-project/qemu/-/jobs/3767000849
> >
> > more specifically, it asserts:
> >
> > ERROR:../tests/qtest/xlnx-can-test.c:96:read_data: assertion failed
> > (int_status == ISR_RXOK): (0 == 16)
>
> It seems the problem is with the loopback test (net/can/can_loopback).
>
> as fifo32_num_used() and fifo32_num_free() return the number of uint32_t slots, the patch
> should be fixed with (remove the "4 *"):
>
> diff --git a/hw/net/can/xlnx-zynqmp-can.c b/hw/net/can/xlnx-zynqmp-can.c
> index 55d3221b4980..8a56734b3ca2 100644
> --- a/hw/net/can/xlnx-zynqmp-can.c
> +++ b/hw/net/can/xlnx-zynqmp-can.c
> @@ -451,7 +451,7 @@ static void transfer_fifo(XlnxZynqMPCANState *s, Fifo32 *fifo)
>       }
>
>       while (!fifo32_is_empty(fifo)) {
> -        if (fifo32_num_used(fifo) < (4 * CAN_FRAME_SIZE)) {
> +        if (fifo32_num_used(fifo) < CAN_FRAME_SIZE) {
>               g_autofree char *path = object_get_canonical_path(OBJECT(s));
>               qemu_log_mask(LOG_GUEST_ERROR, "%s: data left in the fifo is not"
>                             " enough for transfer.\n", path);
> @@ -470,7 +470,7 @@ static void transfer_fifo(XlnxZynqMPCANState *s, Fifo32 *fifo)
>                * that it transmits.
>                */
>               if (fifo32_is_full(&s->rx_fifo) ||
> -                    (fifo32_num_free(&s->rx_fifo) < (4 * CAN_FRAME_SIZE))) {
> +                    (fifo32_num_free(&s->rx_fifo) < CAN_FRAME_SIZE)) {
>                   ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, RXOFLW, 1);
>               } else {
>                   for (i = 0; i < CAN_FRAME_SIZE; i++) {
>
>
> Thanks,
> Laurent

Exactly, I will squash this and send a new pull request.

Thanks

>


