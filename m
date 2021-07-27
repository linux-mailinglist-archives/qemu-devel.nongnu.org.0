Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2783D6EB6
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 08:07:00 +0200 (CEST)
Received: from localhost ([::1]:37410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8GF1-0002JA-L6
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 02:06:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m8GDf-0001bu-38
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 02:05:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m8GDZ-0005cK-CU
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 02:05:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627365928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SUKV0GDnGN3A2A1qYOR3nx3391n/yZTGC48YAkRDn7s=;
 b=NhJU7gr1/7LS9DC2HW/1heGJu634eNbI9JfuNOw6NqJQJWjyUaHg5B8l2oe6bT6F6AdJtt
 rcFZ/lSLEWPFxR+TZrvcyBNYTmeZTmhRP3ZKkxr/nRXHFuwmyUcpmoFwlMdX4aAX/1I4y9
 VoSAArxi9LaSiXwDXIfQ9A8bGIWblXQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-akU8sEAENpi1Qj0HW1qKvg-1; Tue, 27 Jul 2021 02:05:26 -0400
X-MC-Unique: akU8sEAENpi1Qj0HW1qKvg-1
Received: by mail-wr1-f69.google.com with SMTP id
 f6-20020adfe9060000b0290153abe88c2dso1285529wrm.20
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 23:05:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SUKV0GDnGN3A2A1qYOR3nx3391n/yZTGC48YAkRDn7s=;
 b=HqrpA/CzSTAV8sPCUwzjndfAhwKO9geJEqtmXrQ019ImoiPlQBSiosCIGP1Gywb+5I
 SEFAoQDQCKfMRH72bgGT2PThvquNQOBJz+PInCTMWtKUTF8ww8ndDqu0Rp9VDvlSuqZW
 akupjYt8WM6t/ZfJO4OwdllhzDbrInWM9aZKcqSyZITjUjl4jZcnntxvS7HrE0IMZp2l
 QEWRjgVXsSI0UV3gKLieS3Vg2gf74NRt5QP49hhe+9veDuXXFpdEFHV9l6eqbYudIIN+
 0r6q0C40l9ksnRPJSQVfGCnbiGyR4dVMo8wq5su9lz91rSVsMUQVlCAEQLbnCDEZd4TN
 ighQ==
X-Gm-Message-State: AOAM531kWP4dPFsgZ7o0nUSSZwzMk3iZDZqJEMxlIkdyOTvcM1bnUWdh
 AMXvI8p8y4BLolmtLCCCh/c6df8s6apaVmAands64gI9/+bn6RSY+IeSVhrzczAAQ0mUvfGxmWo
 F3YhCDeU5549llNo=
X-Received: by 2002:adf:f110:: with SMTP id r16mr22609378wro.358.1627365925765; 
 Mon, 26 Jul 2021 23:05:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGolVjOh1wvzk5mVc7dZqfM4avSaardUbsftGsw02KZbg9ZIoUmO50N/lhIs+TQgcRr4UbAA==
X-Received: by 2002:adf:f110:: with SMTP id r16mr22609361wro.358.1627365925586; 
 Mon, 26 Jul 2021 23:05:25 -0700 (PDT)
Received: from thuth.remote.csb (pd9575250.dip0.t-ipconnect.de. [217.87.82.80])
 by smtp.gmail.com with ESMTPSA id q17sm1969197wre.3.2021.07.26.23.05.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jul 2021 23:05:25 -0700 (PDT)
Subject: Re: [PATCH-for-6.1 v4 2/4] gitlab-ci: Fix 'when:' condition in
 acceptance_test_job_template
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210726150429.1216251-1-philmd@redhat.com>
 <20210726150429.1216251-3-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <bd8736a4-4db8-f3bb-f937-6d44d90a526c@redhat.com>
Date: Tue, 27 Jul 2021 08:05:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210726150429.1216251-3-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.438, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/07/2021 17.04, Philippe Mathieu-Daudé wrote:
> Jobs depending on another should not use the 'when: always'
> condition, because if a dependency failed we should not keep
> running jobs depending on it. The correct condition is
> 'when: on_success'.
> 
> Fixes: f56bf4caf71 ("gitlab: Run Avocado tests manually (except mainstream CI)")
> Reported-by: Daniel P. Berrangé <berrange@redhat.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   .gitlab-ci.d/buildtest-template.yml | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
> index 3e3e19d96bd..fcbcc4e627a 100644
> --- a/.gitlab-ci.d/buildtest-template.yml
> +++ b/.gitlab-ci.d/buildtest-template.yml
> @@ -73,9 +73,9 @@
>       # in its namespace setting or via git-push option, see documentation
>       # in /.gitlab-ci.yml of this repository).
>       - if: '$CI_PROJECT_NAMESPACE == "qemu-project"'
> -      when: always
> +      when: on_success
>       - if: '$QEMU_CI_AVOCADO_TESTING'
> -      when: always
> +      when: on_success
>       # Otherwise, set to manual (the jobs are created but not run).
>       - when: manual
>         allow_failure: true
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


