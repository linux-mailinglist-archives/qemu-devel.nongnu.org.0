Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BAA6690ED
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 09:31:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGFT1-0003bU-Fc; Fri, 13 Jan 2023 03:31:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yezhiyong@bytedance.com>)
 id 1pGFSw-0003VV-BV
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 03:31:13 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yezhiyong@bytedance.com>)
 id 1pGFSr-0002E3-Bh
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 03:31:10 -0500
Received: by mail-pl1-x62c.google.com with SMTP id jl4so22752877plb.8
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 00:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BSSz8f4U2TSwDsNQlQzzmflIEodaeH2A56f71bKAs34=;
 b=IdRxaQcKWutPbvdiVg9tV6mN6vO33uvmUjtCUlWGhbsNVrHp4E3nF6WtnmoAU7AuqJ
 V3YsMnrGANHY4KYrIe03ZZPpLKZ1CWeXb0im+c51fVou4d5JoRo/pAE3BP85bId898Fu
 69Wt+EKEpXLypfofuGDyH9G2pROGAW0cz8VJmGQammofuxv4R5aVqtIBSIr9mXcHoc9v
 DSCvcgT0n40fEhjPr/ZqPEPXlJghK5pLXqZmsKUWGcXHZyTl5qigoijNcF2tm23eHQH6
 QPLl+fnZUBQez0SWGlr5BOOX0b5ZYhAG3aQubDQleH4T8yEHITNAiCGG7j3c+cU4dqHs
 g2pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=BSSz8f4U2TSwDsNQlQzzmflIEodaeH2A56f71bKAs34=;
 b=5OIZAFlxALChsRQfC325gEfbG4FVRU9Cz1i/VxKaiMxGZlBZ5AuWdKXsJySrvmoQSx
 WI45JeGp1cM8kqm9CotRA0MrLhx2eSGB3CAMXe2wmY0JLNrjKbbUB2iszHy9y1VFscY7
 Mmq4GZsMimQ0Q7d+jjVUwDvWQdEKZZLpFcMT/uSRZEJ6yIzGZmCroq1NgnldnLnpy0GW
 r3JIc2CnN9wn2YnpEbpuYqrx5PrtVZ8nftXnjGi69PgPPuxWpIhIwzrw84vXxGBWJpmj
 Jit+IDW1TsLWNNTsQbR1plmgeQ6jnpr6VU+fcgIQ9NEArNYxcUHozMwoncDRgfAtlbI8
 Pf9A==
X-Gm-Message-State: AFqh2koArfYhKNUSqNwbnxX6qe+p9SFsmTPn4KaWXvjBgeVP1mh3EvH/
 FUGkm5afkmpy0jaNyTYixbus6w==
X-Google-Smtp-Source: AMrXdXvQdrGspgTsdYPHdrIOtDqQ3iMB+3xyPU5cofRzQ9O6slpKLdpD5tOU3pe3VlXK/hYpldG2cQ==
X-Received: by 2002:a05:6a21:e384:b0:af:9539:9fc9 with SMTP id
 cc4-20020a056a21e38400b000af95399fc9mr104381234pzc.47.1673598660599; 
 Fri, 13 Jan 2023 00:31:00 -0800 (PST)
Received: from [10.87.56.20] ([139.177.225.237])
 by smtp.gmail.com with ESMTPSA id
 s6-20020a63dc06000000b0043c732e1536sm11303548pgg.45.2023.01.13.00.30.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 00:31:00 -0800 (PST)
Message-ID: <ee8efb82-144f-b65f-5811-f74b999c4bf7@bytedance.com>
Date: Fri, 13 Jan 2023 16:30:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: Questions about how block devices use snapshots
To: Kevin Wolf <kwolf@redhat.com>
Cc: mreitz@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <90855f8f-76ce-0a5f-3156-e69b157342c9@bytedance.com>
 <Y7wdTurqBjWXIGmo@redhat.com>
 <e5433b9c-12c1-bfff-a3a5-878b47a86bab@bytedance.com>
 <Y77IajRLJOC6ohih@redhat.com>
 <26114701-2d32-136d-ca44-01048c61842d@bytedance.com>
 <Y7/zQYejj+PiT9GC@redhat.com>
From: Zhiyong Ye <yezhiyong@bytedance.com>
In-Reply-To: <Y7/zQYejj+PiT9GC@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=yezhiyong@bytedance.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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

Thank you for your patience and explanations. I learned a lot from our 
discussions and thank you again for your help.

Regards

Zhiyong

On 1/12/23 7:47 PM, Kevin Wolf wrote:
> Am 11.01.2023 um 17:21 hat Zhiyong Ye geschrieben:
>> Hi Kevin,
>>
>> Can I ask again how base.img + diff.qcow2 can be re-merged into one image
>> via qemu-img or hmp command when modified.img is discarded?
> 
> You can either use 'qemu-img commit' to copy all of the data from
> diff.qcow2 back into base.img (this is probably what you want), or
> 'qemu-img rebase' to copy all of the data from base.img into diff.qcow2.
> 
> Kevin
> 

