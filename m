Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF326D2EFC
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Apr 2023 10:01:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piWA4-0007a1-Go; Sat, 01 Apr 2023 04:00:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1piWA2-0007YD-3C; Sat, 01 Apr 2023 04:00:30 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1piW9z-0002Cn-QO; Sat, 01 Apr 2023 04:00:29 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 446364000B;
 Sat,  1 Apr 2023 11:00:13 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id AA62C92;
 Sat,  1 Apr 2023 11:00:12 +0300 (MSK)
Message-ID: <40b36643-9cc3-1923-45ed-49ea8cf6ce54@msgid.tls.msk.ru>
Date: Sat, 1 Apr 2023 11:00:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 04/11] qemu-options: finesse the recommendations around
 -blockdev
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Ryo ONODERA <ryoon@netbsd.org>, Kevin Wolf <kwolf@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, Reinoud Zandijk <reinoud@netbsd.org>
References: <20230330101141.30199-1-alex.bennee@linaro.org>
 <20230330101141.30199-5-alex.bennee@linaro.org>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <20230330101141.30199-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

30.03.2023 13:11, Alex Bennée wrote:
> We are a bit premature in recommending -blockdev/-device as the best
> way to configure block devices, especially in the common case.
> Improve the language to hopefully make things clearer.
> 
> Suggested-by: Michael Tokarev <mjt@tls.msk.ru>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   qemu-options.hx | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 59bdf67a2c..9a69ed838e 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1143,10 +1143,14 @@ have gone through several iterations as the feature set and complexity
>   of the block layer have grown. Many online guides to QEMU often
>   reference older and deprecated options, which can lead to confusion.
>   
> -The recommended modern way to describe disks is to use a combination of
> +The most explicit way to describe disks is to use a combination of
>   ``-device`` to specify the hardware device and ``-blockdev`` to
>   describe the backend. The device defines what the guest sees and the
> -backend describes how QEMU handles the data.
> +backend describes how QEMU handles the data. The ``-drive`` option
> +combines the device and backend into a single command line options
> +which is useful in the majority of cases. Older options like ``-hda``
> +bake in a lot of assumptions from the days when QEMU was emulating a
> +legacy PC, they are not recommended for modern configurations.

Reviewed-by: Michael Tokarev <mjt@tls.msk.ru>

This is a very welcome change, in my opinion.

Thank you Alex!

/mjt

