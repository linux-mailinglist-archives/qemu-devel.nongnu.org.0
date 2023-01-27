Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6EA67E241
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 11:52:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLMJf-0004tP-Hh; Fri, 27 Jan 2023 05:50:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pLMJd-0004sx-IG
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 05:50:41 -0500
Received: from mout.kundenserver.de ([212.227.126.133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pLMJb-0005JE-TR
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 05:50:41 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MnpP8-1os39z1gCo-00pMAE; Fri, 27 Jan 2023 11:50:37 +0100
Message-ID: <7d452471-cb3f-0108-872b-2ddae4709ac7@vivier.eu>
Date: Fri, 27 Jan 2023 11:50:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] m68k: fix 'bkpt' instruction in softmmu mode
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20230126125234.3186042-1-laurent@vivier.eu>
 <3326f36b-69f1-98ef-3721-bcee188a7905@ilande.co.uk>
Content-Language: fr
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <3326f36b-69f1-98ef-3721-bcee188a7905@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:NaYVoKEryZt3FgnkYAFkRdFkO5CSuNOd5NO6bEr1pIWLSTiKBVW
 ZFodcFWad0sUeOuuItvVGCjBkHmfbr4CO324EavVdzoafQkPCGD6jftmaMFEqlrdypbpD03
 vMv9ioVZUCl2bEbSE8y57/ck5GN7lthrEmampduWXk35upwHVBbyPoJcKfUw9Gtr3ukCS1i
 VVmiXMwA+HDOuyK18C+Yg==
UI-OutboundReport: notjunk:1;M01:P0:dokfEsjhavU=;9t+zFjE7D+ay/dq+XNfsHQ6K6U+
 E9n4p5C0sqL6waR/YSBDAXzHalFCBWSfFpvi5WuZWPsTHCijUDNvB9Sl9x27FIyvECHfdikB4
 F6PHeXzUz/HFxdtjQwSHQeYvx6KHvtZwLmxsV10LeuSHxcGnU8KDYjl8jf+Sq9PLWuLOdsmb3
 WdKtoN+uGksfTA+wn1xQp4aIh/HDeR3FaSfog20GZmyhYCzjJ0u+Y2qKyPcpSeIU3WjkCdR4r
 clKNhped+qRaQ1krEvy6yvImT3BORcstRj3jIxkO7tHIj7g1Fjk6+oAkVMPiOhHPQSPqYMxzO
 8ShNgEQBjsDPmY+pZI9+xPuOl0g7RBUr1tRY/vTDCiQ9ziaTUWs+45xrwVCuWYoCM6VElkrGn
 G1d/IPwfAFZQ2DSrBXaa6QTpytjce22WYtHp2QYgkUhfysux9xite0Hjy/QISAkrtaP/OwZ95
 D6yOTkifNkRWh0DttSZKv2V2ff6E9HhNuWsWzVEUJpiJlHknabrduRcZMOE/spAL+z3Jgcf5Y
 zA4HD9IIvYbURg9+puA1dgHRVqRIXX1QprbfqIXBVR1Gg8sQwqtCtNHF2A2p14aGsvaTzM2VF
 kodSVQBjURY30Kf3akqJlTLiyUdsTNkiUCXnqb2haspDKX9kwhzgTLq5hf3DofzIslT6mPDet
 bNjBEAjidfdCJfRkDCF0+60xZrtOHryj5VwMZXYDEw==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.15,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 26/01/2023 à 23:12, Mark Cave-Ayland a écrit :
> On 26/01/2023 12:52, Laurent Vivier wrote:
> 
>> In linux-user mode, 'bkpt' generates an EXP_DEBUG exception to allow
>> QEMU gdb server to intercept and manage the operation with an external
>> debugger.
>>
>> In softmmu mode, the instruction must generate an illegal instruction
>> exception as it is on real hardware to be managed by the kernel.
>>
>> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/146
> 
> Hi Laurent,
> 
> I think this should be https://gitlab.com/qemu-project/qemu/-/issues/1462?

oh, yes, thank you

Laurent


