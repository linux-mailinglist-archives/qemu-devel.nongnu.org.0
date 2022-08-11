Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEB158FD22
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 15:13:44 +0200 (CEST)
Received: from localhost ([::1]:59576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM80N-0000aF-CM
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 09:13:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oM7g4-0001MC-Fl
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 08:52:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oM7g1-0007Xh-5u
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 08:52:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660222359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ccHKV60GUy43jU9rl4e6LjFMRT/GAai6MdkD4oo/FDM=;
 b=BijjSc3y4c8lI6ruBgExGWfAaadHbyRf/m5U7bP4uc7FQr95Hd6CJFnylBW4DuQVIzeWQp
 GL1a2P4vueSnowj0hx0rlJ10u+GOIVqISq9y2h20BPG1nZXolf56PA75LijGtf6QxBub0/
 uSfKW6aJqeTeZKfCe6W3P1lXPm7dcyc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-668-BajT4HcsO6eSdiYAucVJNg-1; Thu, 11 Aug 2022 08:52:37 -0400
X-MC-Unique: BajT4HcsO6eSdiYAucVJNg-1
Received: by mail-wr1-f71.google.com with SMTP id
 k21-20020adfb355000000b0022079dc2559so2670640wrd.4
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 05:52:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=ccHKV60GUy43jU9rl4e6LjFMRT/GAai6MdkD4oo/FDM=;
 b=71Xf/rbyY1dagc3QgC2yem9P6ZVg8sx59l+Vgp1KR9tParxHaHNPrIRT7CAxKEnIVY
 ttRtdlTGaRMvWoOk+JFThWt0/dGitKFXleRpujvPwLynGdKfg/W1Q37eWaJRz3NDDPAO
 j7kS1/j1Hzb4AVeBqckY3fKoEQNAIuqpmde2lq7gbkFkg6pZs2WgmjwFKjhsHbIj3CIa
 t+m26YIW89YDDJDJmHOaAXjSwQ6cnfo85JPQUkDY69mt5mnU8J/7xZ9hMWfLYgacjFRs
 zOpc4D0qBAzQDW0sz0TMhH1lmI8aGeNIoeHiImgYoDaMiZTEmiHhV5CI7PqxfAhdODRj
 BDbw==
X-Gm-Message-State: ACgBeo3RsVm55AftCq2s/LRPjGTsgLybUZHl17czsfrxIgpoSZA7iNvx
 WV/aCEUDqic4AIOjHnw0QqiDx35l36XaXX+ecWB9xrj/jtTAy4TwcOMf0AZstGGfHUDurQizLbX
 8++ds1kB4YAO5Lh0=
X-Received: by 2002:a5d:64e5:0:b0:220:7859:7bc with SMTP id
 g5-20020a5d64e5000000b00220785907bcmr18788670wri.669.1660222356750; 
 Thu, 11 Aug 2022 05:52:36 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7gaBV7mIJu9yk69aGmTrdJwTF3MhfFPuzS82xXMiFSbDWF4gQ0mkJVJpcyVdG52+GOF/WjpA==
X-Received: by 2002:a5d:64e5:0:b0:220:7859:7bc with SMTP id
 g5-20020a5d64e5000000b00220785907bcmr18788661wri.669.1660222356534; 
 Thu, 11 Aug 2022 05:52:36 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-42-115-19.web.vodafone.de.
 [109.42.115.19]) by smtp.gmail.com with ESMTPSA id
 p10-20020a05600c064a00b003a54f49c1c8sm5978048wmm.12.2022.08.11.05.52.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Aug 2022 05:52:36 -0700 (PDT)
Message-ID: <55aa1d93-f026-9a47-8502-96f648a37e4b@redhat.com>
Date: Thu, 11 Aug 2022 14:52:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] tests/qtest: misc tweaks to readconfig
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20220809093854.168438-1-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220809093854.168438-1-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 09/08/2022 11.38, Daniel P. Berrangé wrote:
> The property name parameter is ignored when visiting a top
> level type, but the obvious typo should be fixed to avoid
> confusion. A few indentation issues were tidied up. We
> can break out of the loop when finding the RNG device.
> Finally, close the temp FD immediately when no longer
> needed.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   tests/qtest/readconfig-test.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/qtest/readconfig-test.c b/tests/qtest/readconfig-test.c
> index 2e604d7c2d..c7a9b0c7dd 100644
> --- a/tests/qtest/readconfig-test.c
> +++ b/tests/qtest/readconfig-test.c
> @@ -33,13 +33,12 @@ static QTestState *qtest_init_with_config(const char *cfgdata)
>       g_assert_cmpint(cfgfd, >=, 0);
>   
>       ret = qemu_write_full(cfgfd, cfgdata, strlen(cfgdata));
> +    close(cfgfd);
>       if (ret < 0) {
>           unlink(cfgpath);
>       }
>       g_assert_cmpint(ret, ==, strlen(cfgdata));
>   
> -    close(cfgfd);
> -
>       args = g_strdup_printf("-nodefaults -machine none -readconfig %s", cfgpath);
>   
>       qts = qtest_init(args);
> @@ -79,7 +78,7 @@ static void test_x86_memdev(void)
>           "size = \"200\"";
>   
>       qts = qtest_init_with_config(cfgdata);
> -   /* Test valid command */
> +    /* Test valid command */
>       resp = qtest_qmp(qts, "{ 'execute': 'query-memdev' }");
>       test_x86_memdev_resp(qdict_get(resp, "return"));
>       qobject_unref(resp);
> @@ -96,7 +95,7 @@ static void test_spice_resp(QObject *res)
>   
>       g_assert(res);
>       v = qobject_input_visitor_new(res);
> -    visit_type_SpiceInfo(v, "spcie", &spice, &error_abort);
> +    visit_type_SpiceInfo(v, "spice", &spice, &error_abort);
>   
>       g_assert(spice);
>       g_assert(spice->enabled);
> @@ -114,7 +113,7 @@ static void test_spice(void)
>           "unix = \"on\"\n";
>   
>       qts = qtest_init_with_config(cfgdata);
> -   /* Test valid command */
> +    /* Test valid command */
>       resp = qtest_qmp(qts, "{ 'execute': 'query-spice' }");
>       test_spice_resp(qdict_get(resp, "return"));
>       qobject_unref(resp);
> @@ -144,6 +143,7 @@ static void test_object_rng_resp(QObject *res)
>           if (g_str_equal(obj->name, "rng0") &&
>               g_str_equal(obj->type, "child<rng-builtin>")) {
>               seen_rng = true;
> +            break;
>           }
>   
>           tmp = tmp->next;
> @@ -164,7 +164,7 @@ static void test_object_rng(void)
>           "id = \"rng0\"\n";
>   
>       qts = qtest_init_with_config(cfgdata);
> -   /* Test valid command */
> +    /* Test valid command */
>       resp = qtest_qmp(qts,
>                        "{ 'execute': 'qom-list',"
>                        "  'arguments': {'path': '/objects' }}");

Reviewed-by: Thomas Huth <thuth@redhat.com>


