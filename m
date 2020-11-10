Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AD32AD3A2
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 11:25:16 +0100 (CET)
Received: from localhost ([::1]:51878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcQpv-0006x1-3a
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 05:25:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcQoo-0006W5-Fu
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 05:24:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcQol-0004Eh-TL
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 05:24:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605003843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+xUBF1AfRe+eDZ+nRvcHl5A8LmBHGZKYhu9iQ3CuJv8=;
 b=G6BLtKPAuLcKQptNWOSRAzjZf4kJMaITQdk7qMWnqlsE4TVHC4ad8C4g0kaT419MgXV9a7
 a6a7ldkA/Qsm0eLEGEXTynGw++UB10roZTAhDmMOoKkg0+X22o7/Lz1v8fW600JhHP/vLX
 EEvf0r0oiVNMIeuhKsRs6+XDnxLlpwU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-M8843OCVMI-pZXKUW05BYg-1; Tue, 10 Nov 2020 05:24:01 -0500
X-MC-Unique: M8843OCVMI-pZXKUW05BYg-1
Received: by mail-wm1-f71.google.com with SMTP id y187so1066261wmy.3
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 02:24:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+xUBF1AfRe+eDZ+nRvcHl5A8LmBHGZKYhu9iQ3CuJv8=;
 b=gZC2oThSOwOUnpEVA1vmg1BKaBvm6vy3Yw6Oga+XUojnlmO6HiUjFDDbe2KWGYCUWo
 4k9xCi3N+t+DgwnLfthafaZypqCdm/euXzyOH6/QuTC42O+cbGpwBvn4rz7c4D0SAcaz
 AAtbe0ja2usNunmaAOzC3pqwPWzLkPNNRVExPmYJ+Wn3Aeu4uOcPduzokJrARcv7K5cg
 gRSFUR3y+v8xZaLw7ftfxA4nq3gPE6YYKL3xAbbZHUl7V2F2MTSPW3DZby0Ga3LsD/W4
 pue0PJ536vpZj41BPNncOhadDiWABbW5PajhgpmZl112ETnmZfRfrvqXGkD09B2Bqpr5
 j0TA==
X-Gm-Message-State: AOAM530admenpIL7oYDdfXtqbP0QNrTvQ1XXum90wmc5iy+wbTmaPTJb
 tPDtmCHmXkqOQU9hTefm6VPEFUtgI15WjhfNL3ec3bSRW+opK+7qy2qXGNEQbZvoiyfeH4KGqfh
 iJStmInjxtuJkoOY=
X-Received: by 2002:a5d:5222:: with SMTP id i2mr24308245wra.247.1605003840409; 
 Tue, 10 Nov 2020 02:24:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzsNr/Z5oUxBGMyj1WZ5t3uDVJFEdPZdYRZOxMnytiAHMWZSQ5etrPggjJIJOvR0ReDzWlYWQ==
X-Received: by 2002:a5d:5222:: with SMTP id i2mr24308223wra.247.1605003840195; 
 Tue, 10 Nov 2020 02:24:00 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id o63sm2486307wmo.2.2020.11.10.02.23.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2020 02:23:59 -0800 (PST)
Subject: Re: [PATCH v3 07/11] gitlab-ci: Extract common job definition as
 'cross_common_job'
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20201108221925.2344515-1-philmd@redhat.com>
 <20201108221925.2344515-8-philmd@redhat.com>
 <6bc0f017-32cc-88e8-27d8-5960f213d579@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b3d8b1eb-f8ff-b7f7-fa06-bbf27566760e@redhat.com>
Date: Tue, 10 Nov 2020 11:23:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <6bc0f017-32cc-88e8-27d8-5960f213d579@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 02:00:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/9/20 10:52 AM, Thomas Huth wrote:
> On 08/11/2020 23.19, Philippe Mathieu-Daudé wrote:
>> Extract the common definitions shared by '.cross_system_build_job'
>> and '.cross_user_build_job' to '.cross_common_job'.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  .gitlab-ci.d/crossbuilds.yml | 9 +++++----
>>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> 5 insertions, 4 deletions ... is it really that much better?

It becomes useful later we we add a lot into cross_common_job,
rather than duplicating in cross_[system/user]_build_job.

I understand this commit description lacks that information.

Thanks.


