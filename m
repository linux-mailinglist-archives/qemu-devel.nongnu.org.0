Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 013056551FE
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 16:23:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8jrj-0001rl-QQ; Fri, 23 Dec 2022 10:21:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p8jrh-0001qy-Gb
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 10:21:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p8jrf-0007mi-8T
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 10:21:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671808897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uxYVqzoezuiITEaFgb6cEjtkI9moXuBHzDPqGSBPIiE=;
 b=BXg9i4oKC/GLCJiz04OAOdt9NPhkmm2AWAn8KM1CoFEFsUjAHTUkhlNDqX9UN/OojoMR7U
 r2xOzqSHyd0FCIhSabpGkftfD5yrD6vmvb/RIi0ceo32Bvt00UDTA2Ay44XAhNja3ygCm9
 ITqCoeF3aW7Nij3Qlwn7AttrCQw75wQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-611-k9Pp0t1wMZKFOldXsIYQQw-1; Fri, 23 Dec 2022 10:21:36 -0500
X-MC-Unique: k9Pp0t1wMZKFOldXsIYQQw-1
Received: by mail-ej1-f72.google.com with SMTP id
 xc12-20020a170907074c00b007416699ea14so3603059ejb.19
 for <qemu-devel@nongnu.org>; Fri, 23 Dec 2022 07:21:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uxYVqzoezuiITEaFgb6cEjtkI9moXuBHzDPqGSBPIiE=;
 b=6m0KhiHyGP+gAuh3QKnhRZzxpXCz0H/xLPMHMP70qmMqD/YS7y6846oWUT9CCNYadC
 BXhzyi1qP7OGN+E4HCd9wd6b8AzdjuBpLREBlJgkI4kR/uIwUIk4OsNghiF5CZaJZQHn
 DmY0ctvMgjPYgqEf0ATBo5svjyh/3MB5BZW2XVg+a4QNJaDUMgFhRJjZUAqLqatsIOIr
 sHXedQh3+WDTPBrzNZXGw0vMjjNuR6VQoZNi2JMPX6UGzc32S/lRP8En+DHuWBJrl8YS
 A9xFz1JP9VyU3tzzLapuVSpz16r6cIOs322siyK2Lc6YgDOr/SeH0wWU7UsRtteBXu51
 TcVA==
X-Gm-Message-State: AFqh2kqH7sxiiHtT1mk6AWlM2AnSzVjeaGLAskGPkm9mrwubttndJXoI
 pxlDXw7AbneGWyBm/X6b0/00CING/+YE7ws8TxXHPURN3ykofIrGVMlDahj85ub/8fsIEvlKfp/
 frfhXWZJ0zgg761g=
X-Received: by 2002:a17:907:c202:b0:7c1:19e3:9f21 with SMTP id
 ti2-20020a170907c20200b007c119e39f21mr7861001ejc.7.1671808895418; 
 Fri, 23 Dec 2022 07:21:35 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuBghYMVc3PulbrxlaLyGJj6ZkmiTR9yzJwSAoomJFj49BJAbC2vCu+ma/9yDhTPmeeT7cgvg==
X-Received: by 2002:a17:907:c202:b0:7c1:19e3:9f21 with SMTP id
 ti2-20020a170907c20200b007c119e39f21mr7860990ejc.7.1671808895163; 
 Fri, 23 Dec 2022 07:21:35 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 fy10-20020a1709069f0a00b007bd7178d311sm1522562ejc.51.2022.12.23.07.21.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Dec 2022 07:21:34 -0800 (PST)
Message-ID: <c901ed54-7861-f2fa-9221-d6253ba471e1@redhat.com>
Date: Fri, 23 Dec 2022 16:21:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v4 00/12] Compiler warning fixes for libvhost-user,libvduse
To: Marcel Holtmann <marcel@holtmann.org>, qemu-devel@nongnu.org,
 mst@redhat.com, xieyongji@bytedance.com
References: <cover.1671741278.git.marcel@holtmann.org>
Content-Language: en-US
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <cover.1671741278.git.marcel@holtmann.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/22/22 21:36, Marcel Holtmann wrote:
> The libvhost-user and libvduse libraries are also useful for external
> usage outside of QEMU and thus it would be nice if their files could
> be just copied and used. However due to different compiler settings, a
> lot of manual fixups are needed. This is the first attempt at some
> obvious fixes that can be done without any harm to the code and its
> readability.
> 
> Marcel Holtmann (12):
>    libvhost-user: Provide _GNU_SOURCE when compiling outside of QEMU
>    libvhost-user: Replace typeof with __typeof__
>    libvhost-user: Cast rc variable to avoid compiler warning
>    libvhost-user: Use unsigned int i for some for-loop iterations
>    libvhost-user: Declare uffdio_register early to make it C90 compliant
>    libvhost-user: Change dev->postcopy_ufd assignment to make it C90 compliant
>    libvduse: Provide _GNU_SOURCE when compiling outside of QEMU
>    libvduse: Switch to unsigned int for inuse field in struct VduseVirtq
>    libvduse: Fix assignment in vring_set_avail_event
>    libvhost-user: Fix assignment in vring_set_avail_event
>    libvhost-user: Add extra compiler warnings
>    libvduse: Add extra compiler warnings
> 
>   subprojects/libvduse/libvduse.c           |  9 ++++--
>   subprojects/libvduse/meson.build          |  8 ++++-
>   subprojects/libvhost-user/libvhost-user.c | 36 +++++++++++++----------
>   subprojects/libvhost-user/meson.build     |  8 ++++-
>   4 files changed, 42 insertions(+), 19 deletions(-)
> 

Looks good, but what happened to "libvhost-user: Switch to unsigned int 
for inuse field in struct VuVirtq"?

(I can pick it up from v3, no need to respin).

Paolo


