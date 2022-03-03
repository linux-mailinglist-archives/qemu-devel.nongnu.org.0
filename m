Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4104CC6CB
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 21:07:01 +0100 (CET)
Received: from localhost ([::1]:39760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPrj2-0002kY-7T
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 15:07:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nPrZZ-00041s-LB
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 14:57:13 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:35119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nPrZX-0007ce-Tp
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 14:57:13 -0500
Received: from [192.168.100.1] ([82.142.17.50]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MUXd0-1nYlYU0km8-00QT9I; Thu, 03 Mar 2022 20:57:10 +0100
Message-ID: <c48cb0a6-2f38-e710-d21f-80d9d1a26b76@vivier.eu>
Date: Thu, 3 Mar 2022 20:57:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 10/12] mac_via: make SCSI_DATA (DRQ) bit live rather
 than latched
Content-Language: fr
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20220224115956.29997-1-mark.cave-ayland@ilande.co.uk>
 <20220224115956.29997-11-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220224115956.29997-11-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:L2VLDIcRM65wJLihflT5gzjHVzAgCTL5ucLfu7E0O3K5TCCisfY
 Dx4sWqws0ZHTBkNe6ZHBb/qEvW1SVNKT6QESTSShyypFHH+uHtcYhrehDLWzjrX4r8XcS00
 XIdlG1ckOFUXSfp/5Q8yb5g7SioYQIyQvd9OHyUkB/INZ9qfF8lYs6/MXXZvmAfk8yvse5H
 f+U3HXj02DmXNvH2FIquw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:t6GRGQaSB6A=:zHZq5fQc7Bh5yZshjQqRX4
 9GU6o/V5SyeWPfuUyuJiMT03uxBBTKOZEjBd7YqfHMLYH1rHkfo4A31NrCcIzem4bJaM89PuR
 F5cFDMiDDAftlUdONWHEm4OU9qHxlQV26iKgsBoUtMS0NwxLvcBFH4ewZUFRxQwP4TdYXyVDH
 HjH647nOAe0MvtB1D87g354n+/JIkkLrtA/+GMkHrG2biyMPRvGb6b2pc1gE64+wvWYlZO0Np
 6xKFSM951oSHC+ylUdweIxqm6lyQSzTBijhnpaqTON8IdCP+MSQ0QNmo3v2RAO8w2xDuNHIye
 gwWlDv/qJMEEQfHoVV40IZ1p82YwlmpE35areh69OWoH29IJLtnfN1VQhJcQNdR7tYInXxvQH
 nIlArzaWZleT/TwDTWFuusxjrsWOaF66dIsnyIHJ+C687O9NGSC/DXY+UPRebGA5+4pn3VUDV
 p9lUuQRflLVaQEbqxnbkx7DICWHQG085Eth290l/XXXMq6erDYlI4Ux6vKDD7C8sZ2RnUbNuX
 NJwfEQn0AVBarkhdldjTXLXqLUVWoYC9ED3PxZYZzuzQWGeu84+c5Q7LExrLbvcCOuu/xtgKD
 TcI2HGDjljswMkvGluBamCm9ExmLKIvEZH7mRt9sJCZx29UUxqxud26dJN/n5dCwDn2LrqmSU
 gnKW9bQmExXCFBbaWakL6/fUXXGTLzy5zqzLZ7O245UcjczWJqpw3/JViB2tGwD19XSY=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
> The VIA2 on the Q800 machine is not a separate chip as in older Macs but instead
> is integrated into the on-board logic. From analysing the SCSI routines in the
> MacOS toolbox ROM (and to a lesser extent NetBSD and Linux) the expectation seems
> to be that the SCSI_DATA (DRQ) bit is live on the Q800 and not latched.
> 
> Fortunately we can use the recently introduced mos6522 last_irq_levels variable
> which tracks the edge-triggered state to return the SCSI_DATA (DRQ) bit live to
> the guest OS.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   hw/misc/mac_via.c | 17 ++++++++++++++++-
>   1 file changed, 16 insertions(+), 1 deletion(-)

Reviewed-by: Laurent Vivier <laurent@vivier.eu>



