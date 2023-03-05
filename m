Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C2D6AAEED
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Mar 2023 11:02:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYlBC-0001sw-KH; Sun, 05 Mar 2023 05:01:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pYlBA-0001sS-Bn
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 05:01:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pYlB7-0006iN-F4
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 05:01:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678010475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XH2MPv9w6aP0V6iB5XIiyIS9IBMxqVb2csjEgKNSYTk=;
 b=NHGYd2mBuofpwvaz2NgpEHpOPvQmNbMPFIOmQOH9KvJskmXzpPBpmPnuk1pC+fnG+9+dnI
 uR6uLJpnNYWCaK4E2lcb/q8xCp0sNPGdttYkCYYvf3qfP9SIjcYXbXhoJHgD3umw1tC6kV
 /XKD/C22iNZV432XOkwvm+qaW7SgXN0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-391-byQb7CA-OJu12ZiBKuh4cw-1; Sun, 05 Mar 2023 05:01:14 -0500
X-MC-Unique: byQb7CA-OJu12ZiBKuh4cw-1
Received: by mail-wr1-f71.google.com with SMTP id
 l5-20020a5d6745000000b002c91cb49949so936935wrw.14
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 02:01:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678010473;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XH2MPv9w6aP0V6iB5XIiyIS9IBMxqVb2csjEgKNSYTk=;
 b=FUKqSz9bat9r5HkrajKPvopByOnkTD5WgfPXbjN0NvMygy3vypNvrM+ArKYybdOPwJ
 gYWs1ouWFU4POti0BJNvQdaP/CSbzw9sfuAibArPkpO4i9++e6Lda75lRpmEUf1zaGqt
 X/n4Gub4n/wQltNzmFtHZacUg+tHKj3k1Op1vQuhaFk6H2MRZxH98nSU9a8h8g2RJ3mO
 7Php4jHbDCSyR0qYg+wBmDSg5AHbBdppsJ3DzveTM1EJGG07DPScSYN9SLkoXhrMb2Ig
 5G20pGHrORFmQQvKWXtZr36g9+1Qmlll5m9Mer8ErFzlD4Jcav0q/FxYJuWu9ZqYHHGF
 NE1Q==
X-Gm-Message-State: AO0yUKV+gMqx4C5DaQVkfeDMbTVFf6hImGlpHM7WUUj+LZxU4a9ntcbC
 9BOrEZSz7tzr8Uu18WGVSKRA4HpNWCDZO0UHjSDVoyRMQ4iPwE5wFaVYD023VcaJEezg3t2nZS1
 DVoHUGVup8y+RS/I=
X-Received: by 2002:adf:f64f:0:b0:2c7:d7ca:4c89 with SMTP id
 x15-20020adff64f000000b002c7d7ca4c89mr4969965wrp.58.1678010473238; 
 Sun, 05 Mar 2023 02:01:13 -0800 (PST)
X-Google-Smtp-Source: AK7set/Y9Qk/jB/TkXb9ZgWzHZKUzm83LBcOU9cRKOVXtuAoz0eNxJmiabqgl0zaTZ7mbYYPCHdqcA==
X-Received: by 2002:adf:f64f:0:b0:2c7:d7ca:4c89 with SMTP id
 x15-20020adff64f000000b002c7d7ca4c89mr4969933wrp.58.1678010472946; 
 Sun, 05 Mar 2023 02:01:12 -0800 (PST)
Received: from redhat.com ([2.52.23.160]) by smtp.gmail.com with ESMTPSA id
 s11-20020a5d510b000000b002c55b0e6ef1sm7273827wrt.4.2023.03.05.02.01.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 02:01:12 -0800 (PST)
Date: Sun, 5 Mar 2023 05:01:08 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paul Burton <paulburton@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 0/5] Fix recent PIC -> CPU interrupt wiring regressions
Message-ID: <20230305045919-mutt-send-email-mst@kernel.org>
References: <20230304114043.121024-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230304114043.121024-1-shentey@gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Sat, Mar 04, 2023 at 12:40:38PM +0100, Bernhard Beschow wrote:
> A recent series [1] attempted to remove some PIC -> CPU interrupt indirections.
> This inadvertantly caused NULL qemu_irqs to be passed to the i8259 because the
> qemu_irqs aren't initialized at that time yet. This series provides a fix by
> initializing the qemu_irq of the respective south bridges before they
> are passed to i2859_init().
> 
> Furthermore -- as an optional extension -- this series also fixes some usability
> issues in the API for creating multifunction PCI devices.
> 
> The series is structured as follows: The first three commits fix the
> regressions, the last two fix the public API for creating multifunction PCI
> devices.

"We pulled your tooth oh and we removed your appendix too while we were
at it".
Pls don't do this kind of thing unless strictly necessary.


> [1] https://lore.kernel.org/qemu-devel/20230302224058.43315-1-philmd@linaro.org/
> 
> Bernhard Beschow (5):
>   hw/isa/vt82c686: Fix wiring of PIC -> CPU interrupt
>   hw/alpha/dp264: Fix wiring of PIC -> CPU interrupt
>   hw/ppc/prep: Fix wiring of PIC -> CPU interrupt
>   hw/pci/pci: Remove multifunction parameter from
>     pci_create_simple_multifunction()
>   hw/pci/pci: Remove multifunction parameter from
>     pci_new_multifunction()
> 
>  include/hw/pci/pci.h |  4 +---
>  hw/alpha/dp264.c     |  8 +++++---
>  hw/i386/pc_piix.c    |  2 +-
>  hw/i386/pc_q35.c     | 10 +++++-----
>  hw/isa/vt82c686.c    |  3 ++-
>  hw/mips/boston.c     |  3 +--
>  hw/mips/fuloong2e.c  |  9 +++++----
>  hw/mips/malta.c      |  2 +-
>  hw/pci-host/sabre.c  |  6 ++----
>  hw/pci/pci.c         | 18 ++++++++++++------
>  hw/ppc/pegasos2.c    |  9 +++++----
>  hw/ppc/prep.c        |  4 +++-
>  hw/sparc64/sun4u.c   |  5 ++---
>  13 files changed, 45 insertions(+), 38 deletions(-)
> 
> -- 
> 2.39.2
> 


