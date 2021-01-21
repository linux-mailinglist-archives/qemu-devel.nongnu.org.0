Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 224CD2FEF59
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 16:46:43 +0100 (CET)
Received: from localhost ([::1]:35672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2cAU-0002k1-69
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 10:46:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2c8j-00027f-Oc
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 10:44:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2c8h-0005xw-1w
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 10:44:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611243888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fCN3FHwdX+Qad5Bjmgqb6HrN52OSf9FfMxasJCjpAYw=;
 b=bC26/pwX97GU9JHZpcOzZbgMp9siiljfHflJx3t1mDVh88ZMWIVUr8fmWMg2i96UNM7axL
 SsZJBZcZFrlPe/dEQX0AeVIG1WvKIk+donkZ5txoa4njNSpMAQ1UNZA/pxhncmL9zkND7x
 SMOY41wa84gvmq60lhFcfFVq5mBfDyE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-iQaZN8DzPEyO1F1_w_cFHA-1; Thu, 21 Jan 2021 10:44:46 -0500
X-MC-Unique: iQaZN8DzPEyO1F1_w_cFHA-1
Received: by mail-ej1-f70.google.com with SMTP id b18so922862ejz.6
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 07:44:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fCN3FHwdX+Qad5Bjmgqb6HrN52OSf9FfMxasJCjpAYw=;
 b=LFsLpUWtP3TYa/+t9sm/XPsFyP5ZO1NZyciFyWToWCHaFeR4ADMNXmjmfdeQ8iNnw3
 TK6CS5Sz1YvOTFXpAiS+hiXoOSJu3H3LNRvPsnd7CBCtipO8MDdu7GflH4ZR01tD07rG
 rFvbFG95gCHjiq7jRDD598JrsXEiVv09kfsGkhQAx6IaJ0whssFop1ATt6LGzFv/1rXA
 8j+ipW4BssELHcoxJBSfDr8nrEodhGTytTfrbhiHQCiZxBMKhF5dyYkocH307hRv2u3Y
 BNBv0QpxANpdhUYHLLBuo2Aznc3QoaZ7aRcSjaWk6g6m/EfGgNFRIa227PNNkbeiHhlY
 Vbbw==
X-Gm-Message-State: AOAM531z+3dGW/uFA6pbdic4pHUHj2Jof0zBMtC4TeI7gczUjbbQYtfu
 +0TVnzXfhmhBjIr7h0lAHKZbiN60ZQJC8MW3Dx60DLU6cLwc/4egf+Y/r+RCzY2HRaQaN8eHKpw
 uXrAoCC2sxgo9WEQ=
X-Received: by 2002:a17:907:c2a:: with SMTP id
 ga42mr27515ejc.511.1611243885427; 
 Thu, 21 Jan 2021 07:44:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwu5Tn+i8MMbLPsR8HspdLZNdLsHWXqPxA93icsCsO33TELALQlSkECWiiVSg6hHFiLD+8ClA==
X-Received: by 2002:a17:907:c2a:: with SMTP id
 ga42mr27507ejc.511.1611243885267; 
 Thu, 21 Jan 2021 07:44:45 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id a10sm2375136ejk.75.2021.01.21.07.44.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 07:44:44 -0800 (PST)
Subject: Re: [PATCH] tests: Fix memory leak in tpm-util.c
To: Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-devel@nongnu.org
References: <20210115204637.3332555-1-stefanb@linux.vnet.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9c97a694-e7c3-7fb2-10e6-9310055dac30@redhat.com>
Date: Thu, 21 Jan 2021 16:44:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210115204637.3332555-1-stefanb@linux.vnet.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/15/21 9:46 PM, Stefan Berger wrote:
> This patch fixes the following memory leak detected by asan:
> 
> Indirect leak of 560320 byte(s) in 136 object(s) allocated from:
>     #0 0x556b3b3f9b57 in calloc (/home/stefanb/tmp/qemu-tip/build/tests/qtest/tpm-crb-swtpm-test+0x23fb57)
>     #1 0x152b0e96b9b0 in g_malloc0 (/lib64/libglib-2.0.so.0+0x589b0)
>     #2 0x556b3b588f61 in parse_object /home/stefanb/tmp/qemu-tip/build/../qobject/json-parser.c:318:12
>     #3 0x556b3b588f61 in parse_value /home/stefanb/tmp/qemu-tip/build/../qobject/json-parser.c:546:16
>     #4 0x556b3b5886e8 in json_parser_parse /home/stefanb/tmp/qemu-tip/build/../qobject/json-parser.c:580:14
>     #5 0x556b3b52ff4a in json_message_process_token /home/stefanb/tmp/qemu-tip/build/../qobject/json-streamer.c:92:12
>     #6 0x556b3b59896f in json_lexer_feed_char /home/stefanb/tmp/qemu-tip/build/../qobject/json-lexer.c:313:13
>     #7 0x556b3b598443 in json_lexer_feed /home/stefanb/tmp/qemu-tip/build/../qobject/json-lexer.c:350:9
>     #8 0x556b3b436c70 in qmp_fd_receive /home/stefanb/tmp/qemu-tip/build/../tests/qtest/libqtest.c:614:9
>     #9 0x556b3b435871 in qtest_qmp_receive_dict /home/stefanb/tmp/qemu-tip/build/../tests/qtest/libqtest.c:636:12
>     #10 0x556b3b435871 in qtest_qmp_receive /home/stefanb/tmp/qemu-tip/build/../tests/qtest/libqtest.c:624:27
>     #11 0x556b3b435c59 in qtest_vqmp /home/stefanb/tmp/qemu-tip/build/../tests/qtest/libqtest.c:715:12
>     #12 0x556b3b435c59 in qtest_qmp /home/stefanb/tmp/qemu-tip/build/../tests/qtest/libqtest.c:756:16
>     #13 0x556b3b4328c7 in tpm_util_wait_for_migration_complete /home/stefanb/tmp/qemu-tip/build/../tests/qtest/tpm-util.c:245:15
>     #14 0x556b3b4333be in tpm_test_swtpm_migration_test /home/stefanb/tmp/qemu-tip/build/../tests/qtest/tpm-tests.c:117:5
>     #15 0x152b0e98e29d  (/lib64/libglib-2.0.so.0+0x7b29d)
> 
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  tests/qtest/tpm-util.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Thanks!

Phil.


