Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D869B5B95CD
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 09:58:01 +0200 (CEST)
Received: from localhost ([::1]:52046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYjl2-0003R6-WE
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 03:58:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oYjWA-0004aB-G3
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 03:42:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oYjW9-0001ru-2L
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 03:42:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663227755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xU3dAx8w+riYC9KfQUS2XlO6/SMw91QYSMQR8a2RTXc=;
 b=ewz95wES3g/1KPpeyl29qq43ESqWcCJGBBLRGJMueQ/Ri+okaX5AvCqg+yxSeFlVXK89Ff
 mlWzj/F+C522/pP7f9E8z7UPoQmndGelcPBtOIStpBdfU4Y3szn3aeCVTQ7jCFMVqVzxD3
 ArCAlkAlvUhpT2MVtkqna4MRuVRvIJk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-103-BlQxubBgNFev5JT4DFvtpg-1; Thu, 15 Sep 2022 03:42:31 -0400
X-MC-Unique: BlQxubBgNFev5JT4DFvtpg-1
Received: by mail-wm1-f71.google.com with SMTP id
 p24-20020a05600c1d9800b003b4b226903dso117148wms.4
 for <qemu-devel@nongnu.org>; Thu, 15 Sep 2022 00:42:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=xU3dAx8w+riYC9KfQUS2XlO6/SMw91QYSMQR8a2RTXc=;
 b=tyCg25jbyvqmGwOllpskXdkUEP4+quEN+70pmNoBOw0gv0FBo89rtBNHkTZd5f5kpp
 UYHmR/jcR+KTaNaHBqvYGhOZBi2lCDroQhJ4vcD7aO9CJOI0nN6IimVsxCAgIhHsp4z1
 /hXAA5BnIQDGUNUVCCNCYWcOEwTMOpS/kBQ0zNVEbE2TpxRZKNMrWjcRNMYnvbbVwuCn
 hbWoFmjGDQAfMXdJ5AMREO+yc1AFc1NmukGJ5hhyJoElxJb5/0GC6ljHrWao4EN4rZKC
 RZTmQBIpR1oWZmlJSSHMeDIhwgxM3xGnYdoz+CHV5dhQKoopeiHhxyyeONvptcpEKkYM
 y3hw==
X-Gm-Message-State: ACgBeo2/n3YRZZHYIy3lzLXn+QUQqWgTchN9R8zrxxv3BWcBBZk718bZ
 LFof/8mjCGplc+b3HXawoIFlrZ7N0rHV4MUh1iSdJw4vz3TqsTvQHrG0tXAj3yHVc6T58ig8nv6
 ANXJS1yGBjNSlStc=
X-Received: by 2002:a5d:45c4:0:b0:228:9248:867d with SMTP id
 b4-20020a5d45c4000000b002289248867dmr23289585wrs.474.1663227750340; 
 Thu, 15 Sep 2022 00:42:30 -0700 (PDT)
X-Google-Smtp-Source: AA6agR606Lar0QYFbBlTiuZRp2v9WoQv3T3XEU5tn6mvx2di2V/2N+oyQG6ywxoH/lvAvoJUpt11jQ==
X-Received: by 2002:a5d:45c4:0:b0:228:9248:867d with SMTP id
 b4-20020a5d45c4000000b002289248867dmr23289569wrs.474.1663227750161; 
 Thu, 15 Sep 2022 00:42:30 -0700 (PDT)
Received: from [172.20.194.41] ([79.140.208.123])
 by smtp.gmail.com with ESMTPSA id
 k16-20020a5d6e90000000b0022ac38fb20asm1608270wrz.111.2022.09.15.00.42.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Sep 2022 00:42:29 -0700 (PDT)
Message-ID: <1d4647d1-75a6-e8d2-45f8-db4989d42b5d@redhat.com>
Date: Thu, 15 Sep 2022 08:42:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 20/30] gitlab-ci: update aarch32/aarch64 custom runner
 jobs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220914155950.804707-1-alex.bennee@linaro.org>
 <20220914155950.804707-21-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220914155950.804707-21-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.583, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/09/2022 16.59, Alex Bennée wrote:
> The custom runner is now using 22.04 so we can drop our hacks to deal
> with broken libssh and glusterfs. The provisioning scripts will be
> updated in a separate commit.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Message-Id: <20220826172128.353798-15-alex.bennee@linaro.org>

Reviewed-by: Thomas Huth <thuth@redhat.com>



