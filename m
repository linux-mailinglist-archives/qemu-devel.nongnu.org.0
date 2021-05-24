Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A93838F2E3
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 20:20:15 +0200 (CEST)
Received: from localhost ([::1]:43526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llFBW-0001WH-Ae
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 14:20:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llF90-0007hV-V2
 for qemu-devel@nongnu.org; Mon, 24 May 2021 14:17:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llF8y-00026E-8E
 for qemu-devel@nongnu.org; Mon, 24 May 2021 14:17:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621880255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qP+TkTR0gVpUdzLoddwaXxej4qE0FJMvm2ejJHsLYwI=;
 b=Uob/DatM6rIcjFLd7oS+cxdQucbZPVCfFabkAdVPR0WHUYgf6sKJAMotCF+S2IHsKxhXKg
 dYila3CLf1LO34IZQhKkBvIqANNnqxmgdJMOi8GIjuP7ML72As9ba3HwcIsJG8GQp3hKFi
 Qm6bZgKXewWyPPgMiWGrgiPcecLC4ms=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-EOmjrzYjPDmwtv9APi0xcw-1; Mon, 24 May 2021 14:17:28 -0400
X-MC-Unique: EOmjrzYjPDmwtv9APi0xcw-1
Received: by mail-wr1-f71.google.com with SMTP id
 22-20020adf82960000b02901115ae2f734so13467808wrc.5
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 11:17:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qP+TkTR0gVpUdzLoddwaXxej4qE0FJMvm2ejJHsLYwI=;
 b=gjJtk9HDSKyN0dMROJIMhH9/XgQJhZo4zAKba93mTXx4vduoLzQnShtd8zOa6k9Aer
 TIp09Sq6HMDWYDZNnH0hZFeOjMeyjqb4AJ2yCJlKL5tnYP851oRcIyCBvI7K96a3sKul
 ZnJx1Fi6d/9JNF5XglOHT7riiAjs8FuC2OnDh/GbYWBb5HiMNoZbyLP3AQQG97vJUJw8
 UKR4MuHbQkVEzjAec5Doadn4DZ7SnqaG636X3w306LSiwEJZvYGudL6UE4rdOCW+3p/3
 +1MvsnRYQlviUSg5WMsp7BZEetq5SN8Lm+Ez8vpz4rIg9sOIn/+WhkfEPIWmJURYV7AS
 /0wA==
X-Gm-Message-State: AOAM530/WIOwSZqu7XcgTL2nOQFv/1iLKbe8EY3TAS0zd8W0SE233rK9
 WiGkw3i6pGDsDiX5Eg2MUCSK9t2ACFHHpm7CIhEmVaeqZDg6cn4p19BiW2FYzIw9083cutSfeTB
 um52y1NIeMTmRQt0=
X-Received: by 2002:a1c:6644:: with SMTP id a65mr19681643wmc.103.1621880246452; 
 Mon, 24 May 2021 11:17:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzh1wNiB4LspDSljtw1JiMtln5nVwc1vax/A5ad22Uq4gYFSNg9uUGhK9Ug/cw4lT4CYnd01A==
X-Received: by 2002:a1c:6644:: with SMTP id a65mr19681620wmc.103.1621880246209; 
 Mon, 24 May 2021 11:17:26 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id r7sm8226691wmq.18.2021.05.24.11.17.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 11:17:25 -0700 (PDT)
Subject: Re: [RFC 0/1] acceptance tests: bump Avocado version to 88.1
To: Cleber Rosa <crosa@redhat.com>, Willian Rampazzo <willianr@redhat.com>
References: <20210520204747.210764-1-willianr@redhat.com>
 <20210524175057.GA1567491@amachine.somewhere>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ae31ce8b-8a59-ff82-3912-2d8ea2dfc51c@redhat.com>
Date: Mon, 24 May 2021 20:17:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210524175057.GA1567491@amachine.somewhere>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/24/21 7:50 PM, Cleber Rosa wrote:
> On Thu, May 20, 2021 at 05:47:46PM -0300, Willian Rampazzo wrote:
>> CI pipeline: https://gitlab.com/willianrampazzo/qemu/-/pipelines/306904401
>>
> 
> While not related to change in Avocado version (I've verified the same
> behavior with 85.0), we need to investigate (further) one of the jobs
> getting stuck here:
> 
>    https://gitlab.com/willianrampazzo/qemu/-/jobs/1281481564#L79

Problem between QEMU/Avocado.

QEMU sets Avocado tags to restrict the set of jobs ran and uses
the @skip decorators to ignore jobs under some conditions, i.e.:

tests/acceptance/boot_linux.py:141:    @skipIf(os.getenv('GITLAB_CI'),
'Running on GitLab')
tests/acceptance/boot_linux_console.py:235:
@skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')
tests/acceptance/boot_linux_console.py:593:
@skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout')
tests/acceptance/boot_linux_console.py:795:
@skipUnless(os.getenv('AVOCADO_ALLOW_LARGE_STORAGE'), 'storage limited')

Avocado fetches artifacts *before* evaluating decorators / tags, so
we are currently trying to fetch artifacts known to break CI due to
their size.

Willian has been looking at it and it is not clear which project
should be modified. He might explain better ;)


