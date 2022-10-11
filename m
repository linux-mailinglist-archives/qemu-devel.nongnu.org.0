Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 571635FB920
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 19:24:59 +0200 (CEST)
Received: from localhost ([::1]:46780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiIzx-0006R6-Kh
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 13:24:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave@stgolabs.net>) id 1oiIqE-0008Nr-Fp
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 13:14:55 -0400
Received: from butterfly.birch.relay.mailchannels.net ([23.83.209.27]:24205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave@stgolabs.net>) id 1oiIq6-0002DW-C6
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 13:14:48 -0400
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 3B0243E1FDE;
 Tue, 11 Oct 2022 17:14:43 +0000 (UTC)
Received: from pdx1-sub0-mail-a277 (unknown [127.0.0.6])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id 6CF983E1D49;
 Tue, 11 Oct 2022 17:14:42 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1665508482; a=rsa-sha256;
 cv=none;
 b=K7gHA9ulnroAQurKky1gLqtqqysjEc9bXpJcm3z0AeJ9JMphXxqyPTMqYxB8ZwNyDHUXoP
 /DItVO/ARjpgzWoy7sho+J81+nE/hKaGX39dVvMNMomMdyFDef1x+bj92055sTyi6GL1Fd
 i6gEUUYJj+YpprzkdSp+lqAbX94IJKfkloqhp9JPz4ZoMeTARZjOfe+Mj0NZ32Wlbs2g+x
 VLuin3sDQVNgUw7KQ0W3Y2OY3lk3IPSGkU5PBI1NPILVy5ylw8RX1m3GgykCezj/JsHjtC
 Xugp8FmgojVs/uhGv0b+9vdvhLRNqcNJ+IRuS86ehODf4hE0j3aPHsDvU/ZNww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net; s=arc-2022; t=1665508482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:dkim-signature;
 bh=Ni9QzluYHuABuQICUWppC9419jaJB/rzslm+BB4E7fI=;
 b=L3366/2sE19QuNPblbglcyAMwMs/Lg3spwL4LnBbX486dWBTicLGEmLR04sh5nCSwv5hLJ
 +9s/gf5XGE2o6vxIJHfCKvY+cc3Tehp718yuT4QFRNkArW51k+SQBNf92ivppXW4hP3AEV
 o5hZKzgCc9hwNHncngf74yfDpCRvspI28YrkPG46cSP5HvMEkhWcwTWKPIeXxIsVUaBaUW
 vCbeIy2WLYqtrCvQnFIpqCrlTTL0GuhHavJ7jJB8yNkEQ7sCT/qNa1nQhyV342yrccSDNn
 5neWX7z8WCnsoB2phVX2tfIjNCgkTyXu0qPoEQH98PjfAjAcQohYni2ht1BfXw==
ARC-Authentication-Results: i=1; rspamd-7c485dd8cf-f5nqg;
 auth=pass smtp.auth=dreamhost smtp.mailfrom=dave@stgolabs.net
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Battle-Hysterical: 6a489e367a0fa42d_1665508482779_136339988
X-MC-Loop-Signature: 1665508482779:2410212757
X-MC-Ingress-Time: 1665508482779
Received: from pdx1-sub0-mail-a277 (pop.dreamhost.com [64.90.62.162])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.97.77.221 (trex/6.7.1); Tue, 11 Oct 2022 17:14:42 +0000
Received: from offworld (ip72-199-50-187.sd.sd.cox.net [72.199.50.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dave@stgolabs.net)
 by pdx1-sub0-mail-a277 (Postfix) with ESMTPSA id 4Mn2TF5GVYz1j;
 Tue, 11 Oct 2022 10:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
 s=dreamhost; t=1665508482;
 bh=Ni9QzluYHuABuQICUWppC9419jaJB/rzslm+BB4E7fI=;
 h=Date:From:To:Cc:Subject:Content-Type;
 b=hxa4hD2GRO6ODs02LnCdHBsK6mewVvIQMUVaPUUrHTpfPBeQi4YbyEKEyT7Ui+5Qm
 qKBCODG+Fj6mIgBx19y77Zxf39QRhBRFTUboc270QLyB0B+QZl4QkQr3jSUZ9yzL1j
 8uG+M5jR8bV+zPIISsxFNkW9S1CyIn4OJaYr2RobR5nxcxJlLoD4B/gpSt28ERnUWD
 mx7OL/0BYYO22qGcTt6QBPCkkKQ3YTXBNFm58EYvbE6zB/s9pbqLMerTTLPYp9KQ49
 lgOcx37nbe7NOSfaM74OHOuCY9bjSOEm/9Nv/v1f2P2Nxoxhpdq8Fa2SV9ouXpa8ZZ
 qvMbRSxP2OXGA==
Date: Tue, 11 Oct 2022 10:14:38 -0700
From: Davidlohr Bueso <dave@stgolabs.net>
To: Gregory Price <gregory.price@memverge.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Gregory Price <gourry.memverge@gmail.com>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org, Alison Schofield <alison.schofield@intel.com>,
 "a.manzanares@samsung.com" <a.manzanares@samsung.com>,
 Ben Widawsky <bwidawsk@kernel.org>
Subject: Re: [PATCH RFC] hw/cxl: type 3 devices can now present volatile or
 persistent memory
Message-ID: <20221011171438.fwlgobgaegns3p7t@offworld>
References: <20221006000103.49542-1-gregory.price@memverge.com>
 <20221006094557.000035ab@huawei.com>
 <20221006095007.00001271@huawei.com> <Yz75ppPOwYCvNamy@fedora>
 <20221006174214.000059c7@huawei.com> <Yz8QlQ9yLFrWxWsN@fedora>
 <CAD3UvdT1ZHJDaqj05C+n7t4rM7yhjZyM6fooXAfG12rAYnBqmw@mail.gmail.com>
 <20221010161809.00006f8e@huawei.com>
 <Y0Q5a2Wx3qFB2eKI@memverge.com> <Y0TFg6198AHKjfux@memverge.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Y0TFg6198AHKjfux@memverge.com>
User-Agent: NeoMutt/20220429
Received-SPF: pass client-ip=23.83.209.27; envelope-from=dave@stgolabs.net;
 helo=butterfly.birch.relay.mailchannels.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, 10 Oct 2022, Gregory Price wrote:

>I've pushed 5 new commits to this branch here (@Jonathan I've also made
>a merge request to pull them into your branch).
>
>https://gitlab.com/gourry.memverge/qemu/-/commits/cxl-2022-10-09

This series could perhaps be posted as a reply to the CDAT extensions
cover letter. But regardless, at some point it should be in linux-cxl@.

>
>They're built on top of Jonathan's extensions for the CDAT since the
>CDAT has memory region relevant entries and trying to do this separate
>would be unwise.
>
>1/5: PCI_CLASS_MEMORY_CXL patch
>2/5: CXL_CAPACITY_MULTIPLIER pullout patch (@Davidlohr request)

Reviewed-by: Davidlohr Bueso <dave@stgolabs.net>

However this needs a changelog; for however redundant it may be.

>3/5: Generalizes CDATDsmas intialization ahead of multi-region

>4/5: Multi-region support w/ backward compatibility
>     * Requires extra eyes for CDAT and Read/Write Change Validation*

I'm still eyeballing this but it certainly looks much more complete now -
at least with the minimal support I was hoping for.

>5/5: Test and documentation update

I think that there should two examples here with volatile and LSA usage.
The first is without as it is quite unintuitive otherwise, then a
second example with specifying the lba. Also in these cases you want
id=cxl-vmem0. And the documentation should be updated to mention that
memdev is deprecated and {persistent/volatile}-memdev should be used.

Thanks,
Davidlohr

