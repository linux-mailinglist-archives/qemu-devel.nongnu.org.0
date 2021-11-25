Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B893745DA91
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 13:59:22 +0100 (CET)
Received: from localhost ([::1]:46676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqELR-0003NC-IK
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 07:59:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mqEEs-0005FU-1N
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 07:52:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mqEEm-0006Zz-Iy
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 07:52:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637844747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HbN6KNJjjDQi4dr6ygOBH2/aOtWaq+DvZluMsUKVt0Y=;
 b=iJJQ9sYoKu64UmYWRIMRlo/Eizn2ok4vUs4KlzFEQyYpZtwFe6XF/x/eHk6wkqA454y+R4
 O0Qq6ll7xn3NlPrKiw6R+6yDj5t9MbExO2PDvE8DBZYwLqRB523TyJGb0ne08zvQFV4brk
 jEqZEYIPfUc2nJC/Azl0Zm7P+azJ4/o=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-250-r0ae-or9M8aOx4ZSbSl73Q-1; Thu, 25 Nov 2021 07:52:26 -0500
X-MC-Unique: r0ae-or9M8aOx4ZSbSl73Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 n16-20020a05600c3b9000b003331973fdbbso3494572wms.0
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 04:52:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HbN6KNJjjDQi4dr6ygOBH2/aOtWaq+DvZluMsUKVt0Y=;
 b=GsQXtW+DlAMamUtFMzkHWy7xojNKE/5msX7zM/uFXpJ5E5nwK1bmrEX/YkZdbIk0GK
 u8y+sTRY0KKQZETFiwzueb0ZW7H4sUa3/1rS6N6c2YP+WVyfS5GKegsiy1VPPvOOBlrL
 /vaWJOgg+wtlmJ9LRKIKOF+kKKzf2wMYn6i928ePhY5k47DpUmnXDN8CuatAgZfKK9zB
 JezcTRCTcn41h7kkRylpQbVCmL/Fnb5b9E/Imq02Oovampv6wkYi8ugyW3MhSHfPPVaI
 Gge6wvBhwb8NO5CArg95+sEjxfFx1kF+DlUV4zaREWpE9iUwkuDT95v2Csm58PeM86Uk
 VciA==
X-Gm-Message-State: AOAM530XIRwjLNtDs231Ir8/jn5udczhzMLpTVSBImvMFTpVe15LahRj
 dTSsGgq3fMDZi4elExRPqTk68u9ZnDlNkpaM01LfTGQ2mj9f1jENFeapBm26Yk77X3SXGFYUWxd
 Hd0DDSwlTczOTX+A=
X-Received: by 2002:adf:f6cf:: with SMTP id y15mr6176090wrp.56.1637844744934; 
 Thu, 25 Nov 2021 04:52:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz9KBrgBb423YJa1xsmcAln5uG262SreNiDvb6Y6fJ/G071fm3hPeKhNwpaJOhODY5znSjkFQ==
X-Received: by 2002:adf:f6cf:: with SMTP id y15mr6176039wrp.56.1637844744620; 
 Thu, 25 Nov 2021 04:52:24 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id c1sm2720608wrt.14.2021.11.25.04.52.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Nov 2021 04:52:24 -0800 (PST)
Message-ID: <219ed595-606d-7e2c-ae20-7ae6330512aa@redhat.com>
Date: Thu, 25 Nov 2021 13:52:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Questions about losing the write lock of raw-format disks after
 migration
To: Peng Liang <liangpeng10@huawei.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <faa74343-998c-f054-fb9c-1ea42b7f82a4@huawei.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <faa74343-998c-f054-fb9c-1ea42b7f82a4@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 yebiaoxiang 00470486 <yebiaoxiang@huawei.com>,
 "Fangyi \(Eric\)" <eric.fangyi@huawei.com>,
 xiexiangyou 00584000 <xiexiangyou@huawei.com>,
 zhengchuan <zhengchuan@huawei.com>, wanghao232@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.11.21 13:56, Peng Liang via wrote:
> Hi folks,
>
> When we test migration with raw-format disk, we found that the QEMU
> process in the dst will lose the write lock after migration.  However,
> the QEMU process in the dst will still hold the write lock for
> qcow2-format disk.
>
> After reading some block layer's code, I found that the first
> blk_set_perm in blk_root_activate will set blk->shared_perm to
> BLK_PERM_ALL (disable all shared permissions?).  Then in
> blk_vm_state_changed, blk_set_perm will set shared_perm to
> blk->shared_perm, which is BLK_PERM_ALL.  And it makes
> raw_handle_perm_lock not to get the write lock.
>
> So I try the following patch and it will fix the problem:
> diff --git a/block/block-backend.c b/block/block-backend.c
> index 12ef80ea17..96518fd1f0 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -197,13 +197,6 @@ static void blk_root_activate(BdrvChild *child,
> Error **errp)
>
>       blk->disable_perm = false;
>
> -    blk_set_perm(blk, blk->perm, BLK_PERM_ALL, &local_err);
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> -        blk->disable_perm = true;
> -        return;
> -    }
> -
>       if (runstate_check(RUN_STATE_INMIGRATE)) {
>           /* Activation can happen when migration process is still
> active, for
>            * example when nbd_server_add is called during non-shared storage
>
> I'm new to the block layer and I'm not sure that it's a right fix to the
> problem.  Any idea about the problem and the patch?

Hi Peng,

Thanks for your report!  I can reproduce this problem.

It appears to me the problem is that blk_set_perm(), well, sets 
blk->perm and blk->shared_perm.  So by once calling it with 
BLK_PERM_ALL, we override blk->shared_perm to from then on be 
BLK_PERM_ALL, even though the guest device has not set that at all. We 
later call blk_set_perm(blk->blk_perm, blk->shared_perm) (in 
blk_vm_state_changed()), however, blk->shared_perm is now BLK_PERM_ALL, 
so this is a no-op.  That means that any restrictions the guest device 
has imposed (like the default share-rw=off) is not reflected in the 
block device’s permissions.

This is not apparent with qcow2, because the qcow2 format imposes its 
own restrictions in addition to the guest device.

I think the right way to fix this is to save blk->shared_perm somewhere 
and then restore it after the blk_set_perm(BLK_PERM_ALL) call.  I’ll 
send a patch (with a test case).

Hanna


