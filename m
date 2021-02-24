Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05828323C13
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 13:49:47 +0100 (CET)
Received: from localhost ([::1]:42738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEtbu-00040X-2O
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 07:49:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEtak-0003NY-NV
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 07:48:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEtai-0002aD-Qa
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 07:48:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614170911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EeE2st+IQ2Ncu/nk9s3pBVu6q7E7Da7SWixNf4aQnp4=;
 b=IdKVPXu97kjWN4acIO1qCQRBnNEI9N9rPhaI2hiZRj0mYeLNNJUhl2+BdBaeOSpkzwnMAx
 WpKQhu+1aURJy3JxUbpKXKRObclPNKj0u7qKRjfp1bpPiBruoycV2Jzp3phi0ZgryBvw6y
 8ho7zfKgI6Wrf5fj1o4uElBMdg+LqKM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-m6lqV0BAOgixPZV9nqOI3A-1; Wed, 24 Feb 2021 07:48:29 -0500
X-MC-Unique: m6lqV0BAOgixPZV9nqOI3A-1
Received: by mail-wm1-f72.google.com with SMTP id s192so514480wme.6
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 04:48:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EeE2st+IQ2Ncu/nk9s3pBVu6q7E7Da7SWixNf4aQnp4=;
 b=GgRoRvCU/sML6qca+3VzhEsyiQSxoVsy6X6/27NmgSHalmVmqRg+lR3M4FrS4aztbP
 tfuQ4W2MNBXvERlbc441DxhHmiPiK0aJ/i34k30fzS23uccnl1/KIvt6fpXxpStLUrWH
 TltrScTXKAbfiU4TYthUbwczDuLO9usZ/GCKP/mvKmep8bwq05xgzgZ/0VS7EKU5DJtF
 TeQiqCNY4wrXf2WMKbC3xP136bqjzM7jXaX9e+YX6CGbxGuTove83GMUdSLJbOBED9MD
 Urm+VlHpiDBUEfq15kEYakuPZktoLczS6NsyFL1JF54J/4wQrEAO3repDgv3gJ9Z98Xz
 V5Zg==
X-Gm-Message-State: AOAM530X65hyv61ced6yQsXmBKzngTWG1NwWkw4tlPxbcCugLpuVy+Gh
 ULoj0HZ/juZsScZCiuGOvGe7X7eAm8amzbf9ZDbFj22cQCXqW20/sgjwMOGfFXN3ppR80jVzGBC
 KKzFXoJbWF2CuKQVOtg7KFNIk171fytQsXDk5wkn/2KFuPgZ0IzjIitrO7dNR22nB
X-Received: by 2002:adf:bb93:: with SMTP id q19mr14575714wrg.154.1614170907747; 
 Wed, 24 Feb 2021 04:48:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxuCFOS/ZHXnB94zl9Yp5D6Mp1a0BGhuUP/+RSbkEbN1bq38piO0EQLbORU+J0fs8k34/anhA==
X-Received: by 2002:adf:bb93:: with SMTP id q19mr14575702wrg.154.1614170907560; 
 Wed, 24 Feb 2021 04:48:27 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id r7sm3366644wre.25.2021.02.24.04.48.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 04:48:27 -0800 (PST)
Subject: Re: Problem running functional tests from China
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>
References: <60118671-cd47-1900-59c6-96782dd7e26c@redhat.com>
 <20210224110605.GM6564@kitsune.suse.cz>
 <198ecefe-4d68-b43d-dfae-8a5ceeee9615@redhat.com>
 <20210224120140.GO6564@kitsune.suse.cz> <YDZBsz/FFZtRCokJ@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0de93d2b-32bb-d0eb-646c-e3a8bb1943a7@redhat.com>
Date: Wed, 24 Feb 2021 13:48:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YDZBsz/FFZtRCokJ@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, avocado-devel <avocado-devel@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 1:08 PM, Daniel P. Berrangé wrote:
> On Wed, Feb 24, 2021 at 01:01:40PM +0100, Michal Suchánek wrote:
>> On Wed, Feb 24, 2021 at 12:37:53PM +0100, Philippe Mathieu-Daudé wrote:
>>> On 2/24/21 12:06 PM, Michal Suchánek wrote:
>>>> On Wed, Feb 24, 2021 at 10:29:15AM +0100, Philippe Mathieu-Daudé wrote:
>>>>> Just to inform the files hosted on github don't work when
>>>>> testing from China:
>>>>
>>>>>
>>>>> raw.githubusercontent.com resolves to 127.0.0.1
>>>
>>> Actually not even localhost but 0.0.0.0 :)
>>>
>>>> And from where does this come from?
>>>>
>>>> Your local system, your ISP, ... ?
>>>
>>> Probably the ISP:
>>>
>> ...
>>>
>>> I raised that problem not to find a way to bypass an ISP
>>> firewall, but to see if there is a way to use another
>>> storage for test artifacts so all the community can run
>>> the tests.
>>
>> I don't think protecting from random network malfunction is something
>> the qemu project can do.
>>
>> That said, downloading the test data during test run does indeed look
>> fragile.
>>
>> We have the concept of git submodules which is used in qemu extensively
>> so the test data could possibly be included directly in the git tree.
>>
>> The obvious downside is that the current and past test binaries will take
>> up disk space for all users that check out the repository, even those
>> that don't run the tests.
> 
> We explicitly do not want to be distributing / including the
> images ourselves, as that makes the QEMU project responsible for
> license compliance and thus provision of full & corresponding source.

I am not asking that QEMU redistribute these files, I'm asking to the
community if someone know an alternative to store files so we can run
QEMU tests in Chinese cloud farms.

Back to your comment, should we remove these tests?

Thanks,

Phil.


