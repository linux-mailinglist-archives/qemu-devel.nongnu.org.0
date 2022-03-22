Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC25A4E3D95
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 12:29:21 +0100 (CET)
Received: from localhost ([::1]:40440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWchU-0005Vf-Pf
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 07:29:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nWcfj-0003HO-Iz
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 07:27:31 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:52163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nWcfh-00028T-VA
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 07:27:31 -0400
Received: from [192.168.100.1] ([82.142.12.150]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MMXcP-1npfWT49cF-00JcOZ; Tue, 22 Mar 2022 12:27:27 +0100
Message-ID: <aab473a3-2744-fbe5-c811-91e033d5a64b@vivier.eu>
Date: Tue, 22 Mar 2022 12:27:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 4/5] linux-user: Properly handle sigset arg to epoll_pwait
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220315084308.433109-1-richard.henderson@linaro.org>
 <20220315084308.433109-5-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220315084308.433109-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:2lLAP3ff3BjoKIJ1GGUoM5ybzoz9BM6x62e9yaoC6Fr59njWyYu
 W1jPwSXaXpB3betNBPQWFDyZXhkXKIWw5KcLJEHl0aam3DXd0EiakuebBOlNns+0AOTh9LA
 to7n0U21MUCwgJtHgBsaVl8LhgfZ/+F5L3uCvVn3XRvyp3smkYXsyfvX+6DxHUPA3ZXvkt0
 SSWC5QRk6ZS+nfHakEhKg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:43QST38oWcE=:45Dmow+N6dhfoPj21VwzSS
 FVUlFfv3GyFHmcX56oL1WuX9xPpBvK539upNhLJUbWgrcQlTa7zyGWzJ9SJYFHHtM78TTl1zj
 3/T1vrAGrkqtBfdhH+3a8tPl3Lxpxj8SSBdU9b2dv+TVkPh6FihiiWfxnehFkf3u9fCOE57tE
 vEhvonFyrfX2zdxCq9eo+It/Cz1tlh8NBPeKTuuhep6fABYj3zai9ONuTA8Auc5wwdEiYMSmd
 qM3aBT9IZLplm6PPcjZdKNztWnmRhjJU97Dr7mNPkEnwOHH4UX5F1HeXdvdZX3EZxRiuZpe6z
 YtJJIMNIj1ni9PsJdv6kxSP24Ex2YAVg/TDxQ1SuPukbM0ksrFxZk3CII6H1w5gd1N27z2/iJ
 YEHysvVEtejDMXjns+0j9Skdn1YBQwyXx0Gdbzt62tExH9P8upZEJ45Q+hq3DeYjHi7+ArfEN
 WDAIa5V60VefO8S5oVJzzTIUrIk0KsY=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

Le 15/03/2022 à 09:43, Richard Henderson a écrit :
> Unblocked signals are never delivered, because we
> didn't record the new mask for process_pending_signals.
> Handle this with the same mechanism as sigsuspend.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/syscall.c | 22 +++++++---------------
>   1 file changed, 7 insertions(+), 15 deletions(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

