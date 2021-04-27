Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C40D36C1FC
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 11:43:59 +0200 (CEST)
Received: from localhost ([::1]:40792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbKG6-0005CM-J3
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 05:43:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbKA8-00014I-Au
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 05:37:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbKA0-0000kq-2J
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 05:37:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619516257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OuZcYfksTtMkbmUbEwMw8fM0Xj0JA3dRB9TriGd+laM=;
 b=HuMKkq7TCwGy0AyFa3NlIh0hl/Gf7Nu8KL0KgI+YEaVM3SoKFRHms5a0MBSiocAsPIptlI
 4eOMZLDwxoRowc3UF62mEHQE+pCQrVzOYSbzKp4fSS3fJc5odV51HWDFutxQUhHDf1rhE8
 Q42UwAKsjbRfv2Kn6DPYM8fOTkh+92k=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-JGmqHK30Oo-9WjfvVvNo2A-1; Tue, 27 Apr 2021 05:37:35 -0400
X-MC-Unique: JGmqHK30Oo-9WjfvVvNo2A-1
Received: by mail-ed1-f70.google.com with SMTP id
 h13-20020a05640250cdb02903790a9c55acso24537768edb.4
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 02:37:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OuZcYfksTtMkbmUbEwMw8fM0Xj0JA3dRB9TriGd+laM=;
 b=JhxLEyRZDW97UAmiWc8VAS7wM0ZGGSdALgldLFG+fRVgC1iIE36vY/3uT+BHNjx3sA
 bvPHE/3KklfD5ok5ySfutHJxlhw9DeSyRfDkd2mrJt3KAUcoJZ9XjE1ZydbGrUu5AMiF
 DSC7qNv7ZzcHKVNvNH1QwCEtQDSUIJ3JVxUqxvasyVCWQKJAxv72mX8zXI/z4RXPxTg4
 y2lyriB+GkSNgHBwxFl3S5fRa0EQNtP7xRZvFHUjOdsj/dHbImJnsOTAhW7IT6rQqoSk
 wudVncA6EtEwyeIq+aU5FPwxOS35hYd2voJtmHIFS5VmuLSLbB3+MwLACfgIimLADTrO
 HmHA==
X-Gm-Message-State: AOAM531HK1O5xQsEpMrb5xXpQvm6kGuKgs4mlcoUCflNiBCWkJRLXX/d
 i4SN3/2exnqZfv1bTGON7q+LLgeoWkMi6bna9XgR6OTZnUr97JXLmIgwnGSexE7iQp+wwRpFISK
 cn4EEO26N5S9QqPQ=
X-Received: by 2002:a17:906:a851:: with SMTP id
 dx17mr6721886ejb.364.1619516254138; 
 Tue, 27 Apr 2021 02:37:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLai4Vrq6KcF2eu2K1zjyC47brTyfnld6KwFXVqcsoY66VFoYnT+qgaQv3rtylOHQsDxtrSg==
X-Received: by 2002:a17:906:a851:: with SMTP id
 dx17mr6721872ejb.364.1619516253944; 
 Tue, 27 Apr 2021 02:37:33 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id r25sm1928907edv.78.2021.04.27.02.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 02:37:33 -0700 (PDT)
Date: Tue, 27 Apr 2021 11:37:31 +0200
From: Andrew Jones <drjones@redhat.com>
To: Haibo Xu <haibo.xu@linaro.org>
Subject: Re: [PATCH RESEND v2 6/6] target/arm: Add vCPU feature 'el2' test.
Message-ID: <20210427093731.suz7sgunxcdxrwjm@gator.home>
References: <cover.1617281290.git.haibo.xu@linaro.org>
 <50db1700b4df48acbecfda077b2220a0e3cf6b49.1617281290.git.haibo.xu@linaro.org>
MIME-Version: 1.0
In-Reply-To: <50db1700b4df48acbecfda077b2220a0e3cf6b49.1617281290.git.haibo.xu@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, abologna@redhat.com, qemu-arm@nongnu.org,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 01, 2021 at 05:55:38AM -0700, Haibo Xu wrote:
> Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
> ---
>  target/arm/monitor.c           | 2 +-
>  tests/qtest/arm-cpu-features.c | 9 +++++++++
>  2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/monitor.c b/target/arm/monitor.c
> index 80c64fa355..6c39238925 100644
> --- a/target/arm/monitor.c
> +++ b/target/arm/monitor.c

The patch summary says we're adding a test, but here we're touching
monitor code. Adding 'el2' to this monitor list should happen in the
patch where el2 is introduced.

> @@ -90,7 +90,7 @@ QEMU_BUILD_BUG_ON(ARM_MAX_VQ > 16);
>   * then the order that considers those dependencies must be used.
>   */
>  static const char *cpu_model_advertised_features[] = {
> -    "aarch64", "pmu", "sve",
> +    "aarch64", "pmu", "sve", "el2",

It doesn't really matter, but I'd rather not add a new feature between
'sve' and 'sve128'. Why not just add it to the front or back of the list?

>      "sve128", "sve256", "sve384", "sve512",
>      "sve640", "sve768", "sve896", "sve1024", "sve1152", "sve1280",
>      "sve1408", "sve1536", "sve1664", "sve1792", "sve1920", "sve2048",
> diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
> index 8252b85bb8..be07bf0c76 100644
> --- a/tests/qtest/arm-cpu-features.c
> +++ b/tests/qtest/arm-cpu-features.c
> @@ -509,6 +509,7 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
>      if (g_str_equal(qtest_get_arch(), "aarch64")) {
>          bool kvm_supports_steal_time;
>          bool kvm_supports_sve;
> +        bool kvm_supports_el2;
>          char max_name[8], name[8];
>          uint32_t max_vq, vq;
>          uint64_t vls;
> @@ -533,10 +534,12 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
>           */
>          assert_has_feature(qts, "host", "kvm-steal-time");
>          assert_has_feature(qts, "host", "sve");
> +        assert_has_feature(qts, "host", "el2");
>  
>          resp = do_query_no_props(qts, "host");
>          kvm_supports_steal_time = resp_get_feature(resp, "kvm-steal-time");
>          kvm_supports_sve = resp_get_feature(resp, "sve");
> +        kvm_supports_el2 = resp_get_feature(resp, "el2");

Isn't this feature disabled by default whether the host supports it or
not? If so, this will always be false. I think the test should

 1) confirm the feature is disabled by default
 2) attempt to enable it without asserting on failure
 3) if it gets enabled, then attempt to disable it, asserting on failure

>          vls = resp_get_sve_vls(resp);
>          qobject_unref(resp);
>  
> @@ -602,11 +605,17 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
>          } else {
>              g_assert(vls == 0);
>          }
> +
> +        if (kvm_supports_el2) {
> +            assert_set_feature(qts, "host", "el2", false);
> +            assert_set_feature(qts, "host", "el2", true);

For the steps outlined above, you can drop this extra re-enabling test.

> +        }
>      } else {
>          assert_has_not_feature(qts, "host", "aarch64");
>          assert_has_not_feature(qts, "host", "pmu");
>          assert_has_not_feature(qts, "host", "sve");
>          assert_has_not_feature(qts, "host", "kvm-steal-time");
> +        assert_has_not_feature(qts, "host", "el2");
>      }
>  
>      qtest_quit(qts);
> -- 
> 2.17.1
> 
>

Thanks,
drew


