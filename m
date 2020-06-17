Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AEC1FCE5E
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jun 2020 15:27:48 +0200 (CEST)
Received: from localhost ([::1]:58126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlY6U-0002oT-Uf
	for lists+qemu-devel@lfdr.de; Wed, 17 Jun 2020 09:27:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1jlY56-0001Vb-C7
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 09:26:20 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:33129
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1jlY54-0003Hj-3Z
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 09:26:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592400377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sBgrSeyBU4s38A9ur7JIkxJ0RpeWlc3nIkdb0JvNhRk=;
 b=b0rM+04GhUa0ZYbIq7U/4SekZuBxGGwjZFFw2gxA4DGizjShf8ocZq63eKIWWvacZq78tn
 SVUhDSMXVS6WPhn3lXXY/Dxccim7/8BYFedEKTZyPx3yffZ7rCwPbS92iz/r/fdtY7WoNm
 vso38Jr9a5cRVDPMzlLmDJJBRbOUnAY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-Qni1T5kdPqSUrHqCajJceQ-1; Wed, 17 Jun 2020 09:26:15 -0400
X-MC-Unique: Qni1T5kdPqSUrHqCajJceQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E6A284E0AD;
 Wed, 17 Jun 2020 13:26:12 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-115-92.ams2.redhat.com
 [10.36.115.92])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 37A01285854;
 Wed, 17 Jun 2020 13:25:56 +0000 (UTC)
Subject: Re: ovmf / PCI passthrough impaired due to very limiting PCI64
 aperture
To: Gerd Hoffmann <kraxel@redhat.com>,
 Guilherme Piccoli <gpiccoli@canonical.com>
References: <99779e9c-f05f-501b-b4be-ff719f140a88@canonical.com>
 <20200616165043.24y2cp53axk7uggy@sirius.home.kraxel.org>
 <20200616165746.GH2788@work-vm>
 <CAHD1Q_zGu4Q63HjHx3aZKu3wh8NppuP6T4kgnUN3j=-ZDufVZA@mail.gmail.com>
 <20200617064014.3j7no7d7trob2ioc@sirius.home.kraxel.org>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <fefd8b35-bf57-c88e-5cfc-815189bbf05a@redhat.com>
Date: Wed, 17 Jun 2020 15:25:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Firefox/52.0 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200617064014.3j7no7d7trob2ioc@sirius.home.kraxel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/17 02:02:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Pedro Principeza <pedro.principeza@canonical.com>, ehabkost@redhat.com,
 Dann Frazier <dann.frazier@canonical.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Christian Ehrhardt <christian.ehrhardt@canonical.com>, qemu-devel@nongnu.org,
 fw@gpiccoli.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/17/20 08:40, Gerd Hoffmann wrote:
>   Hi,
> 
>> What if then we have OVMF relying in the physbits *iff*
>> "-host-phys-bits" is used
> 
> How can the guest know?

Exactly!

> Adding "you can trust physbits" bits somewhere (as suggested by Eduardo)
> would work for sure, but would depend on a qemu update.
> 
> Maybe a "don't trust physbits in case it is 40" heuristic works well
> enough in practice.

... for how many years? ;)

No heuristics please.

(I absolutely prefer X-PciMmio64Mb to guesswork. With X-PciMmio64Mb,
users at least know they have to be careful. I know they don't like
that, they just want a promise "it will work forever", but it's not
randomly called "experimental", we're not there just yet.)

Thank you,
Laszlo

>> Now, regarding the problem "to trust or not" in the guests' physbits,
>> I think it's an orthogonal discussion to some extent.
> 
> It isn't.  OVMF can't ignore the problem, you risk to break guests if
> you do.
> 
> take care,
>   Gerd
> 


