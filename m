Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E742C3584BD
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 15:32:00 +0200 (CEST)
Received: from localhost ([::1]:47324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUUlM-00015r-0Y
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 09:32:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lUUjm-0000YK-VV
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 09:30:26 -0400
Received: from mx2.suse.de ([195.135.220.15]:36540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lUUji-0006eB-SW
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 09:30:22 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7044BB11B;
 Thu,  8 Apr 2021 13:30:17 +0000 (UTC)
Subject: Re: [RFC v12 41/65] tests: restrict TCG-only arm-cpu-features tests
 to TCG builds
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-42-cfontana@suse.de>
 <fd7785bc-5457-bdab-14a0-8a82f929be02@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <dd32fda5-2766-8927-8952-a27701b844d1@suse.de>
Date: Thu, 8 Apr 2021 15:30:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <fd7785bc-5457-bdab-14a0-8a82f929be02@linaro.org>
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/28/21 7:23 PM, Richard Henderson wrote:
> On 3/26/21 1:36 PM, Claudio Fontana wrote:
>> sve_tests_sve_max_vq_8,
>> sve_tests_sve_off,
>> test_query_cpu_model_expansion
> 
> The final two confused me before I realized there are separate tests for kvm. 
> I think we should rename them to *_tcg, so that it's clearer next to the kvm 
> brothers.
> 
>> +#ifndef CONFIG_TCG
> 
> Also, tcg_enabled() again.
> 
> 
> r~
> 

I don't think we have access to that from here, right?

If we use tcg_enabled(), this would be replaced with tcg_allowed, that is not set for qtest, and we end up skipping all the time?

I think even the presence of CONFIG_TCG is a necessary workaround that Paolo has set in place, but had to be explicitly coded in.

Or did I remember wrong?

Thanks,

Claudio



