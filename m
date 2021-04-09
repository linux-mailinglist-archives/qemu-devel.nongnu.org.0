Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EF835A3F7
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 18:50:06 +0200 (CEST)
Received: from localhost ([::1]:52550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUuKb-0001uh-Fr
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 12:50:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lUuIU-0000hW-DQ
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:47:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lUuIN-0006T3-Su
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:47:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617986865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nMeYkbwHmD/CO2Xq2EJ1wWTghyCrMDGd1KnTxBZR9mE=;
 b=TXR+2iAi5Kgkktyb0Qewx5YE5mhdOwzx2Bi7IdHfTlbO9aF4bdYaCmBU8KUhWcrHTlq+P1
 YNnYaK2MhepgJOIuSatk0uBTx6ugCehAjzZg95oP/IbPMg7OjaTm5V4l/6uu+l5p1yHUup
 S3uISXkX8lfqmfrTb1ogtGI1Chl0sy8=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-SgekNFmVOIWzeXyBdReSuA-1; Fri, 09 Apr 2021 12:47:44 -0400
X-MC-Unique: SgekNFmVOIWzeXyBdReSuA-1
Received: by mail-oo1-f69.google.com with SMTP id l17so2719955ooi.4
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 09:47:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nMeYkbwHmD/CO2Xq2EJ1wWTghyCrMDGd1KnTxBZR9mE=;
 b=SF+p6YWVe+B74u2Njd0C1SE5rSTODim24pbIP3JuMiqwCZPniOuvzKo+Xw/qfQFTKj
 rDcxLgkeCVMBtIzNhrs/hWiusmnRll8cwU8kiQmkvMzTi2brO1M1qVe6JuWKv20+Bj9d
 uYp7OFOr3ll6LJIKQg17lkaI4YOw86S8LsonMwQX2Y0u4ke7GkhVOSuC7mIKUhMzC9C1
 DTFc7yNAiRBPp/uPj7xTfOT6cHfJezAHk1pEPjlh7ZMzn+q6oNS88ZWKVssY8Z8xP62o
 T6ouXgazxsuysUyN0Elue7f0wFm6xEFMEPG/+peZFt3WZgdaSibhYTht5/wDl5H7TmLh
 OOkA==
X-Gm-Message-State: AOAM531jip4j4qJAQaHlSowHX2IgSl4CUg53+UbYdD4X+FtVj7x+BCCj
 M6RyHmN3s0yUTmZq9l97s17zBVX4Ve04xha6DhTWdiKgNzxPRl0J972qYtOirzoqmodl5BzvwHW
 1wh6Vn/hLXVu7rwM=
X-Received: by 2002:a05:6830:111a:: with SMTP id
 w26mr12521732otq.329.1617986863255; 
 Fri, 09 Apr 2021 09:47:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0LqtCq6U4uif/VTARqARyhKo6IYpaAToHYn2r3VU/CvQ9z+ZMzpiZNahweaS/8Mg8U/CWDQ==
X-Received: by 2002:a05:6830:111a:: with SMTP id
 w26mr12521720otq.329.1617986863041; 
 Fri, 09 Apr 2021 09:47:43 -0700 (PDT)
Received: from [192.168.0.173] (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id
 t22sm720577otl.49.2021.04.09.09.47.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Apr 2021 09:47:42 -0700 (PDT)
Subject: Re: [PATCH] Document qemu-img options data_file and data_file_raw
To: Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org, jsnow@redhat.com
References: <20210301172837.20146-1-ckuehl@redhat.com>
 <794b64ea-3e5f-8387-76c4-240eeb2a1c67@redhat.com>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <fd30eed1-3ff3-20eb-11c3-23c716a128cc@redhat.com>
Date: Fri, 9 Apr 2021 11:47:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <794b64ea-3e5f-8387-76c4-240eeb2a1c67@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ckuehl@redhat.com;
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
Cc: hhan@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 4:24 AM, Max Reitz wrote:
> On 01.03.21 18:28, Connor Kuehl wrote:
>> [..]
>> diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
>> index b615aa8419..5cc585dc27 100644
>> --- a/docs/tools/qemu-img.rst
>> +++ b/docs/tools/qemu-img.rst
>> @@ -866,6 +866,18 @@ Supported image file formats:
>>       issue ``lsattr filename`` to check if the NOCOW flag is set or not
>>       (Capital 'C' is NOCOW flag).
>> +  ``data_file``
>> +    Pathname that refers to a file that will store all guest data. If
>> +    this option is used, the qcow2 file will only contain the image's
>> +    metadata.
> 
> I think I would like a note here about the fact that when passing this 
> option to qemu-img create, the given data file will be newly created, 
> i.e. if it already contains data, all that data will be lost.  And 
> perhaps also note that qemu-img amend on the other hand will only change 
> the reference in the qcow2 file, so the given file should already exist 
> and will not be overwritten.
> 
> (“Pathname that refers to a file” sounds like the file may already exist 
> before this operation, which may give people ideas.  (Not that the ideas 
> were bad, it’s just that they have to take care.  Referencing qemu-img 
> amend should give them a hint on how to do it right.))

Hey, I just wanted to leave a note indicating that I'm not ignoring this 
review; I've incorporated it in my next version but I am waiting until 
after the freeze to send it.

Thank you!

Connor


