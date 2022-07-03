Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55801564A4B
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 00:25:20 +0200 (CEST)
Received: from localhost ([::1]:49768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o881m-0006KD-CR
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 18:25:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o87zS-00051M-H7
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 18:22:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o87zN-0005SP-DU
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 18:22:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656886968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TopUIyi2bDIF6ETHPUt7meggdZ6D+dZM/h35SyOKp7w=;
 b=FwNNCW05TU+fPvpw9KyjjYaN/EBwEwTTbpY938+RhkElLpzrBs/ofPf8G1KtuexNPKP+wa
 zvmjAfCrHX80NfUHcPVtmAJmmqzcrZ5wiAu9+xDEQYqb6NAX5koCvNfjirkYmDTLGN+z4B
 rWy/pFh51oxSGjqUOVZ4fVW7J16CzjM=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-9b0vmyTLP1egYifSKVN8pw-1; Sun, 03 Jul 2022 18:22:47 -0400
X-MC-Unique: 9b0vmyTLP1egYifSKVN8pw-1
Received: by mail-il1-f200.google.com with SMTP id
 e4-20020a92de44000000b002dab11299d9so3333689ilr.9
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 15:22:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TopUIyi2bDIF6ETHPUt7meggdZ6D+dZM/h35SyOKp7w=;
 b=QDdvJsqUHQKMwmIvTCVvkWeedvYUCwI67vnWoHhwWv7Le3C6pC4tW+LwzG7vNmS2I4
 9D4ClvO7qC3f7Q5PJbo/2dUrhHHr0jYtODRkFaJrsB6yZEmPlIyMajA0Vn2HZaVne873
 EeiZV42QcyoxbRiue9cGKQ6+4Dx7BjeKK95Z8y5MYGJKRivJ5GM584q5K+TXKOgwuXxX
 uaXuqZRiqXuhL37bcBKOl8yTeDRgXbUqeZFVP1Mv+l9rMTtZptaR8OmEvi678M40SJgf
 iJ/1W2sbS7P8+LNL6bS/WYOyTZ0x7fxlIxjntpKIBD9SsU1rPjqHz+gRSwBLuEuouis+
 xkGQ==
X-Gm-Message-State: AJIora8cQ5WmZq5CGTMBSgS3h8azGH8ui7iSrktyXzatWBOT2MYW9j1F
 ezuqn2p+mTqNQyjQWPtVHqG6HxBPTekOuGmy98DC88h2zwnN/5R4lZwgnMk8X4Mrqhlrv5HpDzb
 5VzxnXbTWWONQECkI0qG2lnH36mivhV4=
X-Received: by 2002:a05:6e02:216b:b0:2da:c09b:179f with SMTP id
 s11-20020a056e02216b00b002dac09b179fmr15114462ilv.0.1656886967309; 
 Sun, 03 Jul 2022 15:22:47 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1so9PTysMD527QunKrHrJD2l4FDaKcL1yS1Mq8rOeXP34O6hwfbnSOzJYc/fvnyvutnCV+nMoIoRuXWuiw8OnI=
X-Received: by 2002:a05:6e02:216b:b0:2da:c09b:179f with SMTP id
 s11-20020a056e02216b00b002dac09b179fmr15114434ilv.0.1656886967102; Sun, 03
 Jul 2022 15:22:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220517113524.197910-1-afaria@redhat.com>
 <f36e2069-e1d8-462d-401f-1194139ee6c2@redhat.com>
In-Reply-To: <f36e2069-e1d8-462d-401f-1194139ee6c2@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Sun, 3 Jul 2022 23:22:11 +0100
Message-ID: <CAELaAXyf7_g7WQHrJUgYzhGCQhEm-D_zai2Qv_ugzWjm3z2hpg@mail.gmail.com>
Subject: Re: [PATCH 00/18] Make block-backend-io.h API more consistent
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Andrew Jeffery <andrew@aj.id.au>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 qemu-ppc@nongnu.org, Eric Blake <eblake@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 qemu-riscv@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Joel Stanley <joel@jms.id.au>, Stefan Weil <sw@weilnetz.de>,
 Laurent Vivier <laurent@vivier.eu>, 
 "Denis V. Lunev" <den@openvz.org>, Juan Quintela <quintela@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, 
 Greg Kurz <groug@kaod.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, 
 Bin Meng <bin.meng@windriver.com>, David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Sat, Jul 2, 2022 at 3:12 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
> Alberto, does this need a rebase?

This applies cleanly on "[PATCH v5 00/10] Implement
bdrv_{pread,pwrite,pwrite_sync,pwrite_zeroes}() using
generated_co_wrapper" [1], which applies cleanly to master.

Alberto

[1] https://lore.kernel.org/qemu-devel/20220609152744.3891847-1-afaria@redhat.com/


