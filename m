Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE161455B08
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 12:56:25 +0100 (CET)
Received: from localhost ([::1]:49374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mng1g-0000Cy-Km
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 06:56:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mng02-0007bC-M0
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 06:54:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnfzz-0001QM-5o
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 06:54:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637236478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rGST1cIaqA5kABkTx3L6TG6gYC72uVoxyNmzBaKz+Gk=;
 b=iTpq0CIe/J8iXLnaFR3tll3cEyeS1Uqa+24FpIWR47qwddcSzHdY43gkJYR9Yv9gYX74cB
 nUf7g2XZKawwreBygtBDrSLFDKFPGNR8UJ0LPJ+BNLL4zwZ729bAeA97Q7yhFrsm84uuOg
 pXZHIKlZmlUXcW0Mv0iJRIAIfew2F/c=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-246-m93E3lcjMbKnUGwKsPgq_A-1; Thu, 18 Nov 2021 06:54:34 -0500
X-MC-Unique: m93E3lcjMbKnUGwKsPgq_A-1
Received: by mail-wm1-f70.google.com with SMTP id
 69-20020a1c0148000000b0033214e5b021so2503880wmb.3
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 03:54:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rGST1cIaqA5kABkTx3L6TG6gYC72uVoxyNmzBaKz+Gk=;
 b=3KA5pNKeaoQZPkThmMdrGhwo72G0UtRa1u2QreyFS78MxKwPZFOirdIfpzINzvTuqV
 fxkwETwigEXhPhPzncfC+BXANrZETQX8vVbeXowhFAVGjB/jGRDFVRUgILw2HFqkrdzj
 lQEzvwaeQa3NVMQkMVtDH0fN890q6LUo+/AN++zLFABLJYiSZ/IBxq84oAH0UPIUQdO1
 lDzvasmVsskf605q/1oPQ74BSDmogm7UJmdyh+eQ2+CXeS8LVU2DFkOrS4P3QRpTaSXP
 VQpb1euMc1mmjRSlAX5cnSyL3YZ7cLdaGpmqmBcsntouZVk0Bksz0p7LP62qpCoIG9hi
 f+qw==
X-Gm-Message-State: AOAM5328awkfbzYtJO4lOGOL3wC6GguSQZtHiOnm/AfmiHNxKdASG1Dy
 /0zW8qvnq2w2Rb+3c7YEjI0Fj5WaQ83bjv/3djcCMP2AWIHm2WjB3GK2ZKtBhZqF35Z2HEq4RdL
 45w0emyeIVewoyjA=
X-Received: by 2002:a7b:c38b:: with SMTP id s11mr8960514wmj.29.1637236471403; 
 Thu, 18 Nov 2021 03:54:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzLfiYs2R9OhGBgz9FPBYP3xwWfRNVuV3/syz0Hl9UzyoZkQd+juLf+TfCwn5uvmCU/+oI4LQ==
X-Received: by 2002:a7b:c38b:: with SMTP id s11mr8960171wmj.29.1637236466498; 
 Thu, 18 Nov 2021 03:54:26 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id a12sm2847819wrm.62.2021.11.18.03.54.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Nov 2021 03:54:25 -0800 (PST)
Message-ID: <04452e76-9747-1888-5060-8645b643b067@redhat.com>
Date: Thu, 18 Nov 2021 12:54:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH-for-6.2 v2 1/2] hw/block/fdc: Kludge missing floppy drive
 to fix CVE-2021-20196
To: Darren Kenny <darren.kenny@oracle.com>, qemu-devel@nongnu.org
References: <20211117232422.1026411-1-philmd@redhat.com>
 <20211117232422.1026411-2-philmd@redhat.com> <m2pmqxn3oo.fsf@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <m2pmqxn3oo.fsf@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.084, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Prasad J Pandit <pjp@fedoraproject.org>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gaoning Pan <pgn@zju.edu.cn>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/21 11:44, Darren Kenny wrote:
> Hi Philippe,
> 
> A small nit below, but otherwise looks good.
> 
> On Thursday, 2021-11-18 at 00:24:21 +01, Philippe Mathieu-Daudé wrote:
>> Guest might select another drive on the bus by setting the
>> DRIVE_SEL bit of the DIGITAL OUTPUT REGISTER (DOR).
>> The current controller model doesn't expect a BlockBackend
>> to be NULL. A simple way to fix CVE-2021-20196 is to create
>> an empty BlockBackend when it is missing. All further
>> accesses will be safely handled, and the controller state
>> machines keep behaving correctly.
>>
>> Fixes: CVE-2021-20196
>> Reported-by: Gaoning Pan (Ant Security Light-Year Lab) <pgn@zju.edu.cn>
>> BugLink: https://bugs.launchpad.net/qemu/+bug/1912780
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/338
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  hw/block/fdc.c | 14 +++++++++++++-
>>  1 file changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/block/fdc.c b/hw/block/fdc.c
>> index fa933cd3263..eab17e946d6 100644
>> --- a/hw/block/fdc.c
>> +++ b/hw/block/fdc.c
>> @@ -1161,7 +1161,19 @@ static FDrive *get_drv(FDCtrl *fdctrl, int unit)
>>  
>>  static FDrive *get_cur_drv(FDCtrl *fdctrl)
>>  {
>> -    return get_drv(fdctrl, fdctrl->cur_drv);
>> +    FDrive *cur_drv = get_drv(fdctrl, fdctrl->cur_drv);
>> +
>> +    if (!cur_drv->blk) {
>> +        /*
>> +         * Kludge: empty drive line selected. Create an anonymous
>> +         * BlockBackend to avoid NULL deref with various BlockBackend
>> +         * API calls within this model (CVE-2021-20196).
>> +         * Due to the controller QOM model limitations, we don't
>> +         * attach the created to the controller.
>>
> The created .... to the controller
> 
> Something is missing here, maybe 'device'?

OK. I forgot to add Cc: qemu-stable@nongnu.org so will respin.

Thanks,

Phil.


