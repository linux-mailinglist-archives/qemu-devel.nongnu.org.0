Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5C1355C3B
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 21:37:41 +0200 (CEST)
Received: from localhost ([::1]:58500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTrW7-00010V-Vc
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 15:37:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lTrUv-0000SM-DW; Tue, 06 Apr 2021 15:36:25 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:36535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lTrUs-0003vF-JB; Tue, 06 Apr 2021 15:36:25 -0400
Received: from [192.168.100.1] ([82.142.14.126]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MGhds-1lPxjd1Wa2-00DqfF; Tue, 06 Apr 2021 21:36:19 +0200
Subject: Re: [PATCH v4 12/12] exec: Fix overlap of PAGE_ANON and PAGE_TARGET_1
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210406174031.64299-1-richard.henderson@linaro.org>
 <20210406174031.64299-13-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <ebfb8a08-4b8e-6215-6520-89e44523da70@vivier.eu>
Date: Tue, 6 Apr 2021 21:36:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210406174031.64299-13-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:kJQ0SBbJFlOqp3o7w8Fqf4Sql1sLEIMFyfNMyIuTUB0XevRzpDy
 BwJxLtkn6XfH3C3078OdSe6gzbt7B5cRy18Yd5z1jNh4sFtbzQDW3BlYdutSeuSdh+WwjJK
 rMjYP8rOjeDz59nrBNqrPGYbng54VNkW7bmQdxjRpphbws7hYOZpqhzGhFXG8QroIeEAIh9
 eR4WDWzi9KxA1tLw2flUg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JUygBdQN6J0=:dUfaEpqWnWAjY6lFdnzzJ1
 V1GwwVyc0N6+fFCT+yFp3VeoI9reFbYJApFVR2Nh9wJiM+cDXjAZ89a5XsjlQzAJJVhqWuFjQ
 aOM9KcG6o2SXhTI9Tth9kvBr1f6slhpsrEU8kTuAo7LkOsERwZyATigoW4Hu9Ffg7mG8AQlc/
 aoZOzEAzQB8MvyNgCaXqHDwtnATJrviFIoOSwt2z/ow0bNM5PSkF9GS/jUYUqkfZMkRyM8dXQ
 SSL6krBqL/6mVTCSOWWUTKa5vJGO2lokbepb6eRtPrrOiCwB3qCU72XwrGPeKI5t4RvpmlMAT
 or2JflC1eG1VuQg2nf/PY9CI/pBgos7GJKTrxDhHzAGiAC/h539P+8cJbZYWm4skfvyNf5z/3
 adiTB6mvDJ05AmgmEujcib1ZOlgMsylNPHggxt8PXgH+ZWeT1X85maaATgusNqUMXWge6v879
 NGUORIapuik6/OziZ5MTuME+gfsUni2NiQ2AC8LaZgDN05vy/mUZ
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 06/04/2021 à 19:40, Richard Henderson a écrit :
> Unfortuately, the elements of PAGE_* were not in numerical
> order and so PAGE_ANON was added to an "unused" bit.
> As an arbitrary choice, move PAGE_TARGET_{1,2} together.
> 
> Cc: Laurent Vivier <laurent@vivier.eu>
> Fixes: 26bab757d41b ("linux-user: Introduce PAGE_ANON")
> Buglink: https://bugs.launchpad.net/bugs/1922617
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/cpu-all.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
> index d76b0b9e02..32cfb634c6 100644
> --- a/include/exec/cpu-all.h
> +++ b/include/exec/cpu-all.h
> @@ -268,8 +268,8 @@ extern intptr_t qemu_host_page_mask;
>  #define PAGE_RESERVED  0x0100
>  #endif
>  /* Target-specific bits that will be used via page_get_flags().  */
> -#define PAGE_TARGET_1  0x0080
> -#define PAGE_TARGET_2  0x0200
> +#define PAGE_TARGET_1  0x0200
> +#define PAGE_TARGET_2  0x0400
>  
>  #if defined(CONFIG_USER_ONLY)
>  void page_dump(FILE *f);
> 

Tested-by: Laurent Vivier <laurent@vivier.eu>

