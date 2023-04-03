Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5C36D4860
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 16:28:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjL9j-0005NP-56; Mon, 03 Apr 2023 10:27:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=450a44d59=bchalios@amazon.es>)
 id 1pjL9g-0005Mk-Su
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 10:27:33 -0400
Received: from smtp-fw-80007.amazon.com ([99.78.197.218])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=450a44d59=bchalios@amazon.es>)
 id 1pjL9e-0005zH-On
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 10:27:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.es; i=@amazon.es; q=dns/txt; s=amazon201209;
 t=1680532051; x=1712068051;
 h=message-id:date:mime-version:from:to:references:
 in-reply-to:content-transfer-encoding:subject;
 bh=VDui7dJJ3xt7lqnSsQr6gxhp5Lng454BV8NS3khbFb4=;
 b=F64sd3mX90SLH70HC59SjRP08Qg3mQXh5EDQLMz4wmQ5/X8+kLOdReM8
 1u4b4DbioIEKvJDwsfOh4HCJQW2aTqEA9BnhvHtBQTj48RyqzG0ffb8a2
 +77GAzmozZXy2oO8lNsLLW20l4C4j6QmkvIxHlwWEiKrlTc2DPHVqu5nO o=;
X-IronPort-AV: E=Sophos;i="5.98,314,1673913600"; d="scan'208";a="200397265"
Subject: Re: [RFC PATCH 0/1] Implement entropy leak reporting for virtio-rng
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-pdx-2a-m6i4x-83883bdb.us-west-2.amazon.com)
 ([10.25.36.214]) by smtp-border-fw-80007.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2023 14:27:25 +0000
Received: from EX19D014EUA002.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-pdx-2a-m6i4x-83883bdb.us-west-2.amazon.com (Postfix)
 with ESMTPS id 6E03260B55; Mon,  3 Apr 2023 14:27:23 +0000 (UTC)
Received: from EX19D037EUB003.ant.amazon.com (10.252.61.119) by
 EX19D014EUA002.ant.amazon.com (10.252.50.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 3 Apr 2023 14:27:22 +0000
Received: from [192.168.7.1] (10.1.213.24) by EX19D037EUB003.ant.amazon.com
 (10.252.61.119) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Mon, 3 Apr
 2023 14:27:19 +0000
Message-ID: <7cbaef2f-dde2-8a23-dd99-cf99292bd62e@amazon.es>
Date: Mon, 3 Apr 2023 16:27:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
From: <bchalios@amazon.es>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Amit Shah
 <amit@kernel.org>, <qemu-devel@nongnu.org>, <sgarzare@redhat.com>,
 <graf@amazon.de>, <xmarcalx@amazon.co.uk>
References: <20230403105245.29499-1-bchalios@amazon.es>
 <CAHmME9q3W4HKXERGdtrMHvaTO_as3UYow9qHQjRroyWW0iA-8Q@mail.gmail.com>
 <CAHmME9qhqNvDsOaAdn5PzgtogC4tJKgE3uCn6MVC1b+Ha3jKuA@mail.gmail.com>
In-Reply-To: <CAHmME9qhqNvDsOaAdn5PzgtogC4tJKgE3uCn6MVC1b+Ha3jKuA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.1.213.24]
X-ClientProxiedBy: EX19D031UWA001.ant.amazon.com (10.13.139.88) To
 EX19D037EUB003.ant.amazon.com (10.252.61.119)
Precedence: Bulk
Received-SPF: pass client-ip=99.78.197.218;
 envelope-from=prvs=450a44d59=bchalios@amazon.es; helo=smtp-fw-80007.amazon.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.349, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 4/3/23 4:16 PM, "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> 
> 
> 
> On Mon, Apr 3, 2023 at 4:15 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >
> > Hi Babis,
> >
> > Why are you resending this? As I mentioned before, I'm going to move
> > forward in implementing this feature in a way that actually works with
> > the RNG. I'll use your RFC patch as a base, but I think beyond that, I
> > can take it from here.
> 
> Grrr, sorry! This is for QEMU! I understand.
> 
> (Kernel ends from me are forthcoming.)
> 
> Jason
> 

Hey Jason,

Good to hear from you. Yeap, I thought it would be nice to be able to test this using QEMU (apart from Firecracker).

Cheers,
Babis 

