Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A734019AD77
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Apr 2020 16:10:23 +0200 (CEST)
Received: from localhost ([::1]:60824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJe4S-00069T-Ht
	for lists+qemu-devel@lfdr.de; Wed, 01 Apr 2020 10:10:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48631)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jJe3V-0005Yq-RK
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 10:09:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1jJe3T-00051c-NU
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 10:09:20 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:50077
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1jJe3T-00050u-JU
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 10:09:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585750158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nDaSr/pnIa6TOVLpDiehjGStPSdjkzIMZe35ZW2e2eA=;
 b=Ev4+O7jKQX075eKVUCSvARzOMwLgSCyyV7g3GBIWSfxef+QBwbZSIDLTkli1VyKfXpBiQ3
 H1kXCsTp9OQUNKv94I2FcTP9exesqq077+4qSWOstJ3fFsyeWGZgzPkyP3lVSd2CmI3+wZ
 YESRqsEYsaUJ6ouU9Vk6VeVcqB8JZso=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-gf5anEjzNuGOvwPsgayeGQ-1; Wed, 01 Apr 2020 10:09:12 -0400
X-MC-Unique: gf5anEjzNuGOvwPsgayeGQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05502800D4E;
 Wed,  1 Apr 2020 14:09:11 +0000 (UTC)
Received: from [10.3.113.246] (ovpn-113-246.phx2.redhat.com [10.3.113.246])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 81A88619DB;
 Wed,  1 Apr 2020 14:09:10 +0000 (UTC)
Subject: Re: [PATCH for-5.0?] qemu-img: Report convert errors by bytes, not
 sectors
To: qemu-devel@nongnu.org
References: <158573001353.20343.7334679986961252833@39012742ff91>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <8842ddf2-d811-07ff-f45b-1aee82fb49a8@redhat.com>
Date: Wed, 1 Apr 2020 09:09:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <158573001353.20343.7334679986961252833@39012742ff91>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/1/20 3:33 AM, no-reply@patchew.org wrote:
> Patchew URL: https://patchew.org/QEMU/20200331222442.273158-1-eblake@redhat.com/
> 
> 
> 
> Hi,
> 
> This series failed the asan build test. Please find the testing commands and
> their output below. If you have Docker installed, you can probably reproduce it
> locally.
> 
> === TEST SCRIPT BEGIN ===
> #!/bin/bash
> export ARCH=x86_64
> make docker-image-fedora V=1 NETWORK=1
> time make docker-test-debug@fedora TARGET_LIST=x86_64-softmmu J=14 NETWORK=1
> === TEST SCRIPT END ===
> 
>    BUILD   pc-bios/optionrom/pvh.img
>    BUILD   pc-bios/optionrom/pvh.raw
>    SIGN    pc-bios/optionrom/pvh.bin
> /tmp/qemu-test/src/qemu-img.c:1928:38: error: format specifies type 'long' but the argument has type 'unsigned long long' [-Werror,-Wformat]
>                               ": %s", sector_num * BDRV_SECTOR_SIZE,
>                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Yep.  I'll have to post v2.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


