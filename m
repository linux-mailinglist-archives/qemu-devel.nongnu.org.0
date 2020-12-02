Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 971402CBE2D
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 14:28:16 +0100 (CET)
Received: from localhost ([::1]:45594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkSB5-0007pb-37
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 08:28:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkS9l-0007L5-PZ
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 08:26:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkS9j-0004sy-P5
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 08:26:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606915610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XwoT1iUDLLlve6OP+T0FRO15C1EAAZ+X0kleCUYwRHY=;
 b=cY/NdXbNX+DyLjar74QHadYwGQkg2659LOe+Im4rqiYBvlraF+aiuSJhUIxbkjP8Dcnqn5
 WNj1ZOqTaalLKnR1adg8+IFDw+VF4mTMyOYFIVh+mcXmdWvDCX/xUmvRLroFMLkx5zVuUp
 koGJRFFvdhUu19yVCoskJ1MHtqis3S4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-uJAiwVdPO76KqGvYCc7aPg-1; Wed, 02 Dec 2020 08:26:48 -0500
X-MC-Unique: uJAiwVdPO76KqGvYCc7aPg-1
Received: by mail-ej1-f70.google.com with SMTP id h17so3060252ejk.21
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 05:26:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XwoT1iUDLLlve6OP+T0FRO15C1EAAZ+X0kleCUYwRHY=;
 b=RyU8cwooTcYMyj8tuHduFe9u7SZuZyOaQSsEp4wXhhRK5/F0++vq7a/CtSm4X465tj
 Y3UavZVqFBW2tdc9bxw0B1NKyt9gERZU0iRq6IdkUZ9Zl421XGncP2qJly5RnWLJtv5o
 TRFHqPzwg1td/vdafyJaekKrJSgSB/wpAsKIyq26+d6pP6WV9XKPoH/fQDj5twP0I5/X
 Q48htb2I1lERKsehRdmJaIjSMVxoVwj/kDJXJqMkKVIKCrx+yV6XxNI8Z717ZBO7pWd8
 hkWQmNYgIAFIxQNr5KgM0p3G9LTkwzAHqBOAXGLyKnulk1k6pn7hkPIj+91iEiqgbqtn
 3XNw==
X-Gm-Message-State: AOAM531+f7VD6KheXymQa6Hv+HHvc62UM8r0Nkv8GmaaJVg2PsVe3911
 1pJkZDxJr4O6rv46fxQDcHJpgZe8gyxjN4JLhCouJklewM9k7yPZKPdBL9U/wVzIRezbm4fAzkh
 ZUEQD2TMO42Xh3SY=
X-Received: by 2002:a05:6402:b8e:: with SMTP id
 cf14mr2598466edb.86.1606915607132; 
 Wed, 02 Dec 2020 05:26:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyz4lFqcd1k/35glBAdFK6R9YJL/tHztR8PXRmaB2MQ+BSU5l1Tqjz/UMXoCqcomgdac0+kTg==
X-Received: by 2002:a05:6402:b8e:: with SMTP id
 cf14mr2598422edb.86.1606915606754; 
 Wed, 02 Dec 2020 05:26:46 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id s15sm1253193edj.75.2020.12.02.05.26.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Dec 2020 05:26:45 -0800 (PST)
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20201130154605.GC5078@merkur.fritz.box>
 <a9c1ebf3-ffcc-7312-ce66-a79902d1e9ba@redhat.com>
 <20201130181037.GG5078@merkur.fritz.box>
 <65a9600f-ca8c-ef29-94d8-d9ea114e5e06@redhat.com>
 <20201201162042.GB6264@merkur.fritz.box>
 <db61f61a-1ffa-6185-10dc-3109ff111a35@redhat.com>
 <20201201193528.GC6264@merkur.fritz.box>
 <3449b5d6-d094-84c8-a0ea-4cd25364db2d@redhat.com>
 <20201201220854.GC3836@habkost.net>
 <17afbbfe-209f-e4b2-e9e1-b50abe1fce3c@redhat.com>
 <20201202125124.GD3836@habkost.net>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 00/18] qapi/qom: QAPIfy object-add
Message-ID: <69dff34f-d87b-3a8d-640f-35f6bf5db75c@redhat.com>
Date: Wed, 2 Dec 2020 14:26:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201202125124.GD3836@habkost.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, lvivier@redhat.com, thuth@redhat.com,
 pkrempa@redhat.com, berrange@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, armbru@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/12/20 13:51, Eduardo Habkost wrote:
>>> I'm liking the direction this is taking.  However, I would still
>>> like to have a clearer and feasible plan that would work for
>>> -device, -machine, and -cpu.
>>
>> -cpu is not a problem since it's generally created with a static
>> configuration (now done with global properties, in the future it could be a
>> struct).
> 
> It is a problem if it requires manually converting existing code
> defining CPU properties and we don't have a transition plan.

We do not have to convert everything _if_ for some objects there are 
good reasons to do programmatically-generated properties.  CPUs might be 
one of those cases (or if we decide to convert them, they might endure 
some more code duplication than other devices because they have so many 
properties).

> Would a -device conversion also involve non-user-creatable
> devices, or would we keep existing internal usage of QOM
> properties?
> 
> Even if it's just for user-creatable devices, getting rid of QOM
> property usage in devices sounds like a very ambitious goal.  I'd
> like us to have a good transition plan, in addition to declaring
> what's our ideal end goal.

For user-creatable objects Kevin is doing work in lockstep on all 
classes; but once we have the infrastructure for QAPI object 
configuration schemas we can proceed in the other direction and operate 
on one device at a time.

With some handwaving, something like (see create_unimplemented_device)

     DeviceState *dev = qdev_new(TYPE_UNIMPLEMENTED_DEVICE);

     qdev_prop_set_string(dev, "name", name);
     qdev_prop_set_uint64(dev, "size", size);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);

might become something like

     { 'object': 'unimplemented-device',
       'config': {
          'name': 'str',
          'size': 'size'
       },
     }

     DeviceState *dev = qapi_Unimplemented_new(&(
          (UnimplementedDeviceOptions) {
              .name = name,
              .size = size
          }, &error_fatal);
     object_unref(dev);

(i.e. all typesafe!) and the underlying code would be something like

     void (*init_properties)(Object *obj, Visitor *v, Error **errp);
     ...

     // QAPI generated constructor
     UnimplementedDevice *qapi_Unimplemented_new(
         UnimplementedDeviceOptions *opt, Error **errp)
     {
         Object *obj = object_new(TYPE_UNIMPLEMENTED_DEVICE);
         if (!qapi_Unimplemented_init_properties(obj, opt, errp)) {
             object_unref(obj);
             return NULL;
         }
         return obj;
     }

     // QAPI generated Visitor->struct adapter
     bool qapi_Unimplemented_init_properties(
         Object *obj, Visitor *v, Error **errp)
     {
         UnimplementedDeviceOptions opt;
         Error *local_err = NULL;
         visit_type_UnimplementedDeviceOptions(v, NULL,
                                               &opt, &local_err);
         if (local_err) {
             error_propagate(errp, local_err);
             return false;
         }
         unimplemented_init_properties(UNIMPLEMENTED_DEVICE(obj),
                                       &opt, &local_err);
         if (local_err) {
             error_propagate(errp, local_err);
             return false;
         }
         return true;
     }

     // Hand-written (?) initializer:
     void unimplemented_init_properties(Object *obj,
          UnimplementedDeviceOptions *opt, Error **errp)
     {
          obj->name = name;
          obj->size = size;
          device_realize(obj, errp);
     }

     // class_init code:
     oc->init_properties = qapi_Unimplemented_init_properties;

and all read-only-after-realize QOM properties could be made *really* 
read-only.

Paolo


