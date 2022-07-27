Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0809C582797
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 15:24:32 +0200 (CEST)
Received: from localhost ([::1]:40176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGh1b-0001Jz-3g
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 09:24:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.dooks@sifive.com>)
 id 1oGgxt-0005Te-5I
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 09:20:41 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:36516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ben.dooks@sifive.com>)
 id 1oGgxq-0000lM-Sk
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 09:20:40 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 h189-20020a1c21c6000000b003a34ac64bdfso184727wmh.1
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 06:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=JD1sH0NGj0wk13AbYSgGRSj+YM0W5HkviGSowRW6rn0=;
 b=mSLZAZl6skbwtcdMxfRiDi6CX06jLcP+VNiF6/n2lN3bqtRRR5UJPShacJadpWNAQS
 tlbne8HFK1CB+TTVYJgsH54OyAy4chIVMVnjcDoBEu0yHw0igt5njKriZn/MHtn+Z5Ou
 d+gMxcvaJHKQmLPMSh2IbOCPSI7lZWT8+j1OMVjzpoOhxSHOhbk9hvnzyXjzSvoJbcnw
 IvwFLDtduhAPMpG9TqFlSD6YDLqL1y9VjDFYRq+cbCrQW2KDDDgO8o/oKXyxt5GIjoGE
 Qn1QS/Ljybcl2eS+mgjHSk+1bceoPgyheKa3EuRTMJ3b28k/gg7k8EmtqsxjBUB4OMv4
 +J3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JD1sH0NGj0wk13AbYSgGRSj+YM0W5HkviGSowRW6rn0=;
 b=nhZ8GldRTr68bcMu71obbJtku6/reTeuQhw+4C1/nohg5giaQy+IpFwkxD5WeLQ1+n
 Sn6Cy6j2yH0sxAij1eWy9O/UiNjxwOx1lAXWL+nFzlH2enar3F72axsegqZryQsmGITK
 IEINqMEtiUKlCKYDoLBCyQv4x572vLXwMYM7qKz/fPXwPqWrY4PtFWAXFkXKNjei6dzi
 N5AIRscvl1PPiqxJbFl9wE0HsADswHzh+1PrcefqKoWuYwlhFxCOEEcZWcsgTfeIh5Tl
 1mluFDhIJIuP7CsMmiejzPLph1vwNb2KcTahdQlJbR+8X4RBVokLqfmRa1nmZnbZWoQI
 ODqA==
X-Gm-Message-State: AJIora9WwIvCPzlc49xyBC0tShXqCNY8xX7QdvE9wOdovLgYkSJr064O
 y60GHstFsmomyfEfM7NnYkX/Hw==
X-Google-Smtp-Source: AGRyM1vYvvbmk81XrRS0bRbGKQYEvawrTNgTfs1BGQZ2KDlS8FfjWBqkSRpBmvXb2VPQKyIg2fi6iw==
X-Received: by 2002:a05:600c:154c:b0:3a3:4383:e13f with SMTP id
 f12-20020a05600c154c00b003a34383e13fmr2985779wmg.16.1658928036820; 
 Wed, 27 Jul 2022 06:20:36 -0700 (PDT)
Received: from [192.168.0.17]
 (cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net. [86.15.83.122])
 by smtp.gmail.com with ESMTPSA id
 bn1-20020a056000060100b0021e71894692sm12074938wrb.91.2022.07.27.06.20.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 06:20:36 -0700 (PDT)
Message-ID: <f4e36935-d6b6-54a7-3500-3b54f6ab551e@sifive.com>
Date: Wed, 27 Jul 2022 14:20:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: updates for designware pci-host
Content-Language: en-GB
To: Peter Maydell <peter.maydell@linaro.org>, Ben Dooks <qemu@ben.fluff.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Jude Onyenegecha <jude.onyenegecha@sifive.com>,
 Sudip Mukherjee <sudip.mukherjee@sifive.com>,
 William Salmon <william.salmon@sifive.com>,
 Adnan Chowdhury <adnan.chowdhury@sifive.com>
References: <20220713165449.37433-1-ben.dooks@sifive.com>
 <20220727111320.5b7qobwx5bbwh65d@hetzy.fluff.org>
 <CAFEAcA_aw002ZP6a=M5VyjVSs9Ln-Pv3ED0-eTtJj4bFM+KcJw@mail.gmail.com>
From: Ben Dooks <ben.dooks@sifive.com>
In-Reply-To: <CAFEAcA_aw002ZP6a=M5VyjVSs9Ln-Pv3ED0-eTtJj4bFM+KcJw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=ben.dooks@sifive.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/07/2022 13:56, Peter Maydell wrote:
> On Wed, 27 Jul 2022 at 12:15, Ben Dooks <qemu@ben.fluff.org> wrote:
>>
>> On Wed, Jul 13, 2022 at 05:54:42PM +0100, Ben Dooks wrote:
>>> As part of a project we have been looking at using the DesignWare
>>> PCIe host. We found a few issues of missing features or small bugs
>>> when using this with a recent Linux kernel (v5.17.x)
>>>
>>> Whilst doing this we also made a start on some tracing events.
>>
>> Hi, has anyone had a chance to review these. If so can this series
>> get applied? If not should anyone else be added to the review list?
>>
>> If it would be easier I can try and find a git tree to publish this
>> branch on if a pull request would be easier.
> 
> Is there a public spec for the hardware? There isn't anything
> listed in the source file in the tree. Without the h/w specs
> it's pretty difficult to review changes.

Some of this I did against the Linux driver from the v5.17 kernel
which didn't work until these fixes were added (not sure when the
Linux kernel got the ATU size autodetection in, etc).

I think everything described in this set was from Linux, but I
do have access to the Synopsys v5 PCIe core documentation so have
not gone to see if there is anything publicly available.

-- 
Ben


