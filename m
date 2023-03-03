Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B3B6A9C0B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 17:46:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY8XY-00014J-Hj; Fri, 03 Mar 2023 11:45:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pY8XO-0000za-1f
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:45:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pY8XM-0001LB-Ew
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:45:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677861939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S+s4/ia/kAB6DbKel+hAZvcgFpgNSjMkOl2LdmtG2lg=;
 b=Hs4YSRKIFfdojhMJe8kzeAmRusu8J6WniB+MeZ+Ik4X6RzvXtTNAiwz6AffWCUL7MwqNLV
 33Rlkz7EXyeKZDcwbSHkP3ZGe0BbekPWcjWBAd6hV6gna9+3CMT4/8VXbEuCfyQw2Ge9hj
 mhIX1nuwtETuKB1E9OPK6WxyYFti8lQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-5CHsFCUHPnqYlST67SCHcw-1; Fri, 03 Mar 2023 11:45:36 -0500
X-MC-Unique: 5CHsFCUHPnqYlST67SCHcw-1
Received: by mail-wm1-f71.google.com with SMTP id
 4-20020a05600c024400b003eb2e295c05so1178754wmj.0
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 08:45:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S+s4/ia/kAB6DbKel+hAZvcgFpgNSjMkOl2LdmtG2lg=;
 b=XMfOHyTcjiPLic5bGQnl+992eeVPa58oUzuSYG/CGDb2cjS0uGi49omDfaGpeaE1kz
 BgM3A9DE6g05WWJwEfqiLkz2i2GGtUJLntCK0fVfuECJfRrnlEvk9SByilk9rV654e9I
 y30mX5GB2WfBSUJdJOWyisep+YgaTqCGCuUhtBabDNtC3/mtxEIYvdfJ/xARoXEsSR+n
 VQRH9lXMpOiT01JzstrZWSFyimbsYf3zCAszj7+bV9ggVoP3b3pIIR6p5W8TaXVbwU11
 fls1BmMTxbVz3oFzg7hCamPokC8Uhe+7mpUTa+pQxZGhiZR3QNKVzTOAQG/D6kirrN35
 GP9A==
X-Gm-Message-State: AO0yUKUbMkMaJYNsJ9CLqwQfuaReRlwouZQIbHKdxHnu4jjFLcOEtnbK
 8vikANEstLPy0TxEvABPgP6vX4fofYdgSGjwfhTLRYboQ0+gB19W1WnFzEatzmHco4QKE2RnUEX
 Qc2yNcDIz/Cna/hg=
X-Received: by 2002:a5d:688c:0:b0:2c7:ea8:8afc with SMTP id
 h12-20020a5d688c000000b002c70ea88afcmr1515162wru.59.1677861935198; 
 Fri, 03 Mar 2023 08:45:35 -0800 (PST)
X-Google-Smtp-Source: AK7set/liEKovp0YuEX1RA6ivsWYmHd70VZhN+hIhal2eaOnFFkpuTUqnvK3h1WOTCV5WRLojyCdUw==
X-Received: by 2002:a5d:688c:0:b0:2c7:ea8:8afc with SMTP id
 h12-20020a5d688c000000b002c70ea88afcmr1515152wru.59.1677861934891; 
 Fri, 03 Mar 2023 08:45:34 -0800 (PST)
Received: from [192.168.8.103] (tmo-099-97.customers.d1-online.com.
 [80.187.99.97]) by smtp.gmail.com with ESMTPSA id
 m5-20020a5d56c5000000b002be505ab59asm2611105wrw.97.2023.03.03.08.45.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 08:45:34 -0800 (PST)
Message-ID: <f1f95ccd-b7b7-593d-a922-ada6097b789c@redhat.com>
Date: Fri, 3 Mar 2023 17:45:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 7/8] iotests: register each I/O test separately with
 meson
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230303160727.3977246-1-berrange@redhat.com>
 <20230303160727.3977246-8-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230303160727.3977246-8-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 03/03/2023 17.07, Daniel P. Berrangé wrote:
> Currently meson registers a single test that invokes an entire group of
> I/O tests, hiding the test granularity from meson. There are various
> downsides of doing this
> 
>   * You cannot ask 'meson test' to invoke a single I/O test
>   * The meson test timeout can't be applied to the individual
>     tests
>   * Meson only gets a pass/fail for the overall I/O test group
>     not individual tests
>   * If a CI job gets killed by the GitLab timeout, we don't
>     get visibility into how far through the I/O tests
>     execution got.
> 
> This switches meson to perform test discovery by invoking 'check' in
> dry-run mode. It then registers one meson test case for each I/O
> test. Parallel execution remains disabled since the I/O tests do not
> use self contained execution environments and thus conflict with
> each other.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   tests/qemu-iotests/meson.build | 35 ++++++++++++++++++++++++++++------
>   1 file changed, 29 insertions(+), 6 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


