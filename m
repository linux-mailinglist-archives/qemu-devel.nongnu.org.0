Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 234AD32D198
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 12:14:50 +0100 (CET)
Received: from localhost ([::1]:60352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHlwO-0002xQ-MS
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 06:14:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lHluf-0002HL-Fl
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 06:13:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lHluc-0001rw-Ha
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 06:13:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614856376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K5z99cqChomCBbWU5Ld2feA12LGd8mkCISByNodlalc=;
 b=Q9VMi59EZRA+Hqcffxievg737IveExXHhVKWeAc0rzMOaCY2a7mpkWW88lc6NO3926KT12
 iGOUCkG+7BXluIFaKWrjrJ4FgAE27O41x8Ap3RFh4JTt0IFnB7SioV8KyFNgs2XmZS8Isy
 a1IAF590jljtx3RWZJjZfldIbkmS424=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-PC83B8AdO-m8tz87lQWJOw-1; Thu, 04 Mar 2021 06:12:55 -0500
X-MC-Unique: PC83B8AdO-m8tz87lQWJOw-1
Received: by mail-ej1-f70.google.com with SMTP id sa29so2134135ejb.4
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 03:12:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=K5z99cqChomCBbWU5Ld2feA12LGd8mkCISByNodlalc=;
 b=ob4MPhvp/PO5oh3k+e7TaNAzfWlBVTdjzvhGlNW96NysVHqLxp1IBpVGGNARlz0Ncl
 4F5RxTMQDIeHyggK14LtzQM7U5tvvqcO+fZk8n5dnhB1Lp+2xKb6YzUnb3O9N+TKOEo/
 HS/GRKXsQ2J5pK9zGGnl1Y4VHdiH8o4S6wBxZfWLbOFxYgxIbJSj2Zp2vYmpHV+HCtIU
 W7Lj8UXhFldSuACGmYDYwqdEaG+2c90aNW43t5x0omLgOKppyodZHdmBODWsqiiC7ZlF
 XhW5zV6UCBlWT3wcf7yF641dywZqLuILgq9WU7h3Z5xA2alF5F47stApA28086/AzXHA
 3B0Q==
X-Gm-Message-State: AOAM531kXjt7gblN9ugcD3192YVqOhuhg8L6Cv9leX0N5AN/3fIxsTLi
 /U+kP8/enUx++4rXeL8ncusTMiOdbbkTMWlwPAHN0V1NtHjxKhtT5YkyzE2MsQ+QXDN+phrIPEH
 vHgUBjeRqYa+EyIk=
X-Received: by 2002:a17:906:8043:: with SMTP id
 x3mr3557798ejw.149.1614856374169; 
 Thu, 04 Mar 2021 03:12:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzROdWAffNXZfI75qSbDhjsgTARfvj6fU9NG3rLrnNUzETOT7ZH3J/ffj5H4iZoJsHDCoX39A==
X-Received: by 2002:a17:906:8043:: with SMTP id
 x3mr3557783ejw.149.1614856373913; 
 Thu, 04 Mar 2021 03:12:53 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id e22sm24061390edu.61.2021.03.04.03.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 03:12:53 -0800 (PST)
Date: Thu, 4 Mar 2021 12:12:51 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: QEMU RBD is slow with QCOW2 images
Message-ID: <20210304111251.2ernxss627lllwqa@steredhat>
References: <20210303174058.sdy5ygdfu75xy4rr@steredhat>
 <CA+aFP1CXWaZ4a7pB2EGhyf1CWt5k884qwgvwKxSRrZKTn=f3wg@mail.gmail.com>
 <20210304085540.ivknwqwrvhko3vxg@steredhat>
 <YEC1nQPYf4e5o8/j@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YEC1nQPYf4e5o8/j@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Lieven <pl@kamp.de>, dillaman@redhat.com,
 qemu-devel <qemu-devel@nongnu.org>, qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 04, 2021 at 10:25:33AM +0000, Daniel P. Berrangé wrote:
>On Thu, Mar 04, 2021 at 09:55:40AM +0100, Stefano Garzarella wrote:
>> On Wed, Mar 03, 2021 at 01:47:06PM -0500, Jason Dillaman wrote:
>> > On Wed, Mar 3, 2021 at 12:41 PM Stefano Garzarella <sgarzare@redhat.com> wrote:
>> > >
>> > > Hi Jason,
>> > > as reported in this BZ [1], when qemu-img creates a QCOW2 image on RBD
>> > > writing data is very slow compared to a raw file.
>> > >
>> > > Comparing raw vs QCOW2 image creation with RBD I found that we use a
>> > > different object size, for the raw file I see '4 MiB objects', for QCOW2
>> > > I see '64 KiB objects' as reported on comment 14 [2].
>> > > This should be the main issue of slowness, indeed forcing in the code 4
>> > > MiB object size also for QCOW2 increased the speed a lot.
>> > >
>> > > Looking better I discovered that for raw files, we call rbd_create()
>> > > with obj_order = 0 (if 'cluster_size' options is not defined), so the
>> > > default object size is used.
>> > > Instead for QCOW2, we use obj_order = 16, since the default
>> > > 'cluster_size' defined for QCOW2, is 64 KiB.
>> > >
>> > > Using '-o cluster_size=2M' with qemu-img changed only the qcow2 cluster
>> > > size, since in qcow2_co_create_opts() we remove the 'cluster_size' from
>> > > QemuOpts calling qemu_opts_to_qdict_filtered().
>> > > For some reason that I have yet to understand, after this deletion,
>> > > however remains in QemuOpts the default value of 'cluster_size' for
>> > > qcow2 (64 KiB), that it's used in qemu_rbd_co_create_opts()
>> > >
>> > > At this point my doubts are:
>> > > Does it make sense to use the same cluster_size as qcow2 as object_size
>> > > in RBD?
>> >
>> > No, not really. But it also doesn't really make any sense to put a
>> > QCOW2 image within an RBD image. To clarify from the BZ, OpenStack
>> > does not put QCOW2 images on RBD, it converts QCOW2 images into raw
>> > images to store in RBD.
>>
>> Yes, that was my doubt, thanks for the confirmation.
>>
>> Also Daniel (+CC) confirmed me the same thing, but just to be complete he
>> added that there is a case where OpenStack could use qcow2 on RBD, but in
>> this case using in-kernel RBD, so the QEMU RBD is not involved.
>>
>> >
>> > > If we want to keep the 2 options separated, how can it be done? Should
>> > > we rename the option in block/rbd.c?
>> >
>> > You can already pass overrides to the RBD block driver by just
>> > appending them after the
>> > "rbd:<filename>[:option1=value1[:option2=value2]]" portion, perhaps
>> > that could be re-used.
>>
>> I see, we should extend qemu_rbd_parse_filename() to suppurt it.
>
>We shouldn't really be extending the legacy filename syntax.
>If we need extra options we want them in the QAPI schema for
>blockdev.

Got it.

I'm still a bit confused about how QemuOpts are handled between format 
and protocol drivers.

It seems that in this case the protocol tries to access some information 
from the format (BLOCK_OPT_CLUSTER_SIZE).

Since the format removes this information from the QemuOpts passed to 
the protocol, this takes the default value of the format, even if a 
different value is specified.

Is it correct for a protocol to access BLOCK_OPT_CLUSTER_SIZE?

>
>> Maybe if we don't want to support this configuration, we should print some
>> warning messages.
>
>Note these are separate layers in QEMU block layer. qcow2 is a format
>driver, while RBD is a protocol driver. QEMU lets any format driver be
>run on top of any protocol driver in general. In practice there are
>certain combinations that are more sane and commonly used than others,
>but QEMU doesn't document this or assign support level to pairing
>right now.

Thanks for the clarification,
Stefano


