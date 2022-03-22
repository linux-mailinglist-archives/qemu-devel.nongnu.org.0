Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEC94E3D96
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 12:30:06 +0100 (CET)
Received: from localhost ([::1]:41612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWciD-0006HW-Ng
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 07:30:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nWcgW-0004mL-4V
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 07:28:20 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:58301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nWcgU-0002FJ-FS
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 07:28:19 -0400
Received: from [192.168.100.1] ([82.142.12.150]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M3lLh-1nWtfP1BBr-000pwq; Tue, 22 Mar 2022 12:28:16 +0100
Message-ID: <b29d3558-7a4c-6fe6-1e7f-d9cca4a7b05d@vivier.eu>
Date: Tue, 22 Mar 2022 12:28:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 5/5] linux-user: Properly handle sigset arg to ppoll
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220315084308.433109-1-richard.henderson@linaro.org>
 <20220315084308.433109-6-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220315084308.433109-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:mtb3nN3fzi0jMvaHIf+ZcfIIzERl2SY4KrDWMnNNt1KD+BWEkV6
 ART6k7W5xhtQmMV+mv+mgWm7i9QIoEdKQTuTsMmE9P3QmGaWNfstWY5W44IDq3tw/f4mRiM
 g4zYRUvOomRwjYcpXEoO6nT6MUE02soQq04k1v19eL62FF7JjZq2uCM/h7KICyMr/rmIOB6
 lrsAvTlh2CRiCkZt1T8sQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:IA0UbGu/a/o=:hJmTdyCQoTiKfXZveiRm78
 z9loduWkFvqJYMmZWbQa3TP0snjMOG9a/7CcLV44SHdIkFwIvtKwKyeXZ6XbGMRAU0reECgcs
 F+TvJW/gjfUd/32HlqVoT6iT1/r4zvvzI/ZV8cTAB8WSJMNBarLmOdSzgmb1n+Cst0VPJR0rU
 aBSHkKWtW/SedzAbXzTtYubiFzhOREkmH4ZtFzIRI0b0ZWYMQx1RnQlz09Mu4bz4/G/GERS9H
 EerNe3BIFGSSJUIjfMm3edA4K8csPUtp6YU/SGl2aPN0UGpY4kMTRepcBIDqo/O+IR6YOM/4o
 WJx6EVhoJIZ//n+WJ4xqj9rdNYKZOtfNb9BAn87IIgSh+KrW/wS1xc7Try2ZtlCfqgXOfZZrt
 X3niGBOIy2fH6kLoiN+DBp8hL2pZ+Hu6Bkxo90uwLwR17sgZb0bemEBfZAWY49jZ0FicINhj8
 VRqyDGMnFOtMwXY+0UCUDTx3k9lYU4Q=
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Le 15/03/2022 à 09:43, Richard Henderson a écrit :
> Unblocked signals are never delivered, because we
> didn't record the new mask for process_pending_signals.
> Handle this with the same mechanism as sigsuspend.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/syscall.c | 24 +++++++-----------------
>   1 file changed, 7 insertions(+), 17 deletions(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

