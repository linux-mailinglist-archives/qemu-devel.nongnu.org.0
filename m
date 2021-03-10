Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACC433431F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 17:35:20 +0100 (CET)
Received: from localhost ([::1]:39424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK1nr-00039V-CZ
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 11:35:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lK1NU-0001nX-Lb
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:08:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lK1NS-0006Tn-8z
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:08:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615392481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AsdMloTgN0taXsKQ40fAoCDOkUQzGz5Ut5F3C362uuY=;
 b=dgplIK4c37Hc3trrKFsTri/AHiGrstfgMB+jBNcv4Z4OlrDXJPe0W7a7JsXMISKJEtlU86
 THfz6P6LM/C1zABR7g+wxZptkTRFz+TZ49xyy833wirMbfkJAki2SKCZmGWSEu1a5zHy5g
 nb67zNMhFlC9zm02fckEFdDeDJZMS24=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-x_2gyhbROf2NCos7PAJryg-1; Wed, 10 Mar 2021 11:07:58 -0500
X-MC-Unique: x_2gyhbROf2NCos7PAJryg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D00E48015BD;
 Wed, 10 Mar 2021 16:07:57 +0000 (UTC)
Received: from [10.3.112.36] (ovpn-112-36.phx2.redhat.com [10.3.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A4115945D;
 Wed, 10 Mar 2021 16:07:57 +0000 (UTC)
Subject: Re: [PATCH 4/4] iotests/108: Test new refcount rebuild algorithm
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210310155906.147478-1-mreitz@redhat.com>
 <20210310155906.147478-5-mreitz@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <0c178b42-de16-3400-1ea8-852474ed7391@redhat.com>
Date: Wed, 10 Mar 2021 10:07:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210310155906.147478-5-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/21 9:59 AM, Max Reitz wrote:
> One clear problem with how qcow2's refcount structure rebuild algorithm
> used to be before "qcow2: Improve refcount structure rebuilding" was
> that it is prone to failure for qcow2 images on block devices: There is
> generally unused space after the actual image, and if that exceeds what
> one refblock covers, the old algorithm would invariably write the
> reftable past the block device's end, which cannot work.  The new
> algorithm does not have this problem.
> 
> Test it with three tests:
> (1) Create an image with more empty space at the end than what one
>     refblock covers, see whether rebuilding the refcount structures
>     results in a change in the image file length.  (It should not.)
> 
> (2) Leave precisely enough space somewhere at the beginning of the image
>     for the new reftable (and the refblock for that place), see whether
>     the new algorithm puts the reftable there.  (It should.)
> 
> (3) Test the original problem: Create (something like) a block device
>     with a fixed size, then create a qcow2 image in there, write some
>     data, and then have qemu-img check rebuild the refcount structures.
>     Before HEAD^, the reftable would have been written past the image
>     file end, i.e. outside of what the block device provides, which
>     cannot work.  HEAD^ should have fixed that.
>     ("Something like a block device" means a loop device if we can use
>     one ("sudo -n losetup" works), or a FUSE block export with
>     growable=false otherwise.)

We could use qemu-nbd as another alternative to create a non-growable
protocol layer.  Then we don't need root access via sudo to run the test.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


