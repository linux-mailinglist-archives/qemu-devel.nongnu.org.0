Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD13737FAFB
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 17:47:00 +0200 (CEST)
Received: from localhost ([::1]:46736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhDYB-0002E5-FH
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 11:46:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhDWC-0001Gq-EW; Thu, 13 May 2021 11:44:56 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:47805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhDWA-0002Od-Kn; Thu, 13 May 2021 11:44:56 -0400
Received: from [192.168.100.1] ([82.142.31.78]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MLi0U-1lykMi3JfU-00Hg2J; Thu, 13 May 2021 17:44:40 +0200
Subject: Re: [PATCH] backends/tpm: Replace qemu_mutex_lock calls with
 QEMU_LOCK_GUARD
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210512070713.3286188-1-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <0091e979-9757-9a71-89fb-891933ff8987@vivier.eu>
Date: Thu, 13 May 2021 17:44:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210512070713.3286188-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:4ZZbJZd1b1PNSJNr4vvceOHsTISqbdvHpJx5dlveEO1jerzPLh/
 qISGx3VgJXGnYJL8iqvKBamFRw5U4lTMU8UhccKmtP9xQR3rB09s0LXCYFym1g/w6xwDICg
 j+KEKYj0MtTcQKfrf57liQhbZIJQjEO/n6U8WeFoFotBnbUu0zMhhuyGs/KhGl4KqfTicZY
 3eFOe2aumGefxUX+XI1CA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:b81BVfIu0Ww=:yjMm3hiwP3F/bNApDOHyw8
 hnmFX2QhA+OZfIaRTqwVi9GD6HkWtzJ+CFzJmvqPE30Qz0jl/bc6fc4uNjgCEpdbQEFMDB7NH
 DtRLuTrmovYg5ICAdxpkokwHXtuGk3c84TOKpLWe0GVD0xOY0LLuVrAy5jpFRHhLyLvWkky2T
 lgFb+g+fxcq5I1YX2ye6GQ6yw1oAzij2evumWN+REXxlmVY6kCqg1by5adsBZnSERUIChADDX
 XCh8NJvd0QZiGtQa56PeetFysY88ia5kcANAbhXfNsfd6RqqQ69Jrb1NYLWCxEU6Q4PiKrL2Z
 Ar8Nfx85STKP7ROJHVe4S4wolVLNet+fJLYGnY1UXwKW6dvEY/rbFpSMOkWqdD2RKq/LakyGo
 8PvWfS/RJ6cX7M99jFe7kzhFTCAOkSOPm6aEVSIShL6SXRxVgXxIyEu2WAx7x52weFFAoRa8j
 wNosTiOKzNpQErT5HPquGGXSLNrsbeBUsxGW5BIxLMSijdlBd3xwkfMEUVjxKcZIU1SI3Nlfo
 3rMCJeqU0alL5OpoBpHUaw=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Christophe de Dinechin <dinechin@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 12/05/2021 à 09:07, Philippe Mathieu-Daudé a écrit :
> Simplify the tpm_emulator_ctrlcmd() handler by replacing a pair of
> qemu_mutex_lock/qemu_mutex_unlock calls by the WITH_QEMU_LOCK_GUARD
> macro.
> 
> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
> Reviewed-by: Christophe de Dinechin <dinechin@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  backends/tpm/tpm_emulator.c | 34 +++++++++++++++-------------------
>  1 file changed, 15 insertions(+), 19 deletions(-)
> 
> diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
> index a012adc1934..e5f1063ab6c 100644
> --- a/backends/tpm/tpm_emulator.c
> +++ b/backends/tpm/tpm_emulator.c
> @@ -30,6 +30,7 @@
>  #include "qemu/error-report.h"
>  #include "qemu/module.h"
>  #include "qemu/sockets.h"
> +#include "qemu/lockable.h"
>  #include "io/channel-socket.h"
>  #include "sysemu/tpm_backend.h"
>  #include "sysemu/tpm_util.h"
> @@ -124,31 +125,26 @@ static int tpm_emulator_ctrlcmd(TPMEmulator *tpm, unsigned long cmd, void *msg,
>      uint32_t cmd_no = cpu_to_be32(cmd);
>      ssize_t n = sizeof(uint32_t) + msg_len_in;
>      uint8_t *buf = NULL;
> -    int ret = -1;
>  
> -    qemu_mutex_lock(&tpm->mutex);
> +    WITH_QEMU_LOCK_GUARD(&tpm->mutex) {
> +        buf = g_alloca(n);
> +        memcpy(buf, &cmd_no, sizeof(cmd_no));
> +        memcpy(buf + sizeof(cmd_no), msg, msg_len_in);
>  
> -    buf = g_alloca(n);
> -    memcpy(buf, &cmd_no, sizeof(cmd_no));
> -    memcpy(buf + sizeof(cmd_no), msg, msg_len_in);
> -
> -    n = qemu_chr_fe_write_all(dev, buf, n);
> -    if (n <= 0) {
> -        goto end;
> -    }
> -
> -    if (msg_len_out != 0) {
> -        n = qemu_chr_fe_read_all(dev, msg, msg_len_out);
> +        n = qemu_chr_fe_write_all(dev, buf, n);
>          if (n <= 0) {
> -            goto end;
> +            return -1;
> +        }
> +
> +        if (msg_len_out != 0) {
> +            n = qemu_chr_fe_read_all(dev, msg, msg_len_out);
> +            if (n <= 0) {
> +                return -1;
> +            }
>          }
>      }
>  
> -    ret = 0;
> -
> -end:
> -    qemu_mutex_unlock(&tpm->mutex);
> -    return ret;
> +    return 0;
>  }
>  
>  static int tpm_emulator_unix_tx_bufs(TPMEmulator *tpm_emu,
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

