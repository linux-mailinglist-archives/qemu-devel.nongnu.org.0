Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB3442C19E
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 15:42:18 +0200 (CEST)
Received: from localhost ([::1]:41818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maeWP-0003A0-Pi
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 09:42:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1maeLL-0006bH-0e; Wed, 13 Oct 2021 09:30:52 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:59276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1maeL3-00050T-G2; Wed, 13 Oct 2021 09:30:47 -0400
Received: from [192.168.15.165] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 1486221C32;
 Wed, 13 Oct 2021 13:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1634131831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xc1muD9OeRZouDYRGFL4fR3ysklq7pax+BpwwDfULd4=;
 b=URU3Av7Ga7uGceOY/wj9crDtvFnGIpKloaoYCyZSy/xKahNbJCAlJV3MzQ8g6gbzR4SKLe
 CAwrPNtl1fwA9hGWsQYNTgQIjt7jQbK+wT7rPC1RRHV71tZ9RmD67NAgpkrVoaNMHOFYUh
 LRJe9HAwkKXNxneggouOhxC2snk8t7o=
Message-ID: <4bfdf12e-b24a-5111-c972-663ed8506385@greensocs.com>
Date: Wed, 13 Oct 2021 15:30:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH v2 02/15] net/vhost-user: Fix device compatibility check
Content-Language: en-US-large
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20211008133442.141332-1-kwolf@redhat.com>
 <20211008133442.141332-3-kwolf@redhat.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <20211008133442.141332-3-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: lvivier@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, mst@redhat.com,
 libvir-list@redhat.com, jasowang@redhat.com, quintela@redhat.com,
 armbru@redhat.com, vsementsov@virtuozzo.com, its@irrelevant.dk,
 pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/8/21 15:34, Kevin Wolf wrote:
> vhost-user works only with specific devices. At startup, it second
> guesses what the command line option handling will do and error out if
> it thinks a non-virtio device will attach to them.
> 
> This second guessing is not only ugly, it can lead to wrong error
> messages ('-device floppy,netdev=foo' should complain about an unknown
> property, not about the wrong kind of network device being attached) and
> completely ignores hotplugging.
> 
> Drop the old checks and implement .check_peer_type() instead to fix
> this. As a nice side effect, it also removes one more dependency on the
> legacy QemuOpts infrastructure and even reduces the code size.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>

Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>

