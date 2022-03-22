Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CD24E3DAD
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 12:34:54 +0100 (CET)
Received: from localhost ([::1]:46606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWcmr-0001Ry-0M
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 07:34:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nWckl-0000Fr-06
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 07:32:43 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:44121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nWckj-000337-Bn
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 07:32:42 -0400
Received: from [192.168.100.1] ([82.142.12.150]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M7KG2-1nR7VL2mxY-007iWK; Tue, 22 Mar 2022 12:32:39 +0100
Message-ID: <e323d99d-88f2-5497-f929-fdc2bc42d031@vivier.eu>
Date: Tue, 22 Mar 2022 12:32:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/5] linux-user: signal mask fixes for pselect et al
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220315084308.433109-1-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220315084308.433109-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:k4RKCPVmFfiiX2/Ww6dNGj0vKtCiAN0rckRXRNKSltsQnzH/gHM
 aT4rZQQgme8LUQ4JjpKPkLbCnhX4qWLPYiXqRVpH113ArYMgdR+At7cYMgl8nF37xIwSSqD
 ch1rvdPRLMSfv37OaDK7lRs9EvOAl7vrqlATDtFIygqlpLwflgMiCXwot+pwvyysl5eAuA7
 ALO23yh94wd6wCsF2HT+g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7lso48AVvog=:QYKnZiOrWX+A1PlrUR/2CT
 z/g3i8jAALDlGkm2obo3h22ltFSeH8ub0YHozo4VP4NM9nIwBkDbEd+4s344E1N2ELIDNEW1+
 7GqqENa6TzIenC18DOvB1dFUK6wvVrRMlZ2/2YKukDcFF64BC3BBcb+/oFIhT/rd/UuER6NE0
 4iVUsPHdHzgBqDEE/VYaTktsApNXkf8PQni/rbxVMI7ektwm9bpej2i10V9wTNmXq5s+J8iim
 3WgG4Dvsp5CZG2+J6NF1OMObogeSVc90AVsHkiDvUlom5Yqn2vfpkxoWgAiVv+By3HP3PW/lU
 AdnKK3nKfw4DYehTV2wb9fR6+nHw1wfqXWPkoEI+8+x7Z4PFI5R9N7KF0fbxPgSA6c+Zh7XLQ
 waEH5m07rbLeaHv3AzURb/Ev0OLqyVpZY3Dms3qi3V4QSQ2YZkaDvq/Wy0ztp5fbUONqE2WZF
 lIdcPMIam+hsMkwzNm39QaBIH7tecRFxHeajRymUOPGdlBXPYFsq5KYTVd27Y7xsyCv8hM8AX
 e/GfvSHWWTNJtsqfJyPrC5IlVUTtKaAcvJVTv3vjIU2sEXFyRr762qvccCQq7TaeZ3S//bRh4
 ba3zvE9QnqE8V6UBmymPQnWJk8lQNq0e5ErM11aNghY4Dfzr260rI3z5muPYEhcRMbiI3J8VG
 8173Bf2dtkNoO7WkYHkhdbXQmQ5EqvCWDX7NbR1g2756yKQyVAUlyxSo+4lHAWhTTmF4=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Le 15/03/2022 à 09:43, Richard Henderson a écrit :
> Split out some helpers from sigsuspend.
> Reuse them for pselect, epoll_pwait, ppoll.
> Fix an alpha buglet found on the way.
> 
> r~
> 
> Richard Henderson (5):
>    linux-user/alpha: Fix sigsuspend for big-endian hosts
>    linux-user: Split out helpers for sigsuspend
>    linux-user: Properly handle sigset arg to pselect
>    linux-user: Properly handle sigset arg to epoll_pwait
>    linux-user: Properly handle sigset arg to ppoll
> 
>   linux-user/signal-common.h |  26 ++++++++
>   linux-user/signal.c        |  23 +++++++
>   linux-user/syscall.c       | 119 ++++++++++++++-----------------------
>   3 files changed, 92 insertions(+), 76 deletions(-)
> 

Series applied to my linux-user-for-7.0 branch.

Thanks,
Laurent


