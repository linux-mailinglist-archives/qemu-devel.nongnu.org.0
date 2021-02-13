Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FB431AD1A
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 17:27:05 +0100 (CET)
Received: from localhost ([::1]:59434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAxlA-00082z-NN
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 11:27:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lAxje-000757-Gu
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 11:25:30 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:46283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lAxjb-0004Vp-1Z
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 11:25:30 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MlfCm-1ladpi3tWU-00ijgs; Sat, 13 Feb 2021 17:25:21 +0100
Subject: Re: [PATCH v2] linux-user: fix O_NONBLOCK usage for hppa target
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <20210201220551.GA8015@ls3530.fritz.box>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <f6c72e80-a800-1ab3-544b-337537e9cfe5@vivier.eu>
Date: Sat, 13 Feb 2021 17:25:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210201220551.GA8015@ls3530.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:FKjcam0KzftnBUk8hmZOtzEIZgZIcppdV2z24hv7vmh3RcX0chc
 9Jklg35vzgi/nGk922dOYBX/DP3uk8op2GK8pbvQ86aXPT9Q8QU+SqLvaN1eadrsvLYiiGO
 lly8sVwkL9UhG//mV66gYJh94l6uAyR27gJZmvPLAw1qZWHkofmDEF45XMaYd5YIeGGL6N5
 Op6m2Qpuabx1xGziLWytg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mxsM9s/2YZk=:rKu4JBls+Ay1ElQzjMKz4e
 Buga+Vv5Kr+XJbUiW1tgVBo6yKF9Z23L9WmNw7kJU8PX89sH+8Tl3ByrKPasBEtMqI9Js19hB
 XXnY0HHhmJs1NGhKAZ6vOaVLkwGyKRMqXA1kA/JFS5NTcp6gDCRYn+o3VJN7mrXoho9AoivAP
 Yblzy088mhv4cZN2SJSJkGB65BSYSgK4ltSKvGEbhgSKWxefJPUxXU0Zzmz3EeNZ2NY4Unbhz
 ywx27oxB8R8d4ztTwg5PUZ8kMgFrSet/1haGc4+UfAa8pTouY6Xmli4JxNLLpTV0Z6IyZuZVe
 Ex2TKfengfb0OTUR1VXwqtzRcSKsttBfLlEh7ATyH8POt9paWYgy01TX/Z3XsDshbXtAcbzG7
 6XVDhvSmAboksYoydVzTdrAqcEQOzMSB8DHgY0dHbiTumRfQv5i77fCxoRJ2i
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 01/02/2021 à 23:05, Helge Deller a écrit :
> Historically the parisc linux port tried to be compatible with HP-UX
> userspace and as such defined the O_NONBLOCK constant to 0200004 to
> emulate separate NDELAY & NONBLOCK values.
> 
> Since parisc was the only Linux platform which had two bits set, this
> produced various userspace issues. Finally it was decided to drop the
> (never completed) HP-UX compatibilty, which is why O_NONBLOCK was
> changed upstream to only have one bit set in future with this commit:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=75ae04206a4d0e4f541c1d692b7febd1c0fdb814
> 
> This patch simply adjusts the value for qemu-user too.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> ---
> 
> diff --git a/linux-user/hppa/target_fcntl.h b/linux-user/hppa/target_fcntl.h
> index bd966a59b8..08e3a4fcb0 100644
> --- a/linux-user/hppa/target_fcntl.h
> +++ b/linux-user/hppa/target_fcntl.h
> @@ -8,7 +8,7 @@
>  #ifndef HPPA_TARGET_FCNTL_H
>  #define HPPA_TARGET_FCNTL_H
> 
> -#define TARGET_O_NONBLOCK    000200004 /* HPUX has separate NDELAY & NONBLOCK */
> +#define TARGET_O_NONBLOCK    000200000
>  #define TARGET_O_APPEND      000000010
>  #define TARGET_O_CREAT       000000400 /* not fcntl */
>  #define TARGET_O_EXCL        000002000 /* not fcntl */
> 

Applied to my linux-user-for-6.0 branch.

Thanks,
Laurent

