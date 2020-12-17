Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE342DD9A8
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 21:09:28 +0100 (CET)
Received: from localhost ([::1]:54834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpzaY-0001ZV-Iz
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 15:09:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kpzYt-00018B-Hr
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 15:07:43 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:40075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kpzYp-0003SR-PK
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 15:07:43 -0500
Received: from [192.168.100.1] ([82.252.144.198]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1McXs5-1kFHIc22lp-00d2lY; Thu, 17 Dec 2020 21:07:31 +0100
Subject: Re: [PATCH] linux-user: Fix loading of BSS segments
To: Stephen Long <steplong@quicinc.com>, qemu-devel@nongnu.org
References: <c9106487-dc4d-120a-bd48-665b3c617287@gmail.com>
 <20201217174055.544-1-steplong@quicinc.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <9e82b386-0e0f-f9b8-0854-a754315ab1bd@vivier.eu>
Date: Thu, 17 Dec 2020 21:07:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201217174055.544-1-steplong@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ejyexLefjWPXqKEcbx7YLVxE4D7hyj5Es8S0WFoVgjhWpommliT
 VWkUKhUcI3ZhfhnzNYWcHr5EZkzT4guuCJRxTRSIBYCwQ2ZkfaQzpnPRRWX9PMYp/506O8W
 uM6WxCjJRyh23cV8JPfQvbdn7fVOX9NgPtmFvO6OhXjqbhgWFc8yvenif/euQKLg7HIy87B
 6bL2jEsIj5ragr/hL320g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:WvfhpzY65kQ=:OrwAmi+DtNu7FQVHjeVPD5
 LLFX0/3SNSeLKhDtmuMwx0YLcbzfN5jvkmE/LZHdO+sshWtg5t+yLMmtmYhdhbCYKn7z/Lwbm
 99ZjcgG3HJH9us5C6cQrpU7YbATUjGAVR8oiUJ2haf8A6glqXsUBylEr94RRE20j9PQwWtcIP
 p1L1JKYM0vGJpm/3t+nJ8xMxPTtmO5iA6+fBuF2Xhl4hobAl8GMggLDlNh+R/QRXCcZLErMjn
 oEeXQKjng1GkKyJNxABp5SB5eIj/FhtEuGEXk6EjFnEF6CxPPqcSP/1TaOi62BtorkeS3YXmq
 9lQZ6UQc/oXn1ZTTOJqattMSr3vF2iyk5m5E2qeS48qjMLqqFFwN3L63tYpNYV0RyHJ94WObS
 7E1UnhzhoLKkWwU+vWAjLA8pGI+W2CcJXWEe7N9OhHYEDrlzTgercTMULcss3
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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
Cc: thatlemon@gmail.com, richard.henderson@linaro.org, ben@decadent.org.uk,
 philippe.mathieu.daude@gmail.com, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 17/12/2020 à 18:40, Stephen Long a écrit :
> Laurent Vivier wrote:
>> Is this also fixing what "linux-user/elfload: Fix handling of pure BSS segments" [1] patch fixes?
> 
> I can do a v2 of my patch with a better commit description and addressing Peter's
> questions, but feel free to take this patch instead. It has a much
> clearer commit msg and seems to be more correct to me.
> 

If this patch fixes also your problem I will take this one instead.

Thanks,
Laurent

