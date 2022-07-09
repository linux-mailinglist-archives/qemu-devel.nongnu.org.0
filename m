Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E702956C917
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jul 2022 12:56:24 +0200 (CEST)
Received: from localhost ([::1]:41592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oA88N-0007oo-Hv
	for lists+qemu-devel@lfdr.de; Sat, 09 Jul 2022 06:56:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <bounce+55f5a6.0b57-qemu-devel=nongnu.org@quantumachine.net>)
 id 1oA86y-000759-OW
 for qemu-devel@nongnu.org; Sat, 09 Jul 2022 06:54:56 -0400
Received: from m32-12.eu.mailgun.net ([141.193.32.12]:12929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <bounce+55f5a6.0b57-qemu-devel=nongnu.org@quantumachine.net>)
 id 1oA86x-0004tH-1R
 for qemu-devel@nongnu.org; Sat, 09 Jul 2022 06:54:56 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=quantumachine.net;
 q=dns/txt; 
 s=k1; t=1657364092; x=1657572892; h=Content-Transfer-Encoding:
 Content-Type: In-Reply-To: From: From: Cc: References: To: To: Subject:
 Subject: MIME-Version: Date: Message-ID: Sender: Sender;
 bh=XxW6PiCoIxCKSd242w/OmPgpMnIqysL2RHGmAK5e7vU=;
 b=Y+odYQ1a3Qm4MJFLQZSxXY2qjhL6QvuetZ45Of4PXvV78xuoqauDPH3CTO2JbIumhQ1jf/mm
 uF6NCwZj/Uo3HdBdAjShEYwmRFzwOdW8AbG/crTCf8xlUHjU3EnGYBZyz9bm2Vb7XBe+7n0z
 chKgP2LBhQFG6Hq/bwMT+dx+j12gxY85yP2QVijRaBqkJeK3zVpYRH/LeCDsgdFIpKsCXq23
 HRS5d9RbL9zOTwCT+Y847sT/ov/pE/i5dl0hlFtMGDV48NtOdg1BKTACuymoFwJBWZMfFyJz
 2060bZjhP/YByD7h+SavyupBQ3M1q1j67w3Tbe7xeEGADJ9UobN36g==
X-Mailgun-Sending-Ip: 141.193.32.12
X-Mailgun-Sid: WyIzN2E0YiIsICJxZW11LWRldmVsQG5vbmdudS5vcmciLCAiMGI1NyJd
Received: from mail-01.sector.int (225.pool90-165-196.dynamic.orange.es
 [90.165.196.225]) by smtp-out-n02.prod.eu-central-1.postgun.com with SMTP
 id 62c95e7bd0e690e725d0a8b7 (version=TLS1.3,
 cipher=TLS_AES_128_GCM_SHA256); Sat, 09 Jul 2022 10:54:51 GMT
Received: from [192.168.5.136] (revealer.sector.int [192.168.5.1])
 by mail-01.sector.int (Postfix) with ESMTPA id 2E7AD99996;
 Sat,  9 Jul 2022 10:54:50 +0000 (UTC)
Message-ID: <527d2492-e8a7-6fe2-31dc-bcf6d2793e87@quantumachine.net>
Date: Sat, 9 Jul 2022 12:54:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; DragonFly x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v8 00/12] qtests: Check accelerator available at runtime
 via QMP 'query-accels'
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <d566d35a-6aa7-5fa4-76eb-b21ddd95ec8e@quantumachine.net>
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, philmd@redhat.com,
 richard.henderson@linaro.org, armbru@redhat.com, pbonzini@redhat.com
From: Antonio Huete Jimenez <tuxillo@quantumachine.net>
In-Reply-To: <d566d35a-6aa7-5fa4-76eb-b21ddd95ec8e@quantumachine.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=141.193.32.12;
 envelope-from=bounce+55f5a6.0b57-qemu-devel=nongnu.org@quantumachine.net;
 helo=m32-12.eu.mailgun.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Second attempt of trying to resurrect this thread :-)

May anybody please let us know what else is missing in this series of 
patches? I'm trying to add a 'query-nvmm' qmp command but got redirected 
to this thread.

On 4/7/22 21:27, Antonio Huete Jimenez wrote:
> Are all these changes OK or is there anything else missing? I was 
> thinking in adding a QMP 'query-nvmm' command but I got pointed to this 
> thread as a better alternative to having a per-accelerator query command.
> 

