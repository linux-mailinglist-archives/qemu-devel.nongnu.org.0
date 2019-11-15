Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70043FE370
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Nov 2019 17:55:48 +0100 (CET)
Received: from localhost ([::1]:41886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVest-0008VK-6K
	for lists+qemu-devel@lfdr.de; Fri, 15 Nov 2019 11:55:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54994)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iVeeN-0000vM-PI
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 11:40:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iVeeM-0001c3-HK
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 11:40:47 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:42336
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iVeeM-0001bA-Do
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 11:40:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573836045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bsa92Q1oLaeg2Ly1mFURdZAQKOoOIkCvfQlosZkOli0=;
 b=ZCWACbD9CypUmtY60BtEkCrhE5/lHD0ksQeNW0bHqNh0s6HLv5sq+jk6g6M7H14iH77/VY
 kQ04SbSnzYbCnzq7kG/VsRnCrpTPL+gKB/ZolmAc6UlCJOm0KVWOAHCECLkt5oM5U8AhcE
 T7k1riWa2cAEqJK5tPz+A4qTxUwqwMQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-DuPW1Eg4MKa6C2ePq5XJbw-1; Fri, 15 Nov 2019 11:40:42 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFC748034E0
 for <qemu-devel@nongnu.org>; Fri, 15 Nov 2019 16:40:40 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-84.ams2.redhat.com
 [10.36.117.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 604C96055E;
 Fri, 15 Nov 2019 16:40:36 +0000 (UTC)
Subject: Re: [qemu-web PATCH v3] Add a blog post on "Micro-Optimizing KVM
 VM-Exits"
To: Kashyap Chamarthy <kchamart@redhat.com>, qemu-devel@nongnu.org
References: <20191115162441.27302-1-kchamart@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <cc5b77d2-e152-c87b-a84c-38212c1e5811@redhat.com>
Date: Fri, 15 Nov 2019 17:29:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191115162441.27302-1-kchamart@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: DuPW1Eg4MKa6C2ePq5XJbw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: aarcange@redhat.com, dgilbert@redhat.com, rjones@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com, vkuznets@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/11/2019 17.24, Kashyap Chamarthy wrote:
> This blog post summarizes the talk "Micro-Optimizing KVM VM-Exits"[1],
> given by Andrea Arcangeli at the recently concluded KVM Forum 2019.

Thanks, pushed now:

https://www.qemu.org/2019/11/15/micro-optimizing-kvm-vmexits/

 Thomas


