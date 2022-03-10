Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A664D5009
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 18:16:22 +0100 (CET)
Received: from localhost ([::1]:38258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSMOj-0000kj-6g
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 12:16:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nSMN2-0008G0-BA
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:14:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nSMMy-0002tz-M7
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:14:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646932471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T3frLnrhnoPgB86XnTDoC6tMl7zXSo5ctC0EVZDbRFk=;
 b=K/iLTbjkcjmQ9IQ1DVfyWw6sj6aCX4lDDwR8qDSndhwWgQnPezg3j/AkOScq3+AIiM5T9G
 mDtJ/6Z/IuQlzFrcAX/JFJ3sKKj60U4gqZAqj8BXBW/x3YEJd7wuEsyUo0jY3Axl+E/rry
 9kWqKDtX+Et0nRUIiUrXb9zDvPYenlo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-394-w_shQ3TRPnm4oBZxOrQuFw-1; Thu, 10 Mar 2022 12:14:30 -0500
X-MC-Unique: w_shQ3TRPnm4oBZxOrQuFw-1
Received: by mail-ej1-f69.google.com with SMTP id
 x2-20020a1709065ac200b006d9b316257fso3475224ejs.12
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 09:14:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=T3frLnrhnoPgB86XnTDoC6tMl7zXSo5ctC0EVZDbRFk=;
 b=MLWT/q8m5LjfoSokuWwW/mZxkEa1+h1NKlBPlQWCSLVw+10W0h9aVfO/5b7biITPCO
 NY8A/xo2NV2gKhFHMXCAKh8V0VZv7Er2BDxHwXn9fSpCGCrHLv7ClmqwjEmnHoufaved
 +J90XroGymhuKJQTcpvrgxocPorYWrDG+HaQRf2OLs1GKURSqjR+NzkFFSZDDmnSpVVZ
 Yu7raFU5aG0WF31c+JiDmqGvekyd8ElfWsNVRrfH2xPXaWDeuuvf3cDwahV5PQ/cylh3
 gPqGRs/W0pw/hPOsQjFYZ+61JB15A5pXmPOHTP/W1r9QT+s+p/eKhx4BEeRtshTt+zbT
 gunw==
X-Gm-Message-State: AOAM5314lDmKwHzOthy4REUpXz82Jg++dzOK7SJ7DP7UJT7XdaqbIwNV
 iIqO/karGp+l2AEcCuGgs3QHGzWiX2UeDWCALYCzD7E9iASSNjh+1ygDErwOBUghWstthEM4Y+S
 Qlmb1EwKwMktPQV4=
X-Received: by 2002:a17:907:6e06:b0:6da:889b:321c with SMTP id
 sd6-20020a1709076e0600b006da889b321cmr4973215ejc.510.1646932468986; 
 Thu, 10 Mar 2022 09:14:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy0ftCced2J8VlXJ4z7IgjfZVYQM9ZC4hEFt44qPSF4MdGgeJ0g0YXMfG8tAMYNHqsf2l9uFg==
X-Received: by 2002:a17:907:6e06:b0:6da:889b:321c with SMTP id
 sd6-20020a1709076e0600b006da889b321cmr4973192ejc.510.1646932468779; 
 Thu, 10 Mar 2022 09:14:28 -0800 (PST)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218]) by smtp.gmail.com with ESMTPSA id
 g22-20020a170906395600b006cec40b9cf0sm1983129eje.92.2022.03.10.09.14.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 09:14:27 -0800 (PST)
Message-ID: <01a68a16-fa01-e7f3-4248-fdec6595cf74@redhat.com>
Date: Thu, 10 Mar 2022 18:14:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH-for-6.2 0/2] hw/block/fdc: Fix CVE-2021-3507
To: Jon Maloy <jmaloy@redhat.com>, qemu-devel@nongnu.org, f4bug@amsat.org
References: <20211118115733.4038610-1-philmd@redhat.com>
 <7153eadf-3c43-b62c-aaa1-919abf0634ca@redhat.com>
 <1c5dfae3-1c3c-bd2f-d2b5-06dbe75c04c8@redhat.com>
 <4df33af0-0a28-2e20-1909-25baf87d0565@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <4df33af0-0a28-2e20-1909-25baf87d0565@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 Prasad J Pandit <pjp@fedoraproject.org>, qemu-block@nongnu.org,
 Darren Kenny <darren.kenny@oracle.com>, Alexander Bulekov <alxndr@bu.edu>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/02/2022 20.19, Jon Maloy wrote:
> Trying again with correct email address.
> ///jon
> 
> On 2/6/22 14:15, Jon Maloy wrote:
>>
>>
>> On 1/27/22 15:14, Jon Maloy wrote:
>>>
>>> On 11/18/21 06:57, Philippe Mathieu-Daudé wrote:
>>>> Trivial fix for CVE-2021-3507.
>>>>
>>>> Philippe Mathieu-Daudé (2):
>>>>    hw/block/fdc: Prevent end-of-track overrun (CVE-2021-3507)
>>>>    tests/qtest/fdc-test: Add a regression test for CVE-2021-3507
>>>>
>>>>   hw/block/fdc.c         |  8 ++++++++
>>>>   tests/qtest/fdc-test.c | 20 ++++++++++++++++++++
>>>>   2 files changed, 28 insertions(+)
>>>>
>>> Series
>>> Acked-by: Jon Maloy <jmaloy@redhat.com>
>>
>> Philippe,
>> I hear from other sources that you earlier have qualified this one as 
>> "incomplete".
>> I am of course aware that this one, just like my own patch, is just a 
>> mitigation and not a complete correction of the erroneous calculation.
>> Or did you have anything else in mind?

Any news on this one? It would be nice to get the CVE fixed for 7.0 ?

  Thomas


