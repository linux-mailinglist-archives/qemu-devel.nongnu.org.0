Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F0F629545
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 11:07:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ousoz-0007dI-JM; Tue, 15 Nov 2022 05:05:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ousor-0007ck-BR
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 05:05:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ousop-00060i-OA
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 05:05:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668506727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5yzttf4sGJE7DMQxwefGn10Pa6Fuj2qXqTmf1L5F/KA=;
 b=aseAu9L0y5R7UTbFH+7yr7ZC2tJu89W+u9yZ8lLVxgRYw0byt8OxxzV3tQiDhV0qJ6lkHK
 cCweTGtYCaetuDKO/h0w72bZjYaF6nN3TEpXS9cw6l+DtpA9cIViSsxYld7LGIIn2GuKvf
 7Wy3uW+pm5AAUfNsGIlYkWzWnX+x5PM=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-138-jz__-fezO_Sc6dTOZ4OmOw-1; Tue, 15 Nov 2022 05:05:25 -0500
X-MC-Unique: jz__-fezO_Sc6dTOZ4OmOw-1
Received: by mail-qv1-f69.google.com with SMTP id
 ln3-20020a0562145a8300b004b8c29a7d50so10263349qvb.15
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 02:05:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5yzttf4sGJE7DMQxwefGn10Pa6Fuj2qXqTmf1L5F/KA=;
 b=oweV5aYvemlN8gW1EWMFcy1CsDOCsSYQBUj+28/uXNJ5Y86kCsOy+7fqis2skuPfSi
 shQJBEWimX9gTioqS4NxK960PK3kL+NX3YRh5A7mnCvHDDYTH3KDuQ+9YvFgbd1hlQp6
 mhXs/Nzy7+QB8EVNj5V9lEnGWl7WC+bFagcSOlZMzTLoquRnnUADl03ipePN9rgzFIB3
 2QFLxOIhXWCXpRRNKp0dsqP1+JBMhU9RhJ5qBwGBrTMAQ88EPJu5mxYX851h9p1D4wR7
 riK8sZ/NWIy/oubRAdrMfWNFgtxSgvsdZUZhfG7+SEXfu3PPtr/ItJDNkjIwNFynYPjF
 eFLg==
X-Gm-Message-State: ANoB5pnqpvXFbP9JXcguJ5Q8gmsIC4M4xR7+C6mQd4YsxsfnfWCUCNP1
 BoEn7KEWuB3R+hdy+mVcfs0J/TxZjLvqfukHMygNSX7wf7Pisis2Y39tYNTSCzpBI7YPDobPHdh
 gcoSNTU44cfRezDI=
X-Received: by 2002:a37:c247:0:b0:6fa:8c15:652c with SMTP id
 j7-20020a37c247000000b006fa8c15652cmr14539063qkm.399.1668506724779; 
 Tue, 15 Nov 2022 02:05:24 -0800 (PST)
X-Google-Smtp-Source: AA0mqf46O43/6keECY+sQug584iITRt/1FpvQvYTx6SLqwgrtH0v5BrDs+shVmOmjV2LT231LUPjlw==
X-Received: by 2002:a37:c247:0:b0:6fa:8c15:652c with SMTP id
 j7-20020a37c247000000b006fa8c15652cmr14539048qkm.399.1668506724534; 
 Tue, 15 Nov 2022 02:05:24 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-177-149.web.vodafone.de.
 [109.43.177.149]) by smtp.gmail.com with ESMTPSA id
 d16-20020a05622a15d000b003a540320070sm7093065qty.6.2022.11.15.02.05.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Nov 2022 02:05:24 -0800 (PST)
Message-ID: <c111811c-07e9-b602-0bfe-09eaa4ddabba@redhat.com>
Date: Tue, 15 Nov 2022 11:05:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] docs/system/s390x: Document the "loadparm" machine
 property
Content-Language: en-US
To: Janosch Frank <frankja@linux.ibm.com>, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Collin Walling <walling@linux.ibm.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>,
 Eric Farman <farman@linux.ibm.com>, "Jason J . Herne"
 <jjherne@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
References: <20221114132502.110213-1-thuth@redhat.com>
 <a6b76605-b599-1666-293a-4fc70f9ffcdb@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <a6b76605-b599-1666-293a-4fc70f9ffcdb@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 15/11/2022 09.41, Janosch Frank wrote:
> On 11/14/22 14:25, Thomas Huth wrote:
>> The "loadparm" machine property is useful for selecting alternative
>> kernels on the disk of the guest, but so far we do not tell the users
>> yet how to use it. Add some documentation to fill this gap.
>>
>> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2128235
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   docs/system/s390x/bootdevices.rst | 26 ++++++++++++++++++++++++++
>>   1 file changed, 26 insertions(+)
>>
>> diff --git a/docs/system/s390x/bootdevices.rst 
>> b/docs/system/s390x/bootdevices.rst
>> index b5950133e8..40089c35a9 100644
>> --- a/docs/system/s390x/bootdevices.rst
>> +++ b/docs/system/s390x/bootdevices.rst
>> @@ -53,6 +53,32 @@ recommended to specify a CD-ROM device via ``-device 
>> scsi-cd`` (as mentioned
>>   above) instead.
>> +Selecting kernels with the ``loadparm`` property
>> +------------------------------------------------
>> +
>> +The ``s390-ccw-virtio`` machine supports the so-called ``loadparm`` 
>> parameter
>> +which can be used to select the kernel on the disk of the guest that the
>> +s390-ccw bios should boot. When starting QEMU, it can be specified like 
>> this::
>> +
>> + qemu-system-s390x -machine s390-ccw-virtio,loadparm=<string>
>> +
>> +The first way to use this parameter is to use the word ``PROMPT`` as the
>> +``<string>`` here. In that case the s390-ccw bios will show a list of
>> +installed kernels on the disk of the guest and ask the user to enter a 
>> number
>> +to chose which kernel should be booted -- similar to what can be achieved by
>> +specifying the ``-boot menu=on`` option when starting QEMU. Note that the 
>> menu
>> +list will only show the names of the installed kernels when using a 
>> DASD-like
>> +disk image with 4k byte sectors, on normal SCSI-style disks with 512-byte
>> +sectors, there is not enough space for the zipl loader on the disk to store
>> +the kernel names, so you only get a list without names here.
> 
> I'd suggest splitting the last sentence into two so there's a clear 
> separation between DASD and SCSI.

Yes, makes sense, I'll replace the "," with a "." there.

  Thomas


