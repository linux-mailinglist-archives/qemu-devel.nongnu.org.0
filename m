Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5037D5F1004
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 18:30:41 +0200 (CEST)
Received: from localhost ([::1]:50060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeIuN-0007yu-VW
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 12:30:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oeIq2-00029u-JD
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 12:26:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oeIpv-0001ai-Od
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 12:26:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664555162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7dMy7sNchcnHGktZpQ64pSeOGzChqVNiKG3//BJ0MLQ=;
 b=TZ9t9iUTV8pzegpCVDEZa+T7wUxYX98Y3aJZBFZWEehlJR4aGXjS29kSKpXWIonZjFqtp5
 aPc5+6pGJHKlmnfGiZRal6hmPXS8wS9G7Q1DgMohoRdiKijP2MTX7dHKT0LWJQtjcS+4Eq
 YRdORe5EmWPdkLPayAohKYqe2X6QEA8=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-339-8KbtsIDVMC2Ae1c6Chn4HA-1; Fri, 30 Sep 2022 12:26:00 -0400
X-MC-Unique: 8KbtsIDVMC2Ae1c6Chn4HA-1
Received: by mail-ua1-f72.google.com with SMTP id
 a4-20020ab05684000000b003bf05973a24so1692152uab.23
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 09:26:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=7dMy7sNchcnHGktZpQ64pSeOGzChqVNiKG3//BJ0MLQ=;
 b=3UwZhXSv+90djvuClnBNkcYIoNOYoOW31Gj00rzoaqvQj+aH6w3ongUyl0LDijJxJ+
 Iilm/K1XwhDm0LORONGgRuHyGuWSvdiFUEXMuoAwhEygkk5tSTNpd7e+rxjmYsDvVRm3
 1yXYiWoyk6F45zCOl/72ddaglCAYQg20sfkkR2BLoxBjJKVkRytw+ZlzHj5JQ67JeFgA
 JGUCCqNaDTbR7RtIP2WVfNQfpCmEVAEMLAhJhqJSbm2nSwljJC+zDlGOgFXOctZxiH0e
 ZjZrb6BuFlKxjqkHG0Ju5vg7Zka3t+Gku05eK3l44s2LujILf2PQaGCnMv2HCrjVeUH/
 8tUg==
X-Gm-Message-State: ACrzQf1mtthDypLjQKnSqqqocADFDQiK7oZJwyuOzm2UdZ2J9MyY7SBm
 PCYpA7xN2+L56WobNJDNHm4pn2ZJqFWOtx2xLZGAjSqyNcXWUJxgpeEd3glmBw45IlUgws9sR5J
 VsrNoVf8+AZFFwQbG3MuzhikHl1wGeCw=
X-Received: by 2002:ab0:6f94:0:b0:3d1:d6e5:5de6 with SMTP id
 f20-20020ab06f94000000b003d1d6e55de6mr4972597uav.51.1664555160069; 
 Fri, 30 Sep 2022 09:26:00 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4ycm/zxK97lYdn8JrSIetuzcnq9vWx8OguNspm1vxuThgYYD4zY1i1sDGzawnEU8EAU4lpSpxxKqWYHb433PM=
X-Received: by 2002:ab0:6f94:0:b0:3d1:d6e5:5de6 with SMTP id
 f20-20020ab06f94000000b003d1d6e55de6mr4972587uav.51.1664555159755; Fri, 30
 Sep 2022 09:25:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220928180603.101533-1-venu.busireddy@oracle.com>
 <CABgObfYXMBnVp2NqhyxOGjppDPc81Qk_fKepF6uzTkOBMoj2zA@mail.gmail.com>
 <YzYcqNqVCiobf/IB@lt>
 <CABgObfbydWZbUvgQVA4ACaR8GgZuft8c9bMTm7_bM86P44vnig@mail.gmail.com>
 <YzcAK23fRnohvXNT@lt>
In-Reply-To: <YzcAK23fRnohvXNT@lt>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 30 Sep 2022 18:25:48 +0200
Message-ID: <CABgObfZ-8T+=PgPuxtTc5GHgK9sGGTs_HUrcWG0N3kXXLXAZnQ@mail.gmail.com>
Subject: Re: [PATCH v3] virtio-scsi: Send "REPORTED LUNS CHANGED" sense data
 upon disk hotplug events.
To: Venu Busireddy <venu.busireddy@oracle.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>, 
 "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Fri, Sep 30, 2022 at 4:42 PM Venu Busireddy
<venu.busireddy@oracle.com> wrote:
> > > Immediately after a hotunplug event, qemu (without any action from
> > > the guest) processes a REPORT_LUNS command on the lun 0 of the device
> > > (haven't figured out what causes this).
> >
> > There is only one call to virtio_scsi_handle_cmd_req_prepare and it
> > takes the command from the guest, are you sure it is without any
> > action from the guest?
>
> I am sure, based on what I am observing. I am running the scsitrace
> (scsitrace -n vtioscsi -v) command on the Solaris guest, and I see no
> output there.

Do you have the sources to the driver and/or to the scsitrace dtrace
script? Something must be putting the SCSI command in the queue.
Perhaps the driver is doing so when it sees an event? And if it is
bypassing the normal submission mechanism, the REPORT LUNS commands is
hidden in scsitrac; that in turn retruns a unit attention and steals
it from the other commands such as TEST UNIT READY, but that's a guest
driver bug.

But QEMU cannot just return the unit attention twice. I would start
with the patch to use the bus unit attention mechanism. It would be
even better to have two unit tests that check the behavior prescribed
by the standard: 1) UNIT ATTENTION from TEST UNIT READY immediately
after a hotunplug notification; 2) no UNIT ATTENTION from REPORT LUNS
and also no UNIT ATTENTION from a subsequent TEST UNIT READY command.
Debugging the guest is a separate step.

Paolo

> However, for whatever it's worth, if I have two or more luns
> on a virtio-scsi adapter, the spurious REPORT_LUNS processing
> (virtio_scsi_handle_cmd_req_prepare() call) occurs only when
> I hotunplug a lun while the other luns are still plugged in,
> until the last lun is unplugged. I do not see the spurious call to
> virtio_scsi_handle_cmd_req_prepare() when the last lun is unplugged,
> whether that was the only lun present, or if it was the last of many.
>
> Venu
>


