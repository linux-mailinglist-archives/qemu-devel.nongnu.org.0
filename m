Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6646632CEF0
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 09:56:56 +0100 (CET)
Received: from localhost ([::1]:33278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHjmx-0001bs-Fe
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 03:56:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lHjlv-00015S-5m
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 03:55:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lHjlr-0006Rl-RW
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 03:55:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614848146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cVmw/gqJTQekywOvq3u7imfBW1niKB7Llvur15SbNco=;
 b=gchobP7JIWJJNxll4Z8GEjCHx3q3Pkc65P5h7a012O7iGYF/rCyraibjBhUw2VHQISYR//
 oj9c/eLn3dgn0ckynK4Ra8mSWWQEIgJTXiDLRPBeVJe8eQjpG3tNo+MgSJxzW+C0aIdyS6
 XLExEl964Gd+u4GbEIbkfwaOjFScAFo=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-CSFAhjkJNQuSNLYSo7XCTQ-1; Thu, 04 Mar 2021 03:55:44 -0500
X-MC-Unique: CSFAhjkJNQuSNLYSo7XCTQ-1
Received: by mail-ej1-f72.google.com with SMTP id rl7so6510209ejb.16
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 00:55:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cVmw/gqJTQekywOvq3u7imfBW1niKB7Llvur15SbNco=;
 b=T2XMsXifKu6lcs6Pc5AGukcPeKkrzWF3g8SLolOjj09x2WzP//Og59uzesMbuCxqVZ
 UWp6B31JI2WTp5oV65sxH/Z7kIt9077YvS2W7iXLkedWVv+Piaq3otlHEMZYnQpTp3sV
 +y3qw7bzsnWySaQxdNgkz0QBR1u46PyNlAxsqRwq/Hzqdek9Ut3gXRjY4XWHustrst33
 3FgtbQ7fWORNt2Mjsd860zX6Te6SmV896u9gYakTU/rJ/H1vh1yJMhr1xm7yg1/ZB81N
 mrqo3Qr0I74zLilslzWTEoE2gnzuWjMUIl1uYYfvNVRUw74Sjoci3E0obxyYxAq0NonY
 EKYw==
X-Gm-Message-State: AOAM532zXCJ2caqlwTp/t7IHPJXiQoOckeia0ggrxmeJtOJY2zXT3aZ6
 LhARwzK/65XukEltsWio3AV6UW50Xq4tV4cXFLvezwaBMlmJKSXabcLMaFtYkfZOBFLeCkzxzZF
 Txx4p7Ursga1Pcmo=
X-Received: by 2002:a50:9dcd:: with SMTP id l13mr3180174edk.220.1614848143383; 
 Thu, 04 Mar 2021 00:55:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyTQO+EdE52y23njNHOl2EfrtuwMiVbuGKdASzfEI5aR1Iuc44kcJHm89nr6Wyh4JckWuds2w==
X-Received: by 2002:a50:9dcd:: with SMTP id l13mr3180161edk.220.1614848143208; 
 Thu, 04 Mar 2021 00:55:43 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id j1sm2682095ejt.18.2021.03.04.00.55.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 00:55:42 -0800 (PST)
Date: Thu, 4 Mar 2021 09:55:40 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: dillaman@redhat.com
Subject: Re: QEMU RBD is slow with QCOW2 images
Message-ID: <20210304085540.ivknwqwrvhko3vxg@steredhat>
References: <20210303174058.sdy5ygdfu75xy4rr@steredhat>
 <CA+aFP1CXWaZ4a7pB2EGhyf1CWt5k884qwgvwKxSRrZKTn=f3wg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+aFP1CXWaZ4a7pB2EGhyf1CWt5k884qwgvwKxSRrZKTn=f3wg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Lieven <pl@kamp.de>, qemu-devel <qemu-devel@nongnu.org>,
 qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 03, 2021 at 01:47:06PM -0500, Jason Dillaman wrote:
>On Wed, Mar 3, 2021 at 12:41 PM Stefano Garzarella <sgarzare@redhat.com> wrote:
>>
>> Hi Jason,
>> as reported in this BZ [1], when qemu-img creates a QCOW2 image on RBD
>> writing data is very slow compared to a raw file.
>>
>> Comparing raw vs QCOW2 image creation with RBD I found that we use a
>> different object size, for the raw file I see '4 MiB objects', for QCOW2
>> I see '64 KiB objects' as reported on comment 14 [2].
>> This should be the main issue of slowness, indeed forcing in the code 4
>> MiB object size also for QCOW2 increased the speed a lot.
>>
>> Looking better I discovered that for raw files, we call rbd_create()
>> with obj_order = 0 (if 'cluster_size' options is not defined), so the
>> default object size is used.
>> Instead for QCOW2, we use obj_order = 16, since the default
>> 'cluster_size' defined for QCOW2, is 64 KiB.
>>
>> Using '-o cluster_size=2M' with qemu-img changed only the qcow2 cluster
>> size, since in qcow2_co_create_opts() we remove the 'cluster_size' from
>> QemuOpts calling qemu_opts_to_qdict_filtered().
>> For some reason that I have yet to understand, after this deletion,
>> however remains in QemuOpts the default value of 'cluster_size' for
>> qcow2 (64 KiB), that it's used in qemu_rbd_co_create_opts()
>>
>> At this point my doubts are:
>> Does it make sense to use the same cluster_size as qcow2 as object_size
>> in RBD?
>
>No, not really. But it also doesn't really make any sense to put a
>QCOW2 image within an RBD image. To clarify from the BZ, OpenStack
>does not put QCOW2 images on RBD, it converts QCOW2 images into raw
>images to store in RBD.

Yes, that was my doubt, thanks for the confirmation.

Also Daniel (+CC) confirmed me the same thing, but just to be complete 
he added that there is a case where OpenStack could use qcow2 on RBD, 
but in this case using in-kernel RBD, so the QEMU RBD is not involved.

>
>> If we want to keep the 2 options separated, how can it be done? Should
>> we rename the option in block/rbd.c?
>
>You can already pass overrides to the RBD block driver by just
>appending them after the
>"rbd:<filename>[:option1=value1[:option2=value2]]" portion, perhaps
>that could be re-used.

I see, we should extend qemu_rbd_parse_filename() to suppurt it.

Maybe if we don't want to support this configuration, we should print 
some warning messages.

Thanks,
Stefano


