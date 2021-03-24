Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9923471E6
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 07:54:10 +0100 (CET)
Received: from localhost ([::1]:35386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOxP7-0005wT-4B
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 02:54:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOxMk-0004f0-FM
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 02:51:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOxMi-0006J6-7s
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 02:51:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616568699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7bM8S6LrQT6dn63SuCPilTd5S91IWhqVMtZnWcv06qU=;
 b=Fs31w+jPkuk5ehWNGL93OU4rI3XBomnRypbKVHMfaATnBGiSh5A+OW1mYAADq16RDP4f2U
 isKwxUIVQF4U6/kmHEGkSyUei9ei+v2SIZxPwSjy0viayjSEP6ZMeQMSM3tL4jqOG3sIaW
 xsr5jHUsWighkag13BVE/o6oSmWIOWY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544--alfLzC5OD-_coqgPz_etw-1; Wed, 24 Mar 2021 02:51:35 -0400
X-MC-Unique: -alfLzC5OD-_coqgPz_etw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 393D61005D47;
 Wed, 24 Mar 2021 06:51:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F22992C8CD;
 Wed, 24 Mar 2021 06:51:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 83E5211327E1; Wed, 24 Mar 2021 07:51:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH V4 2/7] qapi/net.json: Add L4_Connection definition
References: <20210319035508.113741-1-chen.zhang@intel.com>
 <20210319035508.113741-3-chen.zhang@intel.com>
 <877dm3i1qk.fsf@dusky.pond.sub.org>
 <5b75057ecc784296aa271f5f6692906a@intel.com>
 <87k0pz4bg8.fsf@dusky.pond.sub.org>
 <4ffb0d8b135b40caba777a830b70ae18@intel.com>
 <871rc6urdc.fsf@dusky.pond.sub.org> <YFpML7sdeUiciL3B@work-vm>
 <87mtutf3pv.fsf@dusky.pond.sub.org>
Date: Wed, 24 Mar 2021 07:51:32 +0100
In-Reply-To: <87mtutf3pv.fsf@dusky.pond.sub.org> (Markus Armbruster's message
 of "Wed, 24 Mar 2021 07:47:08 +0100")
Message-ID: <878s6ddoy3.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Lukas Straub <lukasstraub2@web.de>, Li Zhijian <lizhijian@cn.fujitsu.com>,
 Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>, "Zhang,
 Chen" <chen.zhang@intel.com>, Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> writes:

> "Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:
[...]
>>                                     I think there should also beb
>> a separate type that represents an IP address+port, so that what you end
>> up with is:
>>
>>   IPFlowSpec
>>      ID
>>      Protocol
>>      Source
>>      Dest
>
> I understand the motivation.  Three drawbacks, though.
>
> One, it gets us another level of nesting on the wire, i.e. something
> like
>
>     {"source": {"address": SRC-ADDR, "port": SRC-PORT},
>      "destination": {"address": DST-ADDR, "port": DST-PORT}}
>
> instead of
>
>     {"source-address": SRC-ADDR, "source-port": SRC-PORT,
>      "destination-address": DST-ADDR, "destination-port": DST-PORT}
>
> QMP clients shouldn't care.
>
> Two, we have many (address, port) pairs in the schema that don't use
> nesting.  Adding nesting sometimes makes QMP less consistent.
>
> Three, human-friendly interface wrappers tend to dislike nesting.  This
> particular case seems okay; we end up with dotted keys like
> source.address instead of source-address.  In a case where we need just
> one (address, port), we'd get some-silly-name.address instead of just
> address, though.
>
> I've occasionally felt a mild need for letting me say "this struct
> member should be unboxed on the wire", i.e. have its curlies peeled off.
> Never enough to justify the additional generator complexity, though.

Just remembered we actually have

    ##
    # @InetSocketAddressBase:
    #
    # @host: host part of the address
    # @port: port part of the address
    ##
    { 'struct': 'InetSocketAddressBase',
      'data': {
        'host': 'str',
        'port': 'str' } }

It's from commit eb87203b64 "rbd: Reject -blockdev server.*.{numeric,
to, ipv4, ipv6}".


