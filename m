Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7326A6807
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 08:16:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXGgD-000373-SV; Wed, 01 Mar 2023 02:15:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pXGff-0002oM-59
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 02:14:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pXGfa-0006Q0-9Z
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 02:14:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677654873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v2QEBpwPNgq/Y/SIC0d9P/Jht3hesebq1EPx+baJhZA=;
 b=KI17N05z5P+zfqNUO8FGm13FKjANdz3+oaKUpPH/vAVtbdE7icl9JbyvugPMoQwDI5X94+
 kxp7ivOMKUaRX0piDR41UqSSTtI7B+eHJxzZ7QIsFdeyJqQ6G0ry2AjrsUxxvD3zkTHnsG
 S/hoPjwJ4hiVvVWXywNvaU4CO/5qr2M=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-615-a84GmpMmOM6ZxtikiTX3Yg-1; Wed, 01 Mar 2023 02:14:31 -0500
X-MC-Unique: a84GmpMmOM6ZxtikiTX3Yg-1
Received: by mail-wr1-f70.google.com with SMTP id
 d14-20020adfa34e000000b002bfc062eaa8so2294136wrb.20
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 23:14:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v2QEBpwPNgq/Y/SIC0d9P/Jht3hesebq1EPx+baJhZA=;
 b=wfcRUfzRWQ3Eoo1YuYyZcv3xG/LmtuS01tq9mhR6IcVsY5rHROis9ao3F/ssdfJVBj
 1saiwwy/otPFig66M5xUbUiIVXzjeIVEKQ1Nj50fgAyptGFZgX9ioCfxRH+giCK3QRpJ
 +8paiiZExJsTisI9wpvfP/P4Y5hu2OW0oGWJ433LkfeFcJTOaxIkn42V0NQnpVJLuoPw
 HJLxI4NxGQoGN6gRMkP7C00UCgADwuLYgPiTKTL+0ps3cAaSXNdMBnAnPDp4aRrB7fwv
 ya6kPlj3WPW7P0H7rE9q4UcmiQir73SqePanf5RZH30XwJM71++2TxosHuEB4iJQ5Oot
 SVqw==
X-Gm-Message-State: AO0yUKX27/OOkxDDz5/KXnrRRZ7qr2NLKeZfo0O73s+SqG6n/+V1/UON
 DWETC/yB+XVKmifndRvm3u+mf7WrNxJANWwtpQc5XFv5umo/T8hylT0q3CyCf3PPDHlZkHMJ1r9
 Nj1Pv5RWB4B8o+w4=
X-Received: by 2002:a05:600c:4d97:b0:3eb:29fe:f922 with SMTP id
 v23-20020a05600c4d9700b003eb29fef922mr3894051wmp.29.1677654870834; 
 Tue, 28 Feb 2023 23:14:30 -0800 (PST)
X-Google-Smtp-Source: AK7set8EiyMChfkFEsef7MCucGfC0HauNqt/wB0m7j8O/igekSUjp3t1OkDcMWKwmi/ufYva/3ODXA==
X-Received: by 2002:a05:600c:4d97:b0:3eb:29fe:f922 with SMTP id
 v23-20020a05600c4d9700b003eb29fef922mr3894022wmp.29.1677654870569; 
 Tue, 28 Feb 2023 23:14:30 -0800 (PST)
Received: from [192.168.8.100] (tmo-114-247.customers.d1-online.com.
 [80.187.114.247]) by smtp.gmail.com with ESMTPSA id
 m9-20020a05600c4f4900b003dec22de1b1sm16231030wmq.10.2023.02.28.23.14.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 23:14:29 -0800 (PST)
Message-ID: <72580c0e-353b-bb91-444e-b56d4c6ff7ba@redhat.com>
Date: Wed, 1 Mar 2023 08:14:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Peter Maydell
 <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Aurelien Jarno <aurelien@aurel32.net>, Markus Armbruster
 <armbru@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Darren Kenny <darren.kenny@oracle.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Ed Maste <emaste@freebsd.org>,
 qemu-arm@nongnu.org, Fam Zheng <fam@euphon.net>,
 Yonggang Luo <luoyonggang@gmail.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Bandan Das <bsd@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Laurent Vivier <lvivier@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
 <20230228190653.1602033-25-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v3 24/24] tests/avocado: disable BootLinuxPPC64 test in CI
In-Reply-To: <20230228190653.1602033-25-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.092, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 28/02/2023 20.06, Alex Bennée wrote:
> This test is exceptionally heavyweight (nearly 330s) compared to the
> two (both endians) TuxRun baseline tests which complete in under 160s.
> The coverage is slightly reduced but a more directed test could make
> up the difference.
> 
> tests/avocado/tuxrun_baselines.py:TuxRunBaselineTest.test_ppc64:
> 
> Overall coverage rate:
>    lines......: 9.6% (44110 of 458817 lines)
>    functions..: 16.5% (6767 of 41054 functions)
>    branches...: 6.0% (13395 of 222634 branches)
> 
> tests/avocado/boot_linux.py:BootLinuxPPC64.test_pseries_tcg:
> 
> Overall coverage rate:
>    lines......: 11.6% (53408 of 458817 lines)
>    functions..: 18.7% (7691 of 41054 functions)
>    branches...: 7.9% (17692 of 224218 branches)
> 
> So lets skip for GITLAB_CI and also unless AVOCADO_TIMEOUT_EXPECTED is
> specified by the user.

The explanation sounds somewhat implausible to me. AVOCADO_TIMEOUT_EXPECTED 
should be for jobs where we are not sure whether the job really finishes in 
time, e.g. when compiling QEMU with debug flags enabled, and not for jobs 
that simply run a little bit longer (in the latter case, it would be enough 
to simply bump the timeout setting a little bit if necessary). So did you 
check whether you really run into timeout issues here when compiling QEMU 
with debug flags?

Anyway, if you add AVOCADO_TIMEOUT_EXPECTED, then I think you don't need 
GITLAB_CI anymore, since we certainly don't set AVOCADO_TIMEOUT_EXPECTED in 
the gitlab CI.

  Thomas


