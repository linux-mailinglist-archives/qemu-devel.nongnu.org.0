Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D26BC310680
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 09:21:10 +0100 (CET)
Received: from localhost ([::1]:55642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7wMX-0008S7-T3
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 03:21:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l7wKZ-0007Y2-PG
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 03:19:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l7wKX-0005OI-QP
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 03:19:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612513144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NgJdrjlDwBQwDdtQsxBsLjeP9JHE6jIC5JgrAb3+3Pk=;
 b=Y5fttuktPyGUsaFWBiEkJnTSUM0hAQUiOc6iq9nroZuTGduvcMBwQ0Rel2tZqfh63eS5n3
 xpYgldwiJ+ZJUxRrVokCDCl+ZprxhWyhTmi89tf1BZW0PYt2MrkysrEh6zhJveXrYXsxeW
 LeqV7lvnjFPkoivE/C1H4zbic+CiPMA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-lAk3lKsNP9iU_n34NFgABg-1; Fri, 05 Feb 2021 03:19:01 -0500
X-MC-Unique: lAk3lKsNP9iU_n34NFgABg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC042C7401;
 Fri,  5 Feb 2021 08:19:00 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-18.ams2.redhat.com
 [10.36.114.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 686E260C6C;
 Fri,  5 Feb 2021 08:18:59 +0000 (UTC)
Subject: Re: [PATCH] qemu-img: add seek and -n option to dd command
To: Peter Lieven <pl@kamp.de>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org
References: <20210128140704.6547-1-pl@kamp.de>
 <99982043-ed89-5fbe-afe2-691a9c19280d@redhat.com>
 <567ab8bb-b452-d6c2-dec7-bc2cf1e34ec8@kamp.de>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <be6e992c-fbb6-2f16-a066-0ef1e1ace9e5@redhat.com>
Date: Fri, 5 Feb 2021 09:18:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <567ab8bb-b452-d6c2-dec7-bc2cf1e34ec8@kamp.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.02.21 21:09, Peter Lieven wrote:
> Am 02.02.21 um 16:51 schrieb Eric Blake:
>> On 1/28/21 8:07 AM, Peter Lieven wrote:
>>> Signed-off-by: Peter Lieven <pl@kamp.de>
>> Your commit message says 'what', but not 'why'.  Generally, the one-line
>> 'what' works well as the subject line, but you want the commit body to
>> give an argument why your patch should be applied, rather than blank.
>>
>> Here's the last time we tried to improve qemu-img dd:
>> https://lists.gnu.org/archive/html/qemu-devel/2018-08/msg02618.html
> 
> 
> I was not aware of that story. My use case is that I want to be
> 
> able to "patch" an image that Qemu is able to handle by overwriting
> 
> certain sectors. And I especially do not want to "mount" that image
> 
> via qemu-nbd because I might not trust it. I totally want to avoid that the host
> 
> system tries to analyse that image in terms of scanning the bootsector, partprobe,
> 
> lvm etc. pp.

qemu will have FUSE exporting as of 6.0 (didn’t quite make it into 5.2), 
so you can do something like this:

$ qemu-storage-daemon \
     --blockdev node-name=export,driver=qcow2,\
file.driver=file,file.filename=image.qcow2 \
     --export fuse,id=fuse,node-name=export,mountpoint=image.qcow2

This exports the image on image.qcow2 (i.e., on itself) and so by 
accessing the image file you then get raw access to its contents (so you 
can use system tools like dd).

Doesn’t require root rights, and shouldn’t make the kernel scan 
anything, because it’s exported as just a regular file.

Max


