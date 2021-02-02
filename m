Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8D430C3C5
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 16:29:12 +0100 (CET)
Received: from localhost ([::1]:39390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6xc7-0001Kz-H7
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 10:29:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l6xA2-0007av-35
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:00:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l6x9y-0000fN-TB
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:00:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612278005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YFKVGYadxHSVbc/ywHmPIDy9ZiFqmFspKFlQMwx4RZQ=;
 b=Fx0IoTKfZZ8nKeDHUcGgLR824rWl7XlkRGITdZoCdrxKF8fk8+plIG4OBnRji52+mwsXqK
 QDxVOfr8DuRceqDnV1IlzUCMuCMw2OUSy7RoruyJb0CiFTUIx8sKo1/k8ZVOZxojiZ/9Kl
 NccuvEdhcf3ohmwe1dKfn9XW6GKg894=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-vnjNe5fnP-CNe6Ioq7f2Fg-1; Tue, 02 Feb 2021 10:00:03 -0500
X-MC-Unique: vnjNe5fnP-CNe6Ioq7f2Fg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E20091846091;
 Tue,  2 Feb 2021 15:00:00 +0000 (UTC)
Received: from [10.3.112.103] (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E57460C69;
 Tue,  2 Feb 2021 14:59:57 +0000 (UTC)
Subject: Re: [PATCH v4 00/16] 64bit block-layer: part I
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201211183934.169161-1-vsementsov@virtuozzo.com>
 <81abe7dc-6053-72d2-ddf7-352dc21e75b6@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <d24657a3-6845-3dba-52ff-89665f256aa9@redhat.com>
Date: Tue, 2 Feb 2021 08:59:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <81abe7dc-6053-72d2-ddf7-352dc21e75b6@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/1/21 8:56 PM, Eric Blake wrote:
> I had planned to send a pull request for this series today, but ran into
> a snag.  Without this series applied, './check -qcow2' fails 030, 185,
> and 297.  With it applied, I now also get a failure in 206.  I'm trying
> to bisect which patch caused the problem, but here's the failure:
> 
> 206   fail       [20:54:54] [20:55:01]   6.9s   (last: 6.7s)  output
> mismatch (see 206.out.bad)
> --- /home/eblake/qemu/tests/qemu-iotests/206.out
> +++ 206.out.bad
> @@ -180,7 +180,7 @@
> 
>  {"execute": "blockdev-create", "arguments": {"job-id": "job0",
> "options": {"driver": "qcow2", "file": "node0", "size":
> 9223372036854775296}}}
>  {"return": {}}
> -Job failed: Could not resize image: Required too big image size, it
> must be not greater than 9223372035781033984
> +Job failed: Could not resize image: offset(9223372036854775296) exceeds
> maximum(9223372035781033984)
>  {"execute": "job-dismiss", "arguments": {"id": "job0"}}
>  {"return": {}}
> 
> Looks like it is just a changed error message, so I can touch up the
> correct patch and then repackage the pull request

Culprit was "block: refactor bdrv_check_request: add errp".  I'm
preparing the pull request now.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


