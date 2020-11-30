Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BAD2C8AF2
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 18:28:11 +0100 (CET)
Received: from localhost ([::1]:45146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjmyA-0001ue-6R
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 12:28:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kjmvF-0007q8-1g
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 12:25:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kjmvB-0001yv-HR
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 12:25:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606757104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+sfWVqa+0Hrfmhn2dPiOCJ9BBdvfQd09Mmkhsc3SQ2g=;
 b=IU8rFg3Bc821RqjvhA0qvCmfaRfJxu93s6BCJmK9UmY9NYfB5Dnh+XOr9yGO0ae0hguLOf
 zzmutF+Zbun/PqEItLm991hcvJzuwrdysbAum8YStjW7mNp0re7wF6qyiIc/XpAxFnE8g/
 mc6ISTDCjmzpT65kd5w7sbPL6JY+WQ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-Vt2vGFb_MI-DBidvmQoptg-1; Mon, 30 Nov 2020 12:24:57 -0500
X-MC-Unique: Vt2vGFb_MI-DBidvmQoptg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 514E31012770;
 Mon, 30 Nov 2020 17:24:38 +0000 (UTC)
Received: from [10.3.113.230] (ovpn-113-230.phx2.redhat.com [10.3.113.230])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E26367C73;
 Mon, 30 Nov 2020 17:24:36 +0000 (UTC)
To: Kevin Wolf <kwolf@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <87r1ofru4z.fsf@dusky.pond.sub.org>
 <20201127101405.GA1596141@redhat.com>
 <20201127103216.GA4736@merkur.fritz.box>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: ImageInfo oddities regarding compression
Message-ID: <a6630327-eda0-0f5e-1fb5-2ad4db2fd994@redhat.com>
Date: Mon, 30 Nov 2020 11:24:35 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201127103216.GA4736@merkur.fritz.box>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Max Reitz <mreitz@redhat.com>, Denis Plotnikov <dplotnikov@virtuozzo.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/27/20 4:32 AM, Kevin Wolf wrote:

>>>    ##
>>>    # @Qcow2CompressionType:
>>>    #
>>>    # Compression type used in qcow2 image file
>>>    #
>>>    # @zlib: zlib compression, see <http://zlib.net/>
>>>    # @zstd: zstd compression, see <http://github.com/facebook/zstd>
>>>    #
>>>    # Since: 5.1
>>>    ##
>>>    { 'enum': 'Qcow2CompressionType',
>>>      'data': [ 'zlib', { 'name': 'zstd', 'if': 'defined(CONFIG_ZSTD)' } ] }
>>>
>>> Apparently, you can't have a qcow2 image without compression.  Correct?
>>>
>>> Can you imagine a use case for "without compression"?
>>
>> Yes & no. An image always has a compression type, either implicitly
>> zlib as the historical default, or explicitly as a type recorded in
>> the header.  This doesn't mean compression is used.
>>
>> There may be zero or more clusters actually using compression.
>> Typically compression will never be used, but there's still an
>> associated compression type regardless.
> 
> Right, so the correct answer to "is this image compressed?" is "unknown"
> for qcow2. Providing an answer would require checking all clusters in
> the image for the compression flag, which is not something we want to do
> for query-block. And even if we did that, it would still be unclear what
> to do with a partially compressed image.

If we truly need it, we could define three new autoclear bits in the
qcow2 spec:

bit 2: set if bits 3-4 are known to describe entire image
bit 3: set any time a compressed cluster is written to the image
bit 4: set any time an uncompressed cluster is written to the image

Any edit to the image by an older qemu will clear all three bits,
whereas new qemu would set bit 2 on image creation, and set the
appropriate bit 3 or 4 on any cluster write, so that we then have the
following knowledge:

234
===
000 - image was created or modified by older qemu; we have no idea if
clusters are written, or if compression was used, without expensive scan
001 - image contains at least one normal cluster, but no idea if it also
contains compressed clusters without expensive scan
010 - image contains at least one compressed cluster, but no idea if it
is fully compressed without expensive scan
011 - image contains mix of normal and compressed clusters
100 - image is newly created with no written clusters
101 - image contains only normal clusters; compression type could be
changed without risk
110 - image contains only compressed clusters
111 - image contains mix of normal and compressed clusters

But I'm not sure we need it.

> 
> The @compression-type only tells you what format a compressed cluster
> uses if any compressed cluster exists in the image (or if a new
> compressed cluster is written to it). It doesn't mean that such clusters
> currently exist.
> 
> Kevin
> 
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


