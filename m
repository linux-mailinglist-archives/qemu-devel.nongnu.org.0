Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F52D40F6D0
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 13:45:52 +0200 (CEST)
Received: from localhost ([::1]:48184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRCJT-0007Vl-8v
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 07:45:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mRCGm-0006mX-KN
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 07:43:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mRCGk-0001Qp-NF
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 07:43:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631878982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j1MQLaRp+EsvtUB5pxt3ERpFVaoeSVgFafV/72rx2iE=;
 b=ZCo1219tahVmaDcA98FOui1aVc7wGd/OYSppU9NbdclwOovV1QFoDGkRt/u0vhrhFv9gLf
 870mSY64/NhmB0HpvK2KeXBkAVid3eG9eUgOnrRzDXbncku0aN0uLWoBmb7ECgJdc7z1EY
 UfzkKQxTNNsPKOcy30xZ/b62aNVs3j4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-48OcobORPFS6d-_iYYRyAQ-1; Fri, 17 Sep 2021 07:43:01 -0400
X-MC-Unique: 48OcobORPFS6d-_iYYRyAQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 x7-20020a5d6507000000b0015dada209b1so3616387wru.15
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 04:43:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j1MQLaRp+EsvtUB5pxt3ERpFVaoeSVgFafV/72rx2iE=;
 b=NHA+y2801idqyEJUfsbQnv07xU7TyxDQMJDzpeJ8nMmlT+PjAb+QUw9dekyKOJrLYn
 jl1Lny6/onQ6ALa0ChGju8TYlCVKUiNxcXbC/zGBGVAMNweFEpKI9jt0HPpNA8L49paA
 CRwR/GcdiQLcKrx/5vC7j6x/22AAqGswEfROOk+afZoH/AeXbMGzgWaWLt/qiKCunZ5W
 JK/6R6jhybZjisViHvH1tkP5FN7iFWhDc6WzAz6kaXFb1HyGvFS9mzhZs6PFzI1Ol+nu
 8gUmPSD4n14KJ3SLpqChLT/TEFoYNhvaAjse+gX/VAx2RqNkC++iXngNZ3eH5I/TIK4f
 uE4g==
X-Gm-Message-State: AOAM53289NwlRhNi5f58n4Y8782qauXkS6ceWbwiRp9a0l+wkpHkCAvz
 iWKMs6bDq8YfaFdLRer9yGyJnQymcJfGHK7/3N1QgaQ14pu1YlopHxxYFhctMd/t7TnKw3EKebU
 On6x9tupP50NSiA0=
X-Received: by 2002:a7b:cc94:: with SMTP id p20mr14479208wma.75.1631878979918; 
 Fri, 17 Sep 2021 04:42:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOs0Vd4Wfc2Y73/SOTB+Bzadj4F7TeXsgfeG9PBdBH01tdJEZHTuXAKelyXYxu8La2gd2UBw==
X-Received: by 2002:a7b:cc94:: with SMTP id p20mr14479186wma.75.1631878979679; 
 Fri, 17 Sep 2021 04:42:59 -0700 (PDT)
Received: from thuth.remote.csb (tmo-097-75.customers.d1-online.com.
 [80.187.97.75])
 by smtp.gmail.com with ESMTPSA id k18sm6564016wrh.68.2021.09.17.04.42.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Sep 2021 04:42:59 -0700 (PDT)
Subject: Re: [PATCH] travis.yml: Remove the "Release tarball" job
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20210917094826.466047-1-thuth@redhat.com>
 <CAAdtpL7DkZyE7z-M2trjnXj0mpry95Y-T7-WahgxWg-jfg9gCg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <9a941135-a659-bf8e-6b4f-bc7e297060c0@redhat.com>
Date: Fri, 17 Sep 2021 13:42:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAAdtpL7DkZyE7z-M2trjnXj0mpry95Y-T7-WahgxWg-jfg9gCg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.488, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/09/2021 13.25, Philippe Mathieu-Daudé wrote:
> Le ven. 17 sept. 2021 11:48, Thomas Huth <thuth@redhat.com 
> <mailto:thuth@redhat.com>> a écrit :
> 
>     This is a leftover from the days when we were using Travis excessively,
>     but since x86 jobs are not really usable there anymore, this job has
>     likely never been used since many months. Let's simply remove it now.
> 
>     Signed-off-by: Thomas Huth <thuth@redhat.com <mailto:thuth@redhat.com>>
>     ---
>       .travis.yml | 23 -----------------------
>       1 file changed, 23 deletions(-)
> 
> Do we have the equivalent job on GitLab?

I'm not aware of any. But since this job was only running on v* tags anyway, 
it likely does not make much sense to translate it 1:1 to a gitlab job. But 
maybe Michael could suggest something similar if it's helpful for making 
sure the release tarballs do no regress?

  Thomas


