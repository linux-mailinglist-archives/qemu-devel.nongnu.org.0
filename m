Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0D4363F3F
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 11:56:24 +0200 (CEST)
Received: from localhost ([::1]:59696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYQdj-0005B8-L5
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 05:56:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lYQcO-0004dS-9G
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 05:55:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lYQcM-0001gS-0s
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 05:54:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618826095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2WTCbxcbhPAVDzOo6+apKUgY69w7kg9FYOHL+mTyyQ8=;
 b=JfL194ds15cKkxBJx+DlDkPciYEk2oeWziW68NX61mxuY/6O7u/ykxhKlXabq0TRZE68T1
 dy4HRF/ZyE2NQDuq1XFwfeBFSzvjeBtr04CtX5mm3Nb3kxYWBTFCnPOvcl9sHtRwKl8Qxw
 hq7N86vBLnmU+ckw5gyZIFritXAnjRg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-5pn0LT7IMFC0sH6oCv1TzQ-1; Mon, 19 Apr 2021 05:54:51 -0400
X-MC-Unique: 5pn0LT7IMFC0sH6oCv1TzQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 t18-20020adfdc120000b02900ffe4432d8bso8787187wri.6
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 02:54:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2WTCbxcbhPAVDzOo6+apKUgY69w7kg9FYOHL+mTyyQ8=;
 b=YxWYLcsvQoj4lsUJPDxj82u9aKOPk4/a9C67ssEIxZ6XVIoP5Db2Z2mjNHT3fZl4tj
 7JgozH21xmPNiK3MHhTWdFGyQKLoFDuUwRzfGGBsFOZeig/p5c4W76jRKsYp97UYqtPG
 vso/9qo1VayqPkoUVYKdV+diJUM1fsAWB750eGGYMR5x/e3b+ChA4KMhx1zrXfva2EPs
 09a/xR4e+s6PDPKy++0ixBFL/KWFUTZBkPf9YaJ751DEgkmN0q1ziVbtVD/cIchMtDEQ
 +hcqlos7apuUNRT2ETARDRS26fZBwFML+AyQomn+eA9nweLxhGtBjLdF9Lw0zw4R9E1V
 dR8A==
X-Gm-Message-State: AOAM5333nlIyZBVS9J8SRVelPg0MTFm7LR7yV//eVyuiLC0KVGZ4sC0K
 WvovOaWpvfwwi5EV0PY0Kf6jO5AOu+LcbSCaOa9AqAT5SKJvLezxkxCwaSUUcCVEqQMO2hGd5pp
 LoSRFNYHyYXI+wSI=
X-Received: by 2002:a5d:58fa:: with SMTP id f26mr13017781wrd.177.1618826090750; 
 Mon, 19 Apr 2021 02:54:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5VnJxK96YcHUGkr9ntZ67mvml8RJmroTGV6Md0eAtNGav+rAKe19L+RNHIksdh7tKfRHujA==
X-Received: by 2002:a5d:58fa:: with SMTP id f26mr13017762wrd.177.1618826090596; 
 Mon, 19 Apr 2021 02:54:50 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id x25sm19488890wmj.34.2021.04.19.02.54.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Apr 2021 02:54:50 -0700 (PDT)
Subject: Re: [PULL 0/7] queue of proposed rc4 fixes
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Prasad J Pandit <pjp@fedoraproject.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210417194205.17057-1-peter.maydell@linaro.org>
 <a64b9f0d-66fb-9fd2-711c-c5e6df318bed@redhat.com>
Message-ID: <b7f9f907-2945-947f-de51-b65a3a320d82@redhat.com>
Date: Mon, 19 Apr 2021 11:54:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <a64b9f0d-66fb-9fd2-711c-c5e6df318bed@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Hannes Reinecke <hare@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/18/21 7:17 AM, Philippe Mathieu-Daudé wrote:
> On 4/17/21 9:41 PM, Peter Maydell wrote:
>> This pullreq contains fixes for the remaining "not fixed yet" issues
>> in the 6.0 Planning page:
>>  * Fix compile failures of C++ files with new glib headers
>>  * mps3-an547: Use correct Cortex-M55 CPU and don't disable its FPU
>>  * accel/tcg: Fix assertion failure executing from non-RAM with -icount
>>
>> None of these are 100% rc4-worthy on their own, but taken all together
>> I think they justify rolling another release candidate.
> 
> I wonder about this one for https://bugs.launchpad.net/qemu/+bug/1914236
> "mptsas: remove unused MPTSASState.pending (CVE-2021-3392)"
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg799236.html
> which is a respin of
> https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg02660.html
> with Paolo's comment addressed.

Actualized version:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg799620.html

This is not a new regression (present since QEMU v2.6.0) but is a
CVE...


