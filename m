Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCC5357269
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 18:52:36 +0200 (CEST)
Received: from localhost ([::1]:48650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUBPv-0001s4-6d
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 12:52:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lUBMo-0000ER-Fk
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 12:49:22 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:35599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lUBMl-0004vr-K5
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 12:49:22 -0400
Received: from [192.168.100.1] ([82.142.14.126]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MlO9r-1lqqbm3XTx-00lnx9; Wed, 07 Apr 2021 18:49:15 +0200
Subject: Re: [PATCH] linux-user: Use signed lengths in uaccess.c
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210315204004.2025219-1-richard.henderson@linaro.org>
 <c8a434a8-9f88-99cf-a136-6099626b2477@vivier.eu>
 <CAFEAcA8L6asqjxrnEXBv9W8G95dXHrYzOeqbxxXP6nm7EkzXMg@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <e983d6a3-8c7b-acbc-afdd-add33b6041eb@vivier.eu>
Date: Wed, 7 Apr 2021 18:49:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8L6asqjxrnEXBv9W8G95dXHrYzOeqbxxXP6nm7EkzXMg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:vhNL0ZXc1fLWNInXyj8lbQJzQazf0o6UFxE/oQ5rVeKexfMjHbt
 jZRRsUJHH1S8Vs0gDiG4i7pHEPFjLYJaHvd70sZwEx0IRZFTIFoYAlPt0usxw0suwhHtgwI
 /hoMaZAYyAGtVgU8T7Il0Z2cjEuUneadqSdfo3V4V2w4xoEpm8LNy2QVCUNTU/7BqupcxI4
 8fLg0SDhkDibo+pTQhNWA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:cXAgK+GtRtU=:rqz9irzORyTbvkUs1YILvS
 6aAMQEzO4mxrwZ5Hpg+wlafLcLEenLYMcEaJ/arL06mXt0j/uOtkpCzJwyWq1bMpkcKajbXjS
 Gf72l/1fSFJ9mUhoCrBx1uxZJC+7naOZQ/Hs87HeYFKLYuQQ/YyVsAYJgrsMNfM/S3Ynbet9y
 cQXw7MSIY50P5e6j5erZxURGPKOQl4NiesqXrJh6XfiuQtvAUG0afekpD/oLpKSPnNHIgVq2J
 +DutETsoV4MUmF/xC766AzVYOacE1oyruussSI94z/AQvzXKA4aUm8gjfp6LD22rDVOlq/7j6
 SqOzyMH7jnrCklXeqdFmmYM4he/Kgj7roEgFyclz9PN8aH2vgLgxdSpyB1XjbY67/luIEolkF
 bBcTAsfOKqwZCxKrbpmRDBDyrZBlXnB1yG945DgFILf4DImRBIwijNRMxy2KtvU8LN08xvkyP
 qJVrTQlODHiQaK+CuZfGmHEWPseKsVpeIA+WtK075UBme3ttrYcj
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 07/04/2021 à 17:16, Peter Maydell a écrit :
> On Mon, 15 Mar 2021 at 21:07, Laurent Vivier <laurent@vivier.eu> wrote:
>>
>> Le 15/03/2021 à 21:40, Richard Henderson a écrit :
>>> Partially revert 09f679b62dff, but only for the length arguments.
>>> Instead of reverting to long, use ssize_t.  Reinstate the > 0 check
>>> in unlock_user.
>>>
>>> Fixes: 09f679b62dff
>>> Reported-by: Coverity (CID 1446711)
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
>> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> 
> Hi -- did this patch get lost? I think we should put it into 6.0.

It seems so... thank you.

I prepare a PR with it.

Laurent


