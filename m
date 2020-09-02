Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D1B25ABE2
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Sep 2020 15:14:41 +0200 (CEST)
Received: from localhost ([::1]:35108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDSb2-0002yt-75
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 09:14:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kDSPY-0003IJ-Fm
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 09:02:48 -0400
Received: from mx2.suse.de ([195.135.220.15]:48666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kDSPW-0007dJ-SQ
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 09:02:48 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3226CACCC;
 Wed,  2 Sep 2020 13:02:46 +0000 (UTC)
Subject: Re: meson build failure, configure without tcg, fixed by running make
 again
To: Paolo Bonzini <pbonzini@redhat.com>
References: <c9971e27-fded-3e5d-d489-b1fb539b8ec1@suse.de>
 <41c09bb2-1704-47c0-9638-9f1eff010e8c@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <462d6cfa-f4ba-d001-200b-9fc017f7e2fc@suse.de>
Date: Wed, 2 Sep 2020 15:02:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <41c09bb2-1704-47c0-9638-9f1eff010e8c@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/01 00:13:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.324,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/2/20 12:27 PM, Paolo Bonzini wrote:
> On 02/09/20 12:03, Claudio Fontana wrote:
>> Hi Paolo,
>>
>> there seems to be some parallelism or race condition somewhere?
>>
>> with master, commit 8d90bfc5c31ad60f6049dd39be636b06bc00b652
>> I am doing:
>>
>> mkdir build-nontcg
>> cd build-nontcg
>> ../configure --disable-tcg --enable-kvm --enable-hax
>> make -j120
>> make -j120 check
>>
>> I am getting:
> 
> Yes:
> 
> diff --git a/tests/qtest/libqos/meson.build b/tests/qtest/libqos/meson.build
> index 19931b9248..268ea23803 100644
> --- a/tests/qtest/libqos/meson.build
> +++ b/tests/qtest/libqos/meson.build
> @@ -52,6 +52,6 @@ libqos = static_library('qos',
>          'arm-xilinx-zynq-a9-machine.c',
>          'ppc64_pseries-machine.c',
>          'x86_64_pc-machine.c',
> -), build_by_default: false)
> +) + genh, build_by_default: false)
>  
>  qos = declare_dependency(link_whole: libqos)
> 
> Paolo
> 

Hi Paolo,

this one worked for me just fine, I did not try your latest patch which is a bit different.

Ciao,

Claudio

