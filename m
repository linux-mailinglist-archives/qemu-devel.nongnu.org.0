Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA914557DB
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 10:17:11 +0100 (CET)
Received: from localhost ([::1]:50718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mndXZ-0005sJ-QJ
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 04:17:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mndVw-0004Wd-T5
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 04:15:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mndVo-000203-JA
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 04:15:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637226918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F1cEvMh4uhS/jEOJ18lnANILZSGPd2bxkBz9vKoKvwg=;
 b=fwbDMuZc1RtLr8jtnQlLKNkK7Yr+MEFN8gLPyT3IyivXFWHzVa+PAYuhPkYVU9mo6Fhwfs
 GUdYQ4wjYP34uu0bJQFsjSvHbEL7kUp0HUbUSuSUgyZECN7/s5uph7x7VxS+o4WSawOZxL
 qeqL3HNAVh7UHJhIZZEeGrFUUJVNxYc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-115-jMqLHXysM9eaopuhKtv0_Q-1; Thu, 18 Nov 2021 04:15:15 -0500
X-MC-Unique: jMqLHXysM9eaopuhKtv0_Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 m14-20020a05600c3b0e00b0033308dcc933so2799480wms.7
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 01:15:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=F1cEvMh4uhS/jEOJ18lnANILZSGPd2bxkBz9vKoKvwg=;
 b=io1XGovLxZDQkijZgw674tRCcwLHqmgYDEisIjPwZtETYxCu9buyHICqOjjecUuwW5
 JL+NvOIm3zQGO7REOB1HZmTW4fG0W2ey4J9p5ITfwECtzMbBHoYAYLYdyaA1kNMPmZXS
 q1BtsvuaXZmqzZFlRdyEPhTOV28Ttscr8eGqftvH5TiS/MKlyurOYuLbKORugVyINZWe
 qBmvJ42sKAyMGwI9Vi+Ak7+EbONf0G5nmHL7YbGgfW54Bw6LQ08vVKYxpqtS9Np1t5IE
 oGb/L8sZpbFMLzziEvU+2DIrZk2zehRcrdePyq4yhIfWO6s3DGToS1BHamnqUEOz8gRc
 56vg==
X-Gm-Message-State: AOAM532f0+GWXkwbJ3QXUC+AMnYzJqWtW19mpgBXN9vfjf4htoTmva3O
 enJ08mC02NeRhWfDKsQ4/1iwNN0dEAFtvdw14u/E3K5QJa8KfQ6galHOTqCNb63E1Fi8W8JXkUM
 bt9ZjA+bWXqPGGNU=
X-Received: by 2002:a5d:4107:: with SMTP id l7mr28456249wrp.209.1637226914339; 
 Thu, 18 Nov 2021 01:15:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxmBrWkL3DJJRM/rXp4lGBJPPwzutLfARFL4c7I75PGcrhL1McxQvqTJIzMGLLZqhv0xFTrhw==
X-Received: by 2002:a5d:4107:: with SMTP id l7mr28456217wrp.209.1637226914151; 
 Thu, 18 Nov 2021 01:15:14 -0800 (PST)
Received: from [192.168.100.42] ([82.142.2.234])
 by smtp.gmail.com with ESMTPSA id l4sm2384412wrv.94.2021.11.18.01.15.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Nov 2021 01:15:13 -0800 (PST)
Message-ID: <720581b3-c0ec-0834-7ca4-c18a621853f4@redhat.com>
Date: Thu, 18 Nov 2021 10:15:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3] failover: fix unplug pending detection
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20211001082502.1342878-1-lvivier@redhat.com>
 <187a516b-9989-954a-4cab-834379d2a1d8@redhat.com>
 <20211018041855-mutt-send-email-mst@kernel.org>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <20211018041855-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.084, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>, Jens Freimann <jfreimann@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/10/2021 10:27, Michael S. Tsirkin wrote:
> On Mon, Oct 18, 2021 at 09:19:16AM +0200, Laurent Vivier wrote:
>> Hi,
>>
>> I don't understand if there are some issues
> 
> Gerd did identify some issues, you felt they aren't related to the patch
> and need to be addressed separately.
> 
> Gerd posted patches that are supposed to address them since.
> "try improve native hotplug for pcie root ports"
> Could you please either
> - test and report that your series depend on
>    Gerd's one to now work without the issues.
>    preferably by reposting a patch that applies on top.
> - test and report that the functionality is still partially
>    broken but explain in the commit log that this is not due
>    to the patch itself, and not made worse.
> 
> in both cases please CC reviewers: Daniel, Gerd.
>

I'm writing a test in tests/qtest that tests virtio-net failover, and I've added a test 
that checks the migration doesn't start while the card is not unplugged.

I've run the test on top of current qemu master (where Gerd's series is merged) and the 
problem still exists.

I will re-send this fix and the test in the same series.

Thanks,
Laurent


