Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 666F140A626
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 07:47:56 +0200 (CEST)
Received: from localhost ([::1]:44238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ1IR-0002tz-Gl
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 01:47:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mQ1Eo-00089P-QU
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 01:44:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mQ1Ek-0006Ik-Gz
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 01:44:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631598245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jOMFzme4xQUk/nX9ynGv7/L3GO/IS/wYkvjt6S4K1ho=;
 b=OsEd9Z+E85PooCgx15Aq7z2zSRo3QT4s66ZhdbQA1bTHlb1ejoVVfadGNPfnrR1M6sy4ha
 4O9TFMLLQfcTLG/5WEhk+eoUfDk2l0600NfjA19zqE9ISMAEkuMdGdPgLX3BmdiktYRymL
 KBr1kxLoLRIXL+tHtQQYZA5FqE9zBtk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-mhgc860YMp-BALYJb-jsZA-1; Tue, 14 Sep 2021 01:44:04 -0400
X-MC-Unique: mhgc860YMp-BALYJb-jsZA-1
Received: by mail-wr1-f72.google.com with SMTP id
 x2-20020a5d54c2000000b0015dfd2b4e34so1818303wrv.6
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 22:44:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jOMFzme4xQUk/nX9ynGv7/L3GO/IS/wYkvjt6S4K1ho=;
 b=v7dDrIExh5zicPcx2SkQLvd9Y2BjQFVuRAlneUBXyrNFki2kNcKcb1spoAESdZG2MC
 LB0xAY/LO4K829KF9I32D0TR4EI3En90I1yp8K/UaAgbGqVW/nUSvckgZSTiWtgVnP5W
 9fVNijhsHt4lScAQE+qJiRSkzSNjxnu0ek2sIr67MMx+xqgGx+MlU4jGw+QgpAwM0L/g
 0HwlR1ANQNAqkhSC1PBRMD9ykGlDsvuSWpuUbGaXh0Q2MPy8XMNBJX2nnCpPRBvVSIp6
 e4iXUzgt8uX6XI8g7YhqPlfniOdTASxrmYI9X6D1JnuCIsNrqHUJhmFHMkh6clAEcE2i
 7RIg==
X-Gm-Message-State: AOAM533nWh/qKl7rRlJH3FRpNl0XZs/TolAyKIqe5iUqf+5ZizYIRw0l
 o2KtATxn8qSf5ahGFCRNeRYeTl7hKRtDzyPkRfdy6kZf8+u6Y+4pgrSpi3TLlGxda+V+Ze2b6Yh
 8l1gWhLEN/CGcZqg=
X-Received: by 2002:a5d:5981:: with SMTP id n1mr10369158wri.82.1631598243586; 
 Mon, 13 Sep 2021 22:44:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSpBw2Xwv8o7ekeH5+idj9h8bA0vh1DgIVpgSRh166E2ZkrxNkqrFkhK0OMYC7Iy0jNUjh4Q==
X-Received: by 2002:a5d:5981:: with SMTP id n1mr10369146wri.82.1631598243414; 
 Mon, 13 Sep 2021 22:44:03 -0700 (PDT)
Received: from thuth.remote.csb
 (dynamic-046-114-144-112.46.114.pool.telefonica.de. [46.114.144.112])
 by smtp.gmail.com with ESMTPSA id w1sm54146wmc.19.2021.09.13.22.44.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 22:44:02 -0700 (PDT)
Subject: Re: [PATCH] gitlab-ci: Make more custom runner jobs manual, and don't
 allow failure
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210913101948.12600-1-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <28edd4ac-5b7f-8500-cb00-b05124c365d5@redhat.com>
Date: Tue, 14 Sep 2021 07:44:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210913101948.12600-1-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/09/2021 12.19, Peter Maydell wrote:
> Currently we define a lot of jobs for our custom runners:
> for both aarch64 and s390x we have
>   - all-linux-static
>   - all
>   - alldbg
>   - clang (manual)
>   - tci
>   - notcg (manual)
> 
> This is overkill.  The main reason to run on these hosts is to get
> coverage for the host architecture; we can leave the handling of
> differences like debug vs non-debug to the x86 CI jobs.
> 
> The jobs are also generally running OK; they occasionally fail due to
> timeouts, which is likely because we're overloading the machine by
> asking it to run 4 CI jobs at once plus the ad-hoc CI.
> 
> Remove the 'allow_failure' tag from all these jobs, and switch the
> s390x-alldbg, aarch64-all, s390x-tci and aarch64-tci jobs to manual.
> This will let us make the switch for s390x and aarch64 hosts from
> the ad-hoc CI to gitlab.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   .gitlab-ci.d/custom-runners.yml | 20 ++++++++------------
>   1 file changed, 8 insertions(+), 12 deletions(-)

Acked-by: Thomas Huth <thuth@redhat.com>


