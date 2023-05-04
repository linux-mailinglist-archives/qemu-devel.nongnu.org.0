Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7906F658E
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 09:13:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puT9l-0004mv-5I; Thu, 04 May 2023 03:13:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1puT9i-0004mX-Oc
 for qemu-devel@nongnu.org; Thu, 04 May 2023 03:13:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1puT9h-0005Ye-Bm
 for qemu-devel@nongnu.org; Thu, 04 May 2023 03:13:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683184412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A2yY+722iIA4/Wy2ID1GEipEToYsXzH3SZ+e4zEAg3M=;
 b=Scn5GCAkvhZnFv0575tmAPuYvhS9h7OEffQfLU6YT0ItEn3BHw7VpYe952dUREVI0L0ASn
 5d9OIXMvMNU+6+u1bVF5uXpBaI9L0ze6ygKQzzLcmpa1y26Lwfu+RD2TEMXNyY7b2mkDhx
 iLnj5GP423XkA3Sk7cqYTqTQfUN9WRA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-330-K94jrf4yPnOseEXj0yhALg-1; Thu, 04 May 2023 03:13:28 -0400
X-MC-Unique: K94jrf4yPnOseEXj0yhALg-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f33f8ffa05so656405e9.1
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 00:13:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683184407; x=1685776407;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A2yY+722iIA4/Wy2ID1GEipEToYsXzH3SZ+e4zEAg3M=;
 b=CCQLgMRjfO9xx7LSROrTKrWCqdliG1Bh/02DrJp9+9tOeRbnnydlX3Lm4zddwjTfVQ
 kwGIogHTIl4oORPcyv/pluOg5im4kQedaF7wJmhW8TslZwSncPuIBDu6BRQ+K4N62ZyA
 NdhnfICBYy+EKgH0zGSO1HZcRUxnO3fwlfeydUyVSEvWqKFBCEyQw8UDvqVl8qOtdo5+
 2C9n0MbEJBD1obxp9wAxYl3pAAX5s9mGiKJEzJmhUl1BQShJ43WCm8KVmS8Jh+eYN96X
 O/XOPQgWDBgvpQ3o0G1iVDiAJX0qIKboLAobOHlK7WgC1OccXVZCEya1Wz4xb8Sb2BIR
 /yMQ==
X-Gm-Message-State: AC+VfDzg4QWSUTAhSYq4exj7mCxvdehF/EY3iCf/YSvHj/hZ4M/rUYwu
 +O1ii9FwurEP1z490TsXcmBGB3KeW0aYtL9+j1mR6yIUTwQoInosK4AZ2JBm3vDh4+9YARm1J4t
 SDzNiNXg90CD+OX4=
X-Received: by 2002:a7b:cc94:0:b0:3f1:69cc:475b with SMTP id
 p20-20020a7bcc94000000b003f169cc475bmr17462202wma.36.1683184407679; 
 Thu, 04 May 2023 00:13:27 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6TKCHH4ibQJ+K7Vs1Dl2jTvOrwsQuBAOWb1s88T+tX9clQqIwOV9aXMSumkalya8+aCduUMQ==
X-Received: by 2002:a7b:cc94:0:b0:3f1:69cc:475b with SMTP id
 p20-20020a7bcc94000000b003f169cc475bmr17462182wma.36.1683184407400; 
 Thu, 04 May 2023 00:13:27 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-91.web.vodafone.de.
 [109.43.179.91]) by smtp.gmail.com with ESMTPSA id
 o19-20020a1c7513000000b003f31cb7a203sm3887141wmc.14.2023.05.04.00.13.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 May 2023 00:13:26 -0700 (PDT)
Message-ID: <e30041fa-2295-6abd-b95f-b24b77c13829@redhat.com>
Date: Thu, 4 May 2023 09:13:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 0/2] Add mformat and xorriso dependencies in containers
Content-Language: en-US
To: Ani Sinha <anisinha@redhat.com>
Cc: alex.bennee@linaro.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, wainersm@redhat.com, bleal@redhat.com,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 berrange@redhat.com
References: <20230503145547.202251-1-anisinha@redhat.com>
 <8d7e46ec-95c0-5c4a-a843-20106576e9ba@redhat.com>
 <602A585B-01D1-4140-899F-F7E3A5045E47@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <602A585B-01D1-4140-899F-F7E3A5045E47@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.28, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 04/05/2023 09.10, Ani Sinha wrote:
> 
> 
>> On 04-May-2023, at 12:05 PM, Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 03/05/2023 16.55, Ani Sinha wrote:
>>> mformat and xorriso tools are needed by biosbits avocado tests. This patchset
>>> adds those two tools in the docker container images.
>>
>> tests/qtest/cdrom-test.c already uses genisoimage to create ISO images, and the containers already have that tool installed. Could you maybe switch the biosbits test to use that tool? Or the other way round? ... at least having two tools to create ISO images in our containers sounds IMHO excessive.
> 
> The dependency comes from the use of grub-mkrescue in the avocado test in order to generate the iso with the bios bits enabled grub and boot off with it. Grub-mkrescue is a bash script that uses mformat and xorriso.

Ok, then we could maybe try to convert the cdrom-test.c file to use xorriso 
instead?

  Thomas



