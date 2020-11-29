Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFB12C78FD
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Nov 2020 12:55:38 +0100 (CET)
Received: from localhost ([::1]:36630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjLIm-0007tL-NH
	for lists+qemu-devel@lfdr.de; Sun, 29 Nov 2020 06:55:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kjLGa-0007PS-N5
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 06:53:20 -0500
Received: from mx2.suse.de ([195.135.220.15]:41502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kjLGW-0006NA-5b
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 06:53:20 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0002BAC2E;
 Sun, 29 Nov 2020 11:53:12 +0000 (UTC)
Subject: Re: [RFC v6 07/11] i386: move TCG cpu class initialization out of
 helper.c
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20201126223218.31480-1-cfontana@suse.de>
 <20201126223218.31480-8-cfontana@suse.de>
 <20201127190424.GH2271382@habkost.net>
 <c1d20b34-be23-bb42-9fc6-5395a390c037@suse.de>
 <20201127204347.GI2271382@habkost.net>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <297ed700-eedc-f182-2139-9776e6b9a913@suse.de>
Date: Sun, 29 Nov 2020 12:53:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201127204347.GI2271382@habkost.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, gengdongjiu@huawei.com,
 Olaf Hering <ohering@suse.de>, Stefano Stabellini <sstabellini@kernel.org>,
 Bruce Rogers <brogers@suse.com>, "Emilio G . Cota" <cota@braap.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Alex Bennee <alex.bennee@linaro.org>, Marcelo Tosatti <mtosatti@redhat.com>,
 Wenchao Wang <wenchao.wang@intel.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/27/20 9:43 PM, Eduardo Habkost wrote:
> On Fri, Nov 27, 2020 at 08:47:00PM +0100, Claudio Fontana wrote:
>> On 11/27/20 8:04 PM, Eduardo Habkost wrote:
> [...]
>>> Maybe we should rename CPUClass.synchronize_from_tb to
>>> CPUClass.tcg_synchronize_from_tb?  Maybe we should have a
>>
>> possibly, yes.
>>
>>> separate TCGCpuOperations struct to carry TCG-specific methods?
>>
>>
>> interesting, will think about it.
> 
> I'm working on it at:
> https://gitlab.com/ehabkost/qemu/-/commits/work/tcg-cpu-ops
> 
> Feel free to reuse it, if you want to do it before your series.
> Otherwise, I can rebase it after your series is merged.
> 
> I didn't touch do_interrupt(), because of the aarch64 weirdness.
> 

Hi,

yes it makes sense to separate more clearly I think what is tcg only among those operations,

it is a bit tangent to my series in the sense that those methods need to be set one way or another,
either in cc-> or in cc->tcg_ops,

but yes, we could put those changes before or after the series, and I think they make sense.

Ciao,

Claudio

