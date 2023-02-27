Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8DE6A44B5
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:38:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeTU-0001CE-Lu; Mon, 27 Feb 2023 09:27:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWeTL-00010b-JT
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:27:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWeTJ-0004Db-CK
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:27:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677508040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XpUVmUxP9Hjlacn8N0Dmk25mmERAn/Ff687O+zJOal0=;
 b=GrKOqVMwByoukj+OqhMRMI7WwZVcUQbTnu1+i7/AjGNKw/mMvSnqY1q2SVp6Zunb7vwxgq
 lP4oP5vy96h19N1wgXZjfBhggBNvZKLqMSE84ci7zeeOYkLvLE2qxvEDiv8rWmcfjIxCFx
 q6pS9m4Ak23mVl3rPbgLsvPiRUt3eig=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-151-00Z45F7xPgevOQOhbhPFIA-1; Mon, 27 Feb 2023 09:27:18 -0500
X-MC-Unique: 00Z45F7xPgevOQOhbhPFIA-1
Received: by mail-wr1-f71.google.com with SMTP id
 bv22-20020a0560001f1600b002c559840c76so898525wrb.3
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:27:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XpUVmUxP9Hjlacn8N0Dmk25mmERAn/Ff687O+zJOal0=;
 b=RTRPzkcdUNc5dHUkw7SlgZPrBVqkVAnNivCORepsPq5e3CvkYYoh44rkGzitmB9Kws
 VYzFr1gGAUUER/OyH1xWCJypu8s+9B/0I7KUvmj7YRooMtwCBmB6+Vx6L9Dw48+tDvLd
 luIpO9A3QhEJL0zB+mh9STAwp5pPSrNMSD0HO1m1IDBTHaQ2KEm8YOK/6Mf+uFmLBoNQ
 PLpXMqhUmRAfyRgFqAH1CMkedTDsBROzzFLODnwH+Qlc0llKoTHdMIFp29BxkE9YcmHE
 sjs4SP03wtiVIf80gZkOXLDBylTz+XYxeG1QFHt//2UKuXqtBfcovSpTQRkMOpduNKOx
 nw3w==
X-Gm-Message-State: AO0yUKWnuHukipCKbNMPWjJ9VTZ9mqy0vEhvKMdS0e5vWlS2pqGMZjNM
 AZ+sRaW09sXphZunmOd7P3rnwH8BsTiRK/RHViWyTJR0LQsXIh15O6DwsadBk0/59wW7kgq1GCj
 ijv58IEMx6yAzMT0=
X-Received: by 2002:a05:600c:70a:b0:3df:eecc:de2b with SMTP id
 i10-20020a05600c070a00b003dfeeccde2bmr15835606wmn.11.1677508036861; 
 Mon, 27 Feb 2023 06:27:16 -0800 (PST)
X-Google-Smtp-Source: AK7set+kx3pf+OK3eqMXfBQR/57KFFHAJgwXKARMS0xFg1AD+XyBsMvWXMiu92JMAfWbirYJv2HFnQ==
X-Received: by 2002:a05:600c:70a:b0:3df:eecc:de2b with SMTP id
 i10-20020a05600c070a00b003dfeeccde2bmr15835590wmn.11.1677508036615; 
 Mon, 27 Feb 2023 06:27:16 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-150.web.vodafone.de.
 [109.43.176.150]) by smtp.gmail.com with ESMTPSA id
 u17-20020adff891000000b002c553e061fdsm7185802wrp.112.2023.02.27.06.27.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 06:27:16 -0800 (PST)
Message-ID: <365c5bca-eda6-52dd-a90c-12de397bedf6@redhat.com>
Date: Mon, 27 Feb 2023 15:27:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v16 11/11] docs/s390x/cpu topology: document s390x cpu
 topology
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 nsg@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230222142105.84700-1-pmorel@linux.ibm.com>
 <20230222142105.84700-12-pmorel@linux.ibm.com>
 <039b5a0f-4440-324c-d5a7-54e9e1c89ea8@redhat.com>
 <dcac1561-8c91-310c-7e9f-db9fff3b00a7@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <dcac1561-8c91-310c-7e9f-db9fff3b00a7@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 27/02/2023 15.17, Pierre Morel wrote:
> 
> On 2/27/23 14:58, Thomas Huth wrote:
>> On 22/02/2023 15.21, Pierre Morel wrote:
>>> Add some basic examples for the definition of cpu topology
>>> in s390x.
>>>
>>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>>> ---
>>>   docs/system/s390x/cpu-topology.rst | 378 +++++++++++++++++++++++++++++
>>>   docs/system/target-s390x.rst       |   1 +
>>>   2 files changed, 379 insertions(+)
>>>   create mode 100644 docs/system/s390x/cpu-topology.rst
>>>
>>> diff --git a/docs/system/s390x/cpu-topology.rst 
>>> b/docs/system/s390x/cpu-topology.rst
>>> new file mode 100644
>>> index 0000000000..d470e28b97
>>> --- /dev/null
>>> +++ b/docs/system/s390x/cpu-topology.rst
>>> @@ -0,0 +1,378 @@
>>> +CPU topology on s390x
>>> +=====================
>>> +
>>> +Since QEMU 8.0, CPU topology on s390x provides up to 3 levels of
>>> +topology containers: drawers, books, sockets, defining a tree shaped
>>> +hierarchy.
>>> +
>>> +The socket container contains one or more CPU entries consisting
>>> +of a bitmap of three dentical CPU attributes:
>>
>> What do you mean by "dentical" here?
> 
> :D i.. dentical
> 
> I change it to identical

Ok, but even with "i" at the beginning, it does not make too much sense here 
to me - I'd interpret "identical" as "same", but these attributes have 
clearly different meanings, haven't they?

  Thomas


