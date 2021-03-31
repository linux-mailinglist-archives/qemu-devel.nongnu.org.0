Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8A335082B
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 22:27:12 +0200 (CEST)
Received: from localhost ([::1]:34986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRhQm-0005TT-2J
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 16:27:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lRhGS-0001Fv-Kt
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 16:16:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lRhGP-0006Na-De
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 16:16:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617221785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0iJBzSxVMOrJg2CupZr+AIcWk2loJCGHgc0A/qCOMPw=;
 b=aCf0r+pq4Qal14FNGkncoEob/i77iqdPWlw7fqVjU2fs3PAhtEaMakzI4JreT+aELEFBTi
 x8xSilP8ZsBFCjkKT1ZYlB990zA5BPpJmzl9ECDWoqLst7Sq56UvIecwRLvbjjqzkuhUZC
 plvn+DKbIuOjBfOdiubJm3cggVBV5iI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-Q1xW8bSUNyCcCYTzZWKE2Q-1; Wed, 31 Mar 2021 16:16:21 -0400
X-MC-Unique: Q1xW8bSUNyCcCYTzZWKE2Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53BFB180FCA1;
 Wed, 31 Mar 2021 20:16:20 +0000 (UTC)
Received: from [10.3.113.141] (ovpn-113-141.phx2.redhat.com [10.3.113.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 087E35D72F;
 Wed, 31 Mar 2021 20:16:19 +0000 (UTC)
Subject: Re: Bug: object-add qmp command that used to work fails now
To: Lukas Straub <lukasstraub2@web.de>, Kevin Wolf <kwolf@redhat.com>
References: <20210331215844.43914a75@gecko.fritz.box>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <3929e394-ef6b-273b-4a07-53295d18fc25@redhat.com>
Date: Wed, 31 Mar 2021 15:16:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210331215844.43914a75@gecko.fritz.box>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/31/21 3:00 PM, Lukas Straub wrote:
> Hi,
> This qmp command that used to work:
> {"execute": "object-add", "arguments": {"qom-type": "filter-mirror", "id": "m0", "props": {"netdev": "hn0", "queue": "tx", "outdev": "mirror0", "vnet_hdr_support": false}}}
> now fails with the following error:
> {"error": {"class": "GenericError", "desc": "Parameter 'netdev' is missing"}}
> 
> I haven't looked closely into it, but I think
> 9151e59a8b6e854eb733553c6772351049ca6ab6 "qapi/qom: QAPIfy object-add"
> is the culprint.

Try getting rid of the nesting caused by props:

{"execute": "object-add", "arguments": {"qom-type": "filter-mirror",
"id": "m0", "netdev": "hn0", "queue": "tx", "outdev": "mirror0",
"vnet_hdr_support": false}}

Per docs/system/removed-features.rst, the change was intentional:

> ``object-add`` option ``props`` (removed in 6.0)
> ''''''''''''''''''''''''''''''''''''''''''''''''
> 
> Specify the properties for the object as top-level arguments instead.

although it is unfortunate that you didn't notice the change during the
deprecation cycle.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


