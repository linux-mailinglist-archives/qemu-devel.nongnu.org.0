Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E538647FFF5
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Dec 2021 16:42:17 +0100 (CET)
Received: from localhost ([::1]:57128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1s8e-0004kb-JO
	for lists+qemu-devel@lfdr.de; Mon, 27 Dec 2021 10:42:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n1s6A-0003fl-Aq
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 10:39:42 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:42225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n1s68-00078x-Mg
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 10:39:42 -0500
Received: from [192.168.100.1] ([82.142.30.186]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MKsaz-1miok91ulJ-00LGFY; Mon, 27 Dec 2021 16:39:36 +0100
Message-ID: <67f0cf6c-642a-9e5b-4ba7-cff4b579ce7f@vivier.eu>
Date: Mon, 27 Dec 2021 16:39:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 4/6] target/alpha: Implement prctl_unalign_sigbus
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211227150127.2659293-1-richard.henderson@linaro.org>
 <20211227150127.2659293-5-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211227150127.2659293-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:yvAisN6kEbZIAa6y/e5rhsnsJzqTk7Xt4TUJQwS7QNgOm4+kCJi
 LmjusUHkRSX3/r87FTlcjfCetM7+S5imbkyuibTwe/sJull4nZMHZTnWUpUD9K4wjcXIotZ
 seGJRpQbUCKEfRrPTgCjKs1rd/cHV68ySneE2LA1/gQhDCLGp8FKZ67sPnrkY1RhfPoMLkT
 eQjLsYPf8D6ezEcS7eq7g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9+g/oEMvQao=:yej2djhHD8OlssDGh8Knbe
 6GkkL8qVbs2HWasL9CsX65+uK+/E4E/gY84DPh28gKLt5hNqrykQ/7CmMizoTfT/VqB4kMFqZ
 2ks+WQotUfEtp2FnAp14l9xMUHoGoS2yamNWbwXPpZB+zfsp80BqLJvR3ae/I94SPeFZLvUz9
 v0rem8dl2561yWoisizA6Jt0Z7/DDcbNK5vZEJ/xF5ltRX5XKthV4nHXRLnw8iK68B8lmk5/5
 XtSleiweDWgz7bXIMOb81k11szY11Wpza054kO5y6mAgMORfMZMfX/m6COoWDJo6UY4c3iQNp
 cMLzW0Q6OtRkcsH8hrgdNDiMif1tT5eWJEHGt+0LEvlv6iCUF5WPi9oL33szaHB0s2jlf5Rxu
 deYdFbYyk8ONuN9ogOuF8Ri9VAO7aAtqNtW//yzf8JOX28fZK0l2/xIA3Ca0xJqogQmvk+3tu
 iVPqrTQtXZBhIV20tfcH3CIZZFBfFbhb2DOutU9bRX1waEErj+KlFFJVPBdknnHrYmsM6fG0I
 +NFaYa70zmTfD3PTm5HsH2tC/QFCjzvqB7OvKn+05glxH3DoXNVGrvzPTVOxu7xYYOsqkoc3D
 KSf6tFir1DcNI5BMfLgqP4kxK0ll5EL4+G33Z6ARzRT2UUsH0CEnTxJwh7c7+XQAgF5sKIXf3
 h/QQh85FCcqAYMvLSzYFbpJ+cqCj2NMK45s35WtIPR2vLSpObsShV2roSMBH6BOrE5AQ=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.363,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 27/12/2021 à 16:01, Richard Henderson a écrit :
> Leave TARGET_ALIGNED_ONLY set, but use the new CPUState
> flag to set MO_UNALN for the instructions that the kernel
> handles in the unaligned trap.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/alpha/target_prctl.h |  2 +-
>   target/alpha/cpu.h              |  5 +++++
>   target/alpha/translate.c        | 31 ++++++++++++++++++++++---------
>   3 files changed, 28 insertions(+), 10 deletions(-)

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

