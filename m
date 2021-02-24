Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B8F3246E7
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 23:34:26 +0100 (CET)
Received: from localhost ([::1]:41788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF2jh-0006lB-4e
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 17:34:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lF2id-0006Cs-6y
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 17:33:19 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:58759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lF2ib-00089T-2k
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 17:33:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=9ul5o8Hu7naIdrDr/yDh4luZteKAYDR9ADBnrLt5OCM=; b=HTD3opBAqZryrbetvrp/uXq3HE
 7gbmoH/P5X/6vlEOZlgw3GeBtiNoXlTjfGsMZw0xxSmBeml8cCb7fAozfRZ4BG8u+A1rN01+d+6L3
 wFCBcqXBm7rxDfI0OFb3mz2AxUOgtJDRRSQoYINVbtznom4sDJj2/CdyrqKOpkLebSPAkoYaXVUBc
 5CiWdxJYjnWyIT6sNhV8ghoI17hVDZbJ4BGOeDz5NB5GPbMXNwKy3Vevk+8YJ6GLqTUCXJZDYM38X
 y8ALdFjkjcN52Gv3A4xCbvQ96SUxoHZFz2I7X41F9EJsPDUwfSUqk597FJtb3A9bCk5jfPUUKQiy2
 pPwywXSCBINLSfyZrvAu8+E5Tnt7FRJYAo8pqhIk2p/IxP2S0/E/UTDVf/1V6aApzv6wxBhEBT49Q
 q3KplUETipihwvCm3c5+WtlXEYryfqPue1WJCK3X63IgnFJtOFZdP3szjHvkpOyC49o0BDgqgk0kp
 AIDGmXYrkMLrI50TXL9gM/N+FabxJuR6v+tHkdjAfP0t2XSc7ZUYjQ51wnwUvcsb1bgS594zrRzI/
 5qxCO7KjpI8WacR2iLDUfVohteo5Q7GENTMUq9AH+sRn1NdvUCch/tj4HczSRpz14BM5b9N0MYeWi
 +RjxuUunmg+9zHXAGCjeILq1u3Kjwdr6CUNppYdaA=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Geoffrey McRae <geoff@hostfission.com>,
 =?ISO-8859-1?Q?Jos=E9?= Pekkarinen <koalinux@gmail.com>, kraxel@redhat.com
Subject: Re: [PATCH v2] Autoconnect jack ports by default
Date: Wed, 24 Feb 2021 23:33:14 +0100
Message-ID: <31652865.Htn8XJslzA@silver>
In-Reply-To: <5694e258e36c6623aae5465aafeec951@hostfission.com>
References: <20210224191927.19271-1-koalinux@gmail.com>
 <3407243.daszWApDLn@silver>
 <5694e258e36c6623aae5465aafeec951@hostfission.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mittwoch, 24. Februar 2021 23:04:47 CET Geoffrey McRae wrote:
> This goes against how all standard jack clients work, a new jack client
> should not auto-connect at all unless explicitly configured to as if
> there is an existing audio diagram configured (which is 99% of the time)
> it will cause unexpected/undesired behavior.
> 
> Jack is not supposed to be an 'automatic' system, it's the
> responsibility of the patch bay software to route connections.
> 
> The auto-connect feature exists to allow the jack audiodev to re-connect
> a broken connection when the jack device restarts/reconnects.

Well, that was also my idea first, and I would agree with you in case of a 
regular music app of course, but then I thought QEMU is probably not an 
average JACK client, and it simply lowers the entry level for new users who 
probably just want to output to system out anyway.

I mean, are you piping QEMU into Ardour or something Geoffrey?

This could still be overridden by passing a bogus pattern with argument 
"connect-ports" for people who prefer the patchbay approach in the end.

So I would vote for the "make it easy for newbies" approach in this case, but 
I leave that up to you and Gerd to decide. :)

Best regards,
Christian Schoenebeck



