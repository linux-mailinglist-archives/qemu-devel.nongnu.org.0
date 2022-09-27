Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 451A65EBECF
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 11:40:05 +0200 (CEST)
Received: from localhost ([::1]:49736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od74O-0002lp-Bl
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 05:40:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od6nI-00065b-D1
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 05:22:25 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:54241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od6nG-0002D6-6P
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 05:22:24 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N49xZ-1pLD2H1Gi1-0101c0; Tue, 27 Sep 2022 11:22:16 +0200
Message-ID: <09a65ab4-7cce-4bd0-7156-0eb7f8865bcb@vivier.eu>
Date: Tue, 27 Sep 2022 11:22:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] linux-user/s390x: Save/restore fpc when handling a signal
Content-Language: fr
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
References: <20220817123902.585623-1-iii@linux.ibm.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220817123902.585623-1-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:j9Mw0r87ciH/mOIadQ8E8GwP2IwVF0tu9Zq5WkLHqYZBBO7qkHG
 XNagh2dnfHgTDIGieMQGVM67I2j/y1VgRkGfSednZ1Ik70O6mYIKTl1SGUSZzY7C7UUnmmJ
 iHJLHea3m9uGmRlvUJYdVTXP917p5nPwgHwOnjucX1VL3CnqrMJ2zcG2UL41sadhqWnWChg
 C+LBV5Myyi8ra0ffWoRYw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rz3a8EQJmlg=:aD12WeUvY3KzMW+9Z6fFJ9
 lZ48MzQp4YTOEoYfjv8cCf/0kCE5h/IUF0QiV2sVaBSHEApwOcSelMq7TeD3Rf3UohnUwGv5l
 sfGyTBQvhc1vuIdm9b46K433iW16dbk6LjSlA5vXM4hl0rHvlbJLEDtr/2azBJlQoPQUCqSNc
 5UtmYQ++R1bO8BUUbFwHbOkHl1su9qpX4lD52fRpdlezap3xG5YceSabC90kBLMWmXhI4lDyL
 ZbyvoWXv2DMiYugXtYwmieyzIoAjkEM+fsKKfdF4Z0ZZFi5hW8mzv//j5v7dvTqMaogCg6XJI
 nYe94z/nD4OhabL9LoeTpLwWHluDxP+5BjD4zIhQtMtSy4gk9zPNwNNqjDPceW7LfQB/8xqgm
 m51u2JlR1VqxMCEDRCQph2nEug1+aj1U/8j05e1yP80q1O/Tyydpw0ztUBZk5EFQ6R48XUNgW
 fI/asjDxauKyxes/daqDLSsb1zo8Czr7AjB82veqkNLpdpoBaKN6iwS9lcCczYOnZUzTvdVHe
 k5uQmhuHme95MQdft3omZF3/hjlT5Cj6a7LAwJRXUb/IuU6t5OXszT/DpI7At+NTBEk3PUp26
 VkpmJgXqsuHgADHnmeQnrULpYIpuub/0Ag54nWU+omSeEKGLO80prhXfqY4uaQ8Oq2NXBfp5p
 gTbsTLUt3ljRuWXAKEt/pPJuKqLUwSTzpX9YQCvaU20+xdjXKUp1sgxajx4MFeVkuKkEvGel/
 TPTddAlOHHFrB6dDrM+/tGHuwrSUMr55pUzPra/RZBH/X+xrSfpb4Vy68TR36q/qzspPDBnUj
 mfkK8m2
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.319,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Le 17/08/2022 à 14:39, Ilya Leoshkevich a écrit :
> Linux kernel does this in fpregs_store() and fpregs_load(), so
> qemu-user should do this as well.
> 
> Found by running valgrind's none/tests/s390x/test_sig.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   linux-user/s390x/signal.c | 2 ++
>   1 file changed, 2 insertions(+)

Applied to my linux-user-for-7.2 branch.

Thanks,
Laurent



