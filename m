Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E785FA388
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 20:45:03 +0200 (CEST)
Received: from localhost ([::1]:36928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohxlu-0004I4-Cl
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 14:45:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave@stgolabs.net>) id 1ohwkn-00020w-F1
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:39:49 -0400
Received: from insect.birch.relay.mailchannels.net ([23.83.209.93]:11527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave@stgolabs.net>) id 1ohwkl-0000Wu-33
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:39:48 -0400
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 2C799921FFD;
 Mon, 10 Oct 2022 17:39:41 +0000 (UTC)
Received: from pdx1-sub0-mail-a236.dreamhost.com (unknown [127.0.0.6])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id 648F0921DD5;
 Mon, 10 Oct 2022 17:39:40 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1665423580; a=rsa-sha256;
 cv=none;
 b=ndKHUhRi9yKT0qQCaTNe3cbI8S90SV8aqU/PeCi3yjrQGj6Eln8962B0jB/rEZmTnjRQz/
 ibxNsCZeZGGXJaSuHl0PZsydHEBOjqvMVMCdewCU28v4Qrss5+ri7IVE89XOospfaQiFnf
 4gCKgFAO9PQjtML3FO2LYNXTG/KZAqXLlJ2Wcjk19reUzE8CcMDVX4aoxzdaWu3MrVOW8V
 /AkwGGBOPg2k8+MicO9jCcG3mGFSCpAio2lvGVISETaDxHnFKsfBAHTPzrhwDCO18jssUN
 eOWfmL9AJDpv7bflbLfynLXpgtbfHCOo2OIRvCPoHS3H3rUJZTDeJavKfhvE1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net; s=arc-2022; t=1665423580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:dkim-signature;
 bh=gGmlWW7IjW5I6T1Q1olP9QULCjSHVNP8cLU/WlKtH8o=;
 b=cIHwfvYJM6qQRFCsDjsaaAg1p62o3H03jIhFyRanriBjmBkcLyMf5D6ucvH69o6VZ6Uimm
 7IrhTSPWV3Vol/B46m8kDpCpwGeLkQKYeu79dvX14VZEpIlHVjrX95yFRodjyyDz6/7/OK
 cEBxTuCc1hbdEqAhSwUBM37Cd3IGb2g7uM7zVnHHSyi2Vk3Twra5lH+Fkb+0oGEdP3nnvp
 aWyy4B07PH15aRLsL/po5PfoRVlqshKV2LkCd6o5uWtkIsXp1PNklH8gkCff3Fhpn6TJ/K
 5HwRlWOTpsvFxgDARQVOPWXj1PZTrOhuivdk/Vt/APakTbsRMq/z80mTxSZ0rQ==
ARC-Authentication-Results: i=1; rspamd-7c485dd8cf-xj8f2;
 auth=pass smtp.auth=dreamhost smtp.mailfrom=dave@stgolabs.net
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Bitter-Continue: 027f11f70c9975ff_1665423580913_1980910223
X-MC-Loop-Signature: 1665423580913:2291040994
X-MC-Ingress-Time: 1665423580913
Received: from pdx1-sub0-mail-a236.dreamhost.com (pop.dreamhost.com
 [64.90.62.162]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.116.63.144 (trex/6.7.1); Mon, 10 Oct 2022 17:39:40 +0000
Received: from offworld (ip72-199-50-187.sd.sd.cox.net [72.199.50.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: dave@stgolabs.net)
 by pdx1-sub0-mail-a236.dreamhost.com (Postfix) with ESMTPSA id 4MmR4W3Fv5z6s; 
 Mon, 10 Oct 2022 10:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
 s=dreamhost; t=1665423580;
 bh=gGmlWW7IjW5I6T1Q1olP9QULCjSHVNP8cLU/WlKtH8o=;
 h=Date:From:To:Cc:Subject:Content-Type;
 b=UXEbqIuuyvY+3fP/kksMsIEIesqr+mNBngDDpJp+jrFJGFOn+97Bwnyj4Dy/f+OVs
 TZoMRErULyZDIGPcIhBeET+vV/r1mzjh9qourCPjHYzjp/PndXiememNpCE8ZOmbh/
 KeDVF7TtmdBi+wsAz1I5/PZdlqSJ+axGqsR9emplHa7JQmNweizIqDFn6qTVqDJs8y
 spuBSLOc05aNsUZ7e0rhBmFHueUyid/nRP8mhL/6nU28GicF50TcO8PoxNSJCk6//m
 AkrUtkkuWud41BhtRgK93cu/SolHViMULPeQHa2bGGXMxAsoAYtEhJacLQqgVCHwdK
 jEwQP13/8IWvw==
Date: Mon, 10 Oct 2022 10:18:55 -0700
From: Davidlohr Bueso <dave@stgolabs.net>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Gregory Price <gourry.memverge@gmail.com>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org, Alison Schofield <alison.schofield@intel.com>,
 "a.manzanares@samsung.com" <a.manzanares@samsung.com>,
 Ben Widawsky <bwidawsk@kernel.org>
Subject: Re: [PATCH RFC] hw/cxl: type 3 devices can now present volatile or
 persistent memory
Message-ID: <20221010171855.mgpfwnz3ugq2jnrh@offworld>
References: <20221006000103.49542-1-gregory.price@memverge.com>
 <20221006094557.000035ab@huawei.com>
 <20221006095007.00001271@huawei.com> <Yz75ppPOwYCvNamy@fedora>
 <20221006174214.000059c7@huawei.com> <Yz8QlQ9yLFrWxWsN@fedora>
 <20221010154343.00007afd@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20221010154343.00007afd@huawei.com>
User-Agent: NeoMutt/20220429
Received-SPF: pass client-ip=23.83.209.93; envelope-from=dave@stgolabs.net;
 helo=insect.birch.relay.mailchannels.net
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

On Mon, 10 Oct 2022, Jonathan Cameron wrote:

>I wonder if we care to emulate beyond 1 volatile and 1 persistent.
>Sure devices might exist, but if we can exercise all the code paths
>with a simpler configuration, perhaps we don't need to handle the
>more complex ones?

Yes, I completely agree. 1 of each seems like the best balance between
exercising code paths vs complexity.

Thanks,
Davidlohr

