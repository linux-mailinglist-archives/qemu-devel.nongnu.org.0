Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F4E5F06BD
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 10:43:46 +0200 (CEST)
Received: from localhost ([::1]:35934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeBcW-0005Zw-5W
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 04:43:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oeBar-0004Bv-SJ
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 04:42:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oeBao-0007bu-G0
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 04:42:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664527317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gs/fEhCldPAbYb7R+vYACRy5NQyOWxFepgm/t8R8sG4=;
 b=aXuy4hADhmQuKG6LfcnYHPHhN4db/wV2+aOShdqu9oH6tUit+77XwcOG5rDgXExfhyXBFS
 WfMqF2o2d0PU8gxeO4RW6AlZ5lmjFvT8ezGr/MsRuy4Hb0KPR+dip515IZa2la8QNr7fo9
 x9DTtHtd69qiEqjsMXBxE7WL6DJrC9Q=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-599-cmKztrKQPYuN5kuxLFz0gg-1; Fri, 30 Sep 2022 04:41:15 -0400
X-MC-Unique: cmKztrKQPYuN5kuxLFz0gg-1
Received: by mail-vk1-f199.google.com with SMTP id
 a78-20020a1f9851000000b003a7ed513454so1048780vke.18
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 01:41:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=gs/fEhCldPAbYb7R+vYACRy5NQyOWxFepgm/t8R8sG4=;
 b=wwks4eYi+mJKFq48uqavSKDTqB90Zq8V8PHLSaApVf614yuH6I4+b0GccmI3mlZsnq
 i6d6DMmSf/L09CyXPfD8To2agN2RsbVthF9ZV9R/S+TXTaFcHQNO+usveVpKFKkLT37c
 EQizt9h8ksFK6hbFODUkl7NmNBbuY6s9hft0OARnyr0i44z0moK1ajNdJHX1ZoaLxuvy
 HL1Dyw+q9VuY3pZmWXkDW3W6yh8WoIfw09vjc08bve+/Go7buAjBNeCBGZ8om4Vdc583
 1IkZw8GjYW01L0pn/xSiD9AmeUllGHLLlPGf8aO3Qg+RzYK4j794EmocZ3kaiaB83jpY
 4wCQ==
X-Gm-Message-State: ACrzQf0DfqUippBKhhF5QmGRdvw+lUKT2gJ8WkuFWtXq4bff8+0MpJvO
 /Gsw1xRqwkEU+2CtMxuq3aO/PngrFU/l/BCNkamfuwoycFsqTTQ1Uzkof+8XAYw6y9V4nq/XIvw
 4e+CZZEQYoJBH8VidLEcf83W9mNBGPgY=
X-Received: by 2002:a1f:2c93:0:b0:3a3:4904:aa91 with SMTP id
 s141-20020a1f2c93000000b003a34904aa91mr3775526vks.33.1664527275354; 
 Fri, 30 Sep 2022 01:41:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM42QmuQNP90Y5g5FyqPYOGmVB44ytLXZDqZcB0tUo+JjsLWschN7GmH4oFe0aeVlNp3gX/fAhZFVdesuZXRIjw=
X-Received: by 2002:a1f:2c93:0:b0:3a3:4904:aa91 with SMTP id
 s141-20020a1f2c93000000b003a34904aa91mr3775515vks.33.1664527275112; Fri, 30
 Sep 2022 01:41:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220928180603.101533-1-venu.busireddy@oracle.com>
 <CABgObfYXMBnVp2NqhyxOGjppDPc81Qk_fKepF6uzTkOBMoj2zA@mail.gmail.com>
 <YzYcqNqVCiobf/IB@lt>
In-Reply-To: <YzYcqNqVCiobf/IB@lt>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 30 Sep 2022 10:41:03 +0200
Message-ID: <CABgObfbydWZbUvgQVA4ACaR8GgZuft8c9bMTm7_bM86P44vnig@mail.gmail.com>
Subject: Re: [PATCH v3] virtio-scsi: Send "REPORTED LUNS CHANGED" sense data
 upon disk hotplug events.
To: Venu Busireddy <venu.busireddy@oracle.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>, 
 "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 30, 2022 at 12:31 AM Venu Busireddy
<venu.busireddy@oracle.com> wrote:
> > >            */
> > >           !(buf[0] == REQUEST_SENSE && d->sense_is_ua))) {
> > >          ops = &reqops_unit_attention;
> > > +        d->clear_reported_luns_changed = true;
> >
> > Any reason to have this flag, and not just clear
> > s->reported_luns_changed after scsi_req_new? Is it to handle the
> > invalid opcode case?
>
> Immediately after a hotunplug event, qemu (without any action from
> the guest) processes a REPORT_LUNS command on the lun 0 of the device
> (haven't figured out what causes this).

There is only one call to virtio_scsi_handle_cmd_req_prepare and it
takes the command from the guest, are you sure it is without any
action from the guest?

> scsi_req_new(): SCSIDevice = 0x557fed88fd40, bus = 0x557feda9f9c0, buf[0] = a0
> scsi_req_new(): sdev.key = 6, sdev.asc = 0x3f, sdev.ascq = 0x0e
> virtio_scsi_handle_cmd_req_prepare(): Exiting, reported_luns_changed = 0, VirtIOSCSI = 0x557feda9f750, SCSIDevice = 0x557fed88fd40, cdb[0] = 0xa0
> scsi_clear_unit_attention(): Entered, buf[0] = 0xa0, SCSIDevice = 0x557fed88fd40, key = 6, asc = 0x3f, ascq = 0x0e
> scsi_clear_unit_attention(): Exiting, buf[0] = 0xa0, SCSIDevice = 0x557fed88fd40, key = 0, asc = 0x00, ascq = 0x00
>
> As can be seen, before the guest does anything, we cleared the
> reported_luns_changed flag as well as the unit attention condition.

It is correct that REPORT LUNS clears the unit attention:

    /*
     * If a REPORT LUNS command enters the enabled command state, [...]
     * the device server shall clear any pending unit attention condition
     * with an additional sense code of REPORTED LUNS DATA HAS CHANGED.
     */
    if (req->cmd.buf[0] == REPORT_LUNS &&
        !(ua->asc == SENSE_CODE(REPORTED_LUNS_CHANGED).asc &&
          ua->ascq == SENSE_CODE(REPORTED_LUNS_CHANGED).ascq)) {
        return;
    }

Paolo


