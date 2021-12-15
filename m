Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 703E1475677
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 11:36:34 +0100 (CET)
Received: from localhost ([::1]:50780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxReB-0007ML-Ns
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 05:36:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxRZN-0001qo-3Y
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:31:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxRZL-00078I-Bq
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:31:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639564289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hMK13kZT/iOHtebkYDknWOrcLsLxaWCYYET8CgcF778=;
 b=WZ1bRjztdTHJ2sWjkFfzZ1RAehiBeslT+NI74JyZCVsGHSo7nR9JIk3OMmdh4E3v6Rbejh
 KmKVr5y4Mpky4fPn+5Ww10Vp/J90fhyqfMWujiv5wEbqMhbWFmS9NvJurXXJSIFRT2kw3j
 qzuup0gcrCSR47ITnjAfnqCeKu4GmEg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-195-pnh3fxfoPbydsjSq-fG5nQ-1; Wed, 15 Dec 2021 05:31:28 -0500
X-MC-Unique: pnh3fxfoPbydsjSq-fG5nQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 p3-20020a056000018300b00186b195d4ddso5769082wrx.15
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 02:31:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hMK13kZT/iOHtebkYDknWOrcLsLxaWCYYET8CgcF778=;
 b=uzYjddVdqgJfkcqlTAEtbfCmpnmSIhhyHCx8eajwechIToKG19/mjksu7229kJ6YTE
 /kXCr3ZBcYqGOVEJlYStGS6zQZecURoHZjJSRqEGNOk4L8qI/fXag9hDAx+OpAFvykhS
 EWHybdtPgxizYLi8pIqnu4renmwIXALZ0I4zMD3pXhDp8WfYlGGPNEP86pm/5riAFipX
 BKhRcrBccLIX8+2Cy6Yz7mZvBAl0PafX1IbaAmUE4YAxVL1Lk9b7yVWl3tGjNEw5XSbR
 4LuP9hWKzGkwMmxd0PcDBOFBSadJOdDe0mS02EqDw/s+Jf8k6SeXtN70pAgo4G5aZPh4
 xWqg==
X-Gm-Message-State: AOAM533Bl/i40uh3WtR//V6RqkX1RIxwQT4s9LEpU6430AFIVZISl3WI
 0fp9Un7Gjcnd1/9k/FLzSKtJcL6HVbczzEVB4CcEvxPIM22qBxSvdn0eMsidPdVxVvIfZ0Iy00P
 H1hlJbr5M9ovPUjJ6fIVC7erZByS/mb3NcnSgT1SGq94fDzb2huuc5koyobs+QTdP
X-Received: by 2002:adf:dd46:: with SMTP id u6mr3731144wrm.280.1639564287256; 
 Wed, 15 Dec 2021 02:31:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvGEoMe3XejFZnV/yWQaLuWTnlfrzvMYfV6X1zSHmFnqK86Up9eZ/nMmGBQcIY3qr7fCtl6Q==
X-Received: by 2002:adf:dd46:: with SMTP id u6mr3731118wrm.280.1639564287050; 
 Wed, 15 Dec 2021 02:31:27 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id d1sm1556650wrz.92.2021.12.15.02.31.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 02:31:26 -0800 (PST)
Message-ID: <b30255cd-f34d-1d83-de1f-8eed9b04ad04@redhat.com>
Date: Wed, 15 Dec 2021 11:31:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH-for-6.2? v2 0/3] misc: Spell QEMU all caps
To: qemu-devel@nongnu.org
References: <20211119091701.277973-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211119091701.277973-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.64, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, kvm@vger.kernel.org,
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Taylor Simpson <tsimpson@quicinc.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping?

On 11/19/21 10:16, Philippe Mathieu-Daudé wrote:
> Replace Qemu -> QEMU.
> 
> Supersedes: <20211118143401.4101497-1-philmd@redhat.com>
> 
> Philippe Mathieu-Daudé (3):
>   docs: Spell QEMU all caps
>   misc: Spell QEMU all caps
>   qga: Spell QEMU all caps
> 
>  docs/devel/modules.rst                 |  2 +-
>  docs/devel/multi-thread-tcg.rst        |  2 +-
>  docs/devel/style.rst                   |  2 +-
>  docs/devel/ui.rst                      |  4 ++--
>  docs/interop/nbd.txt                   |  6 +++---
>  docs/interop/qcow2.txt                 |  8 ++++----
>  docs/multiseat.txt                     |  2 +-
>  docs/system/device-url-syntax.rst.inc  |  2 +-
>  docs/system/i386/sgx.rst               | 26 +++++++++++++-------------
>  docs/u2f.txt                           |  2 +-
>  qapi/block-core.json                   |  2 +-
>  python/qemu/machine/machine.py         |  2 +-
>  qga/installer/qemu-ga.wxs              |  6 +++---
>  scripts/checkpatch.pl                  |  2 +-
>  scripts/render_block_graph.py          |  2 +-
>  scripts/simplebench/bench-backup.py    |  4 ++--
>  scripts/simplebench/bench_block_job.py |  2 +-
>  target/hexagon/README                  |  2 +-
>  tests/guest-debug/run-test.py          |  4 ++--
>  tests/qemu-iotests/testenv.py          |  2 +-
>  20 files changed, 42 insertions(+), 42 deletions(-)
> 


