Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B25415F29
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 15:05:55 +0200 (CEST)
Received: from localhost ([::1]:48502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTOQD-0003X5-Mv
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 09:05:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTONL-0002Ed-Cc; Thu, 23 Sep 2021 09:02:55 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:45818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTONJ-0007wP-Aq; Thu, 23 Sep 2021 09:02:54 -0400
Received: by mail-ed1-x52a.google.com with SMTP id c22so23064345edn.12;
 Thu, 23 Sep 2021 06:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MDo5ndD8ytHGcNMAjjO3nOoSiCAX02xtuAmnSNReKQc=;
 b=DvcEGY4GRsMqDjNi+Ha5S3P1Y0BNaRR/NkYMc3e2TrGprT96Bh6NCUaTCozG3PMGDX
 vwwwsobKUJwUgveWTXtolfOJGRM4kxBOdKjmxiXNFHHiwEPzbQkDfTjhlB904Y9iYB79
 jFmy3jBRvZw0QhHPssY7sqmzgt/6/YumM8CmMSkkjTmId3NHvZTVIH9g2AwYfl7JFjLq
 Rj8aA0w8Rb/PdXNdjVeIAau7z639iopzkVNQgkzLJ8fPUWRHsucz4K4h3BC81Ea/UFcE
 i/P48dfKprdGkRXlcMk5oZuS9gVfKMkkmAT8j36sj4oQ71UCxlLFs9RNoDONo3ueVgP0
 RZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MDo5ndD8ytHGcNMAjjO3nOoSiCAX02xtuAmnSNReKQc=;
 b=XkUbC2OH0lGmt6yxjzsWlureYneMI+qAU1w1gVv1eTBROAED+1puI8onJOaSMfOsfS
 nyIUeIbwd2OzSWe9h4Fl5IOfJ5IDzRzYRt5+evgtgJ5F2HCGdo5OBGCdYgPrdDtLwsKU
 +rqmyWgvd+vX1M7+lnZtqYUMhJviqimjUM2zf0lVLd1cCegemy0TiVJDWJx+VkCjOBba
 7xeJmnTHggr0LcnuLxroN6itiCVhP449IgzgJWhxN+w1ywDvJraEj+SAn5ljEJmicoft
 GdqQVpJCf+SQdRn3I7d/eGY5PN3xpsJY7yvnOkyidEbCYTiYUKeForp4Ty/IgzB0FsxQ
 U8yQ==
X-Gm-Message-State: AOAM5318aZFo4/jySA004HZhDcGhbvususdQLdWXlFzT30M8XRMBYFM2
 DKvteOteiWhFJ1DaepJYIuQ=
X-Google-Smtp-Source: ABdhPJwlj6q2ygfjxflSgNBi8GsdF8yX5ESJoygpEYDYHZil1I3QbbNQmugAg8wjZcmffj/VKp3MPA==
X-Received: by 2002:aa7:d785:: with SMTP id s5mr5371958edq.214.1632402170314; 
 Thu, 23 Sep 2021 06:02:50 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id f22sm2979884ejz.122.2021.09.23.06.02.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 06:02:49 -0700 (PDT)
Subject: Re: [PULL 18/28] file-posix: try BLKSECTGET on block devices too, do
 not round to power of 2
To: Halil Pasic <pasic@linux.ibm.com>
References: <20210625141822.1368639-1-pbonzini@redhat.com>
 <20210625141822.1368639-19-pbonzini@redhat.com>
 <20210906162420.5af35eb9.pasic@linux.ibm.com>
 <20210922215143.7f289016.pasic@linux.ibm.com>
 <ba39ff70-9f0a-1e90-a626-c001e6f7f741@redhat.com>
 <20210923141314.352fbf75.pasic@linux.ibm.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5a2903de-0117-373a-90b5-484e6f86b9f5@redhat.com>
Date: Thu, 23 Sep 2021 15:02:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210923141314.352fbf75.pasic@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, "open list:AIO" <linux-aio@kvack.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Benjamin LaHaise <bcrl@kvack.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jan Hoeppner <Jan.Hoeppner@de.ibm.com>, Stefan Haberland <sth@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/09/21 14:13, Halil Pasic wrote:
> On Thu, 23 Sep 2021 12:57:38 +0200
> Paolo Bonzini <pbonzini@redhat.com> wrote:
> 
>> On 22/09/21 21:51, Halil Pasic wrote:
>>> We have figured out what is going on here. The problem seems to be
>>> specific to linux aio, which seems to limit the size of the iovec to
>>> 1024 (UIO_MAXIOV).
>>
>> Hi Halil,
>>
>> I'll send a patch shortly to fix this issue.  Sorry about the delay as I
>> was busy with KVM Forum and all that. :(
> 
> Hi Paolo!
> 
> With some guidance I could cook up a patch myself. But if you prefer to
> do it yourself, I will be glad to test the fix (please put me on cc).
> Thanks!

NP, the patch already existed but I was busy and didn't send it out.

Paolo


