Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F70931944E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 21:22:18 +0100 (CET)
Received: from localhost ([::1]:56850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAITh-0002d9-J9
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 15:22:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lAIO4-0007BX-JW
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 15:16:29 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:53705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lAIO2-0003nq-0m
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 15:16:28 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N45th-1lrz5W08Jd-010473; Thu, 11 Feb 2021 21:16:19 +0100
Subject: Re: [PATCH 0/6] m68k: Overhaul of MOVEC instruction to support
 exception/MSP
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1612137712.git.balaton@eik.bme.hu>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <00617028-bb17-4d10-98b6-126f69686d2f@vivier.eu>
Date: Thu, 11 Feb 2021 21:16:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <cover.1612137712.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:X2W3xhrQWSNO0UOsLaWLoOtlOfYFzXWSMbrfpaF49fdATKaLq5+
 reS7DL7I06f4GqPpuBCHbOkYysro+ZXmQWfd1vihiCM4wxkwL5RWSnd5EbdOlFTrukhJ++A
 KYrqNmnD1IhctOt5fAZDQPwbF5cUKPO4XQC/EbTlsuv2l2aRE37nyR0LcBi3e1nZ+PVeEBQ
 DHfFuAZhw48C+o4DpdfrA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:oVRj5M0y7eE=:6jFOCRKoXEGMj9W9PqDwRw
 oUM2N4V/KGiSi/3QUvBXSa/+wdyY+FKhiTc5yWfvxRiAvUck0Xqz3SH/F/V9tIWSLzD/bhezS
 qlTrW2nVs5k29JG26wEi29l16kDuuk+1Etju15j8bxSOyz6EBLHUCrmEsIrtF4az8FfsxHqsx
 fsOfw+a891GfXD4iOxApjLewoYTSnrUbJmiWK/dTnBQA/dAWtL6GrxQMGJY5RGd862sBFBqja
 EbhdpApR7nPi44Dr1asBvJ3oYf91EdDggSRRTw+K6EJouDQryQXYEr31oS303tjBAF5Fqwptb
 kEjwcKSUgLtk6UUKGCFsW5GakjbLz/y+hHL2ogoNG3321KwUEAwNqB2HxigaOr1fE1PpoU8vP
 zreL62RGgluMW4Yg2FlNuLvlYdnnsrHTP7b4T5diDV7RV+n5pMg2zndznFpiF
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.119,
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
Cc: Lucien Murray-Pitts <lucienmp.qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 01/02/2021 à 01:01, BALATON Zoltan a écrit :
> Hello,
> 
> This is Lucien's m68k series rebased on and fixed up to work with
> current master as per previous discussion:
> https://lists.gnu.org/archive/html/qemu-devel/2020-01/msg02840.html
> 
> I've left previous Reviewed-by tags for reference but these should
> probably be reviewed again. I've only lightly tested it so I don't
> know if everything is correct but it does seem to fix the problem my
> original patch tried to fix at least. More testing, review and help to
> finish this so it can be merged at last is welcome.
> 
> Regards,
> BALATON Zoltan
> 
> Lucien Murray-Pitts (6):
>   m68k: improve cpu instantiation comments
>   m68k: cascade m68k_features by m680xx_cpu_initfn() to improve
>     readability
>   m68k: improve comments on m68k_move_to/from helpers
>   m68k: add missing BUSCR/PCR CR defines, and BUSCR/PCR/CAAR CR to
>     m68k_move_to/from
>   m68k: MOVEC insn. should generate exception if wrong CR is accessed
>   m68k: add MSP detection support for stack pointer swap helpers
> 
>  target/m68k/cpu.c       | 116 ++++++++++++++------
>  target/m68k/cpu.h       |  64 +++++++----
>  target/m68k/helper.c    | 234 +++++++++++++++++++++++++++++++---------
>  target/m68k/translate.c |   2 +-
>  4 files changed, 309 insertions(+), 107 deletions(-)
> 

Series applied to my m68k-for-6.0 branch.

Thanks,
Laurent

