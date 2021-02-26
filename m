Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB253264B8
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 16:29:58 +0100 (CET)
Received: from localhost ([::1]:47010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFf41-0003p4-56
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 10:29:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lFf3A-0003Nl-3d
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 10:29:04 -0500
Received: from mx2.suse.de ([195.135.220.15]:41724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lFf37-0005b5-QD
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 10:29:03 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AE166AD21;
 Fri, 26 Feb 2021 15:28:56 +0000 (UTC)
Subject: Re: [PATCH v24 10/18] i386: move TCG btp_helper into sysemu/
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210226094939.11087-1-cfontana@suse.de>
 <20210226094939.11087-11-cfontana@suse.de>
 <e68b6529-ddb7-afbf-450c-38811771492f@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <622009d3-bd5e-cb45-dfdd-ddce08f43785@suse.de>
Date: Fri, 26 Feb 2021 16:28:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <e68b6529-ddb7-afbf-450c-38811771492f@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.349,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/26/21 4:21 PM, Richard Henderson wrote:
> On 2/26/21 1:49 AM, Claudio Fontana wrote:
>> @@ -8054,6 +8058,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>>      case 0x123: /* mov drN, reg */
>>          if (s->cpl != 0) {
>>              gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
>> +#ifndef CONFIG_USER_ONLY
>>          } else {
>>              modrm = x86_ldub_code(env, s);
>>              /* Ignore the mod bits (assume (modrm&0xc0)==0xc0).
>> @@ -8083,6 +8088,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>>                  gen_helper_get_dr(s->T0, cpu_env, s->tmp2_i32);
>>                  gen_op_mov_reg_v(s, ot, rm, s->T0);
>>              }
>> +#endif /* CONFIG_USER_ONLY */
>>          }
> 
> Better to properly nest the ifdef with the if. I.e.
> 
> if (x) {
> } else {
> #ifndef
> #endif
> }
> 
> Anything else gets confusing quickly.
> 
> 
> r~
> 

Ah ok; thanks

