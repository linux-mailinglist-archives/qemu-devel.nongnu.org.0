Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D9069A515
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 06:27:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pStG6-0003Pr-Qc; Fri, 17 Feb 2023 00:26:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pStG4-0003PY-0m
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 00:26:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pStFx-0004Pb-Mm
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 00:26:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676611559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3I6b/id4Nv8hBz4fV4YxRlZPV5Y/kaofXCvKZL2stFA=;
 b=WJaEyo0rfrzAaYHy1lWddL+hzXF00izttkoy1S6tDdkNtYzupYwyo9+Y7e7R6qp5Z5FLrP
 Z4GMgu+aQHump3hxjTwsDfuRvipWhWFytZaDRiywhj5S8tMA0QidQVhHnvq7DVxWKCfefa
 uHbVgaqnKvtSggHKrTceFd1+m30dpOI=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-215-TFWrZykpMB2cikYiNvLsGw-1; Fri, 17 Feb 2023 00:25:58 -0500
X-MC-Unique: TFWrZykpMB2cikYiNvLsGw-1
Received: by mail-oi1-f197.google.com with SMTP id
 s15-20020a0568080b0f00b0037874eb34c8so120076oij.19
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 21:25:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3I6b/id4Nv8hBz4fV4YxRlZPV5Y/kaofXCvKZL2stFA=;
 b=x2CAauG6SPy2uDTtaNwbbFtwhFCgBybzeZtMuBk9L+l6tx5iywc/ZR8yPnWOegqpPt
 r8JELUwQ6ZaOrNAEXSB3Hdl3x9diHxXx/wyeBQoDYurZYM84n0owz3ed0kBDY+aobXRc
 qLGwfAOlf4eiJHdXZelZ1sfXXSYpt2x1EURIrHlf0+KL5+Llx5kemoSXdVGZPwNRfj8l
 224cx82VbROmVpgrYeF9DJhu/WDAWnlLKZktZnq2+xEw8TzaisfMg1edoDV56oSblmDK
 RIWzhB2GEHIVgqX+wifz2xI7/vRXn2ioaA97xX67iZx/L9+SgT8Pk7f3sv7p72R3a7VV
 jJEA==
X-Gm-Message-State: AO0yUKXW22Yh1+KaCqqdo/eTGj08dEAGogKBylb7/qsTOgfAiqtcAYZu
 ASLumkmKn2hTJnTnhaUsA/0KqET7ruHnmG9j8tXrNJyClTD99uMNDLjuqyYKr8Uzl+TCdrMlGc7
 dYSivwIMZEjhqVn99euTNG/z2dy1AgWw=
X-Received: by 2002:a05:6871:84ca:b0:16a:2c1a:e416 with SMTP id
 sw10-20020a05687184ca00b0016a2c1ae416mr302017oab.35.1676611557458; 
 Thu, 16 Feb 2023 21:25:57 -0800 (PST)
X-Google-Smtp-Source: AK7set/dyR15sR5mg+tIZ4f1PrnjfbBWylD8RtAPfFrLQSz/NN3BUmf80umTzezS8+wW8Jl1Vh6OBE70mE7Cozhkv/E=
X-Received: by 2002:a05:6871:84ca:b0:16a:2c1a:e416 with SMTP id
 sw10-20020a05687184ca00b0016a2c1ae416mr302016oab.35.1676611557247; Thu, 16
 Feb 2023 21:25:57 -0800 (PST)
MIME-Version: 1.0
References: <20230216052424.50926-1-jasowang@redhat.com>
 <d2571e12-661b-60f0-1afd-d3624477ea5c@linaro.org>
In-Reply-To: <d2571e12-661b-60f0-1afd-d3624477ea5c@linaro.org>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 17 Feb 2023 13:25:46 +0800
Message-ID: <CACGkMEvFMewCpcPwCCR69-eTQXcrvDGnQ6_CYzgQ4Arh-76Pow@mail.gmail.com>
Subject: Re: [PULL V2 00/10] Net patches
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, 
 Qiang Liu <cyruscyliu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Thu, Feb 16, 2023 at 4:00 PM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> Hi Jason,
>
> On 16/2/23 06:24, Jason Wang wrote:
> > The following changes since commit 6a50f64ca01d0a7b97f14f069762bfd88160=
f31e:
> >
> >    Merge tag 'pull-request-2023-02-14' of https://gitlab.com/thuth/qemu=
 into staging (2023-02-14 14:46:10 +0000)
> >
> > are available in the git repository at:
> >
> >    https://github.com/jasowang/qemu.git tags/net-pull-request
> >
> > for you to fetch changes up to 5e53a346d8bd2bd22522e1e7abd8f122673e4adf=
:
> >
> >    vdpa: fix VHOST_BACKEND_F_IOTLB_ASID flag check (2023-02-16 13:17:57=
 +0800)
> >
> > ----------------------------------------------------------------
> >
> > Changes since V1:
> > - Fix the wrong guest error detection in xlnx-zynqmp-can
> >
> > ----------------------------------------------------------------
> > Christian Svensson (1):
> >        net: Increase L2TPv3 buffer to fit jumboframes
> >
> > Eugenio P=C3=A9rez (1):
> >        vdpa: fix VHOST_BACKEND_F_IOTLB_ASID flag check
> >
> > Fiona Ebner (1):
> >        hw/net/vmxnet3: allow VMXNET3_MAX_MTU itself as a value
> >
> > Joelle van Dyne (1):
> >        vmnet: stop recieving events when VM is stopped
> >
> > Laurent Vivier (1):
> >        net: stream: add a new option to automatically reconnect
> >
> > Qiang Liu (2):
> >        hw/net/lan9118: log [read|write]b when mode_16bit is enabled rat=
her than abort
> >        hw/net/can/xlnx-zynqmp-can: fix assertion failures in transfer_f=
ifo()
>
> Can you have a look at this comment from v1?
> https://lore.kernel.org/qemu-devel/572fcb76-b2f7-20ca-0701-e22dd4e4cb59@l=
inaro.org/

For some reason, I miss this.

I will drop this patch from the pull request now.

Thanks

>


