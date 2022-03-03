Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5A04CC6CE
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 21:08:27 +0100 (CET)
Received: from localhost ([::1]:44878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPrkQ-0006M2-Se
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 15:08:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nPreE-0004mt-Di
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:02:02 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:48173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nPreC-0000B9-Qe
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:02:02 -0500
Received: from [192.168.100.1] ([82.142.17.50]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MQdMG-1nnYf23eeU-00Nlwi; Thu, 03 Mar 2022 21:01:59 +0100
Message-ID: <81239d6a-efdb-87d0-c5de-bbef3c1030bd@vivier.eu>
Date: Thu, 3 Mar 2022 21:01:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 11/12] mos6522: implement edge-triggering for CA1/2 and
 CB1/2 control line IRQs
Content-Language: fr
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20220224115956.29997-1-mark.cave-ayland@ilande.co.uk>
 <20220224115956.29997-12-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220224115956.29997-12-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ezdBEz538YGFBfU9WbML9HaYTOVa6t3G6gr8dLk04hKJwRQJQkw
 gPdIbILcZRqDcEV/zMyWWCDa0djk1u+sZvHvIfrMAiK0k0OYL245tSyXL5t+JxgD4qCItAM
 s8M2+bV1vGCD1kpyKIWn5chwrN6coVVFptllSG3gAB89E2Ow1LUKWug5lJaK5xHAY8asFQ2
 3izBsFJqOAcLn1D8S80ng==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KViSDhDSvtY=:JikPZgnGIHG9UpTw76JgCf
 3DSEJMklEMbQGx7zLlQsTGdp2z6lxPeQcmIHV+V8kel56iFvufYBdhvB2FRzjzG1drDwvLQ+m
 RLM+hJUtEN1MgvuBQ8vwei8JmKrsWYeiqCP+oe76D5N4bcSKNy5RKUFnmOR6/SJ7/HQ0OdqXG
 ei6lzVzYRc3ZW3TMm3ZidILWMb9Om/+smcNrTFAVDrlr6iWWCcX1msyPI7Qw5H9T0gr7hb0u0
 6nT/nplepiQy0erDy67cisbprHg8f1qbYZO9ZcRENxG4w1BT6T7dKzCKi23hFRL+G4pQM4NsQ
 95FLVthCagzSjalPIacsjRbCSo8kY50tju6n3jYQmuO5tsBkfof6kr/E8aGV2WENR6QbfXbjN
 Qkwc/wjSTHkabjua//kJaoimAta+GeBu5bOSOM8RMbm6CJxNhtDr4w3mUUtQMJMq3sFjWdiAq
 +LotwRdQzAQj9DhcF9t2RlY+/vm8h1Dnh3QATrJHocYAHkn1ysstV0h6BGCIac1KAbOsl0UtW
 uW0b8EPgM05em02CBrCkqyxRG8iBi5BF43D9zZxUBoRIQ2xpXytQfeQjsg3sP8YasZ52yE0X0
 zAstcNpGbnDMb+qKzLA5FYRPPPqVb1NDggArf+w+UjZzUV7CbsYXV2YJs9IFTdj4cWjY59VPg
 zHSt5pNCL2kXHcQ1adjTC9cncxGkqurEyQZjBGPw5uJneuo6qW2Ja2WORUT3wcrdM3B0=
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
> The mos6522 datasheet describes how the control lines IRQs are edge-triggered
> according to the configuration in the PCR register. Implement the logic according
> to the datasheet so that the interrupt bits in IFR are latched when the edge is
> detected, and cleared when reading portA/portB or writing to IFR as necessary.
> 
> To maintain bisectibility this change also updates the SCSI, SCSI data, Nubus
> and VIA2 60Hz/1Hz clocks in the q800 machine to be negative edge-triggered as
> confirmed by the PCR programming in all of Linux, NetBSD and MacOS.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   hw/m68k/q800.c            |  9 +++--
>   hw/misc/mac_via.c         | 15 +++++--
>   hw/misc/mos6522.c         | 82 +++++++++++++++++++++++++++++++++++++--
>   include/hw/misc/mos6522.h | 15 +++++++
>   4 files changed, 109 insertions(+), 12 deletions(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


