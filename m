Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BE06E1AA7
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 05:15:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pn9sx-0007l7-7b; Thu, 13 Apr 2023 23:14:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pn9sv-0007ks-NI
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 23:14:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pn9ss-0006KM-8h
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 23:14:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681442035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8BnvEXJZeyUWxz5hpYxMJ5mCgKw8goEumDwK1Pa3XQQ=;
 b=Mlp35WtFZR/aQmRwDdSaZ6JHH86E+U1yYPg/YyottoC72cZRspx79ZalhgKr+BHVXvG3T9
 T0IGiZ5dyyagCrw/S1GOsX1Wh3OOu1Xa4JQhcA0kSKnq1a9BtsCLgDQGSRMocjkqmz8M5Q
 vxScxBrqWDVRzIBB8UeBeXHaBPHEY5w=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-7xs2Df97Pwuf2daxt0nFGg-1; Thu, 13 Apr 2023 23:13:53 -0400
X-MC-Unique: 7xs2Df97Pwuf2daxt0nFGg-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-187aef83ec8so404273fac.18
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 20:13:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681442032; x=1684034032;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8BnvEXJZeyUWxz5hpYxMJ5mCgKw8goEumDwK1Pa3XQQ=;
 b=PcvBg831hJM4avMJGfda+4kgW8R4ctkXNRGh9bD5vA3/uGsBljUU1P2LnOqGSDrx9W
 mpDHw2s8HNzqmjJppV1LE+zCLYMrO/oZB/muLoCFAU7Ne07ZWSdX8AGDaa/fAy0Ht9RJ
 iJA4I88bw2Rx9gFeFpsx69zJaHO756t4J1CfZ15I1gHeEwtTLURt6nILVdVfpsMwCFTe
 s8kbUZl2TSi2PngoEL9LemiWO+SDtO7WYsb9PDttbPvn5NfNdXOgjUDtNjsVC6HsWszC
 PoYKuVdgizy0eWnAJseUi60JE4ufbmo3TqDybG2hql8tZd3DcWJLYaP5otCuiEJv0NY2
 isVg==
X-Gm-Message-State: AAQBX9eITS0SamVqMil3NpXQSMBdTqS/My1iG1Y34V+q/xiz2tigf5GE
 hvVYrWSWAaYTqm/vnuq00k8ZQn9vp+K4U6H1puWcKyBZhQdXP/fCqyWewqh0LAs4opp3yF4Sbnn
 oVexLibFELCaRgn3bbBUwg0Z5PLw41Zs=
X-Received: by 2002:a05:6808:2129:b0:37f:a2ad:6718 with SMTP id
 r41-20020a056808212900b0037fa2ad6718mr3152651oiw.3.1681442032315; 
 Thu, 13 Apr 2023 20:13:52 -0700 (PDT)
X-Google-Smtp-Source: AKy350bgJZXA/j9XvHP3ab1s5x6xe2wUgIJE4q+NVPm2HC4zlWMLK3+/6FZsIKp+tg4nm8nQU2EdRevP14U7VDcWIn8=
X-Received: by 2002:a05:6808:2129:b0:37f:a2ad:6718 with SMTP id
 r41-20020a056808212900b0037fa2ad6718mr3152645oiw.3.1681442032077; Thu, 13 Apr
 2023 20:13:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230413171946.2865726-1-stefanha@redhat.com>
 <CAFEAcA8J4zWVL=dBAY1KYxU_im392xU1rU=GN=yQKhG6Og=SAQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8J4zWVL=dBAY1KYxU_im392xU1rU=GN=yQKhG6Og=SAQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 14 Apr 2023 11:13:41 +0800
Message-ID: <CACGkMEtgurBiv7wZdF183VrCXSts2uB6SQE3mSjj9g_8byd1+g@mail.gmail.com>
Subject: Re: [PATCH] rtl8139: fix large_send_mss divide-by-zero
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org, 
 Alexander Bulekov <alxndr@bu.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

On Fri, Apr 14, 2023 at 2:24=E2=80=AFAM Peter Maydell <peter.maydell@linaro=
.org> wrote:
>
> On Thu, 13 Apr 2023 at 18:21, Stefan Hajnoczi <stefanha@redhat.com> wrote=
:
> >
> > If the driver sets large_send_mss to 0 then a divide-by-zero occurs.
> > Even if the division wasn't a problem, the for loop that emits MSS-size=
d
> > packets would never terminate.
> >
> > Solve these issues by skipping offloading when large_send_mss=3D0.
>
> > diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
> > index 5a5aaf868d..5f1a4d359b 100644
> > --- a/hw/net/rtl8139.c
> > +++ b/hw/net/rtl8139.c
> > @@ -2154,6 +2154,9 @@ static int rtl8139_cplus_transmit_one(RTL8139Stat=
e *s)
> >
> >                  int large_send_mss =3D (txdw0 >> CP_TC_LGSEN_MSS_SHIFT=
) &
> >                                       CP_TC_LGSEN_MSS_MASK;
> > +                if (large_send_mss =3D=3D 0) {
> > +                    goto skip_offload;
> > +                }
>
> Looks like 0 is the only problematic value for the code, so
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

I think it's not worth 8.0. So I've queued this.

If anyone think it is, Peter may queue this directly with

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

>
> thanks
> -- PMM
>


