Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CB836191C
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 07:13:00 +0200 (CEST)
Received: from localhost ([::1]:55108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXGmp-0000jC-Qr
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 01:12:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lXGl8-0008FZ-2u
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 01:11:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lXGl6-0006t4-CE
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 01:11:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618549871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FsfStsg8Iy1fV1kiEhVrWpvCT2Tl9ugB/Bscp0bzz0I=;
 b=X2HPJiUNLWZRRVrK4z2fqzYGO0YNhh1jfNl4IjBKDVuxUxrt/KwXB0VBcxIF/HPnpR0Cdi
 +XN9fVhL4MvA71uuQIV8+iCyFcK96sdo92lYLizw8/VtKH5UBP5pjN95EN5wNme2G2uq3A
 Uigg06OSbHseiIXQnRiiDELt9vWsQjQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-EqGnJ2LmPBKt02O5L-jlmg-1; Fri, 16 Apr 2021 01:11:08 -0400
X-MC-Unique: EqGnJ2LmPBKt02O5L-jlmg-1
Received: by mail-wr1-f70.google.com with SMTP id
 s7-20020adfc5470000b0290106eef17cbdso445709wrf.11
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 22:11:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FsfStsg8Iy1fV1kiEhVrWpvCT2Tl9ugB/Bscp0bzz0I=;
 b=oKN47HFGPkg+KuDDGoZzHUVrkHJhxZT2RQ/n6v6qAIFGxWSn0ulhUr49OMdQCHMsi9
 M13xloxdLpSpx18pTsE6PZ2ZA5/XftKsmiXTSA/xaMFoevSjWh+RjtQxJg+AzPcWC9k8
 NNgKm4ITuL5dr5WTmW/k28Yow+Hz+jKKcGCywsdCbp03cuB+SEmDuqkwAElpPfhPePqf
 ez7/X8PurkLXXzFq8wecX8ByTWT3wlBnsoKbfFbQW5oiY5JUFMZwtpnvcaJxTGsLv9xo
 wzPVm5jZB2eqOw7LXZL5putWMw+PF7vz07/hvOeml2x9crg9bOj2ONmeu8S+VvWM2+la
 z7vQ==
X-Gm-Message-State: AOAM533MgGe3Z9DvKNUdt7F5jZPJ6xGpZWi/oDyZ4+PHUH81uIdJjTbc
 ZAxhTkSqbaSHzd2DQIkX4IkESFh9PACT/urmUfxavXy+XGja8OAfYgUkdkzuYvfQqV6DA3r/NVS
 1lKV3xcum7fgHV2g=
X-Received: by 2002:a7b:cbc1:: with SMTP id n1mr6252749wmi.50.1618549867067;
 Thu, 15 Apr 2021 22:11:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjUwuXep2jZxGcaAN9LgGIsE+eU0nP3OdUzzhm0QA0+wFgakZLyvpI9b8fmV9WsAEnTwvRlg==
X-Received: by 2002:a7b:cbc1:: with SMTP id n1mr6252718wmi.50.1618549866842;
 Thu, 15 Apr 2021 22:11:06 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id c16sm7831014wrt.83.2021.04.15.22.11.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Apr 2021 22:11:06 -0700 (PDT)
Subject: Re: [PATCH 4/8] tests/acceptance/migration.py: cancel test if
 migration is not supported
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210415215141.1865467-1-crosa@redhat.com>
 <20210415215141.1865467-5-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <68f215a3-10cc-d348-0512-8a5cf64b77a5@redhat.com>
Date: Fri, 16 Apr 2021 07:11:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210415215141.1865467-5-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Auger Eric <eric.auger@redhat.com>,
 qemu-s390x@nongnu.org, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/21 11:51 PM, Cleber Rosa wrote:
> FIXME: check if there's a way to query migration support before
> actually requesting migration.
> 
> Some targets/machines contain devices that do not support migration.
> Let's acknowledge that and cancel the test as early as possible.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/migration.py | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/acceptance/migration.py b/tests/acceptance/migration.py
> index 792639cb69..25ee55f36a 100644
> --- a/tests/acceptance/migration.py
> +++ b/tests/acceptance/migration.py
> @@ -53,7 +53,11 @@ def do_migrate(self, dest_uri, src_uri=None):
>          source_vm = self.get_vm()
>          source_vm.add_args('-nodefaults')
>          source_vm.launch()
> -        source_vm.qmp('migrate', uri=src_uri)
> +        response = source_vm.qmp('migrate', uri=src_uri)
> +        if 'error' in response:
> +            if 'desc' in response['error']:
> +                msg = response['error']['desc']
> +            self.cancel('Migration does not seem to be supported: %s' % msg)
>          self.assert_migration(source_vm, dest_vm)

It would be better to have this done as a generic check_requisites()
method. First because we could reuse it (also at the class level),
second because we could account the time spent for checking separately
from the time spent for the actual testing.


