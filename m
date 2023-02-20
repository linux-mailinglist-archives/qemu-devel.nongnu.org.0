Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1757369D164
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 17:35:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU96P-0007hz-4R; Mon, 20 Feb 2023 11:33:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pU96M-0007hK-7J
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 11:33:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pU96J-0004QU-Dx
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 11:33:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676910794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z/CSWHuMfBlCwGhTv4JBvfUT9uEu36eQSGbLTBv1MZw=;
 b=Paquam3s4OpEeVKUp7KhQBFtN073zXJOxyVe/IIcPNkieEpxdatmE58VG0pfi269zes/Vj
 dLY5AB9wDyfpwHhyTz8S19D+x2Q7s40QF4iwk1gzW5NfQL0DR9H+a2Yh12ykd+cDq5a6JY
 YNt/xrOh+dLgRNtaTHxfvT4yA1Wnv3c=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-450-UTTf-cO4NdOMU5SIoT54Hw-1; Mon, 20 Feb 2023 11:33:12 -0500
X-MC-Unique: UTTf-cO4NdOMU5SIoT54Hw-1
Received: by mail-wm1-f71.google.com with SMTP id
 m22-20020a05600c4f5600b003dffc7343c3so724771wmq.0
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 08:33:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z/CSWHuMfBlCwGhTv4JBvfUT9uEu36eQSGbLTBv1MZw=;
 b=vTFfrbuR/+RH7mb6O+qIxLJoX3dAG/XvXjh17RxfFEescxlhZPtXm667wWOC2LXupI
 HWeMPzjy+7ITiqwuVT7QBQYFhxAig43j/txKpzQxpGbhqme+5Zeyf6EoFOinebl1AQXj
 dltAMkT4R6GwrHY09vtKz5g4fEFE+8TD0nxXbXWojk7tFOsj+JaS/HnF2cZeembCjKqr
 7y6w+fbLydZPNdfG4OwSigBv6AQaXvntAI84lkMUHdoS7dDNnol0Lx6UsFcx9ZzPCzt1
 eRG82nNS5Rw0bNNY4R7SbqueLrMXiz2lbMlZcEU3Xsh0YPfwIeJ2tQDn00T1usFD6w9H
 n5CA==
X-Gm-Message-State: AO0yUKUQxPannnlfOVTcwRmKhOEWHFeF59Nx1kBAFNkf0WLXLYuMWlij
 WQ+GPg6+bqR6wD+pdy9io9z9emTMK9G64af6zejn1NaPNAiJ/SjgmkWhQ35ROChJha5Xk19xax8
 lwBok6mDlSOIZla8=
X-Received: by 2002:a05:600c:44d4:b0:3e2:1f63:4a9a with SMTP id
 f20-20020a05600c44d400b003e21f634a9amr1611970wmo.29.1676910791787; 
 Mon, 20 Feb 2023 08:33:11 -0800 (PST)
X-Google-Smtp-Source: AK7set/aE6pYFsH5WJmoXHkv/Bjungu9u7OnjTigL5sgMa3gZwKixcJksMx7CZMwPjhYX0CqT1hVVw==
X-Received: by 2002:a05:600c:44d4:b0:3e2:1f63:4a9a with SMTP id
 f20-20020a05600c44d400b003e21f634a9amr1611956wmo.29.1676910791481; 
 Mon, 20 Feb 2023 08:33:11 -0800 (PST)
Received: from [192.168.8.104] (tmo-100-40.customers.d1-online.com.
 [80.187.100.40]) by smtp.gmail.com with ESMTPSA id
 k9-20020a5d6289000000b002c56af32e8csm978050wru.35.2023.02.20.08.33.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 08:33:10 -0800 (PST)
Message-ID: <25258b60-f752-99e1-8916-516399e02fac@redhat.com>
Date: Mon, 20 Feb 2023 17:33:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 0/1] pc-bios: Support List-Directed IPL from ECKD DASD
Content-Language: en-US
To: Jared Rossi <jrossi@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Cc: frankja@linux.ibm.com, jjherne@linux.ibm.com
References: <20230130212411.1167822-1-jrossi@linux.ibm.com>
 <62db22bc-2787-6c2d-6fad-9b4834ac12c4@linux.ibm.com>
 <837e025f-2307-225d-2b87-5f58ccda183a@redhat.com>
 <eba35cef-32d1-69cd-2fc5-638880e2ee63@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <eba35cef-32d1-69cd-2fc5-638880e2ee63@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 20/02/2023 17.21, Jared Rossi wrote:
> On 2/20/23 10:45 AM, Thomas Huth wrote:
>> On 20/02/2023 16.13, Jared Rossi wrote:
>>> Hi,
>>>
>>> Pinging this patch since v2.26.0 of s390-tools adds ECKD DASD 
>>> list-directed IPL.
>>> This patch set allows QEMU to utilize that new boot pointer format.
>>> Any feedback about what needs to be changed for acceptance is much 
>>> appreciated.
>>
>> Where did you send your patches to? I can't find it in neither my 
>> qemu-s390x nor my qemu-devel mailing list folders.
>>
>>  Thomas
> 
> Hi Thomas,
> 
> I tried to send them toqemu-s390x@nongnu.org  andqemu-devel@nongnu.org  lists with some additional people (including you)
> in CC.  The initial mail was on January 30th.  I can resend them if there was a problem with the delivery.

I also don't see your mail in the usual archives, e.g. not in:

  https://lore.kernel.org/qemu-devel/?q=Support+List-Directed+IPL+from+ECKD+DASD

and also not in:

  https://lists.gnu.org/archive/html/qemu-devel/2023-01/threads.html

It seems like your patches never left your mail server. Thus please resend!

  Thanks,
   Thomas


