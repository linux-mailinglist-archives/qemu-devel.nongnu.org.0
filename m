Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E25B6698E31
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 08:59:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSZAG-0001Di-Sm; Thu, 16 Feb 2023 02:58:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pSZAF-0001Da-4v
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 02:58:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pSZAD-0002Dr-IL
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 02:58:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676534320;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eQOjVsFCow0A7sQ5eVwn9Fx+XiRjrGdejeIN4EGNxn4=;
 b=QBS+xySdMsnlDrUQpg5bLU/GUdoCnPAm+hlvFjmoYuS+qaLmZarKsmj/1PQQC1O2KBXbyB
 gbbNYl9XP0oLKlhD0SIWUb+rmSQ0xsMoYugWp/eEoV/6/rJzck+XHXVnm47HHdlsQXzx5c
 HpN+CK9k3DLGp/P/vWDnzBji//AbJKo=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-510-MhB8h9TTPjKfg13ogABcTA-1; Thu, 16 Feb 2023 02:58:33 -0500
X-MC-Unique: MhB8h9TTPjKfg13ogABcTA-1
Received: by mail-qt1-f197.google.com with SMTP id
 c16-20020ac85190000000b003b841d1118aso791384qtn.17
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 23:58:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eQOjVsFCow0A7sQ5eVwn9Fx+XiRjrGdejeIN4EGNxn4=;
 b=1mbSkCRtP0gGj/Ip8djcKk2BJaoYc7uLWgDvqev7VdSOffWxEsisJXwwsN7qtmfqaJ
 T7+5bH1fSSBT71cvVKHiAZYuxKAlX/jND5tlG3R87eY4CDquyxyx91QaB5vzb40yn42Y
 S7HHiEN9l23Blo7/71uEYPF1z4bxe1lqEJxb//moWEcaWo6TEv2/iEjPBdDG3bqspZtx
 R4A6BwbY8ZrUoyGCM7Ayu7zA402I3TdV1E17d1w1z/TlNurXamJ1ij5UOxLAU9bLrH/+
 16zsVjb3E1JdhIaw/fsx6G5ysRFEjjzRxlLqPvS0bcrDgDNduzOWsJywwqDPJJjlUjcm
 Jqvw==
X-Gm-Message-State: AO0yUKW3Mp3uQSbcDNntRD7C2fSiJuk6W1hu/qPVLHYj8YQ3JXGTRm0A
 mZMpITNTmn5LpVLPcKxYzM5tkk/w7iVWNyzqnZUuGPj0nUi042VDETjieX8QUShK8BcZa2BU6ST
 xOxKAM0PDHmBi4z8=
X-Received: by 2002:ac8:7d06:0:b0:3b8:6c10:f52 with SMTP id
 g6-20020ac87d06000000b003b86c100f52mr9108818qtb.46.1676534312522; 
 Wed, 15 Feb 2023 23:58:32 -0800 (PST)
X-Google-Smtp-Source: AK7set8cSqYROssY81qYk1tIYDpeDpcutDsT3ukmfNWC6FjE0fX7JbR/tBo3b/veb7UgJW0FBStazQ==
X-Received: by 2002:ac8:7d06:0:b0:3b8:6c10:f52 with SMTP id
 g6-20020ac87d06000000b003b86c100f52mr9108798qtb.46.1676534312229; 
 Wed, 15 Feb 2023 23:58:32 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 s64-20020a372c43000000b00719165e9e72sm689993qkh.91.2023.02.15.23.58.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 23:58:31 -0800 (PST)
Message-ID: <240d4842-5f71-bf51-6a7c-845c70ce0abd@redhat.com>
Date: Thu, 16 Feb 2023 08:58:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [RFC v3 14/18] backends/iommufd: Introduce the iommufd object
Content-Language: en-US
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: eric.auger.pro@gmail.com, yi.l.liu@intel.com, yi.y.sun@intel.com,
 alex.williamson@redhat.com, clg@redhat.com, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au, thuth@redhat.com, farman@linux.ibm.com,
 mjrosato@linux.ibm.com, akrowiak@linux.ibm.com, pasic@linux.ibm.com,
 jjherne@linux.ibm.com, jasowang@redhat.com, kvm@vger.kernel.org,
 jgg@nvidia.com, kevin.tian@intel.com, chao.p.peng@intel.com,
 peterx@redhat.com, shameerali.kolothum.thodi@huawei.com,
 zhangfei.gao@linaro.org, berrange@redhat.com, apopple@nvidia.com,
 suravee.suthikulpanit@amd.com
References: <20230131205305.2726330-1-eric.auger@redhat.com>
 <20230131205305.2726330-15-eric.auger@redhat.com>
 <Y+1vNgoGJJw40+9C@Asurada-Nvidia>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <Y+1vNgoGJJw40+9C@Asurada-Nvidia>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.257, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Nicolin,

On 2/16/23 00:48, Nicolin Chen wrote:
> Hi Eric,
>
> On Tue, Jan 31, 2023 at 09:53:01PM +0100, Eric Auger wrote:
>
>> diff --git a/include/sysemu/iommufd.h b/include/sysemu/iommufd.h
>> new file mode 100644
>> index 0000000000..06a866d1bd
>> --- /dev/null
>> +++ b/include/sysemu/iommufd.h
>> @@ -0,0 +1,47 @@
>> +#ifndef SYSEMU_IOMMUFD_H
>> +#define SYSEMU_IOMMUFD_H
>> +
>> +#include "qom/object.h"
>> +#include "qemu/thread.h"
>> +#include "exec/hwaddr.h"
>> +#include "exec/ram_addr.h"
> After rebasing nesting patches on top of this, I see a build error:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [47/876] Compiling C object libcommon.fa.p/hw_arm_smmu-common.c.o
> FAILED: libcommon.fa.p/hw_arm_smmu-common.c.o=20
> cc -Ilibcommon.fa.p -I../src/3rdparty/qemu/dtc/libfdt -I/usr/include/pi=
xman-1 -I/usr/include/libmount -I/usr/include/blkid -I/usr/include/glib-2=
=2E0 -I/usr/lib/aarch64-linux-gnu/glib-2.0/include -I/usr/include/gio-uni=
x-2.0 -fdiagnostics-color=3Dauto -Wall -Winvalid-pch -std=3Dgnu11 -O2 -g =
-isystem /src/3rdparty/qemu/linux-headers -isystem linux-headers -iquote =
=2E -iquote /src/3rdparty/qemu -iquote /src/3rdparty/qemu/include -iquote=
 /src/3rdparty/qemu/tcg/aarch64 -pthread -U_FORTIFY_SOURCE -D_FORTIFY_SOU=
RCE=3D2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -fno-s=
trict-aliasing -fno-common -fwrapv -Wundef -Wwrite-strings -Wmissing-prot=
otypes -Wstrict-prototypes -Wredundant-decls -Wold-style-declaration -Wol=
d-style-definition -Wtype-limits -Wformat-security -Wformat-y2k -Winit-se=
lf -Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels -Wex=
pansion-to-defined -Wimplicit-fallthrough=3D2 -Wmissing-format-attribute =
-Wno-missing-include-dirs -Wno-shift-negative-value -Wno-psabi -fstack-pr=
otector-strong -fPIE -MD -MQ libcommon.fa.p/hw_arm_smmu-common.c.o -MF li=
bcommon.fa.p/hw_arm_smmu-common.c.o.d -o libcommon.fa.p/hw_arm_smmu-commo=
n.c.o -c ../src/3rdparty/qemu/hw/arm/smmu-common.c
> In file included from /src/3rdparty/qemu/include/sysemu/iommufd.h:7,
>                  from ../src/3rdparty/qemu/hw/arm/smmu-common.c:29:
> /src/3rdparty/qemu/include/exec/ram_addr.h:23:10: fatal error: cpu.h: N=
o such file or directory
>    23 | #include "cpu.h"
>       |          ^~~~~~~
> compilation terminated.
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> I guess it's resulted from the module inter-dependency. Though our
> nesting patches aren't finalized yet, the possibility of including
> iommufd.h is still there. Meanwhile, the ram_addr.h here is added
> for "ram_addr_t" type, I think. So, could we include "cpu-common.h"
> instead, where the "ram_addr_t" type is actually defined?

Sure. We will fix that on the next iteration

Eric

>
> The build error is gone after this replacement:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> diff --git a/include/sysemu/iommufd.h b/include/sysemu/iommufd.h
> index 45540de63986..86d370c221b3 100644
> --- a/include/sysemu/iommufd.h
> +++ b/include/sysemu/iommufd.h
> @@ -4,7 +4,7 @@
>  #include "qom/object.h"
>  #include "qemu/thread.h"
>  #include "exec/hwaddr.h"
> -#include "exec/ram_addr.h"
> +#include "exec/cpu-common.h"
>  #include <linux/iommufd.h>
> =20
>  #define TYPE_IOMMUFD_BACKEND "iommufd"
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> Thanks
> Nic
>


