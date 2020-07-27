Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CCB22EF4C
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jul 2020 16:15:27 +0200 (CEST)
Received: from localhost ([::1]:58832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k03uY-0007Sn-6E
	for lists+qemu-devel@lfdr.de; Mon, 27 Jul 2020 10:15:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1k03tY-0006wK-Kp
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 10:14:24 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:42627
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1k03tW-0006x0-JV
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 10:14:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595859261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eFkhR90GyYb2iYpWv5JJ2UOVfVOAcLNCMBfJFLICxR4=;
 b=Gw/1Fgc7rg2Cj1T8GVUPb62Q9TsP8aH/gGd1eVjnNNABp6I9ybMMwjeBDYyefglSN8sFfW
 Vn98k/T0KmrlQdbOvCxk93zfmPj7PkQYhdqr3Upi4bARXVW+jmIezb1jJJl8LL6YA1LDMd
 REUB197PUXalW1T/U8JkxFWpQ80kSbA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-TzKO-1FDMYK7I30buDAArw-1; Mon, 27 Jul 2020 10:14:16 -0400
X-MC-Unique: TzKO-1FDMYK7I30buDAArw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F45E1005510;
 Mon, 27 Jul 2020 14:14:15 +0000 (UTC)
Received: from [10.3.113.26] (ovpn-113-26.phx2.redhat.com [10.3.113.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BE3E55C1C3;
 Mon, 27 Jul 2020 14:14:14 +0000 (UTC)
Subject: Re: [PATCH 2/2] qemu-iotests: Test convert to qcow2 compressed to NBD
To: Max Reitz <mreitz@redhat.com>, Nir Soffer <nirsof@gmail.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <20200726152532.256261-1-nsoffer@redhat.com>
 <20200726152532.256261-3-nsoffer@redhat.com>
 <b0e61f48-d272-0aa5-3698-5d17a1de0774@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <b4c0408f-da30-259f-b175-15e709ee987c@redhat.com>
Date: Mon, 27 Jul 2020 09:14:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b0e61f48-d272-0aa5-3698-5d17a1de0774@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/27 00:16:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Nir Soffer <nsoffer@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/27/20 5:04 AM, Max Reitz wrote:
> On 26.07.20 17:25, Nir Soffer wrote:
>> Add test for "qemu-img convert -O qcow2 -c" to NBD target. The use case
>> is writing compressed disk content to OVA archive.
>>
>> Signed-off-by: Nir Soffer <nsoffer@redhat.com>
>> ---

> 
>> +# The use case is writing qcow2 image directly into a tar file. Code to create
>> +# real tar file not included.
>> +#
>> +# offset    content
>> +# -------------------------------
>> +#      0    first memebr header
> 
> *member
> 
>> +#    512    first member data
>> +#   1024    second memeber header
> 
> *member
> 
>> +#   1536    second member data
>> +
>> +tar_file = file_path("test.tar")

I guess it's okay that you don't create a real tar file here, but 
listing the commands to create it (even as a comment) is better than 
just saying "trust me".  And it doesn't seem like that much more work - 
it looks like the key to your test is that you created a tar file 
containing two files, where the first file was less than 512 bytes and 
the second file is your target destination that you will be rewriting.

>> +out = qemu_img_pipe("measure", "-O", "qcow2", "--output", "json", src_disk)
>> +measure = json.loads(out)
>> +qemu_img_create("-f", "raw", tar_file, str(measure["required"]))
> 
> Should this be measure["required"] + 1536?

The test works without it (because of compression), but yes, if you are 
going to test writing into an offset, you should oversize your file by 
that same offset.

> 
>> +
>> +nbd_sock = file_path("nbd-sock", base_dir=iotests.sock_dir)
>> +nbd_uri = "nbd+unix:///exp?socket=" + nbd_sock
>> +
>> +# Use raw format to allow creating qcow2 directy into tar file.
>> +qemu_nbd(
>> +    "--socket", nbd_sock,
>> +    "--persistent",
>> +    "--export-name", "exp",
>> +    "--format", "raw",
>> +    "--offset", "1536",
>> +    tar_file)
>> +
>> +iotests.log("=== Target image info ===")
>> +qemu_img_log("info", nbd_uri)
>> +
>> +# Write image into the tar file. In a real applicatio we would write a tar
> 
> *application
> 

>> +=== Converted image check ===
>> +No errors were found on the image.
>> +1/160 = 0.62% allocated, 100.00% fragmented, 100.00% compressed clusters
>> +Image end offset: 393216
> 
> I hope none of this is fs-dependant.  (I don’t think it is, but who
> knows.  I suppose we’ll find out.)

Indeed - time to see what CI thinks of this.

At any rate, given the urgency of getting pull requests for -rc2 in 
before slamming Peter tomorrow, I'll probably try to touch up the issues 
Max pointed out and queue it today.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


