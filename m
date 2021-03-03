Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6619732B9F4
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 19:39:19 +0100 (CET)
Received: from localhost ([::1]:48880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHWP0-000407-Ek
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 13:39:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWN4-0002kS-On
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:37:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWN3-00053e-83
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:37:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614796636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RTSPxmhFtQEoaalhYZBAGdSBxMSx5X/iJhZ5W1nMsvk=;
 b=Txo1lozxxNXFbzaMpKVWfeoeoyOgVmNAW7K7VRIqQebOwcCAeDVqmjOeoSqYzFH88lqlns
 ZDSMLovUSSWD0xIXavSX8VmFmRWZHpwRB+i+jLv5FKt9OGy+PLH0sCjmQNsb73TGIp9zZV
 +XKGgfGh3uKmvIdS7fhMjS6KyPZsYxE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-5IQhk_QnO9Ki-N4vPq8Vwg-1; Wed, 03 Mar 2021 13:37:13 -0500
X-MC-Unique: 5IQhk_QnO9Ki-N4vPq8Vwg-1
Received: by mail-wm1-f70.google.com with SMTP id c7so1691161wml.8
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 10:37:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RTSPxmhFtQEoaalhYZBAGdSBxMSx5X/iJhZ5W1nMsvk=;
 b=oa4rJ+nPmWcXdZkcrmqGrCoTL5MTEI27ibPfPkaq19Ui16hhsTdH6bKodPGRzHK9TA
 BKzdwxdeKYoGAFC6jKu4a0FErUvTqxsJPeSkRMBPPgK+Jcate7jlJ2S3cS4bEpc010Rj
 2Wrsojpq5O1yoWMk7jZXQMcRA2plt8KrMfiq8dSMjcrMkc1TWS5rG1aTLwU6iNwluttR
 ykG23vJxhWsFS18XorL704YPJf4eyt8zfGzfWmqvydcvubHpunFuMmx2k/pxpTxUcEdJ
 jM+iIYPHXUG1keNhxS49D3qcNOkPBI1FuIteo16Cx2XL1iD3q0XjT1cB49Jo2iE/NkYu
 z7KQ==
X-Gm-Message-State: AOAM5321RShQFW9meAN++DnZ5xrg0phq6UKR6TqzCVMXX35sofkoLXW/
 hGDm5n0numGt65yZwDgEj2HY9R2lpxEuEAxi4kdRnuw0YeZfE1NY6iwBS4G/2+fV3tcefTedw/+
 kMPVhSvtkecajfCU=
X-Received: by 2002:a1c:804e:: with SMTP id b75mr289095wmd.113.1614796632740; 
 Wed, 03 Mar 2021 10:37:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzuj8vt04Hsk5gOEGXUt4RmQwBOp07gxAmhTiUTv03/ZKOEd8ZI2pDCU4/BxBnozQiG+4ON0Q==
X-Received: by 2002:a1c:804e:: with SMTP id b75mr289072wmd.113.1614796632571; 
 Wed, 03 Mar 2021 10:37:12 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id a21sm8546595wmb.5.2021.03.03.10.37.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 10:37:12 -0800 (PST)
Subject: Re: [PATCH v3 4/7] hw/core: implement a guest-loader to support
 static hypervisor guests
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210303173642.3805-1-alex.bennee@linaro.org>
 <20210303173642.3805-5-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <224e4bad-6185-a457-ddb5-f04d5c16e2dc@redhat.com>
Date: Wed, 3 Mar 2021 19:37:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210303173642.3805-5-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
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
Cc: julien@xen.org, andre.przywara@arm.com, stefano.stabellini@linaro.org,
 xen-devel@lists.xenproject.org, stefano.stabellini@xilinx.com,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/21 6:36 PM, Alex Bennée wrote:
> Hypervisors, especially type-1 ones, need the firmware/bootcode to put
> their initial guest somewhere in memory and pass the information to it
> via platform data. The guest-loader is modelled after the generic
> loader for exactly this sort of purpose:
> 
>   $QEMU $ARGS  -kernel ~/xen.git/xen/xen \
>     -append "dom0_mem=1G,max:1G loglvl=all guest_loglvl=all" \
>     -device guest-loader,addr=0x42000000,kernel=Image,bootargs="root=/dev/sda2 ro console=hvc0 earlyprintk=xen" \
>     -device guest-loader,addr=0x47000000,initrd=rootfs.cpio
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20201105175153.30489-5-alex.bennee@linaro.org>
> Message-Id: <20210211171945.18313-5-alex.bennee@linaro.org>
> ---
>  hw/core/guest-loader.h |  34 ++++++++++
>  hw/core/guest-loader.c | 145 +++++++++++++++++++++++++++++++++++++++++
>  MAINTAINERS            |   5 ++
>  hw/core/meson.build    |   2 +
>  4 files changed, 186 insertions(+)
>  create mode 100644 hw/core/guest-loader.h
>  create mode 100644 hw/core/guest-loader.c

Missing documentation, otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


