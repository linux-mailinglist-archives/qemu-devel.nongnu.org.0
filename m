Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DC26A0354
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 08:36:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV68f-0004AA-1r; Thu, 23 Feb 2023 02:35:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yezhiyong@bytedance.com>)
 id 1pV68V-00048H-A3
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 02:35:27 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yezhiyong@bytedance.com>)
 id 1pV68S-0003Vj-Me
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 02:35:27 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 k21-20020a17090aaa1500b002376652e160so620943pjq.0
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 23:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B6xtKmdESYgNFz3bWpMLwm4JS7exfxiWGZJa7AcnoYg=;
 b=lWWiXnzBbb67cb1cmLC3rck33Jp89T0nZfYS2tWg90iQd2uGjM/NNfMZESjL+C7wGg
 o7S8V+YPaA5cC8ctZW5Lb3/oQsgVKn/O3N0bmwYb3OYdjv4FEeEaTC8dffuWXEeI3FpI
 KeMzOO77Hb8BjTICQOzwIlfXZo9Y58vuQiYBLchQcuSD+xMytENSHWfLYLRmArMgR27e
 Blgx9ytkNFZHEaaxIsGfvo2brbnQvqiSQDhXlR2VTqi62r41G8At2GWp2ZIS/+5Gidnm
 XZuIHLkTnkN4BRFIgRXnSo1Hy67/Je7/evhzxdtLNYY9hn9A/F6wsGPpPEKK7Jy3kgHI
 NPGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=B6xtKmdESYgNFz3bWpMLwm4JS7exfxiWGZJa7AcnoYg=;
 b=4q35pzjJ2Kyp22HrXf2nuxtm5xHvTZBZ1nM5pdjpZVO8ZP5vKeShTzvLRYbLoH89zq
 s/E+4LD2UJTqYuC3ARw+xC3quJtjEmYWj7Bdmvwg1Qgf+8h1kuhgNNWiu67PSo0avfq4
 6/qo7T2qNgOf04B8jJCwz6mVNNFxy2YoVtNTRbBxVJgbPee8iZMh3i6F6KQFP/iyI4ox
 /kuqyoz628LEzsFhhYr1jQuJGZL/weKuXUx15sbEQA9Ygh29TdJJqChrrBrpYaq5YfLY
 KcUkAocIFe3FnKVC25r1VhIrp6jVEZy0ikM/Fwe8y74XuIlT9wzk4ROfy50ZaitX6M0y
 rIrg==
X-Gm-Message-State: AO0yUKVGcQ26ZCJrnMmUB4NlG4y1OHxMRM+hyAv4qgnnWf8BV+Kubh4V
 +85M4C/cGUHBK5ABUIrVVMEuOA==
X-Google-Smtp-Source: AK7set+S77lWad8ckuMzggiUlQihO9b/5+Q03wOv5Nece8UaAWHAfXIQBCrVJmc6qP1ctjdNCSsZVg==
X-Received: by 2002:a17:902:e80f:b0:19a:972a:7cb3 with SMTP id
 u15-20020a170902e80f00b0019a972a7cb3mr14356514plg.60.1677137716777; 
 Wed, 22 Feb 2023 23:35:16 -0800 (PST)
Received: from [10.4.116.91] ([139.177.225.228])
 by smtp.gmail.com with ESMTPSA id
 jf19-20020a170903269300b0019b0937003esm3414629plb.150.2023.02.22.23.35.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 23:35:16 -0800 (PST)
Message-ID: <2a5594e9-11b4-2ce8-c09c-3d75a0c87732@bytedance.com>
Date: Thu, 23 Feb 2023 15:35:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: Questions about how block devices use snapshots
To: Kevin Wolf <kwolf@redhat.com>
Cc: mreitz@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <90855f8f-76ce-0a5f-3156-e69b157342c9@bytedance.com>
 <Y7wdTurqBjWXIGmo@redhat.com>
 <12bfc9a0-45e0-21f2-3d50-988ea2ad80c8@bytedance.com>
 <Y/TqNIz9EEXaop/Q@redhat.com>
From: Zhiyong Ye <yezhiyong@bytedance.com>
In-Reply-To: <Y/TqNIz9EEXaop/Q@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=yezhiyong@bytedance.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.102, RCVD_IN_DNSWL_NONE=-0.0001,
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

Hi Kevin,

Thank you for your reply and this method works.

May I ask if this 'image-end-offset' field can be shown in the qemu-img 
info too? Because it is also a very useful information whether qcow2 is 
placed on a file or a block device.

Regards

Zhiyong

On 2/21/23 11:58 PM, Kevin Wolf wrote:
> Am 21.02.2023 um 14:27 hat Zhiyong Ye geschrieben:
>>
>> Hi Kevin,
>>
>> Sorry to bother you again.
>>
>> I intend to use this approach for snapshots of block devices, which, as you
>> say, requires a lot of disk space to store snapshot data. So, to save disk
>> space, after each successful external snapshot creation, I want to shrink
>> the block device that stores the backing_file image to the size that qcow2
>> data actually occupies, since it has become read-only. But there is no way
>> to get the actual size of qcow2 when it is stored in a block device.
>>
>> Qemu-img info can easily get the actual size of qcow2 when it is stored in a
>> file using the fstat function, but this will fail and return 0 for block
>> devices. Therefore, it is necessary to implement the method of getting data
>> occupancy inside qcow2. I think there may be two possible ways to do this:
>>
>> - Add a cluster count field @nb_clusters in the BDRVQcow2State for each new
>> cluster allocated and the actual size occupied by qcow2 is: nb_clusters *
>> cluster_size.
>> - Iterate through the refcount block to find the value with the largest host
>> offset, and this is the actual size occupied by qcow2.
>>
>> Since I'm not very familiar with qcow2, may I ask if you have any advice on
>> getting the actual size when using qcow2?
> 
> I think what you need is the 'image-end-offset' field from 'qemu-img
> check --output=json'.
> 
> Kevin
> 

