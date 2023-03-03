Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBC66A9219
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 09:03:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY0Mq-0007EJ-8D; Fri, 03 Mar 2023 03:02:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pY0Mg-0007CK-CG
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:02:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pY0Me-0001jq-MU
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:02:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677830522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LuZcAk/35uQKnnlIDJFa40OOdO1s93AlFMT75MuMKSQ=;
 b=VGyoWJUMYquFBbennvYMqXpujF/Gv+8bJwb436Bf/D0ZXZoM2y+S4xQSL1dtWFuJ54CBS5
 SVlyuyNnpCatsZsJNa8euBY2TEUelvF1ASy44EGyL08FwO38mqLn15jc8pk0+Y6W7mKtsE
 s0A4rkQ6tN1GHOImLdLnLnRLVQHrSf4=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-653-tTl5BOuLOluostmKEsuRSQ-1; Fri, 03 Mar 2023 03:02:01 -0500
X-MC-Unique: tTl5BOuLOluostmKEsuRSQ-1
Received: by mail-oo1-f69.google.com with SMTP id
 c9-20020a4a4f09000000b005178610a793so684368oob.3
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 00:02:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677830521;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LuZcAk/35uQKnnlIDJFa40OOdO1s93AlFMT75MuMKSQ=;
 b=Yvome1UU3tRPN4qMAHSyuukqzqcVfHEdLL9BdSvSBTRihnBMm3rksUJ+ajh4jkB98k
 1kBRyxgdses4NWwuslWhE4nt5LgJa795flyBYvw/JmKenVDLzprCcjJtYlAUUV8x9fQP
 tAVVHLs9Vhu6CKQQhrptADPsyytmIFq3aavkTZpw67BxRDcVjUAcJRG234VsbNQrHh50
 M+3uqrv9Vx9A6OFsBc+UmEHaoDHyTuVu4HaKF02tPwb9teED1bQrzFr7wb+9+ykakvD/
 /qFgLE9GrvYFTNoAMtSTbiZ3w8EyS7bAG4p/blFG1QWDLKliUJhnzO288Bv9KBHwUqNp
 3ptw==
X-Gm-Message-State: AO0yUKUdMP+r8k37E7Kr05BA9KUrgRcUlizJUXaQlOUW3BVIm3w6cokx
 hcwSYaIVcTBwF75+mp7tmbTM68Yf5qtbfs1sPIqs7lf9jCBvfQNRk787nWme19jf8ATCpdjqCIL
 BaEN5Qpv0KE/VO2/4g2fQ+VsaD/3E7OA=
X-Received: by 2002:aca:1216:0:b0:383:c688:a8e0 with SMTP id
 22-20020aca1216000000b00383c688a8e0mr249682ois.9.1677830521152; 
 Fri, 03 Mar 2023 00:02:01 -0800 (PST)
X-Google-Smtp-Source: AK7set+upSTf48oWqLTqQnA6Lah2hq893e/j1gock93zWY1fXEPDvPyiIKei3V7jI1J6Zo7/jfJrRLUtTLSt6NLavT8=
X-Received: by 2002:aca:1216:0:b0:383:c688:a8e0 with SMTP id
 22-20020aca1216000000b00383c688a8e0mr249661ois.9.1677830519993; Fri, 03 Mar
 2023 00:01:59 -0800 (PST)
MIME-Version: 1.0
References: <20230213101048.94519-1-philmd@linaro.org>
 <e432c04d-6682-596f-c5bc-5266a38bbe0d@linaro.org>
 <092be240-8e2f-4ef1-aefc-f5622be4b314@linaro.org>
In-Reply-To: <092be240-8e2f-4ef1-aefc-f5622be4b314@linaro.org>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 3 Mar 2023 16:01:49 +0800
Message-ID: <CACGkMEv4F1CZdPgU+dbGtDxdEp2aV1m=qLxpHrXpaTP6ZwdKAQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] hw/net/eepro100: Finish QDev conversion
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, 
 Thomas Huth <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Stefan Weil <sw@weilnetz.de>
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

On Tue, Feb 28, 2023 at 9:40=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> Hi Jason, do you Ack this series?

Sorry for the late reply.

I've queued this series.

Thanks

>
> On 23/2/23 16:16, Philippe Mathieu-Daud=C3=A9 wrote:
> > ping
> >
> > On 13/2/23 11:10, Philippe Mathieu-Daud=C3=A9 wrote:
> >> Convert EEPRO100 to use the latest QDev conventions / style.
> >>
> >> v1:
> >> https://lore.kernel.org/qemu-devel/20230213070820.76881-9-philmd@linar=
o.org/
> >>
> >> Based-on: <20230213070423.76428-1-philmd@linaro.org>
> >>            hw/qdev: Housekeeping around qdev_get_parent_bus()
> >>
> >> Philippe Mathieu-Daud=C3=A9 (7):
> >>    hw/net/eepro100: Abort if pci_add_capability() ever fail
> >>    hw/net/eepro100: Introduce TYPE_EEPRO100 QOM abstract parent
> >>    hw/net/eepro100: Convert reset handler to DeviceReset
> >>    hw/net/eepro100: Pass E100PCIDeviceInfo as class init data
> >>    hw/net/eepro100: Remove instance
> >>      EEPRO100State::has_extended_tcb_support
> >>    hw/net/eepro100: Remove instance's EEPRO100State::device
> >>    hw/net/eepro100: Replace DO_UPCAST(EEPRO100State) by EEPRO100()
> >>
> >>   hw/net/eepro100.c | 147 ++++++++++++++++++++++----------------------=
--
> >>   1 file changed, 69 insertions(+), 78 deletions(-)
> >>
> >
>


