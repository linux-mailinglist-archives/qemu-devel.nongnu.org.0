Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 111445F7D76
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 20:41:44 +0200 (CEST)
Received: from localhost ([::1]:41358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogsI2-0001uW-O6
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 14:41:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave@stgolabs.net>) id 1ogsDr-0007v2-3l
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 14:37:23 -0400
Received: from gt-egress-001.relay.mailchannels.net ([199.10.31.235]:46625
 helo=relay.mailchannels.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave@stgolabs.net>) id 1ogsDn-0001pY-PO
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 14:37:22 -0400
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id DE9636C13F3;
 Fri,  7 Oct 2022 18:37:01 +0000 (UTC)
Received: from pdx1-sub0-mail-a218 (unknown [127.0.0.6])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id 217106C13AD;
 Fri,  7 Oct 2022 18:37:00 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1665167820; a=rsa-sha256;
 cv=none;
 b=T8TTrLfsxub5Sldpq125VeHTJDg8NZkXdu/FtC4L9jOM2nc5cHlnHURgdZBHUrNVoM5tk8
 D86xYJU70a90pOBAD8J46bqXgdbRpE+HyoVHUa1wngOaAg90hrQDipDWiYctb4N6CxG9u1
 O/s8PUTghG9kQ3AiIwBTHssPeeyRMpFKMYqNOT9MlOjoT67OmK0hCndPHZ46vOcaq4F3aM
 7YmgR0dUbYS2shBbfK0VWnoVxT4cwJNj3m2vs6fBBKhj+s3JUMJb+nxw+4hKYgBHbwIeQI
 R0AH1p1Uldlfb1bSukdHctvb07g3nU2ECXu45qmgConLYRBEML2/XEkuGqEp2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net; s=arc-2022; t=1665167820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:dkim-signature;
 bh=31cY904QFEvmfcAAsvwyeUqiZ/49j6nOzymPMZsDZ/s=;
 b=sdKhZBWYSGrEUhaxtu0bjERQvF2MG+sePsa9LcLKPpf5M7RRrnar5LVkPQm5B/SyBIQ3wx
 HPLAt10KZlNBmZW6zGTobqc/Z5tqEQhdkFGL1KYPoFGQ5irZENQFHDzEbRSLMBeMTbZ9en
 YUsUoKJz56CJJQKoflG+YvBG639+YRgM3gmbfV+9EmqZKbe0vSuS5N1NBmtdbm4SamCN/n
 uFJh8HjW8JL16L6P23LCx4+p9buXJ1B0txsecMCMRIqdMkoCErtViZudJTIjjO91AgO+nZ
 wTaQn3SG0Abp+ePNFeNH9sxvTizF0f26SmefjcT2OXLTgXgqjsUA3FB2j1Io4w==
ARC-Authentication-Results: i=1; rspamd-755f899884-6m66d;
 auth=pass smtp.auth=dreamhost smtp.mailfrom=dave@stgolabs.net
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Battle-Bored: 58e986521b46a821_1665167820515_3553219686
X-MC-Loop-Signature: 1665167820515:2070812966
X-MC-Ingress-Time: 1665167820514
Received: from pdx1-sub0-mail-a218 (pop.dreamhost.com [64.90.62.162])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.97.34.80 (trex/6.7.1); Fri, 07 Oct 2022 18:37:00 +0000
Received: from offworld (ip72-199-50-187.sd.sd.cox.net [72.199.50.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: dave@stgolabs.net)
 by pdx1-sub0-mail-a218 (Postfix) with ESMTPSA id 4MkcTx3pdkz63;
 Fri,  7 Oct 2022 11:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
 s=dreamhost; t=1665167814;
 bh=MvStcbMf5Wa2KZtZXLZR3Fgd2EtzLBtlC8MvwUU2FvQ=;
 h=Date:From:To:Cc:Subject:Content-Type;
 b=jW21RdokcU00elsXYDpYfKEEy+1KN9iYT8St1GKwaIuJlJ9LN4bPbuIUHqCl0oWLz
 W9MdalesJOofIqK+dpqBC20Y1vKAgL7n6MSZLYVvKAbfeGJJWba7jjnbANBmWBudkv
 UMV78Ia7/DssL0B4xVVcnkKYKv0FuS/qOKrA88XRAYn0PMRVpZcDrZ70T27hT1LFiy
 03ymSHGEgMogVSyFpmC1qi/Bz5mqr1ZdacT15MLH/xyL6s3MUAii8xlGFIgZABQ7WP
 Hliy68DKPPY4tk+VGhNqMEFB/86AjWLyw7NLdzybdCp+m/W+1pW8E89xPo2Q3wZVCU
 V0Wrp5DZ2H+zQ==
Date: Fri, 7 Oct 2022 11:16:19 -0700
From: Davidlohr Bueso <dave@stgolabs.net>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Gregory Price <gourry.memverge@gmail.com>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org, Alison Schofield <alison.schofield@intel.com>,
 "a.manzanares@samsung.com" <a.manzanares@samsung.com>,
 Ben Widawsky <bwidawsk@kernel.org>
Subject: Re: [PATCH RFC] hw/cxl: type 3 devices can now present volatile or
 persistent memory
Message-ID: <20221007181619.gumcab46ftnvhwbi@offworld>
References: <20221006000103.49542-1-gregory.price@memverge.com>
 <20221006094557.000035ab@huawei.com>
 <20221006095007.00001271@huawei.com> <Yz75ppPOwYCvNamy@fedora>
 <20221006174214.000059c7@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20221006174214.000059c7@huawei.com>
User-Agent: NeoMutt/20220429
Received-SPF: pass client-ip=199.10.31.235; envelope-from=dave@stgolabs.net;
 helo=relay.mailchannels.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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

On Thu, 06 Oct 2022, Jonathan Cameron wrote:
>> 3) Upstream linux drivers haven't touched ram configurations yet.  I
>> just configured this with Dan Williams yesterday on IRC.  My
>> understanding is that it's been worked on but nothing has been
>> upstreamed, in part because there are only a very small set of devices
>> available to developers at the moment.
>
>There was an offer of similar volatile memory QEMU emulation in the
>session on QEMU CXL at Linux Plumbers.  That will look something like you have
>here and maybe reflects that someone has hardware as well...

Yeah, putting this back together was on my todo list, but happy to see
patches are out. Recollecting my thoughts on this, my original approach
was also to support only volatile or persistent capacities, but through
two backends, and thus two address spaces. Afaik the last idea that was
discussed on IRC in this regard was to do it with a single backend along
with a pmem_offset=N boundary (0 or 100% for example for one type or the
other) tunnable.

...

>> Seems a little odd to use two memory backends.  Of what use is it to the
>> software developers, it should be completely transparent to them, right?
>>
>> The only thing I can think of is maybe reset mechanics for volatile
>> regions being set differently than persistent regions, but even then it
>> seems simple enough to just emulate the behavior and use a single
>> backing device.
>
>It's a very convenient path as lets us define sizes and things from the
>actual memdev rather than duplicating all the configuration in multiple
>devices.  If it weren't for the ability to change the allocations at runtime
>I'd definitely say this was the best path.  That corner makes it complex
>but I'd still like the simplicity of you throw a backend at the device
>and we set up all the description on basis that backend is what we want
>to use.

Agreed.

...

>> > > >  Example command lines
>> > > >  ---------------------
>> > > > -A very simple setup with just one directly attached CXL Type 3 device::
>> > > > +A very simple setup with just one directly attached CXL Type 3 Persistent Memory device::
>> > > >
>> > > >    qemu-system-aarch64 -M virt,gic-version=3,cxl=on -m 4g,maxmem=8G,slots=8 -cpu max \
>> > > >    ...
>> > > > @@ -308,7 +308,18 @@ A very simple setup with just one directly attached CXL Type 3 device::
>> > > >    -object memory-backend-file,id=cxl-lsa1,share=on,mem-path=/tmp/lsa.raw,size=256M \
>> > > >    -device pxb-cxl,bus_nr=12,bus=pcie.0,id=cxl.1 \
>> > > >    -device cxl-rp,port=0,bus=cxl.1,id=root_port13,chassis=0,slot=2 \
>> > > > -  -device cxl-type3,bus=root_port13,memdev=cxl-mem1,lsa=cxl-lsa1,id=cxl-pmem0 \
>> > > > +  -device cxl-type3,bus=root_port13,pmem=true,memdev=cxl-mem1,lsa=cxl-lsa1,id=cxl-pmem0 \

So regardless of the interface we end up with, volatile and lsa parameters
should be mutually exclusive.

Thanks,
Davidlohr

