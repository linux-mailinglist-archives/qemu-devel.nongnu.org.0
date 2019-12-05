Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90831113D4C
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Dec 2019 09:47:23 +0100 (CET)
Received: from localhost ([::1]:51592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1icmnC-0004BM-LN
	for lists+qemu-devel@lfdr.de; Thu, 05 Dec 2019 03:47:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59804)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <xiaoyao.li@intel.com>) id 1icmky-0002xS-L8
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 03:45:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <xiaoyao.li@intel.com>) id 1icmkw-0002CU-Ex
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 03:45:03 -0500
Received: from mga17.intel.com ([192.55.52.151]:24848)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <xiaoyao.li@intel.com>)
 id 1icmkw-0001te-3A
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 03:45:02 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Dec 2019 00:44:57 -0800
X-IronPort-AV: E=Sophos;i="5.69,280,1571727600"; d="scan'208";a="205703274"
Received: from xiaoyaol-mobl.ccr.corp.intel.com (HELO [10.239.13.123])
 ([10.239.13.123])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/AES256-SHA;
 05 Dec 2019 00:44:56 -0800
Subject: Re: [PATCH RESEND 4/4] target/i386: Add notes for versioned CPU models
To: qemu-devel@nongnu.org
References: <20191202063233.28523-1-tao3.xu@intel.com>
 <20191202063233.28523-5-tao3.xu@intel.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
Message-ID: <689d3cc9-5325-1664-76fa-6f2a2b2b4c04@intel.com>
Date: Thu, 5 Dec 2019 16:44:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191202063233.28523-5-tao3.xu@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.151
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/2/2019 2:32 PM, Tao Xu wrote:
> Add which features are added or removed in this version. Remove the
> changed model-id in versioned CPU models.
> 
> Signed-off-by: Tao Xu <tao3.xu@intel.com>
> ---
>   target/i386/cpu.c | 50 +++++++++++++++++++++++------------------------
>   1 file changed, 25 insertions(+), 25 deletions(-)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 7b3bd6d4db..c82fbfd02e 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c

[...]

> @@ -3141,6 +3133,7 @@ static X86CPUDefinition builtin_x86_defs[] = {
>           .versions = (X86CPUVersionDefinition[]) {
>               { .version = 1 },
>               { .version = 2,
> +              .note = "ARCH_CAPABILITIES",

Here ARCH_CAPABILITIES doesn't tell what bits in 
MSR_IA32_ARCH_CAPABILITIES this version has, which makes it meaningless.

Maybe
	.note = "ARCH_CAPABLITIES(rdctl-no, ibrs-all, skip-l1dfl-vmentry, mds-no)",

is better?

>                 .props = (PropValue[]) {
>                     { "arch-capabilities", "on" },
>                     { "rdctl-no", "on" },
> @@ -3152,6 +3145,7 @@ static X86CPUDefinition builtin_x86_defs[] = {
>               },
>               { .version = 3,
>                 .alias = "Cascadelake-Server-noTSX",
> +              .note = "no TSX",
>                 .props = (PropValue[]) {
>                     { "hle", "off" },
>                     { "rtm", "off" },



