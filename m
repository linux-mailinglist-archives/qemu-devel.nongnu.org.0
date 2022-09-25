Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2945E93FC
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 17:33:19 +0200 (CEST)
Received: from localhost ([::1]:52082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocTd8-0005rc-Dn
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 11:33:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ocTZm-0003JG-Al
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 11:29:50 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:42011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ocTZk-0006qI-SG
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 11:29:50 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MDhpZ-1oVZHR1Rup-00AnnZ; Sun, 25 Sep 2022 17:29:46 +0200
Message-ID: <8e2dfcb0-7735-1b3c-8971-b0ccde293a7e@vivier.eu>
Date: Sun, 25 Sep 2022 17:29:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3 07/12] linux-user: Fix strace of chmod() if mode == 0
Content-Language: fr
To: Helge Deller <deller@gmx.de>, Stefan Hajnoczi <stefanha@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220918194555.83535-1-deller@gmx.de>
 <20220918194555.83535-8-deller@gmx.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220918194555.83535-8-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:mK32U5FTUn35AOrcOdWktL4BBC4r1IOaKVojXpEosE6Sj8KiyuP
 ARY78EaPifExlk9tfBFtNwoZ0vDgyjXGrrwEHfMuFq5eQVU9/kzn+xfPA8BDWxGjVVainox
 gQpbwzF+SnVT7Cxb/J6+kNkxofLTEvX9JXYgbyl7wtmWosysMB7ZSZTwSEndpG2yjzeX23u
 DYUNfX4r4FkHuovOjw+fw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:oWza59TLryU=:vshz+x3yz87sPP2lvZgHr4
 9wDr2bc6LSXYcNFDxs7o5E4XRYXisRnSht4n/Fw+eCneXNFqBYoWV03HB3cNpXYJ4qgn6H6ft
 tGb5lt1F+Suj/wpxtVxMSHWO5MQbdJq5hf3kj8Ygbt8ZDiPEcAfvb06P7Nmd6I8Rs5LqOJjTy
 xgZm8MVuaWaSXPpJdJNLwJSHjcp7zOo3kXuRnjB/VYRJF0u5tt/FcACYP8+W1DbQ19ijWRYUi
 J+uNqjWNYhPizSSl0joTUn5LliZ2EQy1lGvvAtUClmL94kCS9xN5DTR4Clf1cJFGuMHxfq5ns
 suC2ORVjA0U7+f0gJIZplQZVDZpxtuTAJinXcEZLe6rfTdj4MtWFUXGiunaWO4WgWZMBZLNuJ
 2kP64khcEEcJbJ4Ycgi+qiafbjogzlaiWHH4PT0MEGoxJBpIq4axNzLAyQOo2AF3SXP+E06ti
 a7ZlrjWDfukDYP/wtMKbiDPLfLFsWmQdz5pwXEJwRWMFVb0QvShL6X+V8a8WlxC1wwj+lK+4u
 1+PYMqBPlKdxq1vOTbvPcJ9mTVfO1EpIQ9rBWtgwqHfX6r28VY8lrH5ixBc8/WqQ++6R1ZZRd
 +lydTLZLHBo3DYkPYGcLbkaeBMIBmcA7K6KB+489QG1V+tDXFuhCa8QR0zfuGxFEJs3u0uJDc
 u5kCXTrWt//MP9ZhabLmXHNUVUum/ZA3pw/xrrW2pQRg+pBcs6RpNNbjJwNnm+D99bXx0OIt+
 m58fKdBvanN9aPajeh6KoVy2pK/K3q6fNHzGpw4gAYUUhQNz2biBcwOWeFYJWFVyKpkQra+jS
 etGjPzI
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.766,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 18/09/2022 à 21:45, Helge Deller a écrit :
> If the mode parameter of chmod() is zero, this value isn't shown
> when stracing a program:
>      chmod("filename",)
> This patch fixes it up to show the zero-value as well:
>      chmod("filename",000)
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>   linux-user/strace.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/linux-user/strace.c b/linux-user/strace.c
> index 5ac64df02b..2f539845bb 100644
> --- a/linux-user/strace.c
> +++ b/linux-user/strace.c
> @@ -1505,6 +1505,11 @@ print_file_mode(abi_long mode, int last)
>       const char *sep = "";
>       const struct flags *m;
> 
> +    if (mode == 0) {
> +        qemu_log("000%s", get_comma(last));
> +        return;
> +    }
> +
>       for (m = &mode_flags[0]; m->f_string != NULL; m++) {
>           if ((m->f_value & mode) == m->f_value) {
>               qemu_log("%s%s", m->f_string, sep);
> --
> 2.37.3
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> 


