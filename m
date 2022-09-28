Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C45095EE177
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 18:14:13 +0200 (CEST)
Received: from localhost ([::1]:40562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odZhM-0007XM-MP
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 12:14:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odYvw-0003R4-5r
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 11:25:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odYvo-0007ei-CD
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 11:25:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664378702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cd3LLtqKmeXgJ6NDuTnMU4cbeK3FOtpKOnxb9+fp7FI=;
 b=IObR9nQVIvC0B+TnmPOiJgz8lLiLniNpwp6fdOjQidMMTnyrggWQBSt10HDWqelGhKq0ta
 0JJHSUTzbNnbMIVT8rewCfXxxN4YVkLGPQg7EXNQF/ibV99YlHFkJip06lWvn/hVVNqnh4
 wLiCF886ejIu1G4rBM+7m66xlePUlJ4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-91-wmNJwr8zPG62MlL53rhTcA-1; Wed, 28 Sep 2022 11:25:01 -0400
X-MC-Unique: wmNJwr8zPG62MlL53rhTcA-1
Received: by mail-wr1-f69.google.com with SMTP id
 h20-20020adfaa94000000b0022cc1de1251so1400384wrc.15
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 08:25:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=cd3LLtqKmeXgJ6NDuTnMU4cbeK3FOtpKOnxb9+fp7FI=;
 b=ws4IJA8e/zdrd2wIpDTkXJiAW8wcd+9PU9iupfyx3p83/LB3w033w1KyqyAwSb/NQ/
 IgIBH9kYPBzfMmhg/kZ4gfmjDu42f7dZlZfzfoTFnxousE0Mepsbah8PjPN4fA+OlEc3
 DPqYsia+1Y2IMsHYqxNKmyUUHxSgPKCJZZ+8dXCaj6MEJY+CeVJ8K+SqNpULMD6grRkm
 cjh/isqPn5uiXiOm6dJ2AlVxZyzEswHCv//eVw2R3WIMNaq/b0wsUZSDBG9U/F65I8N6
 ux2aZi+gGgejkwskC7PKCRRhWshGYamKIeGvC/nvQaEMh8UhQQ2F8gLQ+13s2FYy7F9V
 RXWw==
X-Gm-Message-State: ACrzQf3fj6i6npazo6ijNRnlSTfJwuHKn5edmPHRaXK5bnwqN+9mQDP/
 dOO86kqYAAedVSbth4XdSA6S1nNeFk5KoHyLBCfrXP5DXj8f2SZJjBkWvpuuC25antRpXj+TsXv
 22H+s5V+balEjlnY=
X-Received: by 2002:a5d:4f0d:0:b0:22c:c7c1:aa07 with SMTP id
 c13-20020a5d4f0d000000b0022cc7c1aa07mr2893549wru.401.1664378700632; 
 Wed, 28 Sep 2022 08:25:00 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7kgWwAFKG2Ecb9/TlMSOIe9sV+mlRmjvnGrDsUNFM3ChM3XDpr5ayuUhbkCtw7lH8V2TwxMA==
X-Received: by 2002:a5d:4f0d:0:b0:22c:c7c1:aa07 with SMTP id
 c13-20020a5d4f0d000000b0022cc7c1aa07mr2893497wru.401.1664378700379; 
 Wed, 28 Sep 2022 08:25:00 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-89.web.vodafone.de.
 [109.43.176.89]) by smtp.gmail.com with ESMTPSA id
 e12-20020adffc4c000000b0022ad393ba3csm4336552wrs.107.2022.09.28.08.24.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 08:24:59 -0700 (PDT)
Message-ID: <4cb2dea7-6c3d-4b4c-647d-979889bddc9c@redhat.com>
Date: Wed, 28 Sep 2022 17:24:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 00/54] tests/qtest: Enable running qtest on Windows
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Alexander Bulekov <alxndr@bu.edu>, Andrew Jeffery <andrew@aj.id.au>,
 Ani Sinha <ani@anisinha.ca>, Bandan Das <bsd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Coiby Xu
 <Coiby.Xu@gmail.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Fam Zheng <fam@euphon.net>,
 Gerd Hoffmann <kraxel@redhat.com>, Greg Kurz <groug@kaod.org>,
 Hanna Reitz <hreitz@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Joel Stanley <joel@jms.id.au>,
 John Snow <jsnow@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Konstantin Kostiuk <kkostiuk@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
 <23ed00ab-d774-81bb-5cf1-5cd077480720@redhat.com>
In-Reply-To: <23ed00ab-d774-81bb-5cf1-5cd077480720@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 28/09/2022 12.31, Thomas Huth wrote:
> On 27/09/2022 13.05, Bin Meng wrote:
>> In preparation to adding virtio-9p support on Windows, this series
>> enables running qtest on Windows, so that we can run the virtio-9p
>> tests on Windows to make sure it does not break accidently.
> 
> Thanks for your patches - I've picked many of them for my pull request that 
> I sent out earlier today, so you don't have to carry them along anymore once 
> the PR got merged.
> 
> For the patches that are not directly related to tests/ ... could you maybe 
> ask the corresponding maintainers to pick those up? I'm not sure whether 
> they should go through my testing branch, too...
> 
> Anyway, there seems to be one more issue: The migration test sometimes seems 
> to be failing on aarch64 with all your patches applied:
> 
> 87/470 qemu:qtest+qtest-aarch64 / qtest-aarch64/migration-test             
> ERROR          261.71s   killed by signal 6 SIGABRT
>  >>> MALLOC_PERTURB_=171 QTEST_QEMU_BINARY=./qemu-system-aarch64 
> QTEST_QEMU_IMG=./qemu-img 
> G_TEST_DBUS_DAEMON=/home/thuth/devel/qemu/tests/dbus-vmstate-daemon.sh 
> QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon 
> /home/thuth/tmp/qemu-build/tests/qtest/migration-test --tap -k
> ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
> stderr:
> **
> ERROR:../../devel/qemu/tests/qtest/migration-helpers.c:205:wait_for_migration_status: 
> assertion failed: (g_test_timer_elapsed() < MIGRATION_STATUS_WAIT_TIMEOUT)
> ../../devel/qemu/tests/qtest/libqtest.c:201: kill_qemu() tried to terminate 
> QEMU process but encountered exit status 1 (expected 0)
> 
> (test program exited with status code -6)
> ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
> 
> Not sure whether it's really related to your patches or whether it's 
> something else that has been merged recently, I'm having problems to 
> reproduce it reliably, but it's definitely something we should keep an eye 
> on...

Seems like somebody also ran into this issue with a vanilla QEMU:

  https://gitlab.com/qemu-project/qemu/-/issues/1230

So it's not related to your patch series.

  Thomas



