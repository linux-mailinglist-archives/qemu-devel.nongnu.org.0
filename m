Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AC660F085
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 08:43:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onwas-00022m-LX; Thu, 27 Oct 2022 02:42:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1onwap-0001oP-3B
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 02:42:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1onwan-00042Z-3c
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 02:42:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666852933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XS3ic0iCUvn5ho/53uIrFNHi7ZNbpesOuXtxAnsqiX4=;
 b=Nqe4NDRuqYLLUirYiPAI5yCnC60/MYXUuUGXfGiwjFV7R/gt+DXzRNneeUSyAM/BJnGfz4
 GIPODjpIzgYOh65npnFteVmKb8csSEI/iAC1Ni6C9+U70drNMetNwVK7xqM/W1gVXyqx4C
 OpFu8NNnsGRPffz3XDNC4JYXAox3yZA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-592-nRHMrWieNRetIoF-cTgexg-1; Thu, 27 Oct 2022 02:42:05 -0400
X-MC-Unique: nRHMrWieNRetIoF-cTgexg-1
Received: by mail-wm1-f69.google.com with SMTP id
 f7-20020a7bcd07000000b003c6e73579d3so251387wmj.8
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 23:42:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XS3ic0iCUvn5ho/53uIrFNHi7ZNbpesOuXtxAnsqiX4=;
 b=z/tOSYNoI0aRfyYW1plQdvCER4EUNb81XURRMJN9xfx7JAD6Wb3PI5RihZP6mcfvxA
 cLWEd/GUnE8I4LxzuEy1VRsqtZW9NZdO8rX+mW+SphOp2lMlPI2MDrDTnUw7vT3Se+5H
 Exml6z9tVIeDgSQHln1n6FdUb/rJFXKvVNZoyMS+eteivPwVdiln72aJehSE72yOJb1M
 axyODyZ0W6TG7Y6xHmj4xFXuiyfYIQ4iAS5zLhhxa6dpIEY/NAAS6da8/qFspcA28Zv3
 WyMasD8k+6f4Sz0PaosYOnUpDMMOyjCR7vAaLJv51+19xg28BnMmOK7s/ilWb3Sfw0GM
 mKJw==
X-Gm-Message-State: ACrzQf2lvj3KJJKAuk3QXuTkztSJM0PJkgb2OehkQc+bQ+o9gEOlAwle
 I6wg3Ch0CckcWsY96+JeLzM/cVpVtH22iaTt1ysnfuuiXVmU5VgefoZ/pfIqpzsR2LDPD9HGqI3
 FcI/DkpGNg9CQ1Zc=
X-Received: by 2002:adf:c7d1:0:b0:236:7cde:a9b5 with SMTP id
 y17-20020adfc7d1000000b002367cdea9b5mr8668719wrg.381.1666852924306; 
 Wed, 26 Oct 2022 23:42:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7MYmH4O1N8t97lPe6oZ1KZ0uy22V/IBAjSIZsCk97sDO9SaNmtgbPcbQDa8GVpW1AFeAoVCg==
X-Received: by 2002:adf:c7d1:0:b0:236:7cde:a9b5 with SMTP id
 y17-20020adfc7d1000000b002367cdea9b5mr8668695wrg.381.1666852923965; 
 Wed, 26 Oct 2022 23:42:03 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-195.web.vodafone.de.
 [109.43.176.195]) by smtp.gmail.com with ESMTPSA id
 t8-20020a05600c198800b003cf490d1cf7sm4096597wmq.8.2022.10.26.23.42.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Oct 2022 23:42:03 -0700 (PDT)
Message-ID: <bfd29635-9742-741c-a6dc-145bcf4f8ef8@redhat.com>
Date: Thu, 27 Oct 2022 08:42:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 2/2] qtests/arm: add some mte tests
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier <lvivier@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 Eric Auger <eauger@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Gavin Shan <gshan@redhat.com>
References: <20221026160511.37162-1-cohuck@redhat.com>
 <20221026160511.37162-3-cohuck@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221026160511.37162-3-cohuck@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 26/10/2022 18.05, Cornelia Huck wrote:
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>   tests/qtest/arm-cpu-features.c | 76 ++++++++++++++++++++++++++++++++++
>   1 file changed, 76 insertions(+)
> 
> diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
> index 5a145273860c..e264d2178a8b 100644
> --- a/tests/qtest/arm-cpu-features.c
> +++ b/tests/qtest/arm-cpu-features.c
> @@ -22,6 +22,7 @@
>   
>   #define MACHINE     "-machine virt,gic-version=max -accel tcg "
>   #define MACHINE_KVM "-machine virt,gic-version=max -accel kvm -accel tcg "
> +#define MACHINE_MTE "-machine virt,gic-version=max,mte=on -accel tcg "
>   #define QUERY_HEAD  "{ 'execute': 'query-cpu-model-expansion', " \
>                       "  'arguments': { 'type': 'full', "
>   #define QUERY_TAIL  "}}"
> @@ -155,6 +156,18 @@ static bool resp_get_feature(QDict *resp, const char *feature)
>       g_assert(qdict_get_bool(_props, feature) == (expected_value));     \
>   })
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
>   #define assert_feature(qts, cpu_type, feature, expected_value)         \
>   ({                                                                     \
>       QDict *_resp;                                                      \
> @@ -165,6 +178,16 @@ static bool resp_get_feature(QDict *resp, const char *feature)
>       qobject_unref(_resp);                                              \
>   })
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
>   #define assert_set_feature(qts, cpu_type, feature, value)              \
>   ({                                                                     \
>       const char *_fmt = (value) ? "{ %s: true }" : "{ %s: false }";     \
> @@ -176,6 +199,16 @@ static bool resp_get_feature(QDict *resp, const char *feature)
>       qobject_unref(_resp);                                              \
>   })
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
>   #define assert_has_feature_enabled(qts, cpu_type, feature)             \
>       assert_feature(qts, cpu_type, feature, true)
>   
> @@ -412,6 +445,24 @@ static void sve_tests_sve_off_kvm(const void *data)
>       qtest_quit(qts);
>   }
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
>   static void pauth_tests_default(QTestState *qts, const char *cpu_type)
>   {
>       assert_has_feature_enabled(qts, cpu_type, "pauth");
> @@ -424,6 +475,21 @@ static void pauth_tests_default(QTestState *qts, const char *cpu_type)
>                    "{ 'pauth': false, 'pauth-impdef': true }");
>   }
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
> +
> +    assert_set_feature_str(qts, "max", "mte", "off", "{ 'mte': 'off' }");
> +    assert_error(qts, cpu_type, "mte=on requires tag memory",
> +                 "{ 'mte': 'on' }");
> +}
> +
>   static void test_query_cpu_model_expansion(const void *data)
>   {
>       QTestState *qts;
> @@ -473,6 +539,7 @@ static void test_query_cpu_model_expansion(const void *data)
>   
>           sve_tests_default(qts, "max");
>           pauth_tests_default(qts, "max");
> +        mte_tests_default(qts, "max");
>   
>           /* Test that features that depend on KVM generate errors without. */
>           assert_error(qts, "max",
> @@ -516,6 +583,13 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
>           assert_set_feature(qts, "host", "pmu", false);
>           assert_set_feature(qts, "host", "pmu", true);
>   
> +        /*
> +         * Unfortunately, there's no easy way to test whether this instance
> +         * of KVM supports MTE. So we can only assert that the feature
> +         * is present, but not whether it can be toggled.
> +         */
> +        assert_has_feature(qts, "host", "mte");
> +
>           /*
>            * Some features would be enabled by default, but they're disabled
>            * because this instance of KVM doesn't support them. Test that the
> @@ -630,6 +704,8 @@ int main(int argc, char **argv)
>                               NULL, sve_tests_sve_off);
>           qtest_add_data_func("/arm/kvm/query-cpu-model-expansion/sve-off",
>                               NULL, sve_tests_sve_off_kvm);
> +        qtest_add_data_func("/arm/max/query-cpu-model-expansion/tag-memory",
> +                            NULL, mte_tests_tag_memory_on);

Is it already possible to compile qemu-system-aarch64 with --disable-tcg ? 
If so, I'd recommend a qtest_has_accel("tcg") here ... but apart from that:

Acked-by: Thomas Huth <thuth@redhat.com>



