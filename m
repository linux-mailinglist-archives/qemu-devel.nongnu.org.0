Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B48573754CB
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 15:33:33 +0200 (CEST)
Received: from localhost ([::1]:45974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lee8C-0005l9-SC
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 09:33:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lee5v-00040M-T6; Thu, 06 May 2021 09:31:12 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:58497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lee5t-0003KD-05; Thu, 06 May 2021 09:31:11 -0400
Received: from [192.168.100.1] ([82.142.20.222]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M1ZUb-1lg0be2CSZ-0033v2; Thu, 06 May 2021 15:31:01 +0200
Subject: Re: [PATCH v2 00/15] linux-user/s390x: some signal fixes
To: Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210428193408.233706-1-richard.henderson@linaro.org>
 <20210506135409.1be1c693.cohuck@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <915455f0-eb80-ebfd-cdba-039d820b521b@vivier.eu>
Date: Thu, 6 May 2021 15:31:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210506135409.1be1c693.cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:oPnzKy1KXpXZNOa6vNa+fUfla1r/uw+zVvvXKH7af9W6ZoEbay2
 A2lo6EM722+t4F9P2fKWj+koAuvapywyCLG/1eRzO1ouXcLmS7EJTN8F0zkVbYzD9WXtJST
 Chs8/PY8hRLsV9ScdAnObk4BsZMhSQgJF//9pkXS8OFC1gctjlYVRo/MSP57W2IlXrX8uOi
 ioru4Qc1iGDuOpCCzbVGA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xKthAvhWiBo=:lNWQkxcPaLjqnM77yIIDYP
 VO3OvSAigKkeC0KdbANlMU0I1IQ96Ro8H+ZPtmNQjbLMy3IeFdegyo5jwMjYq2YpmFWtEHaHy
 gTn2ifAsS75pajtqsjJP6ySHbBANEyBTbH2Pu5b1ccEVeQ4m+tk1Vhd5fGSNLJKAflMSxcMaz
 +YfCUy/DjbwfwE1t72e2BbhPA2mi36k3qDm7sXs3UZvKPn8NXxPEAkys5fvpLRlyGtxvtQ2wD
 V95KWJQQRqJ34BLhAIqOV1+RpJjV8UkpA4OZlLxoDxdt2Ck128qPAH28QJYtF5teNG7WOVtUe
 sV36envGi670pAlpoQkYMxHCE/wvYbA5YIEYIny7GU4fh1MTkQZS0VHohp2L0XBSgv2U4+9tA
 r4NrBRenPgB6h4qr4GqXV7q0TFL926C9RPUFHf7mJA+o2CxnE3r6HcRlmN3xjEaCrWM8uYjnH
 JQ5F7m91o2M5hZdlQR1UA3VAvr41NaYWexzkiPrgmxZUSHAhgcnsKs4SZagSVwZ+0c/BjSPSc
 uJRyyyWF5ck6pzOnKrwqpY=
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
Cc: qemu-devel@nongnu.org, thuth@redhat.com, qemu-s390x@nongnu.org,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 06/05/2021 à 13:54, Cornelia Huck a écrit :
> On Wed, 28 Apr 2021 12:33:53 -0700
> Richard Henderson <richard.henderson@linaro.org> wrote:
> 
>> Version 2 splits lazy do-it-all patch.
>> Patch 1 has an additional fix, so I dropped the r-b.
>>
>> r~
>>
>> Richard Henderson (15):
>>   linux-user/s390x: Fix sigframe types
>>   linux-user/s390x: Use uint16_t for signal retcode
>>   linux-user/s390x: Remove PSW_ADDR_AMODE
>>   linux-user/s390x: Remove restore_sigregs return value
>>   linux-user/s390x: Fix trace in restore_regs
>>   linux-user/s390x: Fix sigcontext sregs value
>>   linux-user/s390x: Use tswap_sigset in setup_rt_frame
>>   linux-user/s390x: Tidy save_sigregs
>>   linux-user/s390x: Clean up single-use gotos in signal.c
>>   linux-user/s390x: Set psw.mask properly for the signal handler
>>   linux-user/s390x: Add stub sigframe argument for last_break
>>   linux-user/s390x: Fix frame_addr corruption in setup_frame
>>   linux-user/s390x: Add build asserts for sigset sizes
>>   linux-user/s390x: Clean up signal.c
>>   linux-user/s390x: Handle vector regs in signal stack
>>
>>  linux-user/s390x/signal.c | 280 +++++++++++++++++++++++---------------
>>  1 file changed, 170 insertions(+), 110 deletions(-)
>>
> 
> I assume the route-to-upstream for this is through the linux-user tree
> and not the s390x tree, right?
> 

Yes, and I'll try to do a PR soon.

Thanks,
Laurent


