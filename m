Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB38677E08
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 15:30:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJxpg-0002CB-86; Mon, 23 Jan 2023 09:30:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1pJxpe-0002BZ-4p
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 09:29:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1pJxpc-0006JY-GZ
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 09:29:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674484195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0SQptuAIaRNFz/bC88RVjgJ5Pcdv6KOz5lEQTL2fDNY=;
 b=XTp7gg1fFXlyebxEgHAW680OBxqHVoYF8uGyiN9UHqeDO7566jfZFDrcA5ql0mtu2/ZPr1
 uBmijEvqycJw1kULjsS6sISTUkogoyDB6otgi2688xCGcPxA+A3F+g88nkSnR7SBMu0QCw
 zTzrMF73P2FDRG7LQhFcFnj0oFtOqVw=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-562-GNFMAMSUMNicgrX73pOFCA-1; Mon, 23 Jan 2023 09:29:54 -0500
X-MC-Unique: GNFMAMSUMNicgrX73pOFCA-1
Received: by mail-qv1-f70.google.com with SMTP id
 y6-20020a0cec06000000b005346d388b7aso5947060qvo.6
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 06:29:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0SQptuAIaRNFz/bC88RVjgJ5Pcdv6KOz5lEQTL2fDNY=;
 b=Iu49kpygQnPHMsHaqFdu8BDWw7V2Ob+4an+S27XFEiIESufL5jNfIZekJz4EBnt9bQ
 CLB90S8UUPUC4LPu6D/MMAxzTtus4BWDx2W2X49YDuHU9Vl5U7C3CRLtRh7hc398ScO6
 mvgIugVFfmmTyLCFAr2eDJJY2I7cBKETXd/x6VRMyG+W2PU+TMpSQ9LcJPGn8cuxXLHo
 mkbOKjjlMGvCNcwN3q6zKUgcwJvw5qRubBd9kMHN4FccY05Fpm7hOv3gogcZPnW0fAsS
 9/MWJezo5w9ynsSEGSznACWb/kkCxNLnmyH1VGJUPJKS2dhom7ga1uj7kVSccp9Y+JBt
 buHg==
X-Gm-Message-State: AFqh2kqexJvltx4pHqWaJv6+ElUabOUSZCEDLxz6irbcIoC1GjDLva89
 f8hPdfHqpl0CElhisIBH6/I0CRUvwgpj5oyy25TuxuELOCjiAcZtn9hu0X5b53PLH5PMkLbqj0D
 O60KKNTvNtmTnORQ=
X-Received: by 2002:ac8:4443:0:b0:3b6:2ec0:69fe with SMTP id
 m3-20020ac84443000000b003b62ec069femr37384645qtn.40.1674484193802; 
 Mon, 23 Jan 2023 06:29:53 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvBHnpPqbKn034jwNpxJl5aH7Pqwsr3vroXGYh+8WCiqR5LRhQCCVrj/Q9Do/T7D9KUbNt0Kg==
X-Received: by 2002:ac8:4443:0:b0:3b6:2ec0:69fe with SMTP id
 m3-20020ac84443000000b003b62ec069femr37384616qtn.40.1674484193525; 
 Mon, 23 Jan 2023 06:29:53 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 w22-20020ac87196000000b003b62deadddcsm12481984qto.42.2023.01.23.06.29.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 06:29:52 -0800 (PST)
Message-ID: <be81e9e3-1669-4627-562e-30ab0a98c8fc@redhat.com>
Date: Mon, 23 Jan 2023 15:29:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v4 2/2] qtests/arm: add some mte tests
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gavin Shan <gshan@redhat.com>
References: <20230111161317.52250-1-cohuck@redhat.com>
 <20230111161317.52250-3-cohuck@redhat.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20230111161317.52250-3-cohuck@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.147, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

Hi Connie,
On 1/11/23 17:13, Cornelia Huck wrote:
> Acked-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
Maybe add some extra information about what tests are run. Also you
could add an example of test invocation so that any people interested in
can easily run those new tests?

> ---
>  tests/qtest/arm-cpu-features.c | 76 ++++++++++++++++++++++++++++++++++
>  1 file changed, 76 insertions(+)
> 
> diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
> index 5a145273860c..e264d2178a8b 100644
> --- a/tests/qtest/arm-cpu-features.c
> +++ b/tests/qtest/arm-cpu-features.c
> @@ -22,6 +22,7 @@
>  
>  #define MACHINE     "-machine virt,gic-version=max -accel tcg "
>  #define MACHINE_KVM "-machine virt,gic-version=max -accel kvm -accel tcg "
> +#define MACHINE_MTE "-machine virt,gic-version=max,mte=on -accel tcg "
>  #define QUERY_HEAD  "{ 'execute': 'query-cpu-model-expansion', " \
>                      "  'arguments': { 'type': 'full', "
>  #define QUERY_TAIL  "}}"
> @@ -155,6 +156,18 @@ static bool resp_get_feature(QDict *resp, const char *feature)
>      g_assert(qdict_get_bool(_props, feature) == (expected_value));     \
>  })
>  
> +#define resp_assert_feature_str(resp, feature, expected_value)         \
> +({                                                                     \
> +    QDict *_props;                                                     \
> +                                                                       \
> +    g_assert(_resp);                                                   \
> +    g_assert(resp_has_props(_resp));                                   \
> +    _props = resp_get_props(_resp);                                    \
> +    g_assert(qdict_get(_props, feature));                              \
> +    g_assert_cmpstr(qdict_get_try_str(_props, feature), ==,            \
> +                    expected_value);                                   \
> +})
> +
>  #define assert_feature(qts, cpu_type, feature, expected_value)         \
>  ({                                                                     \
>      QDict *_resp;                                                      \
> @@ -165,6 +178,16 @@ static bool resp_get_feature(QDict *resp, const char *feature)
>      qobject_unref(_resp);                                              \
>  })
>  
> +#define assert_feature_str(qts, cpu_type, feature, expected_value)     \
> +({                                                                     \
> +    QDict *_resp;                                                      \
> +                                                                       \
> +    _resp = do_query_no_props(qts, cpu_type);                          \
> +    g_assert(_resp);                                                   \
> +    resp_assert_feature_str(_resp, feature, expected_value);           \
> +    qobject_unref(_resp);                                              \
> +})
> +
>  #define assert_set_feature(qts, cpu_type, feature, value)              \
>  ({                                                                     \
>      const char *_fmt = (value) ? "{ %s: true }" : "{ %s: false }";     \
> @@ -176,6 +199,16 @@ static bool resp_get_feature(QDict *resp, const char *feature)
>      qobject_unref(_resp);                                              \
>  })
>  
> +#define assert_set_feature_str(qts, cpu_type, feature, value, _fmt)    \
> +({                                                                     \
> +    QDict *_resp;                                                      \
> +                                                                       \
> +    _resp = do_query(qts, cpu_type, _fmt, feature);                    \
> +    g_assert(_resp);                                                   \
> +    resp_assert_feature_str(_resp, feature, value);                    \
> +    qobject_unref(_resp);                                              \
> +})
> +
>  #define assert_has_feature_enabled(qts, cpu_type, feature)             \
>      assert_feature(qts, cpu_type, feature, true)
>  
> @@ -412,6 +445,24 @@ static void sve_tests_sve_off_kvm(const void *data)
>      qtest_quit(qts);
>  }
>  
> +static void mte_tests_tag_memory_on(const void *data)
> +{
> +    QTestState *qts;
> +
> +    qts = qtest_init(MACHINE_MTE "-cpu max");
> +
> +    /*
> +     * With tag memory, "mte" should default to on, and explicitly specifying
> +     * either on or off should be fine.
> +     */
> +    assert_has_feature(qts, "max", "mte");
> +
> +    assert_set_feature_str(qts, "max", "mte", "off", "{ 'mte': 'off' }");
> +    assert_set_feature_str(qts, "max", "mte", "on", "{ 'mte': 'on' }");
> +
> +    qtest_quit(qts);
> +}
> +
>  static void pauth_tests_default(QTestState *qts, const char *cpu_type)
>  {
>      assert_has_feature_enabled(qts, cpu_type, "pauth");
> @@ -424,6 +475,21 @@ static void pauth_tests_default(QTestState *qts, const char *cpu_type)
>                   "{ 'pauth': false, 'pauth-impdef': true }");
>  }
>  
> +static void mte_tests_default(QTestState *qts, const char *cpu_type)
> +{
> +    assert_has_feature(qts, cpu_type, "mte");
> +
> +    /*
> +     * Without tag memory, mte will be off under tcg.
> +     * Explicitly enabling it yields an error.
> +     */
> +    assert_has_feature(qts, cpu_type, "mte");
called twice
> +
> +    assert_set_feature_str(qts, "max", "mte", "off", "{ 'mte': 'off' }");
> +    assert_error(qts, cpu_type, "mte=on requires tag memory",
> +                 "{ 'mte': 'on' }");
nit. with pauth_tests_default form: cannot enable mte without tag memory
> +}
> +
>  static void test_query_cpu_model_expansion(const void *data)
>  {
>      QTestState *qts;
> @@ -473,6 +539,7 @@ static void test_query_cpu_model_expansion(const void *data)
>  
>          sve_tests_default(qts, "max");
>          pauth_tests_default(qts, "max");
> +        mte_tests_default(qts, "max");
>  
>          /* Test that features that depend on KVM generate errors without. */
>          assert_error(qts, "max",
> @@ -516,6 +583,13 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
>          assert_set_feature(qts, "host", "pmu", false);
>          assert_set_feature(qts, "host", "pmu", true);
>  
> +        /*
> +         * Unfortunately, there's no easy way to test whether this instance
> +         * of KVM supports MTE. So we can only assert that the feature
> +         * is present, but not whether it can be toggled.
> +         */
> +        assert_has_feature(qts, "host", "mte");
why isn't it possible to implement something like
        kvm_supports_steal_time = resp_get_feature(resp, "kvm-steal-time");
Could you elaborate?

> +
>          /*
>           * Some features would be enabled by default, but they're disabled
>           * because this instance of KVM doesn't support them. Test that the
> @@ -630,6 +704,8 @@ int main(int argc, char **argv)
>                              NULL, sve_tests_sve_off);
>          qtest_add_data_func("/arm/kvm/query-cpu-model-expansion/sve-off",
>                              NULL, sve_tests_sve_off_kvm);
> +        qtest_add_data_func("/arm/max/query-cpu-model-expansion/tag-memory",
> +                            NULL, mte_tests_tag_memory_on);
>      }
>  
>      return g_test_run();
Thanks

Eric


