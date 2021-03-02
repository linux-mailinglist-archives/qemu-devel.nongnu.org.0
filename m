Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 177A332A988
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 19:38:14 +0100 (CET)
Received: from localhost ([::1]:48740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH9uO-0001cy-W7
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 13:38:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lH9LH-000810-KV
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 13:01:55 -0500
Received: from mx2.suse.de ([195.135.220.15]:44016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lH9LG-0008Bm-0Y
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 13:01:55 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 472A8ADCD;
 Tue,  2 Mar 2021 18:01:52 +0000 (UTC)
Subject: Re: [RFC v2 21/24] target/arm: cpu64: wrap TCG-only parts of
 aarch64_cpu_dump_state
To: Richard Henderson <richard.henderson@linaro.org>
References: <20210301164936.19446-1-cfontana@suse.de>
 <20210301164936.19446-22-cfontana@suse.de>
 <6d8ff697-aff9-0f56-6f68-1deb428e0ee5@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <cd93478c-00d3-c6b7-1529-7e52c33b2446@suse.de>
Date: Tue, 2 Mar 2021 19:01:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <6d8ff697-aff9-0f56-6f68-1deb428e0ee5@linaro.org>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/2/21 5:56 PM, Richard Henderson wrote:
> On 3/1/21 8:49 AM, Claudio Fontana wrote:
>> -    if (cpu_isar_feature(aa64_sve, cpu) && sve_exception_el(env, el) == 0) {
>> +    if (tcg_enabled() &&
>> +        cpu_isar_feature(aa64_sve, cpu) && sve_exception_el(env, el) == 0) {
> 
> There's nothing tcg-only about this -- kvm supports sve.
> 
> r~
> 

Indeed, on my box I am using probably just the cpu_isar_feature check fails.

This is basically an open question: do we need an sve_exception_el helper stub that always returns 0?

Thanks,

Claudio



