Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A0F31BAB8
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 15:07:53 +0100 (CET)
Received: from localhost ([::1]:50642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBeXY-0001H5-Mh
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 09:07:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lBeV3-0007hW-NK
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 09:05:17 -0500
Received: from mx2.suse.de ([195.135.220.15]:52682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lBeV2-0000dg-3v
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 09:05:17 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 59765AC32;
 Mon, 15 Feb 2021 14:05:14 +0000 (UTC)
Subject: Re: [RFC v18 08/15] i386: split smm helper (softmmu)
To: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20210212123622.15834-1-cfontana@suse.de>
 <20210212123622.15834-9-cfontana@suse.de>
 <b6b053ef-998e-08ef-4354-27cdcfb331e9@suse.de> <87y2fptss2.fsf@linaro.org>
 <2a001d15-9b17-d356-aa2b-578f58fe63c4@suse.de>
 <0cc5d1ab-088f-1b49-23cd-ecb3703329f0@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <5ad012e6-4b28-fdbc-c17c-9ec2dedb377f@suse.de>
Date: Mon, 15 Feb 2021 15:05:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <0cc5d1ab-088f-1b49-23cd-ecb3703329f0@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 2:30 PM, Paolo Bonzini wrote:
> On 15/02/21 13:59, Claudio Fontana wrote:
>> Yes. The difference between before the patch and after the patch
>> is that before we were still going through all the code in tcg_gen_callN,
>> via the call to gen_helper_rsm macro, only to call finally an empty function for CONFIG_USER_ONLY (helper_rsm() {}),
>>
>> while now we do not generate anything, we do not call the gen_helper_rsm macro at all, so we don't go through tcg_gen_callN.
>>
> 
> Can we even have an abort() for such cases?
> 
> Paolo
> 

Hi Paolo,

where are you suggesting to have an abort()?

You mean that we should abort() QEMU as soon as we detect in translate.c an RSM instruction in user-mode?

Again the translate.c code for reference:

    case 0x1aa: /* rsm */
        gen_svm_check_intercept(s, pc_start, SVM_EXIT_RSM);
        if (!(s->flags & HF_SMM_MASK))
            goto illegal_op;
        gen_update_cc_op(s);
        gen_jmp_im(s, s->pc - s->cs_base);
#ifndef CONFIG_USER_ONLY
        gen_helper_rsm(cpu_env);
#endif /* CONFIG_USER_ONLY */
        gen_eob(s);
        break;

---

Thanks,

CLaudio

  

