Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7328E424E58
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 09:53:17 +0200 (CEST)
Received: from localhost ([::1]:37194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYODL-0001XN-V6
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 03:53:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mYOBl-0000gU-B5
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 03:51:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mYOBi-0008Ic-Hz
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 03:51:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633593092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5HCPdhTc2rEFXdIoI53r+48HOpDipe5FV1PSUrHs+as=;
 b=guH5IGwqQ7g4FxQ6aD75to8fVr8IuGNdTBZMLIK5fuotUu7Jp+f7WIaHDUb0Tjs5X4ldSj
 zDcOlvvHZ9zk8Mf05r+Ol6W05e11uyE9WR2RIjOeFnHiXWWk69MmEdOI6aR3fK/opIzB+Z
 G5h9zV8mzRD7aXiMHrfJ6VJWOzdWA0E=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-2rBassP_Pq626xQzgMn1BA-1; Thu, 07 Oct 2021 03:51:31 -0400
X-MC-Unique: 2rBassP_Pq626xQzgMn1BA-1
Received: by mail-ed1-f70.google.com with SMTP id
 u23-20020a50a417000000b003db23c7e5e2so5099519edb.8
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 00:51:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5HCPdhTc2rEFXdIoI53r+48HOpDipe5FV1PSUrHs+as=;
 b=sMb0PXK6NGRwNKdZ97oT2EYrUfT7LdQ0bb5Oa92oe9/sqdu75mutjb2oc8KM/E2Uv2
 /aNIniBvL++neLZEUqFMCfBPHV8lhtNNZI0VZHYxAmoABzC+Mq7vQCf46YsUG1IfX6SK
 AfFzcSnVxOtIrpKL//q3KvA59d3X2Z4wuDfiRLgO+qZrJ35i7Fhj8ZojtqtE0yAZOboU
 abPWP785EArKHBreGdn0tOX7Duvl4v4xa2zebD1EAcOJ39EWTQuV4Ql9k+039sCKNkmt
 aqqAklYabKlon3zK51oMBLUW/OR5/dFZYRBM1CXVu3exXmEXLinxMbkZsNnry+doedrQ
 LzGg==
X-Gm-Message-State: AOAM530EEhoptJnTgZyjxuB+GfsgASx59qZInkL2yCQzKRPFqH7NyRRA
 pUAZziHGtpJzkrJzGdo7O5JcQdGFAq6p0skvb+qumXRT546oFjCq5MyegEtDC8vjZSCNViVwlHL
 jGI5TMs5K9DQOVZsDQnKTUWOOJq5xQ7STQHK7XjqVVfCv/bdUILuN0W2ckclO6QsIVEI=
X-Received: by 2002:aa7:d1c2:: with SMTP id g2mr4169319edp.248.1633593090555; 
 Thu, 07 Oct 2021 00:51:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5AclNxx65lBzr4gncAlQ3CtKkhXtKVTRby3Nj0pbWXTQgz5bW6iG6wvzywuG9fG7GMRiCIQ==
X-Received: by 2002:aa7:d1c2:: with SMTP id g2mr4169301edp.248.1633593090260; 
 Thu, 07 Oct 2021 00:51:30 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 e7sm11993176edk.3.2021.10.07.00.51.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 00:51:28 -0700 (PDT)
Subject: Re: [PATCH 1/2] pylint: fix errors and warnings from qemu-tests test
 297
To: Kevin Wolf <kwolf@redhat.com>
References: <20211006130100.389521-1-eesposit@redhat.com>
 <20211006130100.389521-2-eesposit@redhat.com> <YV3S9N8SnU4W+aYL@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <3a143653-582e-5b28-f536-bf24c4e45ac8@redhat.com>
Date: Thu, 7 Oct 2021 09:51:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YV3S9N8SnU4W+aYL@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 06/10/2021 18:46, Kevin Wolf wrote:
> Am 06.10.2021 um 15:00 hat Emanuele Giuseppe Esposito geschrieben:
>> Test 297 in qemu-iotests folder currently fails: pylint has
>> learned new things to check, or we simply missed them.
>>
>> All fixes in this patch are related to additional spaces used
>> or wrong indentation.
>>
>> No functional change intended.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> 
>> @@ -87,13 +87,14 @@ class TestStopWithBlockJob(iotests.QMPTestCase):
>>           iotests.qemu_img('create', '-f', iotests.imgfmt, self.overlay_img,
>>                            '1G')
>>   
>> -        result = self.vm.qmp('blockdev-add', **{
>> +        result = self.vm.qmp('blockdev-add',
>> +                             **{
>>                                    'node-name': 'overlay',
>>                                    'driver': iotests.imgfmt,
>>                                    'file': {
>>                                        'driver': 'file',
>>                                        'filename': self.overlay_img
>> -                                 }
>> +                                     }
>>                                })
>>           self.assert_qmp(result, 'return', {})
> 
> Am I the only one to think that the new indentation for the closing
> brace there is horrible? PEP-8 explictly allows things like:
> 
>      my_list = [
>          1, 2, 3,
>          4, 5, 6,
>      ]
> 
> Some of the other changes in this patch should be made, but at least if
> these are behind different switches, I would consider just disabling the
> one that complains about nicely formatted dicts.

The error is "C0330: Wrong hanging indentation"
so it is not about dicts. I guess we can disable the error, but the 
problem is that we will disable it for the whole file, which doesn't 
seem right.

Alternatively, this also works fine:

-        result = self.vm.qmp('blockdev-add',
-                             **{
-                                 'node-name': 'overlay',
-                                 'driver': iotests.imgfmt,
-                                 'file': {
-                                     'driver': 'file',
-                                     'filename': self.overlay_img
-                                     }
-                             })
+        result = self.vm.qmp('blockdev-add', **{
+            'node-name': 'overlay',
+            'driver': iotests.imgfmt,
+            'file': {
+                'driver': 'file',
+                'filename': self.overlay_img
+            }})

What do you think?

Otherwise I am happy to disable the error altogether.

Emanuele


