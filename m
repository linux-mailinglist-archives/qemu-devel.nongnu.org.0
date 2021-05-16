Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F03382119
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 23:11:14 +0200 (CEST)
Received: from localhost ([::1]:55510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liO2b-0005ie-DJ
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 17:11:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1liO13-0004ee-W6
 for qemu-devel@nongnu.org; Sun, 16 May 2021 17:09:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1liO12-0004kl-Ji
 for qemu-devel@nongnu.org; Sun, 16 May 2021 17:09:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621199375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D/lgjT+t8WgZDZbhXeX6fmtmRxLi0TCC1JnDlQ4pBT8=;
 b=hSWM/o48DmJbqb9oVHAWd0iw6WFZG3caEvZXMYDk076mMCHC0pNpQfUFrN0WjwvysjvURl
 lKfI3gjbGt2zYbvkMN5qIC5xI+qTZU0DEDutJhYFFkscs2hiMTOWDuvU9pPKtPgI6jBjy7
 VmBf+jhixM+7mqmFQkbxfdaPFU0guOQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-qjqVGXtMNya-BXhHAx7DyQ-1; Sun, 16 May 2021 17:09:33 -0400
X-MC-Unique: qjqVGXtMNya-BXhHAx7DyQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 s7-20020adfc5470000b0290106eef17cbdso2826742wrf.11
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 14:09:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D/lgjT+t8WgZDZbhXeX6fmtmRxLi0TCC1JnDlQ4pBT8=;
 b=e5EDqDqcrffsnEqjDClzJQH6xg8ZFrY/I+vzh0FV2YM0na33YAn/o177Q0eyd7LI9J
 BoDUWAeGyPSOabumrZ7qoAVRma68gFQ0pshlN4DuhqDTCeXen4v4v6s8xRx8nTRje30v
 Ru3ivASo+Y4GD7Xjs8++Yr9XJvueMBZI5+fjdu4g+CXUfEPkSz2e5z2vRE55u8c0SWQv
 RmFV8Iv7RdHsC8tXvhL4NFuFDZFEniAFkzTVwszGfxagZxKYYvcohsP7QUJw9Zr1ujSj
 v33ggCKjS3mxoUXrsxZTbJbVO2YFfoiw61WfbduUKitIPW8qFbupZp1Oau2MjFWUyoXB
 7k0w==
X-Gm-Message-State: AOAM533NNGa28hJOCmKFh/wQEGkAxC5h7WPKvAQVOvQf8pzLpyOzx32h
 P7VtrfS0QvhrPQ05+NtJCJLEtfoy5nNWIF4IoNaoYv1WCFMA49W97zpaKHu0u6EEhO4w0M4LW17
 zS7XWK26H3xIwXenr9mluY5c3h1ZrqrL41uNhqepR+Q6rKVBTIB0shh3UVDaVzCJa
X-Received: by 2002:a05:600c:154e:: with SMTP id
 f14mr20341006wmg.36.1621199372341; 
 Sun, 16 May 2021 14:09:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhxh59AB7Cpln1tXxe3QzgWoZyB/kzcjVRn4RPc0Swyw/afETTINK53nrQWI/0R1uoBM1LJw==
X-Received: by 2002:a05:600c:154e:: with SMTP id
 f14mr20340987wmg.36.1621199372129; 
 Sun, 16 May 2021 14:09:32 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id t7sm8190784wrs.87.2021.05.16.14.09.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 May 2021 14:09:31 -0700 (PDT)
Subject: Re: [PULL 00/14] Block layer patches
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20210514163124.251741-1-kwolf@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ddb8621b-001d-48ca-d103-0c2bd7e65bb4@redhat.com>
Date: Sun, 16 May 2021 23:09:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514163124.251741-1-kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.296,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/14/21 6:31 PM, Kevin Wolf wrote:
> The following changes since commit 96662996eda78c48aadddd4e76d8615c7eb72d80:
> 
>   Merge remote-tracking branch 'remotes/dgilbert/tags/pull-migration-20210513a' into staging (2021-05-14 12:03:47 +0100)
> 
> are available in the Git repository at:
> 
>   git://repo.or.cz/qemu/kevin.git tags/for-upstream
> 
> for you to fetch changes up to b773c9fb68ceff9a9692409d7afbc5d6865983c6:
> 
>   vhost-user-blk: Check that num-queues is supported by backend (2021-05-14 18:04:27 +0200)
> 
> ----------------------------------------------------------------
> Block layer patches
> 
> - vhost-user-blk: Fix error handling during initialisation
> - Add test cases for the vhost-user-blk export
> - Fix leaked Transaction objects
> - qcow2: Expose dirty bit in 'qemu-img info'
> 
> ----------------------------------------------------------------
> Coiby Xu (1):
>       test: new qTest case to test the vhost-user-blk-server

Not sure if worth blocking the pull request, but this new test
breaks builds using --disable-tools (therefore breaks bisection).


