Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0DE32CF0E
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 09:59:37 +0100 (CET)
Received: from localhost ([::1]:35644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHjpY-0002jN-TI
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 03:59:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lHjoK-0002CD-1d
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 03:58:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lHjoE-0007aV-WF
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 03:58:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614848294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eYlJmOz3Sg1wPsInxV6KtbMKW8OteRD2P1Z7wLzkEU0=;
 b=AhLSmSmTYhRMG7dQufCoD4g3C5e5E+o7yJ28NEHExdHvTk3Ij9C6NE1WsqzhTzXCmughoh
 r08O3vxJ6xH0oizQD0pMoVnSG4yuQPTPON2/PbFc5wBaT218BSXbFJqqtULUvH/1yFXHgX
 pmLBapJLitpA/kECrLuxwRJVdj8cfFw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-9RA0dYOsOu-wWbUlSP81Bw-1; Thu, 04 Mar 2021 03:58:12 -0500
X-MC-Unique: 9RA0dYOsOu-wWbUlSP81Bw-1
Received: by mail-ed1-f72.google.com with SMTP id bi17so1839787edb.6
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 00:58:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eYlJmOz3Sg1wPsInxV6KtbMKW8OteRD2P1Z7wLzkEU0=;
 b=HV45GT84jm43SoVqzJrlJ0HFmxfHsZkk+RC0+SdTQmKNn2Q+HWAwmImjEpNe+SZjkC
 PtZmw8mnt+AD5R+HlOmWK4P/laassE8i9WD9tQNHafp/37Rt7twheiQVw3FAEQajbVU3
 CWI28KEjZSauXrp3oVYC/+d7Ie9odjaEXF03PcYTz20z++XJkSxA+gUwJtc8pVc9qKKg
 rjHoYeVt5+cVH7Qw/Xa9h60ZbyppPcKvLl1S0QT8GySTgaG44g+u7/ZdcLWwo9FZh60d
 SgpAptXbsTo5+Ods4x5SFjrKM5W/55FjuoRgttjWprBsxUa62w9nu7A4CoNwYBUy8b9A
 Dubw==
X-Gm-Message-State: AOAM5317tmzxey9VF/KOHH1hXPX8aJUBx3JicaP8ApfP9kWw1H9jvlLE
 rlPvrGjk09BORR/oMhSuDISEVgqQMkO/GEbdW2lo5kiMDitTezHYSJETL9tL162tuhyeGQQcHz5
 ZbkfTwwcz1viEI6k=
X-Received: by 2002:a17:906:7f84:: with SMTP id
 f4mr2983144ejr.525.1614848291020; 
 Thu, 04 Mar 2021 00:58:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyl5AcSfU0T/z5Sn8rAbf6/7/eYp8mFZyoU7BwRtc9ssEHJQQE0Zs3qDZJdD8calfY+2FCcKA==
X-Received: by 2002:a17:906:7f84:: with SMTP id
 f4mr2983130ejr.525.1614848290875; 
 Thu, 04 Mar 2021 00:58:10 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id d5sm23715502edu.12.2021.03.04.00.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 00:58:10 -0800 (PST)
Date: Thu, 4 Mar 2021 09:58:08 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Peter Lieven <pl@kamp.de>
Subject: Re: QEMU RBD is slow with QCOW2 images
Message-ID: <20210304085808.qto3riamjgr6pshc@steredhat>
References: <20210303174058.sdy5ygdfu75xy4rr@steredhat>
 <CA+aFP1CXWaZ4a7pB2EGhyf1CWt5k884qwgvwKxSRrZKTn=f3wg@mail.gmail.com>
 <f1ba8a4c-94b6-fc94-131d-fd41ce96e6de@kamp.de>
MIME-Version: 1.0
In-Reply-To: <f1ba8a4c-94b6-fc94-131d-fd41ce96e6de@kamp.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: dillaman@redhat.com, qemu-devel <qemu-devel@nongnu.org>,
 qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 03, 2021 at 10:26:12PM +0100, Peter Lieven wrote:
>Am 03.03.21 um 19:47 schrieb Jason Dillaman:
>> On Wed, Mar 3, 2021 at 12:41 PM Stefano Garzarella <sgarzare@redhat.com> wrote:
>>> Hi Jason,
>>> as reported in this BZ [1], when qemu-img creates a QCOW2 image on RBD
>>> writing data is very slow compared to a raw file.
>>>
>>> Comparing raw vs QCOW2 image creation with RBD I found that we use a
>>> different object size, for the raw file I see '4 MiB objects', for QCOW2
>>> I see '64 KiB objects' as reported on comment 14 [2].
>>> This should be the main issue of slowness, indeed forcing in the code 4
>>> MiB object size also for QCOW2 increased the speed a lot.
>>>
>>> Looking better I discovered that for raw files, we call rbd_create()
>>> with obj_order = 0 (if 'cluster_size' options is not defined), so the
>>> default object size is used.
>>> Instead for QCOW2, we use obj_order = 16, since the default
>>> 'cluster_size' defined for QCOW2, is 64 KiB.
>>>
>>> Using '-o cluster_size=2M' with qemu-img changed only the qcow2 cluster
>>> size, since in qcow2_co_create_opts() we remove the 'cluster_size' from
>>> QemuOpts calling qemu_opts_to_qdict_filtered().
>>> For some reason that I have yet to understand, after this deletion,
>>> however remains in QemuOpts the default value of 'cluster_size' for
>>> qcow2 (64 KiB), that it's used in qemu_rbd_co_create_opts()
>>>
>>> At this point my doubts are:
>>> Does it make sense to use the same cluster_size as qcow2 as object_size
>>> in RBD?
>> No, not really. But it also doesn't really make any sense to put a
>> QCOW2 image within an RBD image. To clarify from the BZ, OpenStack
>> does not put QCOW2 images on RBD, it converts QCOW2 images into raw
>> images to store in RBD.
>
>
>As discussed earlier the only reasonable format for rbd image is raw.
>What is the idea behind putting a qcow2 on an rbd pool?
>Jason and I even discussed shortly durign the review of the rbd driver 
>rewrite I posted
>earlier if it was ok to drop support for writing past the end of file.
>
>Anyway the reason why it is so slow is that write requests serialize if the
>qcow2 file grows. If there is a sane reason why we need qcow2 on rbd
>we need to implement at least preallocation mode = full to overcome
>the serialization.

Agree, at most we could deprecate it by printing a message and then 
remove the support in future releases.

Thanks,
Stefano


