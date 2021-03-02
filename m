Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6371A32A383
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 16:19:06 +0100 (CET)
Received: from localhost ([::1]:33970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH6nh-0004hL-DE
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 10:19:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lH6mJ-0003Lf-5l
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 10:17:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lH6mE-0007kW-Mc
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 10:17:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614698252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sOA3RUx9noj8A/uLcy4iiyd1yE69ANGwIucoE1MwApI=;
 b=QyITh0mc+Do7/nEkXech/z6HGAkiFpXS+6vW8q83dJlyxxA39JSRzV/ixWzP8G5ckljMVb
 Jr69OTYBZh672EvpDd8fH004cRlzXHaHDpMcwrWgkVjxC8KebFVuZ0fy3FCsEJcitQ7kgW
 LFxU6AxU/ZUrIq+NQgLJV2nWmi98kpI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-t-BY_DGIN6GmFxqCU0IgOQ-1; Tue, 02 Mar 2021 10:17:24 -0500
X-MC-Unique: t-BY_DGIN6GmFxqCU0IgOQ-1
Received: by mail-ej1-f72.google.com with SMTP id e13so3370835ejd.21
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 07:17:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sOA3RUx9noj8A/uLcy4iiyd1yE69ANGwIucoE1MwApI=;
 b=s4UEqKanfXvW/J/H5aMu0gtP2MadcpodR3aKm/RBMYF2J4fqdUjSozhuqFwcToh/XP
 t+J63OwDB+nC/SrBChXGKhDOv+8Jx7jzYGODpNRD1uMUflMnKrjPQimYfPkWowUgjjMS
 inkuVkIbyvT6vy9cN67OQB09rNzhzOGXc2zRaZEBrofbvsV5ij4uW+Qr1RXwXczruoTA
 2Olce/wPoDprwf5D81xPrGXJaFK0kpfwi7mY8/iboOECOcket13FmdMX49ZdGB0grQVo
 xTP3fF+C5S1eK/wBheUtLPgv3rsIVn9/XthZA1zEYLcpPFs2T763qaoNV060X7dOkQuI
 aL+g==
X-Gm-Message-State: AOAM531OC5cZHzX0eGJJq4ZV4L1J4xdTpA+cspzZAXLQX5fB0e8HFi+u
 k0rB5N1/RHkIAhACHVUqn/zWEM/0HQclB9ORo+Wocn2kNoE5ZDThlnV3ayVG+c+tB4hh8a4/BvJ
 xo76XrkdqWZPrcSI=
X-Received: by 2002:a17:906:5453:: with SMTP id
 d19mr20791948ejp.150.1614698243531; 
 Tue, 02 Mar 2021 07:17:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwM3zK0r6vUrxdczhq/HAC5ij0FhaUl5yXBLLnQcVzHx7NO2AymOIfx896WTE/rVSvbKkViXg==
X-Received: by 2002:a17:906:5453:: with SMTP id
 d19mr20791919ejp.150.1614698243362; 
 Tue, 02 Mar 2021 07:17:23 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id ho19sm4156440ejc.57.2021.03.02.07.17.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Mar 2021 07:17:22 -0800 (PST)
Subject: Re: [PATCH 1/2] Acceptance Tests: restore downloading of VM images
To: Cleber Rosa <crosa@redhat.com>
References: <20210225232122.1254879-1-crosa@redhat.com>
 <20210225232122.1254879-2-crosa@redhat.com>
 <3e7370f0-c094-e1b9-50d2-bdc63170404d@redhat.com>
 <20210226230438.GA1329285@amachine.somewhere>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f88873b9-95e9-56f6-8b2c-0a1405fc4e8f@redhat.com>
Date: Tue, 2 Mar 2021 16:17:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210226230438.GA1329285@amachine.somewhere>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Andrea Bolognani <abologna@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <wrampazz@redhat.com>,
 Marcelo Bandeira Condotta <mbandeir@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/27/21 12:04 AM, Cleber Rosa wrote:
> On Fri, Feb 26, 2021 at 01:01:28AM +0100, Philippe Mathieu-Daudé wrote:
>> On 2/26/21 12:21 AM, Cleber Rosa wrote:
>>> The "get-vm-images" target defined in tests/Makefile.include is a
>>> prerequisite for "check-acceptance", so that those files get
>>> downloaded before the Avocado job even starts.
>>>
>>> It looks like on c401c058a1c a TARGETS variable was introduced with a
>>> different content than it was previously coming from the main
>>> Makefile.  From that point on, the "get-vm-images" succeed without
>>> doing anything because there was no matching architecture to download.
>>
>> Any idea about how to detect such side effects (tests silently
>> disabled) automatically?
>>
> 
> It wasn't really that any tests were disabled... they all continued to
> run.  In this case it was a broken make rule that caused the download
> of the images, ahead of time, to not be performed.
> 
> But your question is still valid and something that could happen.  The
> best answer I have is that all job results could and should also be
> persisted in a structured way that is succeptible to being queried.
> Then on top of that, you can build queries to show stability metrics,
> regressions, etc.
> 
> To that regards, I can speak about three possibilities:
> 
> 1) Avocado has support for Fedora's resultsdb[1][2]
> 
> 2) Because the Acceptance tests are already communicating the test
> results to GitLab (via junit), using the GitLab API that lets you
> query the detailed test results
> 
> 3) In addition to that, Marcelo (cc'd here) has written an Avocado plugin
> that will export test resutls suitable to be used on a datawarehouse
> tool developed by the Continuous Kernel Integration project[3]. This
> is not generally available at the moment, but should be available
> soon.
> 
> Regards,
> - Cleber.
> 
> [1] - https://taskotron.fedoraproject.org/resultsdb/results
> [2] - https://avocado-framework.readthedocs.io/en/85.0/plugins/optional/results.html#resultsdb-plugin
> [3] - https://cki-project.org

Wow this is thrilling!

Maybe we could use fosshost to run a resultsdb VM.


