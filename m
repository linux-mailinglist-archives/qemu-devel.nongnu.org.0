Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D22342C1B6
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 15:49:52 +0200 (CEST)
Received: from localhost ([::1]:56792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maedi-00058W-Pz
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 09:49:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1maeLX-0006nG-LV; Wed, 13 Oct 2021 09:31:03 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:59290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1maeLW-0005Na-2R; Wed, 13 Oct 2021 09:31:03 -0400
Received: from [192.168.15.165] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id E27AB21C32;
 Wed, 13 Oct 2021 13:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1634131860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pjW78Gk7FxZUlI8CrfkXE+I580nvmybsKoumrCIwtyQ=;
 b=gPuYxvessT+nCgfHNQ4EVaim0c3F9U62m0B4UjkXdt5ul6ZI/FHXd/RHJoA1jC1ilhJNfk
 amJnbdVOIm6L/2q6XhVUhyBqJ+zD3pHvMIM11QtQC72TkFbqviRuFcZU8mzQuK+nYhe2d0
 Jx2r2Ru36/cCV8IswFXyXXOmr8a8bck=
Message-ID: <d66bd915-001a-2ee8-fc44-8bb5abdae317@greensocs.com>
Date: Wed, 13 Oct 2021 15:30:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH v2 03/15] net/vhost-vdpa: Fix device compatibility check
Content-Language: en-US-large
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20211008133442.141332-1-kwolf@redhat.com>
 <20211008133442.141332-4-kwolf@redhat.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <20211008133442.141332-4-kwolf@redhat.com>
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
> vhost-vdpa works only with specific devices. At startup, it second
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

