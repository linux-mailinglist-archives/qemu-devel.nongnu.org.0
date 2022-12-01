Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C401363EEBB
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 12:04:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0hMO-0004UZ-52; Thu, 01 Dec 2022 06:04:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p0hML-0004UB-F6
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 06:04:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p0hMJ-0008MS-JL
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 06:04:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669892642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HEql+jLAZI1PBxCQjVqKsZL+NW2TOHnoTc4qZo3n1f0=;
 b=epANjPlNQg5hPWRl+WL+4bIpm/HZo5vCWopF1SEWEJAufSILcrvo0RcI/k6q9Fp0tOyxIm
 L11fmXJkoJ1qrC/pKz0itaoBVcXeFhd+uTqYNU1Bt+82t81W+BJMTGTqTzIvedHV7ypwHD
 odZ/7cNfXmx2LPDuMvcorX6q912oY80=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-396-5yN2NMSRP8GyWWA03a9xTw-1; Thu, 01 Dec 2022 06:04:01 -0500
X-MC-Unique: 5yN2NMSRP8GyWWA03a9xTw-1
Received: by mail-wm1-f70.google.com with SMTP id
 c26-20020a05600c0ada00b003d07fd2473bso308656wmr.9
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 03:04:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HEql+jLAZI1PBxCQjVqKsZL+NW2TOHnoTc4qZo3n1f0=;
 b=jEwyArujBXWW/0QyJ+O7/dRRebbXw6FeoRJJFhYnS9eABSe/IOqwXkMvsdM7dRaNmO
 68xdIWI0WjZYC9z7E6h5H73ZlZEWqoPQAYaRZwd9cpuk9tO8qombNqM6SlvDL0je30qP
 N3oXMkqzSE35k+gqxEKRD2+DziMC+lmxKJAos0sqz5I9XZqElyobOD5ug1s/8yyXDUQ2
 DXc4lqDeKpJlW+h2KCfLzfFk5MPUtBldRLwGaWGIdI1aSecWIYi0s9te7zxrP3+UFVNA
 GTLSWjy2UGFVRDubUxH08iE/jMzt33s7g5lwKL4m22rH6xwjKaRz0N8LuOk7CV0yVJ4Q
 5JbA==
X-Gm-Message-State: ANoB5pnYhxmy70P/sUfwJfaq99cC+enybynP77Vbvo6m+loAW9FjQ+uS
 i+o2mGcHV495cTAF6RYVbgke1N2dI35MsgJXOy8ovKLR75fGg5O5CbY4RfG8sDpUeDvRP7nAHoN
 JsmY7A2nnG6FBJZk=
X-Received: by 2002:a05:6000:1e1b:b0:242:29d7:1004 with SMTP id
 bj27-20020a0560001e1b00b0024229d71004mr5139517wrb.208.1669892640329; 
 Thu, 01 Dec 2022 03:04:00 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6RP0tV7Ub79CXRO2hFb1l81Upf34HBROraxaxqisi8MWqu7Ja9E9MrI7HfXhbpO5Afm7dTcw==
X-Received: by 2002:a05:6000:1e1b:b0:242:29d7:1004 with SMTP id
 bj27-20020a0560001e1b00b0024229d71004mr5139500wrb.208.1669892640076; 
 Thu, 01 Dec 2022 03:04:00 -0800 (PST)
Received: from [192.168.8.102] (tmo-073-221.customers.d1-online.com.
 [80.187.73.221]) by smtp.gmail.com with ESMTPSA id
 e18-20020a5d4e92000000b0024206ed539fsm4009749wru.66.2022.12.01.03.03.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Dec 2022 03:03:59 -0800 (PST)
Message-ID: <2ff3f1f2-ac25-294c-c994-78474fa5eab4@redhat.com>
Date: Thu, 1 Dec 2022 12:03:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] tests/qtest/vhost-user-blk-test: don't abort all qtests
 on missing envar
Content-Language: en-US
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
Cc: Coiby Xu <coiby.xu@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <E1oybRD-0005D5-5r@lizzy.crudebyte.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <E1oybRD-0005D5-5r@lizzy.crudebyte.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.257, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 25/11/2022 16.58, Christian Schoenebeck wrote:
> This test requires environment variable QTEST_QEMU_STORAGE_DAEMON_BINARY
> to be defined for running. If not, it would immediately abort all qtests
> and prevent other, unrelated tests from running.
> 
> To fix that, just skip vhost-user-blk-test instead and log a message
> about missing environment variable.
> 
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
> 
>   I also tried g_test_skip(errmsg) from the setup handlers instead, but it
>   always caused the tests to abort with an error:
>   
>   ../tests/qtest/libqtest.c:179: kill_qemu() tried to terminate QEMU process
>   but encountered exit status 1 (expected 0)
>   
>   I haven't further investigated.
> 
>   tests/qtest/vhost-user-blk-test.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/tests/qtest/vhost-user-blk-test.c b/tests/qtest/vhost-user-blk-test.c
> index 07a4c2d500..dc37f5af4d 100644
> --- a/tests/qtest/vhost-user-blk-test.c
> +++ b/tests/qtest/vhost-user-blk-test.c
> @@ -983,6 +983,12 @@ static void register_vhost_user_blk_test(void)
>           .before = vhost_user_blk_test_setup,
>       };
>   
> +    if (!getenv("QTEST_QEMU_STORAGE_DAEMON_BINARY")) {
> +        g_test_message("QTEST_QEMU_STORAGE_DAEMON_BINARY not defined, "
> +                       "skipping vhost-user-blk-test");
> +        return;
> +    }

Could we use g_test_skip() here?

  Thomas



