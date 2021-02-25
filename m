Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FCD324C6E
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 10:07:54 +0100 (CET)
Received: from localhost ([::1]:42352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFCcj-0007zR-6r
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 04:07:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lFCXk-0005FS-C4
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 04:02:45 -0500
Received: from mx2.suse.de ([195.135.220.15]:36250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lFCXh-0007GY-Ll
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 04:02:44 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D3D32AAAE;
 Thu, 25 Feb 2021 09:02:39 +0000 (UTC)
Subject: Re: [PATCH v22 17/17] i386: move cpu_load_efer into sysemu-only
 section of cpu.h
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210224133428.14071-1-cfontana@suse.de>
 <20210224133428.14071-18-cfontana@suse.de>
 <dfca2069-9d18-4431-f3d5-fa189aafaa80@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <0de04b3b-2008-d710-dda0-de6fa7f55215@suse.de>
Date: Thu, 25 Feb 2021 10:02:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <dfca2069-9d18-4431-f3d5-fa189aafaa80@linaro.org>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/25/21 5:28 AM, Richard Henderson wrote:
> On 2/24/21 5:34 AM, Claudio Fontana wrote:
>> cpu_load_efer is now used only for sysemu code.
>>
>> Therefore, make this inline function not visible anymore
>> in CONFIG_USER_ONLY builds.
>>
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> ---
>>  target/i386/cpu.h | 31 ++++++++++++++++---------------
>>  1 file changed, 16 insertions(+), 15 deletions(-)
> 
> Perhaps move to cpu-internal.h?  It is not used outside of target/i386/.
> 
> Or declared in cpu-internal.h and placed in cpu-sysemu.c?  I don't see that
> it's particularly performance sensitive either.
> 
> But one way or the other,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> 
> r~
> 

cpu-sysemu.c (and cpu.c) seems now to be about cpu class, model, properties, and relative functions. Maybe worth writing it down in the header..

the file that seems to contain pertinent content now is "helper.c", which maybe should be renamed..

Ciao,

Claudio


