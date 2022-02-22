Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0C54C03C4
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 22:27:05 +0100 (CET)
Received: from localhost ([::1]:33480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMcga-0005fn-Ec
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 16:27:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=KWfY=TF=zx2c4.com=Jason@kernel.org>)
 id 1nMceK-00044o-QL
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 16:24:44 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:59572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=KWfY=TF=zx2c4.com=Jason@kernel.org>)
 id 1nMceF-00077e-0G
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 16:24:44 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6CC5B61760
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 21:24:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B207C340E8
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 21:24:35 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="EueXSbd0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1645565071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JVDKbWuQaqEUhqppE+Xa9vvhTXzWjrw/6DnshvBmlO0=;
 b=EueXSbd0k16szyLN73y9HJfysgFUJiIHVswrPMWNrYRY6DSrL5971Q3dVdSYQcGyvJlkst
 OJMI0oJIvOIRFrUs6GqimeXgSP78X+s1DC6JKc32HKjpnfajWyhD3j8xf/Js7/UF41rncC
 34sgNZxkDMef47lk62MFWgnnDKw4Tk8=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 36867f32
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Tue, 22 Feb 2022 21:24:30 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id v186so44025889ybg.1
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 13:24:30 -0800 (PST)
X-Gm-Message-State: AOAM5314DdLPnPZlmGMt2buobeLmhqiuel3Sw3cR+M+AZXBBTX8qAuMV
 kdITh4xPQnf3AlxRhRVqS/Yfv0+vWerCNj6xTVY=
X-Google-Smtp-Source: ABdhPJwvfehACY5olNLdLYWx+1mbRCA/UudBhvxotju5WcW8qrMaLZ7L0JYyK5Hf2olVo7SAOkvPTIjxZVLW1My2qho=
X-Received: by 2002:a5b:d11:0:b0:623:fbda:40f4 with SMTP id
 y17-20020a5b0d11000000b00623fbda40f4mr25771486ybp.398.1645565070061; Tue, 22
 Feb 2022 13:24:30 -0800 (PST)
MIME-Version: 1.0
References: <1614156452-17311-1-git-send-email-acatan@amazon.com>
 <1614156452-17311-3-git-send-email-acatan@amazon.com>
In-Reply-To: <1614156452-17311-3-git-send-email-acatan@amazon.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 22 Feb 2022 22:24:19 +0100
X-Gmail-Original-Message-ID: <CAHmME9o6cjZT1Cj1g5w5WQE83YxJNqB7eUCWn74FA9Pbb3Y6nQ@mail.gmail.com>
Message-ID: <CAHmME9o6cjZT1Cj1g5w5WQE83YxJNqB7eUCWn74FA9Pbb3Y6nQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] drivers/virt: vmgenid: add vm generation id driver
To: Adrian Catangiu <acatan@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=KWfY=TF=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Cc: areber@redhat.com, KVM list <kvm@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, ghammer@redhat.com,
 vijaysun@ca.ibm.com, 0x7f454c46@gmail.com,
 QEMU Developers <qemu-devel@nongnu.org>, Michal Hocko <mhocko@kernel.org>,
 dgunigun@redhat.com, avagin@gmail.com, Pavel Machek <pavel@ucw.cz>,
 ptikhomirov@virtuozzo.com, linux-s390@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Michael Ellerman <mpe@ellerman.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Biggers <ebiggers@kernel.org>,
 borntraeger@de.ibm.com, "Singh, Balbir" <sblbir@amazon.com>, bonzini@gnu.org,
 Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>, "Weiss,
 Radu" <raduweis@amazon.com>, asmehra@redhat.com, graf@amazon.com,
 Mike Rapoport <rppt@kernel.org>, Andrew Lutomirski <luto@kernel.org>,
 gil@azul.com, oridgar@gmail.com, Colm MacCarthaigh <colmmacc@amazon.com>,
 Theodore Ts'o <tytso@mit.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>, ovzxemul@gmail.com,
 "Rafael J. Wysocki" <rafael@kernel.org>, Willy Tarreau <w@1wt.eu>, "Woodhouse,
 David" <dwmw@amazon.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Adrian,

This thread seems to be long dead, but I couldn't figure out what
happened to the ideas in it. I'm specifically interested in this part:

On Wed, Feb 24, 2021 at 9:48 AM Adrian Catangiu <acatan@amazon.com> wrote:
> +static void vmgenid_acpi_notify(struct acpi_device *device, u32 event)
> +{
> +       uuid_t old_uuid;
> +
> +       if (!device || acpi_driver_data(device) != &vmgenid_data) {
> +               pr_err("VMGENID notify with unexpected driver private data\n");
> +               return;
> +       }
> +
> +       /* update VM Generation UUID */
> +       old_uuid = vmgenid_data.uuid;
> +       memcpy_fromio(&vmgenid_data.uuid, vmgenid_data.uuid_iomap, sizeof(uuid_t));
> +
> +       if (memcmp(&old_uuid, &vmgenid_data.uuid, sizeof(uuid_t))) {
> +               /* HW uuid updated */
> +               sysgenid_bump_generation();
> +               add_device_randomness(&vmgenid_data.uuid, sizeof(uuid_t));
> +       }
> +}

As Jann mentioned in an earlier email, we probably want this to
immediately reseed the crng, not just dump it into
add_device_randomness alone. But either way, the general idea seems
interesting to me. As far as I can tell, QEMU still supports this. Was
it not deemed to be sufficiently interesting?

Thanks,
Jason

