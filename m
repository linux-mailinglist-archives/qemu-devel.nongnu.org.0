Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF27831CDD1
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 17:17:44 +0100 (CET)
Received: from localhost ([::1]:54620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC32m-0006dA-0s
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 11:17:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lC30k-00055S-45
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:15:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lC30Z-0001zM-Er
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:15:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613492124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3x10TO24SlPAjcQbiGD8GAkcgJid05feZxRex2uzoPg=;
 b=ORwGR7+WO+HKZ+jUfJVMrCpNv7cD1hf3biJUnquTIGr8rJJ1Mx7gJ1Vm0kHEITk4lrcB4h
 9cTaeTWb3S/lBSUX/pYvkXTFUDghe4zNR+8vCxttR8FQQk7aAKpjGNEki7sFgpb8j2vll3
 Poa3+6iAZCC/eRZygTH6rsUYOlQeFqc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-TLG7JckNMjGU-32vvmT-7A-1; Tue, 16 Feb 2021 11:15:22 -0500
X-MC-Unique: TLG7JckNMjGU-32vvmT-7A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A01A804049;
 Tue, 16 Feb 2021 16:15:21 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-157.ams2.redhat.com [10.36.112.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ECF5B100AE2B;
 Tue, 16 Feb 2021 16:15:19 +0000 (UTC)
Subject: Re: [PATCH] pc-bios/s390-ccw: Use memory barriers in virtio code
To: Halil Pasic <pasic@linux.ibm.com>
References: <20210216110056.1228582-1-thuth@redhat.com>
 <20210216154010.3691880f.pasic@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <72e9a5b3-dd88-85de-e4a8-88a6a9c45099@redhat.com>
Date: Tue, 16 Feb 2021 17:15:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210216154010.3691880f.pasic@linux.ibm.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/02/2021 15.40, Halil Pasic wrote:
> On Tue, 16 Feb 2021 12:00:56 +0100
> Thomas Huth <thuth@redhat.com> wrote:
> 
>> According to the virtio specification, a memory barrier should be
>> used before incrementing the idx field in the "available" ring.
>> So far, we did not do this in the s390-ccw bios yet, but recently
>> Peter Maydell saw problems with the s390-ccw bios when running
>> the qtests on an aarch64 host (the bios panic'ed with the message:
>> "SCSI cannot report LUNs: response VS RESP=09"), which could
>> maybe be related to the missing memory barriers. Thus let's add
>> those barriers now. Since we've only seen the problem on TCG so far,
>> a "bcr 14,0" should be sufficient here to trigger the tcg_gen_mb()
>> in the TCG translate code.
>>
>> (Note: The virtio spec also talks about using a memory barrier
>> *after* incrementing the idx field, but if I understood correctly
>> this is only required when using notification suppression - which
>> we don't use in the s390-ccw bios here)
> 
> I suggest to the barrier after incrementing the idx field for two
> reasons. First: If the device were to see the notification, but
> not see the incremented idx field, it would effectively loose
> initiative. That is pretty straight forward, because the
> notification just says 'check out that queue', and if we don't
> see the incremented index, miss the buffer that was made available
> by incrementing idx.

I was just about to reply that this is certainly not necessary, since
the DIAGNOSE instruction that we use for the notification hypercall
should be serializing anyway ... but after looking at the PoP, it
actually is not marked as a serializing instruction! (while e.g.
SVC - supervisor call - is explicitly marked as serializing)

So maybe that's worth a try: Peter, could you please apply this patch
on top an see whether it makes a difference?

diff --git a/pc-bios/s390-ccw/virtio.c b/pc-bios/s390-ccw/virtio.c
--- a/pc-bios/s390-ccw/virtio.c
+++ b/pc-bios/s390-ccw/virtio.c
@@ -54,6 +54,7 @@ static long kvm_hypercall(unsigned long nr, unsigned long param1,
      register ulong r_param3 asm("4") = param3;
      register long retval asm("2");
  
+    virtio_mb();
      asm volatile ("diag 2,4,0x500"
                    : "=d" (retval)
                    : "d" (r_nr), "0" (r_param1), "r"(r_param2), "d"(r_param3)

  Thanks,
   Thomas


