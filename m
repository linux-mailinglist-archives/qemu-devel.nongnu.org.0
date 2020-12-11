Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EF82D7D2E
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 18:46:01 +0100 (CET)
Received: from localhost ([::1]:42184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knmUS-0006Sx-6W
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 12:46:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1knm6j-0000qF-3M
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:21:29 -0500
Received: from mx2.suse.de ([195.135.220.15]:37754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1knm6h-00070K-8v
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:21:28 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 67354B765;
 Fri, 11 Dec 2020 17:21:25 +0000 (UTC)
Subject: Re: [PATCH v11 09/25] i386: move cpu dump out of helper.c into
 cpu-dump.c
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20201211083143.14350-1-cfontana@suse.de>
 <20201211083143.14350-10-cfontana@suse.de>
 <3e759d43-8864-fe25-4168-8e11538b9bb2@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <b9468ac4-1358-5978-843b-39884eef13b6@suse.de>
Date: Fri, 11 Dec 2020 18:21:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <3e759d43-8864-fe25-4168-8e11538b9bb2@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Colin Xu <colin.xu@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>, Bruce Rogers <brogers@suse.com>,
 Olaf Hering <ohering@suse.de>, "Emilio G . Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/20 5:13 PM, Richard Henderson wrote:
> On 12/11/20 2:31 AM, Claudio Fontana wrote:
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>  target/i386/cpu.h       |   1 +
>>  target/i386/cpu-dump.c  | 537 ++++++++++++++++++++++++++++++++++++++++
>>  target/i386/helper.c    | 514 --------------------------------------
>>  target/i386/meson.build |   1 +
>>  4 files changed, 539 insertions(+), 514 deletions(-)
>>  create mode 100644 target/i386/cpu-dump.c
> 
> There are a fair few "static const char * array[]" that should be "static const
> char * const array[]", but is an existing error and this patch is pure code
> movement.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> r~
> 

Yes, that code being moved is full of issues, checkpatch goes mad about it.
Probably worth an extra cleanup patch later on.

Claudio


