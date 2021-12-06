Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C01984691EC
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 10:05:25 +0100 (CET)
Received: from localhost ([::1]:44040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mu9w4-0008R9-RY
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 04:05:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mu9tb-0007iS-6u
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 04:02:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mu9tZ-0002kJ-5D
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 04:02:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638781368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EI9VCe0m6XmOt0A/UPi1Y9LxmGcC0uLa3HgBn0uS/xA=;
 b=JMVTUZDMyaJFAPcio/8cD8gJyuJWQ9RZVctVH/G5eKhe5knsEdqDZ9304YuPQ/VZkBE0uX
 WRporSR4PkH4Bl7xssGpJcugDZXLPqvDlkFqsW9AMzbpNHZtfJY8/zNUGukezjiImhg00y
 e/Ln2a/Cxz7TG0bRAk7HSNBhdUbpKgc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-488-IFBtIcrEPPiSHvGDMTExtw-1; Mon, 06 Dec 2021 04:02:47 -0500
X-MC-Unique: IFBtIcrEPPiSHvGDMTExtw-1
Received: by mail-wm1-f70.google.com with SMTP id
 a64-20020a1c7f43000000b003335e5dc26bso5780163wmd.8
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 01:02:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EI9VCe0m6XmOt0A/UPi1Y9LxmGcC0uLa3HgBn0uS/xA=;
 b=xzMvFH001kc/hclugL1wpYwWUYstkM2xqdSrrZD7Gqf56325iSfzOxPzLw+crRptLy
 e1xCV5gnvDcEkEQB8jQdrUWN5g41SpBerYXJ4OoqtqAODUbokIuMiAEodS3c4LcnGPhI
 TLt/tghvcSal9fICG3/+UrjsZBS3Y1wXmxRFzEAOVRCPTjAAi3vAsac87n2YQxWVM8+2
 zbQRNa+J6vOf8ayIhlz6Fw9dZuqjvpS6IISMkGmTCxUJlPsDgJXwwlaD0tKNDHv+f2Zn
 QqflXavSjOPF+qrh8BYxcpgNsPN0ewDn+c8VNHWVBTqpxik5XuugyxtGgX1a3P0vuS25
 SHFg==
X-Gm-Message-State: AOAM532QEDAdWXaNv4qO/PNxYCn85vYb2KGxpp6VwFbTcVaIxcEY6fjT
 +orl5UrWSBimDZOBnz+YaZ/W/iTDIdPGpNMyJrKFdq/OZFcY91y8L1w1DcfaRYPKbxmf5/UXiqw
 II3mv+Qq6kCkKSiM=
X-Received: by 2002:adf:d1e3:: with SMTP id g3mr43065161wrd.300.1638781366162; 
 Mon, 06 Dec 2021 01:02:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyFJkuv72OZnisgV7llFzic83iB9esn+1VWe0CSpteep8kMSvI7zlQEmeJSdjEqIk/gv7kMpg==
X-Received: by 2002:adf:d1e3:: with SMTP id g3mr43065134wrd.300.1638781365946; 
 Mon, 06 Dec 2021 01:02:45 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id b13sm11068801wrh.32.2021.12.06.01.02.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Dec 2021 01:02:45 -0800 (PST)
Message-ID: <1fd3a291-0970-5a5f-9428-9539afc8559b@redhat.com>
Date: Mon, 6 Dec 2021 10:02:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH for-7.0] i386: Deprecate the -no-hpet QEMU command line
 option
To: Peter Krempa <pkrempa@redhat.com>
References: <20211206084012.49277-1-thuth@redhat.com>
 <10bc4172-f6c0-504b-cecb-e7caf9edb074@redhat.com>
 <Ya3QltUi9CkqDJEN@angien.pipo.sk>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <Ya3QltUi9CkqDJEN@angien.pipo.sk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.076, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Libvirt <libvir-list@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/12/2021 09.57, Peter Krempa wrote:
> On Mon, Dec 06, 2021 at 09:47:58 +0100, Thomas Huth wrote:
>> On 06/12/2021 09.40, Thomas Huth wrote:
>>> The HPET setting has been turned into a machine property a while ago
>>> already, so we should finally do the next step and deprecate the
>>> legacy CLI option, too.
>>> While we're at it, add a proper help text for the machine property, too.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>    docs/about/deprecated.rst | 6 ++++++
>>>    hw/i386/pc.c              | 2 ++
>>>    qemu-options.hx           | 2 +-
>>>    softmmu/vl.c              | 1 +
>>>    4 files changed, 10 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
>>> index 5693abb663..1dfe69aa6a 100644
>>> --- a/docs/about/deprecated.rst
>>> +++ b/docs/about/deprecated.rst
>>> @@ -198,6 +198,12 @@ form is preferred.
>>>    Using ``-drive if=none`` to configure the OTP device of the sifive_u
>>>    RISC-V machine is deprecated. Use ``-drive if=pflash`` instead.
>>> +``-no-hpet`` (since 7.0)
>>> +''''''''''''''''''''''''
>>> +
>>> +The HPET setting has been turned into a machine property.
>>> +Use ``-machine hpet=off`` instead.
>> [...]
>>
>> Forgot to CC: the libvirt folks, doing so now.
>>
>> Seems like libvirt is still using -no-hpet in some few spots, so I guess
>> these would need to be changed first, before we could finally remove this
>> option in QEMU?
> 
> Yes we need to switch to the new property first.
> 
> Is the new way via -machine property by any chance usable with
> qemu-2.11? If yes, then we can do it unconditionally, otherwise we'll
> need a witness to detect the support for the new flag as a qemu
> capability.

The machine property has been added just a year ago:

  https://gitlab.com/qemu-project/qemu/-/commit/0259c78ca79

So it's just available on QEMU v5.2.0 and newer.

  Thomas


