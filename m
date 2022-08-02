Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC0E587E72
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 16:55:53 +0200 (CEST)
Received: from localhost ([::1]:48332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oItJH-0004I8-DF
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 10:55:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oItGo-0001kn-42
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 10:53:18 -0400
Received: from mga11.intel.com ([192.55.52.93]:40997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oItGl-0003jm-DL
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 10:53:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659451995; x=1690987995;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Trw880o5f/2nvZ60cfT3+5c9qPlVaDFDy31Wri+s4WA=;
 b=ZCk55UT7Db72wChSSFc89qZ2XIJNIXsHZLgpM66CWfcWAOjy9pvN3D0l
 TNO80Qe48ocHvxlCKYRqEnMJOFLzBW3OZm5ffuM3rGu1WOzltT+vGMTzV
 9eK+LOMKJMX647cQmerBe7CY2xPML74FT6jdhnFxPu4rtY8d+QcMIv0Hy
 QuX3/HujQnShcQHgEAB2q0PUwgcb3oRFk9uWLjzk1H9wLeQ6MfNa665hV
 cP+Ol3wsL0is+D88WpMX1Y031d1yabU1d19T/yuTtkjvfRy97qccC4o+i
 UgXWBd3ZLavdoKizNAQj9qzm6OAwdvlrJsIEhlhhjCalV3njjk2kUDjkg w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10427"; a="286985894"
X-IronPort-AV: E=Sophos;i="5.93,211,1654585200"; d="scan'208";a="286985894"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2022 07:53:12 -0700
X-IronPort-AV: E=Sophos;i="5.93,211,1654585200"; d="scan'208";a="578243588"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.249.175.192])
 ([10.249.175.192])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2022 07:53:09 -0700
Message-ID: <a3ddd211-a569-4348-c3bb-2ff509fd6ccf@intel.com>
Date: Tue, 2 Aug 2022 22:53:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PULL 9/9] hw/i386: pass RNG seed via setup_data entry
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=83=c2=a9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, "Michael S . Tsirkin" <mst@redhat.com>
References: <20220721163621.761513-1-pbonzini@redhat.com>
 <20220721163621.761513-10-pbonzini@redhat.com>
 <dae86884-6cfa-a428-374c-60c42900aade@intel.com> <Yukk0YOFgkPwcTzG@zx2c4.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <Yukk0YOFgkPwcTzG@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.93; envelope-from=xiaoyao.li@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/2/2022 9:21 PM, Jason A. Donenfeld wrote:
> Hi,
> 
> On Tue, Aug 02, 2022 at 11:28:15AM +0800, Xiaoyao Li wrote:
>>>    static void pc_q35_7_0_machine_options(MachineClass *m)
>>>    {
>>> +    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>>>        pc_q35_7_1_machine_options(m);
>>>        m->alias = NULL;
>>> +    pcmc->legacy_no_rng_seed = true;
>>
>> Is making .legacy_no_rng_seed default false and opt-in it for old
>> machines correct?
> 
> Not sure I follow what you're saying. ≤7.0 won't pass the RNG seed. It's
> only on ≥7.1 that the RNG seed is used.

yes, with >= 7.1, pcmc->legacy_no_rng_seed = false by default, and RNG 
seed is used.

> Either way, this shouldn't cause boot failures.

It does fail booting OVMF with #PF. Below diff can fix the #PF for me.

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 7280c02ce3d5..1f62971759bf 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1903,6 +1903,7 @@ static void pc_machine_class_init(ObjectClass *oc, 
void *data)
      pcmc->has_reserved_memory = true;
      pcmc->kvmclock_enabled = true;
      pcmc->enforce_aligned_dimm = true;
+    pcmc->legacy_no_rng_seed = true;
      pcmc->enforce_amd_1tb_hole = true;
      /* BIOS ACPI tables: 128K. Other BIOS datastructures: less than 4K 
reported
       * to be used at the moment, 32K should be enough for a while.  */

> Jason


