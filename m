Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9EFFBD38
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Nov 2019 01:57:04 +0100 (CET)
Received: from localhost ([::1]:52564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iV3RV-0003ux-Gs
	for lists+qemu-devel@lfdr.de; Wed, 13 Nov 2019 19:57:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50270)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tao3.xu@intel.com>) id 1iV3Lo-0002vn-55
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 19:51:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1iV3Lj-0001nj-IJ
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 19:51:05 -0500
Received: from mga14.intel.com ([192.55.52.115]:9940)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>) id 1iV3Lj-0000bl-4v
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 19:51:03 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Nov 2019 16:50:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,302,1569308400"; d="scan'208";a="235481219"
Received: from unknown (HELO [10.239.196.128]) ([10.239.196.128])
 by fmsmga002.fm.intel.com with ESMTP; 13 Nov 2019 16:50:49 -0800
Subject: Re: About MONITOR/MWAIT in i386 CPU model
To: Eduardo Habkost <ehabkost@redhat.com>
References: <d52ddfd1-3d9d-6a3a-5ce9-893df96639cc@intel.com>
 <20191113224717.GN3812@habkost.net>
From: Tao Xu <tao3.xu@intel.com>
Message-ID: <b1499e62-269a-2a78-d89a-3e9cdf99f919@intel.com>
Date: Thu, 14 Nov 2019 08:50:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191113224717.GN3812@habkost.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.115
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
Cc: "Lai, Paul C" <paul.c.lai@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Guo,
 Xuelian" <xuelian.guo@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/14/2019 6:47 AM, Eduardo Habkost wrote:
> On Wed, Nov 13, 2019 at 04:42:25PM +0800, Tao Xu wrote:
>> Hi Eduardo，
>>
>> After kvm use "-overcommit cpu-pm=on" to expose MONITOR/MWAIT
>> (commit id 6f131f13e68d648a8e4f083c667ab1acd88ce4cd), the MONITOR/MWAIT
>> feature in CPU model (phenom core2duo coreduo n270 Opteron_G3 EPYC Snowridge
>> Denverton) may be unused. For example, when we boot a guest with Denverton
>> cpu model, guest cannot detect MONITOR and boot with no warning. Should we
>> remove this feature from some CPU model?
> 
> Good catch, thanks!
> 
> Yes, we should remove them from Opteron_G3, EPYC, Snowridge, and
> Denverton, at least.  The other older CPU models can be left
> alone: they are more useful for use with TCG than with KVM, and
> TCG supports MONITOR/MWAIT.
> 
> I would like to understand why this wasn't detected during
> testing by Intel.  I suggest always testing CPU models using the
> "enforce" flag to make sure warnings don't go unnoticed.
> 

OK we will improve the testing.

