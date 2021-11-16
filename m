Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E3045325B
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 13:45:10 +0100 (CET)
Received: from localhost ([::1]:44374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmxpl-00085s-6h
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 07:45:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmxm8-0006ZQ-UD
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 07:41:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmxm6-0002b6-4g
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 07:41:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637066479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pZFw1lxYdZE2PtrWtDFvtDrdfOmc5KAWidFAwYd0hwE=;
 b=Dwh/1hnfvgOdrUZQIblsztxqAoHXJcWEZY0xj0jNU4/dSpQ1rBByqtiMpF25NaqAOKlHLz
 I6jTipeZxJ1nJubWrneMumnntK4dCSMy2OiB3+R7N4Ibqmkgl2DupxB6dxF3xf6BJf+di/
 hwEkTeDOAB5DimOgXxwNTLTqIKtILwI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-RRcnuxr2P9WvmAAVGufckg-1; Tue, 16 Nov 2021 07:41:18 -0500
X-MC-Unique: RRcnuxr2P9WvmAAVGufckg-1
Received: by mail-wm1-f71.google.com with SMTP id
 g11-20020a1c200b000000b003320d092d08so7295593wmg.9
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 04:41:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pZFw1lxYdZE2PtrWtDFvtDrdfOmc5KAWidFAwYd0hwE=;
 b=wrlcyaXe4I9TR4AoQE/QDSENDmvEFiytWyAICM9DM8qpgNMiw/Q93sJVx/7yYOWPWD
 dn8nksOdrGX3XZYECxRZ9FEK+MHuUw31kXiD2hRBojuz+x4+1105Gwi/rHduOB7txg0A
 yoig8YUCFOwTesQRY1ZFEUFKVA3FDE64kIWOXiaZ1qG1PCuEmT6+HtujetYP4SC0U02a
 u5h7ZNiWuomJVa4JAp7IlmV9IA6pY43DJV3/YLLgKCFxvgbf8AxtaPVZNMJrwwL4KuAm
 nrYOzwY7ZrbqpF4Pkp2focwjQ9IWpcNP5GZ9Qp5coZzSKLTyKVuGDt8cb246XuT1/4nD
 3A5Q==
X-Gm-Message-State: AOAM531JZhZrjFzqmyBhOUUe2dq9iBlLxJTYj57mSG+VSZGQUZG/CJaM
 HHvwd2mhshOILVyIQGGqsBKjMY6S7n9W6I4YHnH55MOR6Vy6xbi613gDVoFjlwZWm/tdABZ071l
 1+dXYSfdXfmsSUxM=
X-Received: by 2002:a5d:58c5:: with SMTP id o5mr9041344wrf.15.1637066477256;
 Tue, 16 Nov 2021 04:41:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxmEZTntgNOXs/r4WjviCOsn4jnrzYRguqBCB4BhGVSjHxfI0AHd8vYDuAYHKoLnYcQ0AGzew==
X-Received: by 2002:a5d:58c5:: with SMTP id o5mr9041312wrf.15.1637066477080;
 Tue, 16 Nov 2021 04:41:17 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id 38sm8864656wrc.1.2021.11.16.04.41.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 04:41:16 -0800 (PST)
Message-ID: <cca0087a-61d5-c5ae-4db3-021569d12e58@redhat.com>
Date: Tue, 16 Nov 2021 13:41:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] gitlab: skip cirrus jobs on master and stable branches
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20211116112757.1909176-1-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211116112757.1909176-1-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.446, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/21 12:27, Daniel P. Berrangé wrote:
> On the primary QEMU repository we want the CI jobs to run on the staging
> branch as a gating CI test.
> 
> Cirrus CI has very limited job concurrency, so if there are too many
> jobs triggered they'll queue up and hit the GitLab CI job timeout before
> they complete on Cirrus.
> 
> If we let Cirrus jobs run again on the master branch immediately after
> merging from staging, that just increases the chances jobs will get
> queued and subsequently timeout.
> 
> The same applies for merges to the stable branches.
> 
> User forks meanwhile should be allowed to run Cirrus CI jobs freely.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  .gitlab-ci.d/cirrus.yml | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


