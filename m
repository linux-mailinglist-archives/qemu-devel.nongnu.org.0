Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29018193F9F
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Mar 2020 14:20:20 +0100 (CET)
Received: from localhost ([::1]:51422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHSQk-0002pM-My
	for lists+qemu-devel@lfdr.de; Thu, 26 Mar 2020 09:20:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53505)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jHSPZ-0001lm-HU
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 09:19:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1jHSPX-0001Iq-GY
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 09:19:05 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:38967)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1jHSPX-0001IX-CI
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 09:19:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585228743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NZVIDfnA6e59ChUL+Wy7E/cjxZZmrMbKAF/1LtcN8P4=;
 b=EWMv7GsFaEnDboDnTADAuMPO7tsnXUSAuJ10WB9vZSF5LUzoyWDiTr8RFrwiL07PZqv7b5
 FeVK0/AUVJACCIQWBxvpxpGHKdWkNYqPa1nRn8IrUBM8adQuscL+Oj7lODM5+JzIbL5CA3
 XHkRS3TXICQAtv9K01neG6P2baYfX+M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-ypTpXZVyP_em-vrp_ky1Yw-1; Thu, 26 Mar 2020 09:18:59 -0400
X-MC-Unique: ypTpXZVyP_em-vrp_ky1Yw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9377E100550D;
 Thu, 26 Mar 2020 13:18:57 +0000 (UTC)
Received: from [10.3.113.103] (ovpn-113-103.phx2.redhat.com [10.3.113.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D6D4A0A9F;
 Thu, 26 Mar 2020 13:18:49 +0000 (UTC)
Subject: Re: [PATCH 1/2] block: pass BlockDriver reference to the
 .bdrv_co_create
To: Maxim Levitsky <mlevitsk@redhat.com>, qemu-devel@nongnu.org
References: <20200326011218.29230-1-mlevitsk@redhat.com>
 <20200326011218.29230-2-mlevitsk@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <af808169-5dcb-6293-3c8a-00ab0a9cd76e@redhat.com>
Date: Thu, 26 Mar 2020 08:18:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200326011218.29230-2-mlevitsk@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 integration@gluster.org, sheepdog@lists.wpkg.org,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Jeff Cody <codyprime@gmail.com>, Stefan Weil <sw@weilnetz.de>,
 Peter Lieven <pl@kamp.de>, "Richard W.M. Jones" <rjones@redhat.com>,
 Max Reitz <mreitz@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Liu Yuan <namei.unix@gmail.com>,
 Jason Dillaman <dillaman@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/25/20 8:12 PM, Maxim Levitsky wrote:
> This will allow to reuse a single generic .bdrv_co_create

"allow to ${verb}" is not idiomatic, better is "allow ${subject} to 
${verb}" or "allow ${verb}ing".  In this case, I'd go with:

This will allow the reuse of a single...

> implementation for several drivers.
> No functional changes.
> 
> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> ---
-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


