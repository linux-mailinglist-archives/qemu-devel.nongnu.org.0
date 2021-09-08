Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0D74034A2
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 08:58:54 +0200 (CEST)
Received: from localhost ([::1]:60398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNrXp-0008Rt-Df
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 02:58:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mNrQg-0007iw-97
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 02:51:30 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:36669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mNrQe-0001Kb-Pu
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 02:51:29 -0400
Received: from [192.168.100.1] ([82.142.27.6]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mlejs-1moz2C4Aq2-00ikkw; Wed, 08 Sep 2021 08:51:27 +0200
Subject: Re: [PATCH 07/12] mac_via: move VIA1 reset logic from mac_via_reset()
 to mos6522_q800_via1_reset()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210830102447.10806-1-mark.cave-ayland@ilande.co.uk>
 <20210830102447.10806-8-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <94cdae0f-7743-2db4-bb99-ea669427a2f6@vivier.eu>
Date: Wed, 8 Sep 2021 08:51:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830102447.10806-8-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:w4OI+fiLdnAey4uMxmkbEWeQoVyEu86e/mo1eqeTD3kw1qvC8P4
 cL7/zT9tSZ6Svuj5XpJXxxnvct0eHRoI1QZaoiEXRJNlhB8zeA3SoKVLVquLhGhcqhPxZsf
 qSKqTLLa8sRWXyxo7dyrGa0oND0U5R/jVyjeCTccXR+A9byNmEqnvp4DHlX8whl4JaXifTN
 0jnlKApH7I9lowNsCwbmg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KpavP9VXeGY=:vZL9N3aZaFJNOhs0oluHpG
 hnO9bkAZFI7yW9Wj1lDlT6renNRYF8p98Pw1pBFjVtzdoHIzZzrPi6NJwJbMRICCOYk++pDGH
 KtTDeFGofWwhgCtBuPnypN36+mVOQZU0nrPUABTgYGz/oYbwHZMQDDBQrR93z6du8anVraLQo
 zD7N4vhB1nTPoB0ZzpPd9gR3XtGgXZBZckQuC07/ocgr3y5r/2D9tR6hN9W++je8QZxU5mr2R
 fUlUGlcfUjmqbdw5emePK3h6k+6wDTfM/79WckENjTArR9wW+QYCcTkYHJyjockRtRoi0bCUK
 m9jJkd8tRGyAl8mylxSq3OpwgSQoPsLGl+ohMok5riJXaK+32+eGSVyQHO/5MgAw1QnMgoIla
 42A5LJzbJCPYOXzOVQQ26gwdE5XP8z7T3ZAjBPFxNIXYS9ZNAMVa3E5MBxYpGcdDWRq7sqZSj
 tAEMtPq2PN+h3Txeli61hkg0qZ5mN5ZyCLDVCGyVA6fZ/khPsqQ+FLuAeA1+UPpT3C1KxM1JH
 4E4uiyXQngIwUPjQSoDo2+fwVcDSNw4qrcaBf3KSVebv/0Z5XJmdJIFpAfzSx3pjYF7zYSv1Y
 1m36g3xBnu0IHKZ8zF/p6J9pKbeZ1YVvOseDFxL10YT09xlZgNZcgBrjJDIKQRC+zTCY211/g
 4UkRY54SiLNV86uyFjrjCHTfICyV/Fo5Qr7+6AT+gC2p2FemxpneTmhjsJyN5joPGaad3541R
 lFbX8QsmMLK1Wi4bp15Mth82fTeBF7lw2RFsZg==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.332,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Le 30/08/2021 à 12:24, Mark Cave-Ayland a écrit :
> After this change mac_via_reset() is now empty and can be removed.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/misc/mac_via.c | 22 ++++++++--------------
>  1 file changed, 8 insertions(+), 14 deletions(-)

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


