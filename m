Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D2A380E3F
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 18:34:21 +0200 (CEST)
Received: from localhost ([::1]:52984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhalY-0000Vw-9O
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 12:34:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lhafB-0003s4-W7
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:27:47 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:47011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lhaf4-0008K5-2r
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:27:45 -0400
Received: from [192.168.100.1] ([82.142.31.78]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MBV2f-1lmmv13HSx-00CzDV; Fri, 14 May 2021 18:27:28 +0200
Subject: Re: [PATCH 0/4] linux-user/arm: fpa11 fix and cleanup
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210423165413.338259-1-richard.henderson@linaro.org>
 <21e7d514-8c43-6db0-2477-7b548b187edd@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <400ab05a-b143-b020-6b8b-342b662503a0@vivier.eu>
Date: Fri, 14 May 2021 18:27:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <21e7d514-8c43-6db0-2477-7b548b187edd@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:hdeg429zqqtYYBZVdmri2OCNwmHql8oUzvDbzT7ekVOn4iuzkgd
 ilWpH/Lr5Z1VyLOLkj8hSMnn3rZGKz+5EGdDpPgAjcgt1vgqrcTnpmW6/H0hcQhd8xXJWLS
 bvmWlwaILDNYM+T11GsYF4glpna8yhVbWbQVUawz4ezfyHMdtLrD6313R7HbjpzXlXVwBTt
 LBSgnQ5uaVZM/i4EVZ5jw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:WYxveA92PjY=:DbXK7I0c4BrO5HrO+gZQIh
 O7uOJ0bhrgKCO2LobioqsqS4wYqrXDe/noWjwPxQTrdNh97/rMwfMZsZFFouvvGXRu0ELjk4H
 6qswv48BaHqywriTILp4+vTmk2gzLD+zmwMkADPtqA11GjReK7yKhfnrYf20/Ho45qqwqNYYW
 rg5UN9KOcbMZN1tCkdZoOn2X5qJcFKKka41tBGn/9XYbDMOyJgCs6433Kp+KuFVnPEdJDIMxI
 FdBwnPFxD/9v3CQOjJmDj/Kl/wF8PNl+8fLGAYmkCXQX4o0PDryQkb5SGydNAugg0ZlWv9O42
 E4qFii2Rz3CmJva7SXoETimrCYT2iVxK+j+Sfmx+tJZSNQJfOXHhjKiEWH3A3yLb5+dUOhtA5
 4vaxwZ/UeZHF1vG+O+Y8HZ0PFYu+A1aQX9WENO7SHnix7aMSCuaK6TBkUv5WpboNNwnYIqMb6
 uQLM+uTy7VTdwt25M0snlJ8SzPUT01NP99i37MUhNwtam2+UOrdlyt4KDQT88oRImYNkRGeje
 jVXwDNosukAuDXHzogHIF8=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 14/05/2021 à 17:54, Richard Henderson a écrit :
> On 4/23/21 11:54 AM, Richard Henderson wrote:
>> The bug fix is patch 2, the rest is a bit of tidy-up.
>>
>>
>> r~
>>
>> Richard Henderson (4):
>>    linux-user/arm: Split out emulate_arm_fpa11
>>    linux-user/arm: Do not emulate fpa11 in thumb mode
>>    linux-user/arm: Do not fill in si_code for fpa11 exceptions
>>    linux-user/arm: Simplify accumulating and raising fpa11 exceptions
>>
>>   linux-user/arm/cpu_loop.c | 125 ++++++++++++++++++++------------------
>>   1 file changed, 66 insertions(+), 59 deletions(-)
>>
> 
> Laurent, this is all reviewed.  Do you want to take this through linux-user queue, or have Peter
> take it through his arm queue?
> 

I'm going to try to do a linux-user PR this WE, but if Peter want to pick up the series before there
is no problem.

thanks,
Laurent

