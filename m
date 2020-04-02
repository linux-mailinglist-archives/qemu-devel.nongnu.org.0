Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0457F19C172
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Apr 2020 14:51:29 +0200 (CEST)
Received: from localhost ([::1]:38152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJzJg-0000bp-2r
	for lists+qemu-devel@lfdr.de; Thu, 02 Apr 2020 08:51:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34545)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jJzIp-0008SS-BE
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 08:50:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1jJzIo-0007Nk-6U
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 08:50:35 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:31259
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1jJzIo-0007Mz-1W
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 08:50:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585831833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CaLugzWQHanjE21JH0r3SR+Msm+kbaEs6lK5//GqnRM=;
 b=IAQa+rHuTMAcHQz20iILhEHAKNKkE1pva832VnJKHR+/zPCnbPM0/T0BJoPLHZZjJZq8Dc
 4Z1EovFWKNBFMgH4TJ8gsa3qJsss7FGRKFc0k7Kr+jCIW3Ag9psDHFJAUxcc7bbIWb7ZJH
 AqDPWnlERJiiy11dtZVCcFB4+5xdEkg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-FV3EC5AXPd6GyPFK0g5C5Q-1; Thu, 02 Apr 2020 08:50:28 -0400
X-MC-Unique: FV3EC5AXPd6GyPFK0g5C5Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B986C107ACCC;
 Thu,  2 Apr 2020 12:50:27 +0000 (UTC)
Received: from [10.3.113.246] (ovpn-113-246.phx2.redhat.com [10.3.113.246])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DBC660BF4;
 Thu,  2 Apr 2020 12:50:27 +0000 (UTC)
Subject: Re: [PATCH for-5.0 v2] qemu-img: Report convert errors by bytes, not
 sectors
To: qemu-devel@nongnu.org
References: <158577907110.20436.7335088008002235494@39012742ff91>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <968ef2a8-b292-7804-2ea5-ffa7462dc237@redhat.com>
Date: Thu, 2 Apr 2020 07:50:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <158577907110.20436.7335088008002235494@39012742ff91>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/1/20 5:11 PM, no-reply@patchew.org wrote:
> Patchew URL: https://patchew.org/QEMU/20200401180436.298613-1-eblake@redhat.com/
> 
> 
> 
> Hi,
> 
> This series failed the docker-quick@centos7 build test. Please find the testing commands and
> their output below. If you have Docker installed, you can probably reproduce it
> locally.
> 
> === TEST SCRIPT BEGIN ===
> #!/bin/bash
> make docker-image-centos7 V=1 NETWORK=1
> time make docker-test-quick@centos7 SHOW_ENV=1 J=14 NETWORK=1
> === TEST SCRIPT END ===
> 
> Not run: 259
> Failures: 244
> Failed 1 of 116 iotests

Indeed. v3 coming up.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


