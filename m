Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BE46A07A7
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 12:48:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVA4o-0001WK-4v; Thu, 23 Feb 2023 06:47:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yezhiyong@bytedance.com>)
 id 1pVA4l-0001NK-Oy
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 06:47:51 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yezhiyong@bytedance.com>)
 id 1pVA4j-0000c4-5F
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 06:47:51 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 cp7-20020a17090afb8700b0023756229427so3699294pjb.1
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 03:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fbhByCHoHkXbBXvkduKPz5Tj3umxiCtxl72gWzW9RQY=;
 b=MBTqHYwDLPEZC5SCAdTTYuR1dX7mnGnYKQk3qpHTlDJNMd7uvMUU1X3XKszBh+Zf/r
 Uizk6QossuIbWehT2BHc24x74tqdJrvYqM+kDEYfI9ky6gYZhA0oFvNWilYcsK/UKinB
 LDsHuB44qYIdUBDIdB2OIu/3zLt83HhYfA6rXx5IPB6Z3l8Y6Rj4utn5tvBZCfnl5GCh
 ajPQ3VD1fybWIqGsUb4J66YzfpIU5xqq0lXl8aSjc7yJ9XRM8R6ov2B8+wo1oUHtxwFO
 qIGryWBo2AFaeslYw8ArucgWjTfqUh7MU7kPNy6fCj39asitmdx+TJN+psUnjdd+Usgf
 EOqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=fbhByCHoHkXbBXvkduKPz5Tj3umxiCtxl72gWzW9RQY=;
 b=lNYJdGSWxWimhxe/8bXLfqO906QiF/LjTL6zBhhTcBajm8nke/phuFD19L0jTRRhUk
 LxJ/kGvRHb5+x2u2ocS6205KSWRfs1Uh1pC9XROz5sZLWQ+rLZtfHnJrjt9+kjNcatXO
 6sS5R/sDwsrTPGP655BIWaltxKW0WFrZbDdMiNFrIOvIIDtqi+r2dgX+DrZ48m8NGxjU
 5LMKRZIIU6Swxe8z2X8sAUe6mZ4NmDlz5TYbGj1XCRp6FflioMdZYD8kmyJI8mtHOgfZ
 Dn46mO60K1X5xlAjBkZTAx9MqueiE6yLbKDmkCMimgy39WOpjkKKVNFo+SkBwCq69Bo4
 BoWA==
X-Gm-Message-State: AO0yUKVfl6a55q9JfAy2bSu4ivN4brTs1iVTqUeUsB5R3wunlu+yepmM
 zw3XAa+gqw8LPoiwpbVYjqBMJA==
X-Google-Smtp-Source: AK7set/O2n22s82cGVITEaT+2DfgSJLkC39YXs+OKYMS9SRfBnJtLtEkGwQmZh3CdCeokGNu7cW3TQ==
X-Received: by 2002:a17:90b:350f:b0:234:e5c2:b92c with SMTP id
 ls15-20020a17090b350f00b00234e5c2b92cmr13729411pjb.15.1677152867298; 
 Thu, 23 Feb 2023 03:47:47 -0800 (PST)
Received: from [10.4.116.91] ([139.177.225.228])
 by smtp.gmail.com with ESMTPSA id
 f20-20020a633814000000b00502e918fee3sm2738976pga.60.2023.02.23.03.47.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 03:47:47 -0800 (PST)
Message-ID: <b10cb43d-f5c3-be35-cb53-e1aca84836b3@bytedance.com>
Date: Thu, 23 Feb 2023 19:47:41 +0800
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
 <2a5594e9-11b4-2ce8-c09c-3d75a0c87732@bytedance.com>
 <Y/dQfG9380DPjQ6j@redhat.com>
From: Zhiyong Ye <yezhiyong@bytedance.com>
In-Reply-To: <Y/dQfG9380DPjQ6j@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=yezhiyong@bytedance.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.102,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Thank you for your patience and explanations.

Thanks again!

Zhiyong

On 2/23/23 7:39 PM, Kevin Wolf wrote:
> Am 23.02.2023 um 08:35 hat Zhiyong Ye geschrieben:
>> Hi Kevin,
>>
>> Thank you for your reply and this method works.
>>
>> May I ask if this 'image-end-offset' field can be shown in the qemu-img info
>> too? Because it is also a very useful information whether qcow2 is placed on
>> a file or a block device.
> 
> The only way to know the largest offset is by looking at all the
> metadata in qcow2. 'qemu-img info' is supposed to be very fast, so we
> don't do that there. 'qemu-img check' already looks at all metadata, so
> we have the number readily available there.
> 
> Kevin
> 
>> On 2/21/23 11:58 PM, Kevin Wolf wrote:
>>> Am 21.02.2023 um 14:27 hat Zhiyong Ye geschrieben:
>>>>
>>>> Hi Kevin,
>>>>
>>>> Sorry to bother you again.
>>>>
>>>> I intend to use this approach for snapshots of block devices, which, as you
>>>> say, requires a lot of disk space to store snapshot data. So, to save disk
>>>> space, after each successful external snapshot creation, I want to shrink
>>>> the block device that stores the backing_file image to the size that qcow2
>>>> data actually occupies, since it has become read-only. But there is no way
>>>> to get the actual size of qcow2 when it is stored in a block device.
>>>>
>>>> Qemu-img info can easily get the actual size of qcow2 when it is stored in a
>>>> file using the fstat function, but this will fail and return 0 for block
>>>> devices. Therefore, it is necessary to implement the method of getting data
>>>> occupancy inside qcow2. I think there may be two possible ways to do this:
>>>>
>>>> - Add a cluster count field @nb_clusters in the BDRVQcow2State for each new
>>>> cluster allocated and the actual size occupied by qcow2 is: nb_clusters *
>>>> cluster_size.
>>>> - Iterate through the refcount block to find the value with the largest host
>>>> offset, and this is the actual size occupied by qcow2.
>>>>
>>>> Since I'm not very familiar with qcow2, may I ask if you have any advice on
>>>> getting the actual size when using qcow2?
>>>
>>> I think what you need is the 'image-end-offset' field from 'qemu-img
>>> check --output=json'.
>>>
>>> Kevin
>>>
>>
> 

