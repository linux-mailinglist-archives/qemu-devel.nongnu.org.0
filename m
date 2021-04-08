Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 122D7358971
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 18:15:17 +0200 (CEST)
Received: from localhost ([::1]:47732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUXJM-000362-2k
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 12:15:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lUXB3-0002EU-28
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 12:06:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lUXAz-0002Op-9q
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 12:06:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617897996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o7M4S7YeFOurpr72/U8vQJOq1S1eK4haEBXv7PkHfAg=;
 b=SuTPNQcC1CBUM9Ttq4KK6szBZGYZBL72WSwY0EqSBtN1NBPi4XHr7fNKbq+8sBUwSZED7X
 eVoVsizHRWPZ8YrRHW60z4OwcZCSz4O8Dy6hdkGUyh7zxXfrdeWrywXiZccbA8B2r4eA6L
 If/yKrOJy/+KzeuYI0xcN7e0/c4UbLw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-gkkz658POXGpmTnS4mcqEw-1; Thu, 08 Apr 2021 12:06:34 -0400
X-MC-Unique: gkkz658POXGpmTnS4mcqEw-1
Received: by mail-wm1-f70.google.com with SMTP id n2so595909wmi.2
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 09:06:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=o7M4S7YeFOurpr72/U8vQJOq1S1eK4haEBXv7PkHfAg=;
 b=MWliYKD2d+Sr0f1PmW2GA8j+QQ0Vb6QLMI+DjZ0p2rekeV1XA2/heUBOzjm9ilPCQf
 UYCVGPy09Z9QyHzVzX0ZwiLGcabo7DUwwzozhA6jPN9hY3/QabfeFGSxUxnQWK2eiuSD
 dFYX414Qr2qtNnbQIXXSwUzYNqMkX33jVyELJg+mmw3JQXzTLofZ+NyypDPtjsGto95L
 5FgdKT0P8wgaUbbs8ZokDa8dwuYm7Yb2j2A5rCr8iQ12PPLFSJQkOptQ0cx9X9S2Jltn
 hlZaVm5wUquJaxbrnuErs5nHy7IZt2+4fLA4DDkPecBZIgFDn08a0OKsyaTSwGPG2x6H
 Acqg==
X-Gm-Message-State: AOAM532ih3Z3eJ+yIQ94YxVFtKULmOCi6dH3ImSAOO1MUBwBWPjN0BgM
 yZOBdbOauLx25hIoifgODpLTdv24cy3nSZJFpGXmcjFBS+lK6ZITgZ0tHjiG4Hvp6RjU2c5TV7I
 QotU47LWg8lbY/pg=
X-Received: by 2002:adf:db52:: with SMTP id f18mr6448868wrj.225.1617897992878; 
 Thu, 08 Apr 2021 09:06:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyJhd3IKm+julBedZ3yb7fLMkJbw91ADrNg/lCI2rOtj4QWJHwePGhaatjjgprlCARMOvoBg==
X-Received: by 2002:adf:db52:: with SMTP id f18mr6448808wrj.225.1617897992512; 
 Thu, 08 Apr 2021 09:06:32 -0700 (PDT)
Received: from localhost.localdomain ([194.230.155.120])
 by smtp.gmail.com with ESMTPSA id m14sm3724532wrh.28.2021.04.08.09.06.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Apr 2021 09:06:32 -0700 (PDT)
Subject: Re: [RFC PATCH v2 04/11] qemu-iotests: delay QMP socket timers
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org
References: <20210407135021.48330-1-eesposit@redhat.com>
 <20210407135021.48330-5-eesposit@redhat.com>
 <ac7c35c0-8597-5450-e80a-cb8adac5d85f@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <ef103aa2-d585-22ce-0aaf-45a6e190d2ef@redhat.com>
Date: Thu, 8 Apr 2021 18:06:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <ac7c35c0-8597-5450-e80a-cb8adac5d85f@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 08/04/2021 17:40, Paolo Bonzini wrote:
> On 07/04/21 15:50, Emanuele Giuseppe Esposito wrote:
>>       def get_qmp_events_filtered(self, wait=60.0):
>>           result = []
>> -        for ev in self.get_qmp_events(wait=wait):
>> +        qmp_wait = wait
>> +        if qemu_gdb:
>> +            qmp_wait = 0.0
>> +        for ev in self.get_qmp_events(wait=qmp_wait):
>>               result.append(filter_qmp_event(ev))
>>           return result
> 
> Should this be handled in get_qmp_events instead, since you're basically 
> changing all the callers?

get_qmp_events is in python/machine.py, which as I understand might be 
used also by some other scripts, so I want to keep the changes there to 
the minimum. Also, machine.py has no access to qemu_gdb or 
qemu_valgrind, so passing a boolean or something to delay the timer 
would still require to add a similar check in all sections.

Or do you have a cleaner way to do this?

Emanuele


