Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFC81B6209
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Apr 2020 19:36:37 +0200 (CEST)
Received: from localhost ([::1]:34116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRfm8-0006qT-3E
	for lists+qemu-devel@lfdr.de; Thu, 23 Apr 2020 13:36:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51150)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jRfl5-0005GG-TF
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 13:35:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jRfl5-0002ch-Ec
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 13:35:31 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:29186
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jRfl5-0002aL-1n
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 13:35:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587663330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cSDrLvHEcFhZBMPvoqLKD34tahHMAwbP4vNO/YdAxho=;
 b=XWA7EvF/AawU8uhXR3RgP1w2w+7R9VGFynYNZ8mZInMStvQaGyxszThuadhh1lZGLs6Qa9
 125jhrC/DVYRasFo4+62Tn1ZDOZuzlERtiRq47kbKceIYodfDlpSAAELF66MoFtimhc8Gt
 cCaGXxuk0a2RXC1eYG0xUX9L1QWCP1k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-UDD2iml1M6-bvvibWgybtQ-1; Thu, 23 Apr 2020 13:35:28 -0400
X-MC-Unique: UDD2iml1M6-bvvibWgybtQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B9511895A28;
 Thu, 23 Apr 2020 17:35:26 +0000 (UTC)
Received: from [10.10.116.80] (ovpn-116-80.rdu2.redhat.com [10.10.116.80])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DC58060C18;
 Thu, 23 Apr 2020 17:35:25 +0000 (UTC)
Subject: Re: [PATCH 04/13] qapi: Document @errp usage more thoroughly in
 visitor.h
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20200423160036.7048-1-armbru@redhat.com>
 <20200423160036.7048-5-armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <8d1dca95-6c6c-eb22-fcf7-308c66f905ca@redhat.com>
Date: Thu, 23 Apr 2020 12:35:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200423160036.7048-5-armbru@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/23 06:43:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/23/20 11:00 AM, Markus Armbruster wrote:
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   include/qapi/visitor.h | 37 +++++++++++++++++++++++--------------
>   1 file changed, 23 insertions(+), 14 deletions(-)
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


