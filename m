Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF76147B64
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jan 2020 10:44:49 +0100 (CET)
Received: from localhost ([::1]:39370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuvWC-0007rO-VV
	for lists+qemu-devel@lfdr.de; Fri, 24 Jan 2020 04:44:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34647)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iuvV6-00070P-UU
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 04:43:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iuvV5-00053B-Vy
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 04:43:40 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27875
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iuvV5-00052Q-SP
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 04:43:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579859019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=4E+VCvdCXnRJgXa2YIgdH7oB3knYEgU6myPbATuhtO4=;
 b=RiZ8mNSO5AfQEOmWk/TyYf1xNVuGuikoZ7ytgWNlN7LpOsLIshUCPxIBueZ9oyxpHD/1dO
 NwCuWRXTVJARQhE7ZsyQI8oilEfp7vLN+AEZ1Re0nykD6tFFEJvrmQLekTJk/iqNMgyt2H
 YOXeRxBqKx7aNB+/605AOyy6b7T5s8s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-2PB2IQoROfim_2qhT5UEbQ-1; Fri, 24 Jan 2020 04:43:35 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95CB5800D4C;
 Fri, 24 Jan 2020 09:43:34 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-156.ams2.redhat.com [10.36.116.156])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C486E5DA60;
 Fri, 24 Jan 2020 09:43:33 +0000 (UTC)
Subject: Re: [PATCH 0/5] target/s390x: Do not leak stack address in
 translate_one
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20200123232248.1800-1-richard.henderson@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <41ea3b7b-745d-4d8a-24fa-3862035db41d@redhat.com>
Date: Fri, 24 Jan 2020 10:43:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200123232248.1800-1-richard.henderson@linaro.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: 2PB2IQoROfim_2qhT5UEbQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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
Cc: cohuck@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/01/2020 00.22, Richard Henderson wrote:
> Thomas' patch avoids the leak, but I think we can do a bit more to
> cleaning in this area, and move the structure inline to DisasContext.
>
Sounds like a good idea to me. Cornelia, could you please replace my
patch with Richard's series?

 Thanks,
  Thomas


