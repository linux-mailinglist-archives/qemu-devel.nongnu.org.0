Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BCD325177
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 15:28:40 +0100 (CET)
Received: from localhost ([::1]:59170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFHd9-0001Ug-Ei
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 09:28:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vfazio@xes-inc.com>)
 id 1lFHbM-0000NZ-9L; Thu, 25 Feb 2021 09:26:48 -0500
Received: from mail.xes-mad.com ([162.248.234.2]:45890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vfazio@xes-inc.com>)
 id 1lFHbK-0002T6-AN; Thu, 25 Feb 2021 09:26:47 -0500
Received: from [10.52.16.140] (vfazio1.xes-mad.com [10.52.16.140])
 by mail.xes-mad.com (Postfix) with ESMTP id A5378206BE;
 Thu, 25 Feb 2021 08:26:33 -0600 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
 t=1614263193; bh=Ikx1DMxoOBuXED4X9owvinv/nptMF7WM4ilf6sxZF5Y=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=NdOBho2CD1QrtJOgqEr80KUoGbnLDP/q2vFoe1bYIdR6VdSLEQJjjEfVJj3PdjwwU
 PkWssdyYuhkdlMC7tlU0Ac6C72CApKprLSWgu31S3LF/XID7dS84Fx67KBFeVu3QmU
 igrjmcTqjQtcv275vB7dvdt+y4BPhV+zDphimEV8=
Subject: Re: [PATCH] linux-user/elfload: do not assume MAP_FIXED_NOREPLACE
 kernel support
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Vincent Fazio <vfazio@gmail.com>
References: <20210131061930.14554-1-vfazio@xes-inc.com>
 <87o8gmc2k5.fsf@linaro.org> <78c75d31-f8be-a98a-8649-87ceca224b8b@vivier.eu>
 <CAOrEah7X3H7g7gSKFf-jD0nQ7YqnE+hUP7eq7Ozk8HfwYaxuqA@mail.gmail.com>
 <87o8glveme.fsf@linaro.org>
From: Vincent Fazio <vfazio@xes-inc.com>
Message-ID: <3301f4ba-f65b-ea79-efe3-f84c29c8ab70@xes-inc.com>
Date: Thu, 25 Feb 2021 08:26:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87o8glveme.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=162.248.234.2; envelope-from=vfazio@xes-inc.com;
 helo=mail.xes-mad.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.435,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>




On 2/15/21 3:52 AM, Alex Bennée wrote:
> 
> Vincent Fazio <vfazio@gmail.com> writes:
> 
> 
> Ahh right so I think this is a case of binaries being built on a
> different platform than kernel they are running on. In which case the
> flag would be defined but the underlying kernel fails to identify it. Is
> this a container like case by any chance?
Yes, my builds were happening in a container to eventually have the statically built binaries run in another container. 
I discovered this issue (and the two others reviewed) while trying to debootstrap Debian Bullseye in a container.
> 
> If I'd read the man page closer:
> 
>     Note   that   older   kernels   which   do   not  recognize  the
>     MAP_FIXED_NOREPLACE flag will typically (upon detecting a colli‐
>     sion  with a preexisting mapping) fall back to a "non-MAP_FIXED"
>     type of behavior: they will return an address that is  different
>     from  the  requested  address.   Therefore,  backward-compatible
>     software should check the returned address against the requested
>     address.
> 
> so yes we should avoid short circuiting the return address check.
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> 

