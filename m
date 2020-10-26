Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 820C2299103
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 16:30:38 +0100 (CET)
Received: from localhost ([::1]:41990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kX4SD-0002DD-IN
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 11:30:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kX4QK-0000uh-83
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 11:28:40 -0400
Received: from mx2.suse.de ([195.135.220.15]:53768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kX4QH-0008Bt-8M
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 11:28:39 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 891BAB1F8;
 Mon, 26 Oct 2020 15:28:31 +0000 (UTC)
Subject: Re: [PATCH v3 0/3] unbreak non-tcg builds
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20201013143806.14321-1-cfontana@suse.de>
 <cd8e9295-dcd0-18c4-e7a2-86bed74f967c@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <579a6f80-1e9a-26be-ddc5-610d88fa7cc5@suse.de>
Date: Mon, 26 Oct 2020 16:28:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <cd8e9295-dcd0-18c4-e7a2-86bed74f967c@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/26 00:19:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.167,
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
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Pavel Dovgalyuk <dovgaluk@ispras.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/13/20 4:55 PM, Philippe Mathieu-Daudé wrote:
> On 10/13/20 4:38 PM, Claudio Fontana wrote:
>> This series now unbreaks current non-tcg builds
>> (!CONFIG_TCG).
>>
>> tests Makefiles need to avoid relying on all non-native
>> archs binaries to be present,
>>
>> bios-tables-test needs to skip tests that are tcg-only,
>>
>> and notably the replay framework needs to consider that
>> it might not be functional (or its code present at all)
>> without TCG.
>>
>> Tested ok target x86_64-softmmu on x86_64 host with:
>>
>> ./configure --enable-tcg --disable-kvm
>> ./configure --enable-kvm --disable-tcg
>> ./configure --enable-tcg --enable-kvm
> 
> If you want to avoid these configurations to bitrot,
> consider covering them by adding Gitlab jobs :)))
> 
> 

Hi Philippe and all,

latest master now has all the fixes discussed in these series, thanks also to Paolo's help with sorting out the stubs.

Already there is a new breakage though it seems, this time in qmp-cmd-test.

So adding CI coverage seems necessary.

In the .gitlab-ci.yml I see:

build-tcg-disabled:
[...]
    - ../configure --disable-tcg --audio-drv-list="" || { cat config.log meson-logs/meson-log.txt && exit 1; }

So is this supposed to be covered already?

I am confused also by the fact that it seems that suddently I see much "less" stuff in the gitlab CI, did I miss some infra discussion?

Thanks,

Claudio


