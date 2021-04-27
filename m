Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8370B36C1A3
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 11:22:48 +0200 (CEST)
Received: from localhost ([::1]:37176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbJvb-0008GH-LF
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 05:22:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbJt7-0006mN-Gr; Tue, 27 Apr 2021 05:20:13 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:38646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbJt5-0007JC-Vf; Tue, 27 Apr 2021 05:20:13 -0400
Received: by mail-wr1-x42b.google.com with SMTP id k14so8773009wrv.5;
 Tue, 27 Apr 2021 02:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hd9A5B/gmaq7vbkvgMWO/lHXkZZvwSK+yXa9K68PMC8=;
 b=FUrsNtsaBgJIVkpl9zuaMCwMPEfx3AAdX6pVsVWalzQndHkFEVuAVWss5ofFBC/mlq
 djGjJWG2UYtmuq1bUdZftVGvjBqXOATHb+PHV/SoJxQtf7b5hp6JHJ/xX1v5cBG2xkrz
 3iriWu5UsGteDg56e2JKzj67uzlh5V8cvsoL7qIAudapT+uAayvDQK6wQWk++A/LFyrd
 WXbGxLNDHxRjynoKwe1Hyev3wRs77s/d5ER8DHH+5St1jeCcUW/sN2PSNlM/RZmQKWWD
 bMQpj15iYSXVq3fLPg8/LVNB7eXBNYLp7D6YexFr/EX/9DdNWf8iLUoo6vGr1poXr+8S
 PcHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hd9A5B/gmaq7vbkvgMWO/lHXkZZvwSK+yXa9K68PMC8=;
 b=UDczSroapS8XUHxPruwtgMEVSu9Wp9LYvdWlMPMI57OHIaU+2MPdZKzKBJB5brHM71
 LiAGVP/TigDb6BvZkt45cQofLFpByy5Q3WH+XooT3jtbYW7/y74z01Hx9nwm85UAkTy0
 GZfWSN/PJEYe8VQKeTlmfHM7uTocFZRmatKHowZ9weAt5gARjiFmlIve1oGl5qcPGTas
 jmOiozcjnSikFSWiUcKgcLcbFrRnTHpMLvYFgaqYA+EVfHIGs4tznBQxmUkUjYIfLcjn
 NhBk5/5aB4sbLIVvQ+EUIGZlsjK4SwaCz20UelZV7p+nL9vFmuZU0gk40PkJrTtk0KyO
 +L7g==
X-Gm-Message-State: AOAM532SzXDGwVHQcFij6klz0JiUx7dzUZ+FQnY7UUDj7CmZ7BbGyQwy
 b04pZ1tSSTfe2RqUJR1vHM8=
X-Google-Smtp-Source: ABdhPJyT2q/lPlVkKNE5FC/mpew6F1ZQT/p7yXvGiqLhJeLS4AN3wl2Egtvo2ScYaJEuFl1AQ5DYzw==
X-Received: by 2002:adf:f947:: with SMTP id q7mr28126018wrr.414.1619515209310; 
 Tue, 27 Apr 2021 02:20:09 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id p5sm7782415wma.45.2021.04.27.02.20.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 02:20:08 -0700 (PDT)
Subject: Re: [PATCH 1/5] hw/ppc/spapr_iommu: Register machine reset handler
To: David Gibson <david@gibson.dropbear.id.au>,
 Markus Armbruster <armbru@redhat.com>
References: <20210424162229.3312116-1-f4bug@amsat.org>
 <20210424162229.3312116-2-f4bug@amsat.org> <YIdso1hf+bXwZHmG@yekko.fritz.box>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9dcc20c7-6371-dc77-1cd4-706301ec5c54@amsat.org>
Date: Tue, 27 Apr 2021 11:20:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YIdso1hf+bXwZHmG@yekko.fritz.box>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>, qemu-ppc@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/27/21 3:45 AM, David Gibson wrote:
> On Sat, Apr 24, 2021 at 06:22:25PM +0200, Philippe Mathieu-Daudé wrote:
>> The TYPE_SPAPR_TCE_TABLE device is bus-less, thus isn't reset
>> automatically.  Register a reset handler to get reset with the
>> machine.
>>
>> It doesn't seem to be an issue because it is that way since the
>> device QDev'ifycation 8 years ago, in commit a83000f5e3f
>> ("spapr-tce: make sPAPRTCETable a proper device").
>> Still, correct to have a proper API usage.
> 
> So, the reason this works now is that we explicitly call
> device_reset() on the TCE table from the TCE tables "owner", either a
> PHB (spapr_phb_reset()) or a VIO device (spapr_vio_quiesce_one()).
> 
> I think we want either that, or the register_reset(), not both.

rtas_quiesce() seems to call a DeviceClass::reset() on the
children of TYPE_SPAPR_VIO_BUS:

Abstract TYPE_VIO_SPAPR_DEVICE has the TYPE_SPAPR_VIO_BUS bus_type,
and registers the spapr_vio_busdev_reset() handler, which calls
spapr_vio_quiesce_one()...

So either we already have 2 resets, or the bus is never reset?

The bus is created in spapr_machine_init():

    /* Set up VIO bus */
    spapr->vio_bus = spapr_vio_bus_init();

TYPE_SPAPR_MACHINE class registers spapr_machine_reset(), which
manually calls qemu_devices_reset() and spapr_drc_reset_all(),
but I can't understand if a callee resets vio_bus...

