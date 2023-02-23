Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CB56A0189
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 04:30:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV2Hy-0007Qk-Ul; Wed, 22 Feb 2023 22:28:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pV2Hx-0007Qc-3t
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 22:28:57 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pV2Hu-0002YD-M6
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 22:28:56 -0500
Received: by mail-pl1-x632.google.com with SMTP id i3so861039plg.6
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 19:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h2FODbcUSTLgJ/xny2/bFdnHmyn6tgpcEtMqMZ80KmI=;
 b=GtbAtyosKC57Zc3wWAhU1Fh3GgApNWXMEtEEqcG9v0zHXWx3c1MD1VcFeWSZT/YlSJ
 XmRc8sqg8b6KSsST2sFzAzrY8j7VABVf5POC9xublCnrC8QvsXr010Mx6EiTfsZfAeqn
 PHEVeUlKclDnT/T8RdYRbHjKMAmVukOyuEnlqOWYVD1+mNapvo1VvIlkjIcIPKzFtoJF
 sEx0BKKNxbHc/rvHT7rM4o5q5iglkz6HpCC+xhUXHuWHN9Q5JHJzUO88bk1RH/EK7AvJ
 E5XwMMCdJTHCVTwGosY/f0PCtvv4iCZZNQ+KS3qoGZlyoJJiPExpV3obgVJsSRkyvtfq
 FagA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=h2FODbcUSTLgJ/xny2/bFdnHmyn6tgpcEtMqMZ80KmI=;
 b=TjNf78Kpq/cdsEH6jUF4z6wzKjVuZ2NRXmnMOgVZ6+BzQMuqdppilYotArpfWj+L88
 TY8kqVVPILMq6sBvRzntC4nGzDuhjMBX82+Htyop6zmjnBH2FCmwWhny0T8C6lZdtQak
 QSKtPEWfalahZHbC910Hh3BC8tGGQVqUdJc7bsAkL7Y2/yOBl89t+LXl1pRf0c/BmhDz
 rzUwNRlLDEaZ4dB9fesVbWM9NNCnJpjR2ZWYixGmwjVXbK2oGj67C4j2276CTNsW4IRW
 LgbQQjcrScuAZK1JgubxfudtwPR4mjfYxYU+sCwyZeHQAJI1h+b6VaAOFu12KnNwCWEV
 u2tw==
X-Gm-Message-State: AO0yUKVc1UUELaNcLTOfkYLlLmEpLTF1Jt42zGCBxSksj/h6hfp8tyZW
 UBXi1EW5UL2pnDrvnW0ulTFwwQ==
X-Google-Smtp-Source: AK7set82hNUHYNNIkKomaSFAFD8vO9HxSxnVW9FJhsSj6nOVoWagPEFsimi5dnkS5y5+j3Zq6CPuOQ==
X-Received: by 2002:a17:903:2289:b0:19a:ae30:3a42 with SMTP id
 b9-20020a170903228900b0019aae303a42mr10777786plh.21.1677122931666; 
 Wed, 22 Feb 2023 19:28:51 -0800 (PST)
Received: from [10.94.53.13] ([139.177.225.233])
 by smtp.gmail.com with ESMTPSA id
 a13-20020a170902ee8d00b0019ad6451a67sm1899111pld.24.2023.02.22.19.28.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 19:28:51 -0800 (PST)
Message-ID: <e748090b-3053-17f1-66f6-15d24b70170b@bytedance.com>
Date: Thu, 23 Feb 2023 11:28:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC v5 0/3] migration: reduce time of loading non-iterable
 vmstate
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com
References: <20230117115511.3215273-1-xuchuangxclwt@bytedance.com>
 <877cwizqvy.fsf@secure.mitica>
 <a555b989-27be-006e-0d00-9f1688c5be4e@bytedance.com>
 <abcb08b7-460c-d88c-af48-c1d256f89c54@bytedance.com> <Y++i1NmxUxOPDM/V@x1n>
 <76a253ef-6989-f92d-cb33-6456a270a8d1@bytedance.com>
 <51d862b2-96be-0b93-7ed2-fcd15ffaa76e@bytedance.com> <Y/UrXwRK7rB2KRKO@x1n>
 <44f02b6f-2809-5e2d-bbc4-e4a43a4a8b75@bytedance.com> <Y/Y7Txt3Utq5AfbZ@x1n>
From: Chuang Xu <xuchuangxclwt@bytedance.com>
In-Reply-To: <Y/Y7Txt3Utq5AfbZ@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, NICE_REPLY_A=-0.102, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Hi, Peter

On 2023/2/22 下午11:57, Peter Xu wrote:
> On Wed, Feb 22, 2023 at 02:27:55PM +0800, Chuang Xu wrote:
>> Hi, Peter
> Hi, Chuang,
>
>> Note that as I mentioned in the comment, we temporarily replace this value
>> to prevent commit() and address_space_to_flatview() call each other recursively,
>> and eventually stack overflow.
> Sorry to have overlooked that part.  IMHO here it's not about the depth,
> but rather that we don't even need any RCU protection when updating
> ioeventfds because we exclusively own the FlatView* too there.
>
> I wanted to describe what I had in mind but instead I figured a patch may
> be needed to be accurate (with some cleanups alongside), hence attached.
> IIUC it can work with what I suggested before without fiddling with depth.
> Please have a look.  The patch should apply cleanly to master branch so if
> it works it can be your 1st patch too.
>
> PS: Paolo - I know I asked this before, but it'll be good to have your
> review comment on anything above.
>
> Thanks,
>
Here are two problems I can see:

1. It is inappropriate to use assert(qemu_mutex_iothread_locked()
&& !memory_region_update_pending) in update_ioeventfds().

For example, when entering commit(), if memory_region_update_pending
is true, the assertion will be triggered immediately when update_ioeventfds
is called.

2. The problem of stack overflow has not been solved. There are
too many places where address_space_to_flatview() may be called.

Here are another coredump stack:

#8  0x000055a3a769ed85 in memory_region_transaction_commit_force () at ../softmmu/memory.c:1154
#9  0x000055a3a769fd75 in address_space_to_flatview (as=0x55a3a7ede180 <address_space_memory>) at /data00/migration/qemu-open/include/exec/memory.h:1118
#10 address_space_update_topology_pass (as=as@entry=0x55a3a7ede180 <address_space_memory>, old_view=old_view@entry=0x55a3a9d44990, new_view=new_view@entry=0x55a3d6837390,
     adding=adding@entry=false) at ../softmmu/memory.c:955
#11 0x000055a3a76a007c in address_space_set_flatview (as=as@entry=0x55a3a7ede180 <address_space_memory>) at ../softmmu/memory.c:1062
#12 0x000055a3a769e870 in address_space_update_flatview_all () at ../softmmu/memory.c:1107
#13 0x000055a3a769ed85 in memory_region_transaction_commit_force () at ../softmmu/memory.c:1154
#14 0x000055a3a769fd75 in address_space_to_flatview (as=0x55a3a7ede180 <address_space_memory>) at /data00/migration/qemu-open/include/exec/memory.h:1118
#15 address_space_update_topology_pass (as=as@entry=0x55a3a7ede180 <address_space_memory>, old_view=old_view@entry=0x55a3a9d44990, new_view=new_view@entry=0x55a3d67f8d90,
     adding=adding@entry=false) at ../softmmu/memory.c:955
#16 0x000055a3a76a007c in address_space_set_flatview (as=as@entry=0x55a3a7ede180 <address_space_memory>) at ../softmmu/memory.c:1062
#17 0x000055a3a769e870 in address_space_update_flatview_all () at ../softmmu/memory.c:1107
#18 0x000055a3a769ed85 in memory_region_transaction_commit_force () at ../softmmu/memory.c:1154
#19 0x000055a3a769fd75 in address_space_to_flatview (as=0x55a3a7ede180 <address_space_memory>) at /data00/migration/qemu-open/include/exec/memory.h:1118
#20 address_space_update_topology_pass (as=as@entry=0x55a3a7ede180 <address_space_memory>, old_view=old_view@entry=0x55a3a9d44990, new_view=new_view@entry=0x55a3d67ba790,
     adding=adding@entry=false) at ../softmmu/memory.c:955
#21 0x000055a3a76a007c in address_space_set_flatview (as=as@entry=0x55a3a7ede180 <address_space_memory>) at ../softmmu/memory.c:1062
#22 0x000055a3a769e870 in address_space_update_flatview_all () at ../softmmu/memory.c:1107
#23 0x000055a3a769ed85 in memory_region_transaction_commit_force () at ../softmmu/memory.c:1154

And this may not be the only case where stack overflow occurs.
Thus, changing the depth value is the safest way I think.

Thanks!


