Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 247D63AFCDC
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 08:06:11 +0200 (CEST)
Received: from localhost ([::1]:32808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvZY1-0006HX-Lp
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 02:06:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lvZXH-0005bv-PF
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 02:05:23 -0400
Received: from mga17.intel.com ([192.55.52.151]:24430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lvZXF-0007Nz-1Y
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 02:05:23 -0400
IronPort-SDR: zDIZinkcCezkh7hzq4Ioh1fY2dtZFC1c/WDGxV/Vs9vOMy+9baEOHgufW5KRcOaKJpET8iPcOT
 sJFE3Su6Umxg==
X-IronPort-AV: E=McAfee;i="6200,9189,10022"; a="187372418"
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; d="scan'208";a="187372418"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2021 23:05:03 -0700
IronPort-SDR: 9wS7lkfj9pFBwM3ANIrjr9wSDKoYm8IowPuYXAUkPpqnChUd4XV16WUzj9frddiesxr7jtb0yI
 JrUrru1Wd9aA==
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; d="scan'208";a="452484785"
Received: from unknown (HELO [10.239.13.19]) ([10.239.13.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2021 23:04:59 -0700
Subject: Re: [PATCH V8 1/6] qapi/net: Add IPFlowSpec and QMP command for COLO
 passthrough
To: Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20210615113740.2278015-1-chen.zhang@intel.com>
 <20210615113740.2278015-2-chen.zhang@intel.com>
 <87zgvrnq7w.fsf@dusky.pond.sub.org>
 <8f58a8dcb58849dd917deaea2a728358@intel.com>
 <874kdymjkk.fsf@dusky.pond.sub.org>
 <92b342dd48ca4b8c917ff6afd9574dcd@intel.com>
 <87a6nqhrf0.fsf@dusky.pond.sub.org>
 <0cbfa653aabe42fd831f7a721f6ab85b@intel.com>
 <87im2c3g8v.fsf@dusky.pond.sub.org>
From: "chen.zhang@intel.com" <chen.zhang@intel.com>
Message-ID: <05809f0e-2aa0-7343-b512-814dab241f5c@intel.com>
Date: Tue, 22 Jun 2021 13:58:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87im2c3g8v.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=192.55.52.151; envelope-from=chen.zhang@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Lukas Straub <lukasstraub2@web.de>,
 =?UTF-8?Q?Daniel_P=2eBerrang=c3=a9?= <berrange@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Jason Wang <jasowang@redhat.com>,
 qemu-dev <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Zhang Chen <zhangckid@gmail.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 6/17/21 7:03 PM, Markus Armbruster wrote:
> You recently started using
>
>      Content-Type: text/plain; charset="utf-8"
>      Content-Transfer-Encoding: base64
>
> Please consider anorhter Content-Transfer-Encoding instead.
> quoted-printable should do.
>
> "Zhang, Chen" <chen.zhang@intel.com> writes:
>
> [...]
>
>> No, net-filter is an independent module, although colo must use net-filter to build colo-proxy.
>> I think we can change the name when enable net-filter support passthrough list.
> Changing names of stable interfaces is always awkward.  So, either make
> this an unstable interface, or use names that are likely to work for the
> foreseeable evolution of the interface.
>
> What about passthrough-filter-add and -del?  Jason?


Hi Markus and Dave,

It's OK for me, and I synced with Jason, he don't have any objection.

I will change to "passthrough-filter-add/del" and try to merge this 
series if you and Dave don't have objection too.


Thanks

Chen


>
> [...]
>

