Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4805A698E36
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 09:01:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSZBu-00020v-S2; Thu, 16 Feb 2023 03:00:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pSZBQ-0001vJ-Ph
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 03:00:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pSZBO-0002MW-QM
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 03:00:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676534398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vYoiOAfo3Iubs4igp2bNdYbM4OCTfMM5BsGZG6YDuEU=;
 b=hzbLcvWkeY/XfzojVanegBHs1OCB5cYqGFHEDX9n3aa02/hkq0QiwUApVLUI8tH5EQk05v
 cm7iaftuNxp0hIBSIIFmr0wqChlhN38rQeM2TjTmnFTqYREQ+sw4+bqaWcmb/zELnH1l81
 JsncU5OxpzHARbeSUtqmBVpHdY5ZwrA=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-108-jP-dS7OeOu-aOWa3CMj1VA-1; Thu, 16 Feb 2023 02:59:56 -0500
X-MC-Unique: jP-dS7OeOu-aOWa3CMj1VA-1
Received: by mail-qk1-f198.google.com with SMTP id
 x17-20020a05620a449100b00731b7a45b7fso745342qkp.2
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 23:59:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vYoiOAfo3Iubs4igp2bNdYbM4OCTfMM5BsGZG6YDuEU=;
 b=tIU9wl+Hqza6EadDZ8a3hyJhfk1G/C7hJzeH7kldj2eHjY/AhB3UT9gyefGxQHdxDX
 dDX6Cuf5ggzDpd/cj8oBpw99b013IXdTsOtUpLmOy8SlTU1GMGRirrPR31JJDwM6qMjX
 DSp3EmQ3BZqTI6G986vt9jgmBnK6MxxX6yDMyjt7FwMUwBN67R0GV+nVYE8ecDcWqfxt
 gQ0cYL5Z2dSGMQ7s8EvM8fBwNOR3IY5rAgRq0T5noIOYENK9rGoKBC7wkfwWsN3H2O58
 3evGydZ1bE4DayGwLJQ2bkNQPHrpItEIn+gA3ge/qxJs1U9gPM+didYTmFwqpVzyXCGY
 NiIQ==
X-Gm-Message-State: AO0yUKWClpj8PjXwoZ0IQiUBb96LwKBFSfd9F8bP3onf+jQAjHGeJmfZ
 ltYq2S+SY9p/nvqvHOHZiieJmEUcdNjOsi0BSNNh6L7lTUYD24EVSuEIHgwA/dxiEezXDYqgAPI
 rK9+9mNomTCdZcGM=
X-Received: by 2002:a05:6214:d0a:b0:56e:ff37:6b6e with SMTP id
 10-20020a0562140d0a00b0056eff376b6emr584521qvh.10.1676534396168; 
 Wed, 15 Feb 2023 23:59:56 -0800 (PST)
X-Google-Smtp-Source: AK7set8wx3rF6F/2I25xRs/UYXeM59C97+VU2e54WVZ1X6EG1fBN3gDJ3yYXEq36HiO6HMZmEK7i2Q==
X-Received: by 2002:a05:6214:d0a:b0:56e:ff37:6b6e with SMTP id
 10-20020a0562140d0a00b0056eff376b6emr584492qvh.10.1676534395945; 
 Wed, 15 Feb 2023 23:59:55 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-144.web.vodafone.de.
 [109.43.176.144]) by smtp.gmail.com with ESMTPSA id
 q202-20020a3743d3000000b0073b341148b3sm680283qka.121.2023.02.15.23.59.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 23:59:55 -0800 (PST)
Message-ID: <f975618a-02b1-2838-5379-ecb8ee15977d@redhat.com>
Date: Thu, 16 Feb 2023 08:59:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 12/12] tests: ensure we export job results for some cross
 builds
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Alexander Bulekov <alxndr@bu.edu>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Darren Kenny <darren.kenny@oracle.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230215192530.299263-1-alex.bennee@linaro.org>
 <20230215192530.299263-13-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230215192530.299263-13-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.257, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 15/02/2023 20.25, Alex Bennée wrote:
> We do run tests on some cross builds. Provide a template to ensure we
> export the testlog to the build artefacts and report the test results
> via the junit.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> 
> ---
> v2
>    - properly format extends
> ---
>   .gitlab-ci.d/crossbuild-template.yml | 11 +++++++++++
>   .gitlab-ci.d/crossbuilds.yml         | 12 +++++++++---
>   2 files changed, 20 insertions(+), 3 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>



