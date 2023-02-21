Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0C569E147
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 14:28:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUSgP-00016i-T7; Tue, 21 Feb 2023 08:27:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yezhiyong@bytedance.com>)
 id 1pUSgJ-00016C-P4
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 08:27:43 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yezhiyong@bytedance.com>)
 id 1pUSgF-00076w-5x
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 08:27:42 -0500
Received: by mail-pf1-x42a.google.com with SMTP id a7so2661077pfx.10
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 05:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QaUFeu7QsXQN49tnvAlfgEyQvw2pTaY/ldoZ4Z5F8q4=;
 b=ZSsnM2aBJGv4cAF58TseRBNA7U7tKFm/54MIMhuREg29mHBHi2zsQafw5No5zsdFwu
 gLpz2CIyJpyTvu6ZQiv67ZhmHlRQSWALMmPSXY5ZHJT//546zjH7zOhKlFoxcrIZlMg8
 Mvt1ZfXM4ADCNSKaosnHHkIGRFoa+6u7YIujwtMo66ctRTW4s/EhElLmYALiW/2NPpR2
 36evK6+Q6neIYm5o/vCnALl2XrZP4JAXhZ7xl6IJTRlbkALbqHoAUQa73K5cj1tBGDw0
 Ed3r2AZSvswEjvQcZHxr+jNOyfYBvBnLyfRul/6a3QqdDWCBHoLtF5kOEpENGaiTotjZ
 VsLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=QaUFeu7QsXQN49tnvAlfgEyQvw2pTaY/ldoZ4Z5F8q4=;
 b=Wqdyui6xlhUNc95KGEOWX58qZ5K5O0SESbYGpJDXDKY+4loGAvnKvUfgJFsMZMY93D
 okvbV8EFGhG2g91+oL1FswxyP/VXzZIk2hxWTJUutqapxagLLmnyexmrT3nsQiJ6IFYn
 s69C8ZOsEvxjs1EBOQdlHq+BGfM3EWnglMg+wzwbVQaWJrmfOWj8XMddUmi9BHVltqVK
 CI5Kw0fisPrJWKpx68amB0WLMUWBO6EnCTJxkt/Lki+SFgqv6MFZ9ZHcg0jb+R3Bzms9
 kxI7niPaEmIJR0nuZ7mlv3vCvU1BWhw4KGuw1TUu6QSy40CkBIiQ27IeCmQbe3JSLml2
 YTRw==
X-Gm-Message-State: AO0yUKUJ/uxwf1M/9DiB417W6NOeS9iqMF/C4+abqs4JZSnWHPyxTEqL
 J2EPWInfg8njP80Nc3ml7nK8oQ==
X-Google-Smtp-Source: AK7set9VhRKS0HNMgoJAJ7OAeW9Brwcc/TDucUXpts9E+KVFUjZ5Fgehx1BCqjGBJAwSKShM11dDMg==
X-Received: by 2002:aa7:8f37:0:b0:5a8:c0e0:3bb with SMTP id
 y23-20020aa78f37000000b005a8c0e003bbmr4904214pfr.16.1676986048906; 
 Tue, 21 Feb 2023 05:27:28 -0800 (PST)
Received: from [10.4.116.91] ([139.177.225.228])
 by smtp.gmail.com with ESMTPSA id
 x16-20020aa793b0000000b005a8de0f4c76sm4636504pff.17.2023.02.21.05.27.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 05:27:28 -0800 (PST)
Message-ID: <12bfc9a0-45e0-21f2-3d50-988ea2ad80c8@bytedance.com>
Date: Tue, 21 Feb 2023 21:27:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: Questions about how block devices use snapshots
To: Kevin Wolf <kwolf@redhat.com>
Cc: mreitz@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <90855f8f-76ce-0a5f-3156-e69b157342c9@bytedance.com>
 <Y7wdTurqBjWXIGmo@redhat.com>
From: Zhiyong Ye <yezhiyong@bytedance.com>
In-Reply-To: <Y7wdTurqBjWXIGmo@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=yezhiyong@bytedance.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Sorry to bother you again.

I intend to use this approach for snapshots of block devices, which, as 
you say, requires a lot of disk space to store snapshot data. So, to 
save disk space, after each successful external snapshot creation, I 
want to shrink the block device that stores the backing_file image to 
the size that qcow2 data actually occupies, since it has become 
read-only. But there is no way to get the actual size of qcow2 when it 
is stored in a block device.

Qemu-img info can easily get the actual size of qcow2 when it is stored 
in a file using the fstat function, but this will fail and return 0 for 
block devices. Therefore, it is necessary to implement the method of 
getting data occupancy inside qcow2. I think there may be two possible 
ways to do this:

- Add a cluster count field @nb_clusters in the BDRVQcow2State for each 
new cluster allocated and the actual size occupied by qcow2 is: 
nb_clusters * cluster_size.
- Iterate through the refcount block to find the value with the largest 
host offset, and this is the actual size occupied by qcow2.

Since I'm not very familiar with qcow2, may I ask if you have any advice 
on getting the actual size when using qcow2?

Regards

Zhiyong

On 1/9/23 9:57 PM, Kevin Wolf wrote:
> 
> So a second, still very simple, approach could be taking a second block
> device that is a little bit larger than the virtual disk (for the qcow2
> metadata) and use that as the external snapshot. Obviously, you require
> a lot of disk space this way, because each snapshots needs to be able to
> store the full image.
> 


