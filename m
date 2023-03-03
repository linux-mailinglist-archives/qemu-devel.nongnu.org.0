Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C64BF6A9154
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 07:58:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXzMA-0006kp-Qt; Fri, 03 Mar 2023 01:57:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pXzM1-0006gA-2X; Fri, 03 Mar 2023 01:57:22 -0500
Received: from mailout03.t-online.de ([194.25.134.81])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pXzLz-0003Xb-C3; Fri, 03 Mar 2023 01:57:20 -0500
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
 by mailout03.t-online.de (Postfix) with SMTP id 8E21318298;
 Fri,  3 Mar 2023 07:57:12 +0100 (CET)
Received: from [192.168.211.200] ([84.175.228.75]) by fwd72.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pXzLp-0zIFtp0; Fri, 3 Mar 2023 07:57:09 +0100
Message-ID: <433b8fb7-ff70-281c-da10-89ac872163ed@t-online.de>
Date: Fri, 3 Mar 2023 07:57:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 7/7] hw/audio/via-ac97: Basic implementation of audio
 playback
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 ReneEngel80@emailn.de
References: <cover.1677628524.git.balaton@eik.bme.hu>
 <79e51c3a51f37415ae42b2c4c053cd8a7ffc5c8c.1677628524.git.balaton@eik.bme.hu>
Content-Language: en-US
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
In-Reply-To: <79e51c3a51f37415ae42b2c4c053cd8a7ffc5c8c.1677628524.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1677826629-812ECD99-731DC59C/0/0 CLEAN NORMAL
X-TOI-MSGID: 69d6c1ed-e1b5-4684-a9a4-c3729fdaa12a
Received-SPF: none client-ip=194.25.134.81; envelope-from=vr_qemu@t-online.de;
 helo=mailout03.t-online.de
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.092, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

> Add basic implementation of the AC'97 sound part used in VIA south
> bridge chips. Not all features of the device is emulated, only one
> playback channel is supported for now but this is enough to get sound
> output from some guests using this device on pegasos2.
>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
> v5: rebased on master
> v3: Fixed CLEN_LEN mask, add check to avoid runaway DMA and some
> tweaks to PCI config regs which now make it work with AmigaOS too.
> This is probably as good as it gets for QEMU 8.0
>
>   hw/audio/trace-events     |   6 +
>   hw/audio/via-ac97.c       | 455 +++++++++++++++++++++++++++++++++++++-
>   hw/isa/trace-events       |   1 +
>   hw/isa/vt82c686.c         |   2 +-
>   include/hw/isa/vt82c686.h |  25 +++
>   5 files changed, 482 insertions(+), 7 deletions(-)
>

Reviewed-by: Volker Rümelin <vr_qemu@t-online.de>


