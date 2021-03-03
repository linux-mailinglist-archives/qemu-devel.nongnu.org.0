Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D10432B9F9
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 19:42:25 +0100 (CET)
Received: from localhost ([::1]:55304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHWS0-0006qb-Ht
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 13:42:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWNw-0004OY-Ov
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:38:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWNu-0005Hc-Ho
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:38:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614796689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Azs7r5hzq+oJhnDSjjywtW9vxKYDAae858wPljQ2F1w=;
 b=CrfhmtRRjqAIXhdPjcvQGMMJJr/We1eGMbi0Hzh2B4a5Fa3v+0uxF9CTRk5ptAyKZh2i8k
 nADLdDktZDrPtZsmLXVl2NorWdaNKtBSJR/YBw8yS52YP3BbK+84j/Sc5TdYSW0vnX0ElD
 Kf02PP9+BZmwVY0LtBllDAAFnMnp2aQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-3i6y9rekM-iyahs-LKn4JA-1; Wed, 03 Mar 2021 13:38:08 -0500
X-MC-Unique: 3i6y9rekM-iyahs-LKn4JA-1
Received: by mail-wm1-f70.google.com with SMTP id v5so3402553wml.9
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 10:38:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Azs7r5hzq+oJhnDSjjywtW9vxKYDAae858wPljQ2F1w=;
 b=aqZdNqogD2NYgDotAlMQxmQ1GDmuRpkjl6SHXsVBDlNlm38JZ52eFBbOMChDIi0t9G
 5HQHt8F7DFIHGjHSrJMuGZn8GQo1vkUsSAv3w5J//wYumBeu8Lt1G1rwWCjqn35r9UYq
 22ff/RXwc6JZvCEA/HoW9rpOy1hreUtHpUa+wyWoVzVn0HDiqR6/vySZdbU5w3c61Dch
 NjYExUnfd9jFtumIletUe09oq25O4/Q6iL28S7J4JUvAZNBezUc2Kme1VsDnRW1fklSF
 fe7png1YIM/29Td8HWuGQUl7UXjsmGwKll+fk9J22nGVcTdM+1k2xrLIlJfHgA26L9/f
 pn6g==
X-Gm-Message-State: AOAM533XsMsWWgZOFWbIIPT8ETEgZ6OJ8A9qXQalYd/ukRUzl9DqSfnG
 PPc7Slzvfk+FVi2lebJYEj/dj7PUEu0xFnsF6H4fviiPrBrBohWgZwqAIB/AcRcV+rvSIwyujJU
 rzV6RJKWuL3ue768=
X-Received: by 2002:adf:828e:: with SMTP id 14mr27636557wrc.123.1614796687173; 
 Wed, 03 Mar 2021 10:38:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwH/Hw0IbejeS6DgJJnJUnpPbEdOJiVBVsy5hA87NNUcL1xbXFsMP09GxNLjcIFhY0X+cBFOA==
X-Received: by 2002:adf:828e:: with SMTP id 14mr27636541wrc.123.1614796687008; 
 Wed, 03 Mar 2021 10:38:07 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id r10sm8601151wmh.45.2021.03.03.10.38.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 10:38:06 -0800 (PST)
Subject: Re: [PATCH v3 4/7] hw/core: implement a guest-loader to support
 static hypervisor guests
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210303173642.3805-1-alex.bennee@linaro.org>
 <20210303173642.3805-5-alex.bennee@linaro.org>
 <224e4bad-6185-a457-ddb5-f04d5c16e2dc@redhat.com>
Message-ID: <a44ccf9e-9971-b1d1-7de9-4c2be5dbd5e9@redhat.com>
Date: Wed, 3 Mar 2021 19:38:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <224e4bad-6185-a457-ddb5-f04d5c16e2dc@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: julien@xen.org, andre.przywara@arm.com, stefano.stabellini@linaro.org,
 xen-devel@lists.xenproject.org, stefano.stabellini@xilinx.com,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/21 7:37 PM, Philippe Mathieu-Daudé wrote:
> On 3/3/21 6:36 PM, Alex Bennée wrote:
>> Hypervisors, especially type-1 ones, need the firmware/bootcode to put
>> their initial guest somewhere in memory and pass the information to it
>> via platform data. The guest-loader is modelled after the generic
>> loader for exactly this sort of purpose:
>>
>>   $QEMU $ARGS  -kernel ~/xen.git/xen/xen \
>>     -append "dom0_mem=1G,max:1G loglvl=all guest_loglvl=all" \
>>     -device guest-loader,addr=0x42000000,kernel=Image,bootargs="root=/dev/sda2 ro console=hvc0 earlyprintk=xen" \
>>     -device guest-loader,addr=0x47000000,initrd=rootfs.cpio
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> Message-Id: <20201105175153.30489-5-alex.bennee@linaro.org>
>> Message-Id: <20210211171945.18313-5-alex.bennee@linaro.org>
>> ---
>>  hw/core/guest-loader.h |  34 ++++++++++
>>  hw/core/guest-loader.c | 145 +++++++++++++++++++++++++++++++++++++++++
>>  MAINTAINERS            |   5 ++
>>  hw/core/meson.build    |   2 +
>>  4 files changed, 186 insertions(+)
>>  create mode 100644 hw/core/guest-loader.h
>>  create mode 100644 hw/core/guest-loader.c
> 
> Missing documentation, 

And I now see the following patches...

> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 


