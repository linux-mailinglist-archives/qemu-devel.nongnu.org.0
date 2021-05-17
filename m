Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF5F383DB0
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 21:43:21 +0200 (CEST)
Received: from localhost ([::1]:53428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lij96-00025X-Hd
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 15:43:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lij7v-0000dF-7y
 for qemu-devel@nongnu.org; Mon, 17 May 2021 15:42:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lij7s-00064c-Fd
 for qemu-devel@nongnu.org; Mon, 17 May 2021 15:42:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621280523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l5GI9dTaQzQQJlgy4ievWmUEo+nMFhWvvjggbzS9Dkk=;
 b=OsxMR4BxRtZmcATIrHx0hqoZoPX89dG59+/mdiIj7iznlCvEgESq87Ky4SVZ40X1BaZYhK
 hiGnb12OScN3DnxEEx1PQaX+qrynlR1LiWalOFm1dn6mag5cygkEeZmBl2Zlwj9DEaD4je
 bh036QH+GoYqm7QPxjHMcnAC/z5+N1c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-scvIheWdNciMSciEZvcUCA-1; Mon, 17 May 2021 15:42:01 -0400
X-MC-Unique: scvIheWdNciMSciEZvcUCA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFF948049C5;
 Mon, 17 May 2021 19:42:00 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 788FB60CD0;
 Mon, 17 May 2021 19:41:59 +0000 (UTC)
Subject: Re: [PATCH] fdc: check drive block device before usage
 (CVE-2021-20196)
To: Alexander Bulekov <alxndr@bu.edu>, P J P <ppandit@redhat.com>
References: <20210123100345.642933-1-ppandit@redhat.com>
 <20210123174725.slddy75u7egga43n@mozz.bu.edu>
 <20210123175245.rpckqnoihjtsv6lp@mozz.bu.edu>
From: John Snow <jsnow@redhat.com>
Message-ID: <3fc646ae-e34d-dbcd-204b-156f99ce75c2@redhat.com>
Date: Mon, 17 May 2021 15:41:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210123175245.rpckqnoihjtsv6lp@mozz.bu.edu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Gaoning Pan <pgn@zju.edu.cn>, QEMU Developers <qemu-devel@nongnu.org>,
 Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/23/21 12:52 PM, Alexander Bulekov wrote:
> On 210123 1247, Alexander Bulekov wrote:
>> Hello,
>> Here is a reproducer for this bug found by the OSS-Fuzz fuzzer:
>>
>> cat << EOF | qemu-system-i386 -display none -machine accel=qtest \
>> -m 512M -machine pc -device floppy,unit=1,id=floppy0,drive=disk0 \
>> -drive id=disk0,file=null-co://,file.read-zeroes=on,if=none,format=raw \
>> -qtest stdio
>> outw 0x3f4 0x2500
>> outb 0x3f5 0x81
>> outb 0x3f5 0x0
>> outb 0x3f5 0x0
>> outb 0x3f5 0x0
>> outw 0x3f4 0x0
>> outw 0x3f4 0x4000
>> outw 0x3f4 0x13
>> outb 0x3f5 0x1
>> outw 0x3f2 0x1405
>> outw 0x3f4 0x0
>> EOF
>>
> Oops there's a mistake there. Fixed:
> 
> cat << EOF | ./qemu-system-i386 -display none -machine accel=qtest \
> -m 512M -machine pc -device floppy,unit=1,id=floppy0,drive=disk0 \
> -drive id=disk0,file=null-co://,file.read-zeroes=on,if=none,format=raw \
> -qtest stdio
> outw 0x3f4 0x2500
> outb 0x3f5 0x81
> outb 0x3f5 0x0
> outb 0x3f5 0x0
> outb 0x3f5 0x0
> outw 0x3f2 0x14
> outw 0x3f4 0x0
> outw 0x3f4 0x4000
> outw 0x3f4 0x13
> outb 0x3f5 0x1
> outw 0x3f2 0x1405
> outw 0x3f4 0x0
> EOF
> 
>> -Alex
>>

This actually still triggers after I apply this patch. It's not the same 
bug, or the patch isn't sufficient to address this bug.

--js


