Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CE1302319
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 10:06:40 +0100 (CET)
Received: from localhost ([::1]:59276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3xpX-00053A-QD
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 04:06:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l3xm9-0003Kg-1k
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 04:03:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l3xm6-0008Dy-RV
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 04:03:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611565384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LxJS4tX1dMA1dZlUcWqDPIVU6+xeIDKY8ardH1EbUQQ=;
 b=WlMHXMNAEUfjfhWslnkOt6O1HPjt9k11EnjDECGpzQB+xjTOrIkyt6GIlF4A/kCQkE5gmK
 2wAuJZsZMwWl9fMZtV5U61UXkEuqR3A6d+G89cv4iDdql+ypaE23HVAygdbTFjFGwfdeyr
 yl5s15OxS/nTpLGeEOtQJaCLtR9wOWM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-VYY6C8muNby_YhICAUeH6g-1; Mon, 25 Jan 2021 04:03:00 -0500
X-MC-Unique: VYY6C8muNby_YhICAUeH6g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4204080A5C0;
 Mon, 25 Jan 2021 09:02:59 +0000 (UTC)
Received: from [10.72.13.250] (ovpn-13-250.pek2.redhat.com [10.72.13.250])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A0CE10021B3;
 Mon, 25 Jan 2021 09:02:53 +0000 (UTC)
Subject: Re: [RFC PATCH v3 4/6] ebpf: Added eBPF RSS loader.
To: Yuri Benditovich <yuri.benditovich@daynix.com>
References: <20210114211612.387052-1-andrew@daynix.com>
 <20210114211612.387052-5-andrew@daynix.com>
 <909194f8-17f6-b8d6-d1b0-353866257ee2@redhat.com>
 <CAOEp5Odjd89aoCghFeZsuNv=G=2fJonFigm+3Whtj_zLuB2Jrg@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <e4577775-2ca1-ee99-9ee9-687b5840d8c3@redhat.com>
Date: Mon, 25 Jan 2021 17:02:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAOEp5Odjd89aoCghFeZsuNv=G=2fJonFigm+3Whtj_zLuB2Jrg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Yan Vugenfirer <yan@daynix.com>, Andrew Melnychenko <andrew@daynix.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/1/19 下午10:53, Yuri Benditovich wrote:
> On Fri, Jan 15, 2021 at 9:02 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>> On 2021/1/15 上午5:16, Andrew Melnychenko wrote:
>>> From: Andrew <andrew@daynix.com>
>>>
>>> Added function that loads RSS eBPF program.
>>> Added stub functions for RSS eBPF loader.
>>> Added meson and configuration options.
>>>
>>> By default, eBPF feature enabled if libbpf is present in the build system.
>>> libbpf checked in configuration shell script and meson script.
>>>
>>> Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
>>> Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
>>> ---
>>>    configure               |  33 ++++
>>>    ebpf/ebpf_rss-stub.c    |  40 ++++
>>>    ebpf/ebpf_rss.c         | 165 +++++++++++++++++
>>>    ebpf/ebpf_rss.h         |  44 +++++
>>>    ebpf/meson.build        |   1 +
>>>    ebpf/rss.bpf.skeleton.h | 397 ++++++++++++++++++++++++++++++++++++++++
>>>    ebpf/trace-events       |   4 +
>>>    ebpf/trace.h            |   2 +
>>>    meson.build             |  13 ++
>>>    9 files changed, 699 insertions(+)
>>>    create mode 100644 ebpf/ebpf_rss-stub.c
>>>    create mode 100644 ebpf/ebpf_rss.c
>>>    create mode 100644 ebpf/ebpf_rss.h
>>>    create mode 100644 ebpf/meson.build
>>>    create mode 100644 ebpf/rss.bpf.skeleton.h
>>>    create mode 100644 ebpf/trace-events
>>>    create mode 100644 ebpf/trace.h
>>>
>>> diff --git a/configure b/configure
>>> index 5860bdb77b..9d18e941f5 100755
>>> --- a/configure
>>> +++ b/configure
>>> @@ -342,6 +342,7 @@ vhost_vsock="$default_feature"
>>>    vhost_user="no"
>>>    vhost_user_blk_server="auto"
>>>    vhost_user_fs="$default_feature"
>>> +bpf=""
>>>    kvm="auto"
>>>    hax="auto"
>>>    hvf="auto"
>>> @@ -1236,6 +1237,10 @@ for opt do
>>>      ;;
>>>      --enable-membarrier) membarrier="yes"
>>>      ;;
>>> +  --disable-bpf) bpf="no"
>>> +  ;;
>>> +  --enable-bpf) bpf="yes"
>>> +  ;;
>>>      --disable-blobs) blobs="false"
>>>      ;;
>>>      --with-pkgversion=*) pkgversion="$optarg"
>>> @@ -1845,6 +1850,7 @@ disabled with --disable-FEATURE, default is enabled if available
>>>      vhost-user      vhost-user backend support
>>>      vhost-user-blk-server    vhost-user-blk server support
>>>      vhost-vdpa      vhost-vdpa kernel backend support
>>> +  bpf             BPF kernel support
>>>      spice           spice
>>>      rbd             rados block device (rbd)
>>>      libiscsi        iscsi support
>>> @@ -5057,6 +5063,30 @@ else
>>>        membarrier=no
>>>    fi
>>>
>>> +##########################################
>>> +# check for usable bpf system call
>>> +if test "$bpf" = ""; then
>>
>> This implies the bpf is enabled by default?
> Yes, assuming libbpf-devel present and bpf system call defined.
>
> Any problem with it?


It means the configure will fail if libbpf is not installed. Consider 
libbpf is not very common at current stage. I think it's better to make 
it auto or disabled by default.


>
>>
>>> +    have_bpf=no
>>> +    if test "$linux" = "yes" -a "$bigendian" != "yes"; then
>>> +        cat > $TMPC << EOF
>>> +    #include <stdlib.h>
>>> +    #include <bpf/libbpf.h>
>>> +    int main(void) {
>>> +        struct bpf_object *obj = NULL;
>>> +        bpf_object__load(obj);
>>> +        exit(0);
>>> +    }
>>> +EOF
>>> +        if compile_prog "" "-lbpf" ; then
>>> +            have_bpf=yes
>>> +            bpf=yes
>>> +        fi
>>> +    fi
>>> +    if test "$have_bpf" = "no"; then
>>> +      feature_not_found "bpf" "the libbpf is not available"
>>> +    fi
>>> +fi
>>> +
>>>    ##########################################
>>>    # check if rtnetlink.h exists and is useful
>>>    have_rtnetlink=no
>>> @@ -5905,6 +5935,9 @@ fi
>>>    if test "$membarrier" = "yes" ; then
>>>      echo "CONFIG_MEMBARRIER=y" >> $config_host_mak
>>>    fi
>>> +if test "$bpf" = "yes" -a "$bigendian" != "yes" -a "$linux" = "yes" ; then
>>> +  echo "CONFIG_EBPF=y" >> $config_host_mak
>>> +fi
>>>    if test "$signalfd" = "yes" ; then
>>>      echo "CONFIG_SIGNALFD=y" >> $config_host_mak
>>>    fi
>>> diff --git a/ebpf/ebpf_rss-stub.c b/ebpf/ebpf_rss-stub.c
>>> new file mode 100644
>>> index 0000000000..e71e229190
>>> --- /dev/null
>>> +++ b/ebpf/ebpf_rss-stub.c
>>> @@ -0,0 +1,40 @@
>>> +/*
>>> + * eBPF RSS stub file
>>> + *
>>> + * Developed by Daynix Computing LTD (http://www.daynix.com)
>>> + *
>>> + * Authors:
>>> + *  Yuri Benditovich <yuri.benditovich@daynix.com>
>>> + *
>>> + * This work is licensed under the terms of the GNU GPL, version 2.  See
>>> + * the COPYING file in the top-level directory.
>>> + */
>>> +
>>> +#include "qemu/osdep.h"
>>> +#include "ebpf/ebpf_rss.h"
>>
>> I wonder why not simply use #ifdef #else to exclude the rss functions.
> Just to make the reading easier.
>
>> If I read code correctly, this stub requires rss_is_loaded called before
>> ebpf_rss_set_all(), so actually ebpf_rss_is_loaded serve the same as
> Can you please get into details?
> I think the stub does not require it, it just converts all the
> ebpf_rss calls to nop at link time.
> If I miss something please let us know, we'll fix it in v4.


I mean the current can not be used without checking rss_is_loaded(). So 
rss_is_loaded() is somehow a guard like macro.

I personally prefer #ifdef but it's not a must.

Thanks


