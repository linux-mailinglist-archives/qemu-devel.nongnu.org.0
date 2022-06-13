Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5486F5485E8
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 17:03:34 +0200 (CEST)
Received: from localhost ([::1]:55908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0lbJ-0007yh-1e
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 11:03:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsuvorov@redhat.com>)
 id 1o0lZL-00079f-22
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 11:01:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsuvorov@redhat.com>)
 id 1o0lZI-0003nW-GP
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 11:01:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655132486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/w+b0TelbwuFVDrY2QIyuumk/Fi/j5Trk6odQUVOgPU=;
 b=dBNbTd9ObrS/FWUNQZIPipJ3zG43/GbDTN6PIj2tZk6FcjNoo+WI3aJMBdO+gmQ/boDZz8
 jM1Ac0csU7UCxCoWhPheoot6QT6n0qxn1wO3j0231icg0KfCzS5Mhx2GuVfxfFkOgp4MH3
 BOtteF6vVPDfvqPJsdRf3F9wYLggiiA=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-42-RI3mEStGM6ehk3FAFFvyJQ-1; Mon, 13 Jun 2022 11:01:24 -0400
X-MC-Unique: RI3mEStGM6ehk3FAFFvyJQ-1
Received: by mail-oi1-f198.google.com with SMTP id
 r7-20020a056808210700b0032f1d0ebb87so3278132oiw.7
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 08:01:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/w+b0TelbwuFVDrY2QIyuumk/Fi/j5Trk6odQUVOgPU=;
 b=W5OwaEb877vxKgpmSG51wXEcmXY5weSKoUvpYNN/HBpGwBq8cSFVVVna4RtTWLY7wO
 AnwmfvqDcO4H+wGcjPRKi6Y4bpmQSconymChajJneoXlqY9dEK4+WYfCzENs9/UedNvr
 h/zJtKcTplwqClQ+xOQsezigqhHbnv6i3Fbnd/Im5FeoaQ6VgGbtHLqKx/Cgo6jS0q3O
 2Harxp37LrwoW4PY0rWBAeR/6Dg+whlXPCwzuGohclSNoN+7mGTB5cIfn4YLw0k42PFp
 D4vT9OoQgLKN92YO25qFiJSiqKmksZKNDKx9ILOEIUND/81MHimYVh0kdp9xgYzAawjx
 FwSA==
X-Gm-Message-State: AJIora9TjuLkjuF5xl0fm9YWwkySexqHWsKZnVc48Jda8wl8oKIWDcDt
 A3Kr9QnepR0Sv+jNfCUUMuJ5P1aheLIB89nizb/2DKRcGXYCRmfZPv/NuzQlroDofpVSWgFG2rb
 C2si60pMcVJSf2FsjoBade3IJGCSq4gs=
X-Received: by 2002:a05:6871:93:b0:fe:23b6:6efb with SMTP id
 u19-20020a056871009300b000fe23b66efbmr47742oaa.201.1655132483566; 
 Mon, 13 Jun 2022 08:01:23 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uAUwUn5vKfRnFgGzv7F2V3dOJJ3VC02BK7NFHh+SO5RcEjhtxFe+00ab0nA6xoJm9zu9LErRX2fREzRpBgzhA=
X-Received: by 2002:a05:6871:93:b0:fe:23b6:6efb with SMTP id
 u19-20020a056871009300b000fe23b66efbmr47726oaa.201.1655132483388; Mon, 13 Jun
 2022 08:01:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220531145147.61112-1-jusual@redhat.com>
 <YpY0/Pc3uoA9QQD/@stefanha-x1.localdomain>
In-Reply-To: <YpY0/Pc3uoA9QQD/@stefanha-x1.localdomain>
From: Julia Suvorova <jusual@redhat.com>
Date: Mon, 13 Jun 2022 17:01:10 +0200
Message-ID: <CAMDeoFUxG7B67BCm4nb303VEwBdiD=JNi_OWSaxirThWnTd6LA@mail.gmail.com>
Subject: Re: [PATCH] hw/mem/nvdimm: fix error message for 'unarmed' flag
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>, 
 Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsuvorov@redhat.com;
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

On Tue, May 31, 2022 at 5:32 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Tue, May 31, 2022 at 04:51:47PM +0200, Julia Suvorova wrote:
> > In the ACPI specification [1], the 'unarmed' bit is set when a device
> > cannot accept a persistent write. This means that when a memdev is
> > read-only, the 'unarmed' flag must be turned on. The logic is correct,
> > just changing the error message.
> >
> > [1] ACPI NFIT NVDIMM Region Mapping Structure "NVDIMM State Flags" Bit 3
> >
> > Signed-off-by: Julia Suvorova <jusual@redhat.com>
> > ---
> >  hw/mem/nvdimm.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

It seems like Xiao is not active, whose tree should this patch go to?

Best regards, Julia Suvorova.


