Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B951E3B6E89
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 09:07:38 +0200 (CEST)
Received: from localhost ([::1]:54998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ly7qL-0006n0-Pv
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 03:07:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ly7oe-0005vU-2h
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 03:05:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ly7oc-0006eP-F1
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 03:05:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624950349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ok8my7t89X3HNiJ6G9jE5bXIecuY89Y0VWVtoLfuYBE=;
 b=aMZeO5LDsjjYy+oP2slXtyq/OhKqTAEhepHAHOD1Ir3OUy03NXczv0WoGbu3J/0GqEjSHj
 dwBykDG20fTVfpTKsNOfg4djMTS2d0Oao49XeGhjuNGzZ8v69ZxsgW3+wiiTROCIEFzGKD
 c94OOf7Br46Q/oSNrrdM0PE4DKxXOBU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-dj58Pxn7P36qedndUfVIpw-1; Tue, 29 Jun 2021 03:05:47 -0400
X-MC-Unique: dj58Pxn7P36qedndUfVIpw-1
Received: by mail-ej1-f69.google.com with SMTP id
 q14-20020a1709066aceb029049fa6bee56fso5278824ejs.21
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 00:05:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ok8my7t89X3HNiJ6G9jE5bXIecuY89Y0VWVtoLfuYBE=;
 b=ug+RDMPTKBKELjvbCnXLH81gi6ueACNkzOBzQBXStd1Wg8yntayxiCiKrSysgjzPKN
 DOoxd7v3eo8y/MR8TVRMT9J57FzDDqUuKGa8Q8XEtxCWGVCofnOEoSaSTsy6TKga5FGs
 gRQEwnhofE2xpvtnr8izkdyxuE7znZQ/1mIUoQrze2oTJPpZw2brJNGXLj4S0k71PQo+
 82CCeKryW9Xy3IRfvp/UxfXoRy4lkoPjBHZfkF8ul1g2Oy3djhjzvsXHPHC2cw/otxLV
 LW+PsxZTy5O7QgaiGovcp+gwZBaFH9jSbLUZqHaWPguq2Y6uiSB1aDftqsZAzGlgmdQw
 8Xxw==
X-Gm-Message-State: AOAM533Ro9CZqIpwXGZSF6IpbocM4GpN94w+SnqhIxZ4vzGgcMszopox
 KiNTwDujKnNznH0493s6MYFbQB+D0xNPRV3JQ3br0xlUSkicmiM2jn+dMXMOrcJfMW/YGrZfdik
 MaDw9ry/3Uu2h3/g=
X-Received: by 2002:aa7:c2d8:: with SMTP id m24mr38269594edp.65.1624950346220; 
 Tue, 29 Jun 2021 00:05:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJUuezdT6ZxuWuDtKxK+VhQODTdnrTkF8sUhfGrOe8KC4HUWSKOgo47H8yLya9d8bL/ydcPg==
X-Received: by 2002:aa7:c2d8:: with SMTP id m24mr38269557edp.65.1624950345961; 
 Tue, 29 Jun 2021 00:05:45 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 v25sm7794426ejk.90.2021.06.29.00.05.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jun 2021 00:05:45 -0700 (PDT)
Subject: Re: [PATCH v7 14/16] docs/devel/testing: add -valgrind option to the
 debug section of QEMU iotests
To: Eric Blake <eblake@redhat.com>
References: <20210628123150.56567-1-eesposit@redhat.com>
 <20210628123150.56567-15-eesposit@redhat.com>
 <20210628210009.ntb7l7xy7rhwplsd@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <680d52b6-429f-8001-33dd-bb7c58a6e1ac@redhat.com>
Date: Tue, 29 Jun 2021 09:05:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210628210009.ntb7l7xy7rhwplsd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 28/06/2021 23:00, Eric Blake wrote:
> On Mon, Jun 28, 2021 at 02:31:48PM +0200, Emanuele Giuseppe Esposito wrote:
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> Reviewed-by: Max Reitz <mreitz@redhat.com>
>> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   docs/devel/testing.rst | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
>> index 8b24e6fb47..fa85592a38 100644
>> --- a/docs/devel/testing.rst
>> +++ b/docs/devel/testing.rst
>> @@ -240,6 +240,13 @@ a failing test:
>>     If the ``-gdb`` option is not used, ``$GDB_OPTIONS`` is ignored,
>>     regardless on whether it is set or not.
>>   
>> +* ``-valgrind`` attaches a valgrind instance to QEMU. If it detects
>> +  warnings, it will print and save the log in
>> +  ``$TEST_DIR/<valgrind_pid>.valgrind``.
>> +  The final command line will be ``valgrind --log-file=$TEST_DIR/
>> +  <valgrind_pid>.valgrind --error-exitcode=99 $QEMU ...``
>> +  Note: if used together with ``-gdb``, this command will be ignored.
> 
> Ignored? Or did the previous patch make it an error to try and use
> both at once?
> 

I apologize, I forgot to update the documentation.
You are right in patch 13, the intended behavior is to fail with a 
meaningful error when both flags are used.

Will remove this doc line and update the error message as you suggested.

Thank you,
Emanuele


