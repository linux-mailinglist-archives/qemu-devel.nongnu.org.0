Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F73C68F255
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 16:49:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPmfv-0000UJ-Uc; Wed, 08 Feb 2023 10:47:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=Pi03=6E=zx2c4.com=Jason@kernel.org>)
 id 1pPmfu-0000Tu-Em
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 10:47:58 -0500
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=Pi03=6E=zx2c4.com=Jason@kernel.org>)
 id 1pPmfs-0004aX-UV
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 10:47:58 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 234BEB81E96
 for <qemu-devel@nongnu.org>; Wed,  8 Feb 2023 15:47:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A512CC433EF
 for <qemu-devel@nongnu.org>; Wed,  8 Feb 2023 15:47:53 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="pc2b9aYY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1675871270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VK5IKF0ElOdzXFU8RfHBblsqHQ5w78gkZ354Ms3uhkw=;
 b=pc2b9aYYvSPuUyp0Ti8mhbXsXcSqTnxxINt9L9IQKE41vJj5YDhngDvFpJhXWINL2mcVGy
 FPPH9KBUdF3AT3flUZmLn2g6+TXP6MfOD9EdvohAXSjopZrucDxt/ruM1uIxonz6upKcXT
 PkmcVorsxTlCGyFWJ2gC+OzNpsFUz1I=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a2c57c04
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Wed, 8 Feb 2023 15:47:49 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-4c24993965eso238971227b3.12
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 07:47:49 -0800 (PST)
X-Gm-Message-State: AO0yUKWt6K9H9YuqB6efjxd1Hi7/u1mNLYEr6fjA1o3g1nK4z4Zg02O7
 97YdTl1hSUbcTbIar9IYXq2WseZ6VWg25aETh2s=
X-Google-Smtp-Source: AK7set+YgWd91h+JpgqVHTAyTUzcWRFTWrb5HLQEmnkffB3rztD64yurUWN90xlMEgc2vNE4VdjzPZFhXJzE5a3uKWU=
X-Received: by 2002:a0d:d586:0:b0:50f:7b33:e1d1 with SMTP id
 x128-20020a0dd586000000b0050f7b33e1d1mr712417ywd.79.1675871268691; Wed, 08
 Feb 2023 07:47:48 -0800 (PST)
MIME-Version: 1.0
References: <20230207084116.285787-1-dovmurik@linux.ibm.com>
 <20230207164117-mutt-send-email-mst@kernel.org>
 <23f28bd4-7adb-3bb1-7148-7dfbb57871d5@amd.com>
 <CAHmME9rrqRY0gOVBav4LjMypmu6uicx3vD9kozApyFoytNg84Q@mail.gmail.com>
 <5ac2a4bc-a7a3-49ca-67c7-96df7e152dd7@amd.com>
In-Reply-To: <5ac2a4bc-a7a3-49ca-67c7-96df7e152dd7@amd.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 8 Feb 2023 12:47:37 -0300
X-Gmail-Original-Message-ID: <CAHmME9pn6HwY+LYb=dfRxGos8qw5QYL8gFxcSL3+D8ww4=cB9w@mail.gmail.com>
Message-ID: <CAHmME9pn6HwY+LYb=dfRxGos8qw5QYL8gFxcSL3+D8ww4=cB9w@mail.gmail.com>
Subject: Re: [PATCH] x86: Don't add RNG seed to Linux cmdline for SEV guests
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>,
 qemu-devel@nongnu.org, 
 James Bottomley <jejb@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 "H. Peter Anvin" <hpa@zytor.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=Pi03=6E=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

On Wed, Feb 8, 2023 at 12:26 PM Tom Lendacky <thomas.lendacky@amd.com> wrote:
> However, is the change to the DTB check appropriate?

Yes it is appropriate. The reason is that the first setup_data link is
already conditionalized on sev:

    /*
    * If we're starting an encrypted VM, it will be OVMF based, which uses the
    * efi stub for booting and doesn't require any values to be placed in the
    * kernel header.  We therefore don't update the header so the hash of the
    * kernel on the other side of the fw_cfg interface matches the hash of the
    * file the user passed in.
    */
   if (!sev_enabled() && first_setup_data) {
       SetupDataFixup *fixup = g_malloc(sizeof(*fixup));

       memcpy(setup, header, MIN(sizeof(header), setup_size));
       /* Offset 0x250 is a pointer to the first setup_data link. */

