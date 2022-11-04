Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 365886199FA
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 15:31:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqxhl-0006jj-0l; Fri, 04 Nov 2022 10:30:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oqxhe-0006jI-Is
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 10:29:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oqxha-0002G9-6F
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 10:29:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667572184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K0NQRmCrmy0snNMqQGvOxaS4uPp+eLjooqLWgEXCU88=;
 b=i2RlMpW6KiotriufQZDU3ZlnkzZIQG3YGI2VQeCU5NEhrwE5CB5JIPjNbsoawr28wf2bU4
 e4Gl5PMFPwgZ6XypUymUJm3uq9QZcSF/j48oGH1YTTWUyy9+8RIsAJc/MDBMEMVj5YyQqy
 yelBRF9FfwDRxoti8D4F0WnDZ2qby8M=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-361-AVudW_OoM5K8-nGLtlB5UA-1; Fri, 04 Nov 2022 10:29:44 -0400
X-MC-Unique: AVudW_OoM5K8-nGLtlB5UA-1
Received: by mail-wm1-f70.google.com with SMTP id
 h8-20020a1c2108000000b003cf550bfc8dso4344473wmh.2
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 07:29:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K0NQRmCrmy0snNMqQGvOxaS4uPp+eLjooqLWgEXCU88=;
 b=JyFpaH139sV9E/3Xv3gaygDQ94EnZELx29p/8kKo65pcPDpmVjA0X6r/I7Rg1huafO
 K3J26lfH5h9oc6qadRlqxHDeBANW5nwHHyCxOuHIqIKjusMAQwcbxQhBfLq9Q8DE636z
 b2P/lK9sz0L+RWF9o/Ie8TFb7dfkV96EdBC2yTadLu58B4wP0y7jlzzvS/WwLr5cM5TY
 HRvT4eursHxZ/EPg1p+fHMiLfbhsNdVKAjnfRKYhoy3OWKhPYO9uBrVoHVBOHR52dx5z
 1W5weWMbTznqu1FJakTtTQ0c0COSE3hTRJlZOY1PMya0d6uxhkAdSYTB3QI+DsEZ7srW
 jPFA==
X-Gm-Message-State: ACrzQf1+RnmCt0PcEnNnnurzmWgmsy4aUTSLJ5yugc00qRsihMscOy2v
 gAHjHlwW9X0yAQ5Wk0PAw9kM+8vTnbMNdzrkm4hYjE0SxpuAAzIDW5IPalXb7HbZW9JbGkFSsV/
 ja56HbE5ltwid+WM=
X-Received: by 2002:a05:600c:3d8a:b0:3c6:f241:cb36 with SMTP id
 bi10-20020a05600c3d8a00b003c6f241cb36mr23848756wmb.115.1667572182934; 
 Fri, 04 Nov 2022 07:29:42 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5b4jwcT/qiNkNkDn0JGgJsf2gDj2TH9ztahfx6jfDmW8RW+kgc5CPYDKLVgnl4o5IDLvpj/g==
X-Received: by 2002:a05:600c:3d8a:b0:3c6:f241:cb36 with SMTP id
 bi10-20020a05600c3d8a00b003c6f241cb36mr23848702wmb.115.1667572182483; 
 Fri, 04 Nov 2022 07:29:42 -0700 (PDT)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a5d4b09000000b00228a6ce17b4sm3634702wrq.37.2022.11.04.07.29.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 07:29:41 -0700 (PDT)
Message-ID: <7a3c34dc-2c16-6fdd-e8bc-7a1c623823ae@redhat.com>
Date: Fri, 4 Nov 2022 15:29:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 scgl@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com
References: <20221103170150.20789-1-pmorel@linux.ibm.com>
 <20221103170150.20789-2-pmorel@linux.ibm.com>
 <3f913a58-e7d0-539e-3bc0-6cbd5608db8e@redhat.com>
 <7d809617-67e0-d233-97b2-8534e2a4610f@linux.ibm.com>
 <6415cf08-e6a1-c72a-1c56-907d3a446a8c@kaod.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v11 01/11] s390x: Register TYPE_S390_CCW_MACHINE
 properties as class properties
In-Reply-To: <6415cf08-e6a1-c72a-1c56-907d3a446a8c@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 04/11/2022 11.53, Cédric Le Goater wrote:
> On 11/4/22 11:16, Pierre Morel wrote:
>>
>>
>> On 11/4/22 07:32, Thomas Huth wrote:
>>> On 03/11/2022 18.01, Pierre Morel wrote:
>>>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>>>> ---
>>>>   hw/s390x/s390-virtio-ccw.c | 127 +++++++++++++++++++++----------------
>>>>   1 file changed, 72 insertions(+), 55 deletions(-)
>>>
>>> -EMISSINGPATCHDESCRIPTION
>>>
>>> ... please add some words *why* this is a good idea / necessary.
>>
>> I saw that the i386 patch had no description for the same patch so...
>>
>> To be honest I do not know why it is necessary.
>> The only reason I see is to be in sync with the PC implementation.
>>
>> So what about:
>> "
>> Register TYPE_S390_CCW_MACHINE properties as class properties
>> to be conform with the X architectures
>> "
>> ?
>>
>> @Cédric , any official recommendation for doing that?
> 
> There was a bunch of commits related to QOM in this series :
> 
>    91def7b83 arm/virt: Register most properties as class properties
>    f5730c69f0 i386: Register feature bit properties as class properties
> 
> which moved property definitions at the class level.
> 
> Then,
> 
>    commit d8fb7d0969 ("vl: switch -M parsing to keyval")
> 
> changed machine_help_func() to use a machine class and not machine
> instance anymore.
> 
> I would use the same kind of commit log and add a Fixes tag to get it
> merged in 7.2

Ah, so this fixes the problem that running QEMU with " -M 
s390-ccw-virtio,help" does not show the s390x-specific properties anymore? 
... that's certainly somethings that should be mentioned in the commit 
message! What about something like this:

"Currently, when running 'qemu-system-s390x -M -M s390-ccw-virtio,help' the 
s390x-specific properties are not listed anymore. This happens because since 
commit d8fb7d0969 ("vl: switch -M parsing to keyval") the properties have to 
be defined at the class level and not at the instance level anymore. Fix it 
on s390x now, too, by moving the registration of the properties to the class 
level"

Fixes: d8fb7d0969 ("vl: switch -M parsing to keyval")

?

  Thomas


