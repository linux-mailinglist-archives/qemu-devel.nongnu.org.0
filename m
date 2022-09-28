Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 647E05EDE79
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 16:10:09 +0200 (CEST)
Received: from localhost ([::1]:48892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odXlI-0000Uv-63
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 10:10:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odUMM-0004RH-Uy
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 06:32:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odUM9-0004IC-DE
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 06:32:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664361112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r072hw4nq7j220SZv7l4j1oheSWPZXuwuBycfvaaNz0=;
 b=etCOLtZEaiylKiFH+B9D7Zkfy6fqB9oLKPD+W7OCgoiqr6Q5c8Ci+MxSv+8QSROJQLV9PA
 KN3yvcXC0tOo1qYkPrQ9OZvK1sGDzT7IWHezQm1cZao+DgwC0WlUbMOpW+9ox0E7RltaK3
 7hnfuKRIfvp4BKl6imypkCOEsakFnDo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-217-vXUmzF2tMjSYBkzj2Lvd5w-1; Wed, 28 Sep 2022 06:31:50 -0400
X-MC-Unique: vXUmzF2tMjSYBkzj2Lvd5w-1
Received: by mail-wr1-f69.google.com with SMTP id
 l5-20020adfa385000000b0022a482f8285so2852541wrb.5
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 03:31:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=r072hw4nq7j220SZv7l4j1oheSWPZXuwuBycfvaaNz0=;
 b=fVG6nUl1VSX/9EFOHKWujDxFgMfo0fo3jLKixUrCA7A9xqLCBXQYwwDqB3z79KsldP
 vCYOilRpdmfLQGLTNN+yheNMaIK4DPapQrCvjlVjjR/j0+qhLuvv/lLlKxVaKho8FO6i
 mdotcy6bche5s5VbFjtCWaBYO0LxPkP3uQOXQ/7N79FNfQq2m8BJpfzIu0F+AVIUXP+e
 qCeuP9lxoxh62Hq0beEQ0aghN+gyyRQaAO8sTwlv5HHDLcaZh/59r7As7XHr3HUmY8se
 XWY+1fLTRs522gV9iiLikZ1MFozXqxIjYF4BBJfv3ZzoVJkg6KyIpZruAi0bIOV2Njbp
 rqcg==
X-Gm-Message-State: ACrzQf1XbGe6upNfWGyz4+H1Ij8zgspSTmTuVparRMWe/1gvTxe+/n+E
 KLGyZNZrvGXNs0TpkB0t4iG+jjDV6a9JwPaBEu095h+EOAtuBujdoJdB0AbVtIQ6drzg8Mro1T/
 ur/yEwNJgyMxvISo=
X-Received: by 2002:a05:600c:4f45:b0:3b4:9c9a:7077 with SMTP id
 m5-20020a05600c4f4500b003b49c9a7077mr6399727wmq.109.1664361109798; 
 Wed, 28 Sep 2022 03:31:49 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5rdmyBZ41WUXM+jMY+xZGanRIRHnBeMi3h3nRHLD7jt0qpo6W7Fy/AxS8OUPuoFFPNLgOfNw==
X-Received: by 2002:a05:600c:4f45:b0:3b4:9c9a:7077 with SMTP id
 m5-20020a05600c4f4500b003b49c9a7077mr6399679wmq.109.1664361109578; 
 Wed, 28 Sep 2022 03:31:49 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-89.web.vodafone.de.
 [109.43.176.89]) by smtp.gmail.com with ESMTPSA id
 q17-20020adff511000000b002253fd19a6asm4955356wro.18.2022.09.28.03.31.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 03:31:48 -0700 (PDT)
Message-ID: <23ed00ab-d774-81bb-5cf1-5cd077480720@redhat.com>
Date: Wed, 28 Sep 2022 12:31:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
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
 Willian Rampazzo <willianr@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 qemu-arm@nongnu.org, qemu-block@nongnu.org
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v4 00/54] tests/qtest: Enable running qtest on Windows
In-Reply-To: <20220927110632.1973965-1-bmeng.cn@gmail.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/09/2022 13.05, Bin Meng wrote:
> In preparation to adding virtio-9p support on Windows, this series
> enables running qtest on Windows, so that we can run the virtio-9p
> tests on Windows to make sure it does not break accidently.

Thanks for your patches - I've picked many of them for my pull request that 
I sent out earlier today, so you don't have to carry them along anymore once 
the PR got merged.

For the patches that are not directly related to tests/ ... could you maybe 
ask the corresponding maintainers to pick those up? I'm not sure whether 
they should go through my testing branch, too...

Anyway, there seems to be one more issue: The migration test sometimes seems 
to be failing on aarch64 with all your patches applied:

87/470 qemu:qtest+qtest-aarch64 / qtest-aarch64/migration-test 
             ERROR          261.71s   killed by signal 6 SIGABRT
 >>> MALLOC_PERTURB_=171 QTEST_QEMU_BINARY=./qemu-system-aarch64 
QTEST_QEMU_IMG=./qemu-img 
G_TEST_DBUS_DAEMON=/home/thuth/devel/qemu/tests/dbus-vmstate-daemon.sh 
QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon 
/home/thuth/tmp/qemu-build/tests/qtest/migration-test --tap -k
―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
stderr:
**
ERROR:../../devel/qemu/tests/qtest/migration-helpers.c:205:wait_for_migration_status: 
assertion failed: (g_test_timer_elapsed() < MIGRATION_STATUS_WAIT_TIMEOUT)
../../devel/qemu/tests/qtest/libqtest.c:201: kill_qemu() tried to terminate 
QEMU process but encountered exit status 1 (expected 0)

(test program exited with status code -6)
―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――

Not sure whether it's really related to your patches or whether it's 
something else that has been merged recently, I'm having problems to 
reproduce it reliably, but it's definitely something we should keep an eye on...

  Thomas


