Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0808472347
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 09:56:56 +0100 (CET)
Received: from localhost ([::1]:51276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwh8h-0005ku-FM
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 03:56:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mwh4h-0002ww-Rw
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 03:52:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mwh4b-0002HB-LV
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 03:52:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639385560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dCULV+XXF6Gy0zWd03Rn8lFFNuN0xyt+oK3jkwbYd7U=;
 b=KdnBpyZsVsRWyxGJdGbbvu+6YgC4jQg89N3Aj147m5MFD+SaT1T8Ccgp+Gr1/4oiYDB4px
 7dAy6cyC0sTGoxvgjTTSijh+9QQv416yn8nVodt4GIodX1ATy7Nmyzz9pMqSrdeEZvCEm2
 O2HIUu5nCKHu/Xcj3tcstrXAPyMPe8w=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-aXgeFMvZMtyUH_geXVxqVA-1; Mon, 13 Dec 2021 03:52:39 -0500
X-MC-Unique: aXgeFMvZMtyUH_geXVxqVA-1
Received: by mail-wr1-f71.google.com with SMTP id
 k8-20020a5d5248000000b001763e7c9ce5so3631754wrc.22
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 00:52:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=dCULV+XXF6Gy0zWd03Rn8lFFNuN0xyt+oK3jkwbYd7U=;
 b=DFOKH05wBkzweRMrJNuwCBLb2BcEqZFR/tqcNPWT2HMZ8i68so7aLON+KvHH4UG1Oi
 OxgMWiB68JKZfN22IB12lhr6Io9bRwuOUs287wAmLV8CWQRVZ3rxiQwttUEMkCML1BXo
 en5Ksotq5/CLa6383m4GMt+AFNIy+tDt6uvkwDqqmeJpvtvpXbS2BwojP+IBWgj+XM1Q
 u+HpP6TbNg7U7D3KXgxt/BAcmTwluy/oJg+8xDdzySPCzmC0HBRubzlVNmxsFcG+sPs3
 0t9fjEMpHnG0zUNmWv9hxL6qbh5LsjACCyElrs7p/aNXXU9wN6/3Buuf9ww0oBUH6j2R
 ldnQ==
X-Gm-Message-State: AOAM530JVdPd1jeLABsnGWzAdH+zjuRftOnTh+OCQCvDNunpBIcmgXoB
 ANUyALMrCh2RkGU1IEXVkdEYPLaLeL9SKdfQZMdt5yC6n0009rTJfqZjvmKGBWg/nwpByklOHFE
 J4ouJDxT6nQodPG8=
X-Received: by 2002:adf:d84c:: with SMTP id k12mr30718721wrl.24.1639385558248; 
 Mon, 13 Dec 2021 00:52:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzLdeNRL059AiSBJ2DkveF5FYx4P9n3kKoV0V/ThFu4mgZKjRyWRM8azAJc2VtL5wcbYsoFcw==
X-Received: by 2002:adf:d84c:: with SMTP id k12mr30718698wrl.24.1639385558018; 
 Mon, 13 Dec 2021 00:52:38 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id d6sm10188995wrx.60.2021.12.13.00.52.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 00:52:37 -0800 (PST)
Message-ID: <24b6cec6-792b-15a1-e47b-b9bd8f4263b7@redhat.com>
Date: Mon, 13 Dec 2021 09:52:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20211209103124.121942-1-thuth@redhat.com>
 <YbNDvwlKf4PeO1Ij@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH for-7.0] gitlab-ci: Add cirrus-ci based tests for NetBSD
 and OpenBSD
In-Reply-To: <YbNDvwlKf4PeO1Ij@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.713,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.093, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/2021 13.10, Daniel P. Berrangé wrote:
> On Thu, Dec 09, 2021 at 11:31:24AM +0100, Thomas Huth wrote:
>> Cirrus-CI provides KVM in their Linux containers, so we can also run
>> our VM-based NetBSD and OpenBSD build jobs there.
>> Since the VM installation might take a while, we only run the "help"
>> target on the first invocation to avoid timeouts, and then only check
>> the build during the next run, once the base image has been cached.
>> For the the build tests, we also only use very a limited set of target
>> CPUs since compiling in these VMs is not very fast (especially the
>> build on OpenBSD seems to be incredibly slow).
>> For the time being, the jobs are also marked as manually only, since
>> this double-indirect setup (with the cirrus-run script and VMs in
>> the Cirrus-CI containers) might fail more often than the other jobs.
> 
> I think they'll have to be manual forever basically unless
> something changes in cirrus.
> 
> Historically we've had trouble with the cirrus jobs timing out.
> This was ultimately a result of the fact that only 2 cirrus jobs
> can run concurrently, and we had duplicate jobs being scheduled
> on 'master' and 'staging'. This resulted in 4 jobs being queued
> and most of the time, and because each job took > 30 minutes,
> two of them would frequently hit the gitlab job 1 hour timeout.
> 
> Unless we can ensure that /all/ our cirrus jobs will reliably
> completed in about 20 minutes in normal case (30 mins if
> cirrus is being slow), then we can't have more than 2 cirrus
> jobs as one or more will end up going over the 1 hour cutoff.
> 
> The idea of having NetBSD/OpenBSD jobs is good, but I think
> it feels like a case where we're going to need to look at
> using custom runners if we want them trigger on 'staging'.
> 
> Manual jobs could be ok for contributors forks at most.

Agreed. I'll rephrase the last paragraph a little bit:

The jobs are marked as "manual" only, since this double-indirect setup (with 
the cirrus-run script and VMs in the Cirrus-CI containers) might fail more 
often than the other jobs, and since we can trigger a limited amount of 
Cirrus-CI jobs at a time anyway (due to the restrictions in the free tier of 
Cirrus). Thus these jobs are rather added as convenience for contributors 
who would like to run the NetBSD/OpenBSD tests without the need of 
downloading and installing the corresponding VM images on their local machines.

  Thomas


