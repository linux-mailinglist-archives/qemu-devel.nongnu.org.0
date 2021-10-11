Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A653942868C
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 07:59:34 +0200 (CEST)
Received: from localhost ([::1]:45762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZoLV-0003P7-PJ
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 01:59:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mZoEe-00070J-PN
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 01:52:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mZoEa-0000aY-U7
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 01:52:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633931539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dShaisREntm8h7FIxVB33aS5faUcSx5BNl3jM6lwQbA=;
 b=F+MuA6t8OgK0PwZeh+07lnbXWb7SkedgTAqaVjpUmkO4wtsH/f+w6Yg+YiXaHVKXWEr6YJ
 d9OjOcJyH14VCquDh4Xfqqtf4qZ/3rCbYFYGWs2+ZAzJHDQu76dexdjbwBXOLFs5B9yoKi
 /UWIQAi3j9uCKZK4rpgphvQeLMmQTv0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-nmEuAMiOOQSbT-EPUllJoA-1; Mon, 11 Oct 2021 01:52:18 -0400
X-MC-Unique: nmEuAMiOOQSbT-EPUllJoA-1
Received: by mail-wr1-f72.google.com with SMTP id
 r25-20020adfab59000000b001609ddd5579so12328810wrc.21
 for <qemu-devel@nongnu.org>; Sun, 10 Oct 2021 22:52:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dShaisREntm8h7FIxVB33aS5faUcSx5BNl3jM6lwQbA=;
 b=JRHuzEAyemmUTmVkUJMeg0Cjpe6jyYOJsGwtj5yRqHn4bJVvbFzXwi0PKdb9InuefW
 s5kY272Xdox8DNHMDlOgaz4+yMSijTuGSsaico7C2HKM82/5qF9E5//iTWqIaiLxz6Xb
 iSDMxLySxAZF5xPrqkMV7ypUmGyCsB1WzjdxpNP5NlCqIPyZneRS/CBVQp/lBUbOXM6t
 zXQZGAM1TaQprUyNMuWzoqsZicGj5xghxTOLRFg7fENGUHH4FMnctMXciu48qZRjFDE/
 o5+RiF3VYb5RczqCgs6D3SAwxB3c2RZnezyd8HvbqUsUu0jXFAq8qcMctuyMS/nao2eQ
 1iDw==
X-Gm-Message-State: AOAM530NwRVQw13ZnKLFvRR2nGKlFiQ8qw+cfhyf2yP1fn5gfv4H0UIt
 ne1NKhDKN549k2mn745mOHiQuXudPJAXNYEcQgEtwcgU8j1VuS6vuR5WqBNBQkiDv916Uo8wJK0
 4sigPPwyqIa3buXQ=
X-Received: by 2002:a1c:7201:: with SMTP id n1mr18516517wmc.19.1633931537245; 
 Sun, 10 Oct 2021 22:52:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNx/9ZTP6OEsKQpyxHwI2JrtXI3QlgY0U6nGhGFiSYe3QggkMepmE/KgKW579vIIgJvblS/Q==
X-Received: by 2002:a1c:7201:: with SMTP id n1mr18516503wmc.19.1633931537027; 
 Sun, 10 Oct 2021 22:52:17 -0700 (PDT)
Received: from [192.168.3.103] (120.net-94.228.4.isbl.embou.net.
 [94.228.4.120])
 by smtp.gmail.com with ESMTPSA id g188sm6810649wmg.46.2021.10.10.22.52.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Oct 2021 22:52:16 -0700 (PDT)
Message-ID: <612d2f0b-f312-073d-b796-c76357ba51a2@redhat.com>
Date: Mon, 11 Oct 2021 07:52:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: ACPI endianness
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <957db5ec-fc70-418-44d9-da4f81f5b98@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <957db5ec-fc70-418-44d9-da4f81f5b98@eik.bme.hu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/10/21 15:24, BALATON Zoltan wrote:
> Hello,
> 
> I'm trying to fix shutdown and reboot on pegasos2 which uses ACPI as
> part of the VIA VT8231 (similar to and modelled in hw/isa/vt82c686b.c)
> and found that the guest writes to ACPI PM1aCNT register come out with
> wrong endianness but not shure why. I have this:
> 
> $ qemu-system-ppc -M pegasos2 -monitor stdio
> (qemu) info mtree
> [...]
> memory-region: pci1-io
>   0000000000000000-000000000000ffff (prio 0, i/o): pci1-io
> [...]
>     0000000000000f00-0000000000000f7f (prio 0, i/o): via-pm
>       0000000000000f00-0000000000000f03 (prio 0, i/o): acpi-evt
>       0000000000000f04-0000000000000f05 (prio 0, i/o): acpi-cnt
>       0000000000000f08-0000000000000f0b (prio 0, i/o): acpi-tmr
> 
> memory-region: system
>   0000000000000000-ffffffffffffffff (prio 0, i/o): system
>     0000000000000000-000000001fffffff (prio 0, ram): pegasos2.ram
>     0000000080000000-00000000bfffffff (prio 0, i/o): alias pci1-mem0-win
> @pci1-mem 0000000080000000-00000000bfffffff
>     00000000c0000000-00000000dfffffff (prio 0, i/o): alias pci0-mem0-win
> @pci0-mem 00000000c0000000-00000000dfffffff
>     00000000f1000000-00000000f100ffff (prio 0, i/o): mv64361
>     00000000f8000000-00000000f8ffffff (prio 0, i/o): alias pci0-io-win
> @pci0-io 0000000000000000-0000000000ffffff
>     00000000f9000000-00000000f9ffffff (prio 0, i/o): alias pci0-mem1-win
> @pci0-mem 0000000000000000-0000000000ffffff
>     00000000fd000000-00000000fdffffff (prio 0, i/o): alias pci1-mem1-win
> @pci1-mem 0000000000000000-0000000000ffffff
>     00000000fe000000-00000000feffffff (prio 0, i/o): alias pci1-io-win
> @pci1-io 0000000000000000-0000000000ffffff
>     00000000ff800000-00000000ffffffff (prio 0, i/o): alias pci1-mem3-win
> @pci1-mem 00000000ff800000-00000000ffffffff
>     00000000fff00000-00000000fff7ffff (prio 0, rom): pegasos2.rom
> 
> The guest (which is big endian PPC and I think wotks on real hardware)
> writes to 0xf05 in the io region which should be the high byte of the
> little endian register but in the acpi code it comes out wrong, instead
> of 0x2800 I get in acpi_pm1_cnt_write: val=0x28

Looks like a northbridge issue (MV64340).
Does Pegasos2 enables bus swapping?
See hw/pci-host/mv64361.c:585:

static void warn_swap_bit(uint64_t val)
{
    if ((val & 0x3000000ULL) >> 24 != 1) {
        qemu_log_mask(LOG_UNIMP, "%s: Data swap not implemented", __func__);
    }
}


