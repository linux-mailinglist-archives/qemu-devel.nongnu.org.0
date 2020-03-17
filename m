Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 955BC188F05
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 21:34:11 +0100 (CET)
Received: from localhost ([::1]:41014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEIug-0005KL-2e
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 16:34:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49126)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jEItX-0004q0-Tw
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 16:33:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1jEItW-0005tC-U0
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 16:32:59 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:55644)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1jEItW-0005oC-Ow
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 16:32:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584477178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BlQ8J3q78TNqaKVzn8fs/EWZ7zlmsRVVQtbp3CyKlmU=;
 b=FrIEd9osUBsXR01W4cYMEVjqX4nhU3HHVgZBJZ2M1RRFXdtFDNXQ9x0o+RZXKYrWM8ZEu8
 G8wj1kYz7IOba8q5AvKHma9XntqXg6Q3TSffc1zmtpvCIg0N/uZqFsjH/UXb0SBFjWFUXQ
 +U/yu2Dm1YxX1iqIrwEr+Glho4xGTY4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-sphyNHh3Oee6nc5OuxavEA-1; Tue, 17 Mar 2020 16:32:56 -0400
X-MC-Unique: sphyNHh3Oee6nc5OuxavEA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCA799259B;
 Tue, 17 Mar 2020 20:32:31 +0000 (UTC)
Received: from [10.3.112.193] (ovpn-112-193.phx2.redhat.com [10.3.112.193])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E82D7E31B;
 Tue, 17 Mar 2020 20:32:31 +0000 (UTC)
Subject: Re: [PATCH v4 25/34] qapi: New special feature flag "deprecated"
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20200317115459.31821-1-armbru@redhat.com>
 <20200317115459.31821-26-armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <f26a00be-62a8-ffe9-9f0a-2dfb8e638b8a@redhat.com>
Date: Tue, 17 Mar 2020 15:32:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200317115459.31821-26-armbru@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: marcandre.lureau@gmail.com, mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/17/20 6:54 AM, Markus Armbruster wrote:
> Unlike regular feature flags, the new special feature flag
> "deprecated" is recognized by the QAPI generator.  For now, it's only
> permitted with commands, events, and struct members.  It will be put
> to use shortly.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---

> +++ b/docs/devel/qapi-code-gen.txt
> @@ -683,6 +683,12 @@ Intended use is to have each feature string signal that this build of
>   QEMU shows a certain behaviour.
>   
>   
> +==== Special features ====
> +
> +Feature "deprecated" makes a command, event, or struct member as
> +deprecated.  It is not supported elsewhere so far.

Reads awkwardly, but I can't tell if it was a typo or an extra word. 
Either "makes a command, event, or struct member deprecated" or "marks a 
command, event, or struct member as deprecated".

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


