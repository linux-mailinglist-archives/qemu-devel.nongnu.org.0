Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D06784CC44A
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 18:48:40 +0100 (CET)
Received: from localhost ([::1]:34804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPpZ9-0005FL-Uz
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 12:48:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nPpXd-0002rS-1b
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 12:47:05 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:56579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nPpXa-0003vx-TI
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 12:47:04 -0500
Received: from [192.168.100.1] ([82.142.17.50]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M27ix-1nSINp3QBF-002UN1; Thu, 03 Mar 2022 18:47:00 +0100
Message-ID: <0e7d11a1-8f21-a7c8-f071-7fbed9e52d7b@vivier.eu>
Date: Thu, 3 Mar 2022 18:47:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 04/12] mos6522: switch over to use qdev gpios for IRQs
Content-Language: fr
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20220224115956.29997-1-mark.cave-ayland@ilande.co.uk>
 <20220224115956.29997-5-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220224115956.29997-5-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:VKpfUDqOphCaVOAXCWxB8ixXuZXTnbI3ZTfu0yejAgAlqS2l0wx
 01FZAwS13kwyemii+OVQAqVKym4BjMIg+U2NWyDy7PV8sjbVtoQfGhJhT7MD7g3SzjL6sbZ
 /Vd3wtmDRwriifYI1QRxLJWlkMLT2n7oQJeHqc49bYwKDDCx86R2Bb+3wXQzvUXytZd9NJC
 wXrBoDxROfvBZm9wCL4iA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7EZkW0zK+Bc=:yrcLQt9oYEm48YRZDHzE/M
 2euOK+x6dfInRW43bvNitPHJAhmTUGE/qfeufMQ07X551uSBvOHCFSXZqcGH0VhncCUWHjhDm
 Q8580/9TzwGG54wvnQZWWKKAsfes0OvMHonGf/TR6b/x1tMZ2+Q1nHcOWkxNpG8q1NrX0ibDM
 ZneEf6hAq45X2cQsW7M+ZXCeWvN52dr6LpvAL0mr+6qKAkv16o/aseaC2tS25jeAy6Rz0P+PP
 hpmaQpuwitNcCzF/vAZbLRAVvGvS8zLaWcG6YqeC8HTZwM4yT1cL93uL46MKoIgGcO3ptEnR/
 5sqdfo3L2pFE4o+MF1nbEK/R8sJgUiGW8kl492c3GryXO9WzIlBKj9wdBvGwqQqQ5ivGc3IWR
 Xq4y4ViO/wOxxtnaaJz0eYI0JIKZVbGHL+sJxIvMBcIQrZo4WlanJ3Z/OFF/3UGhsw0kfV4eQ
 oNErpJPhYJbWBpAIiVyOHYd425kJGDPaMQSQqg3lI9lPlppBdujO7y3w3nHk8IcJ8Q+yeVYRy
 vjPPfebrquR6OX/7gGIJ3d67VLXiaXYkMsJmouSnlT9ja4fiY/rR56nJP4kisL9SzddGUWWP8
 x2QOiqh5K2nffGPIiRCDatiTd/Vhktu0/MappuW/w33lRs3e3KViI9wwzSUIwrrrZi2Wvww/O
 xZLkLWNIAg8Rph5ucnv5NyaceKV5bCfPgA9v/ULMUGUusphNHaz+SCyKoXJ1pLpTy4KM=
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Le 24/02/2022 à 12:59, Mark Cave-Ayland a écrit :
> For historical reasons each mos6522 instance implements its own setting and
> update of the IFR flag bits using methods exposed by MOS6522DeviceClass. As
> of today this is no longer required, and it is now possible to implement
> the mos6522 IRQs as standard qdev gpios.
> 
> Switch over to use qdev gpios for the mos6522 device and update all instances
> accordingly.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/misc/mac_via.c         | 56 +++++++--------------------------------
>   hw/misc/macio/cuda.c      |  5 ++--
>   hw/misc/macio/pmu.c       |  4 +--
>   hw/misc/mos6522.c         | 15 +++++++++++
>   include/hw/misc/mac_via.h |  5 ----
>   include/hw/misc/mos6522.h |  2 ++
>   6 files changed, 31 insertions(+), 56 deletions(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>



