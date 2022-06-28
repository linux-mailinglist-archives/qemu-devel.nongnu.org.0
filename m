Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF19955DB62
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 15:24:37 +0200 (CEST)
Received: from localhost ([::1]:33350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6BCm-0003kH-Uw
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 09:24:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o6B7B-0001Tw-Vk
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 09:18:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o6B7A-0001Eg-9D
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 09:18:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656422327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jj2yyU8vaQeQp8A26NcOUTJr9V0vmsbuzeW6iYfBmo8=;
 b=Nrk2UdxreqwPl3JjdkgN5FMC+jws/OJk5uyDfV+TgxbUXt8pCOg1MdgRpAAIKegUlZ3ntw
 R1AaPoc+uCuQl4xHzehCQQRwwpbft/2S4gSYiGifYV1LYkEIgMAJqAsSZ8NAPTXGU7eQm/
 fR0jDCP4qY2Y282NcAvVcW89gzM7GmI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-495-EPvumGkJM92Va0uq1jPAOw-1; Tue, 28 Jun 2022 09:18:46 -0400
X-MC-Unique: EPvumGkJM92Va0uq1jPAOw-1
Received: by mail-wm1-f70.google.com with SMTP id
 m17-20020a05600c3b1100b003a04a2f4936so3073140wms.6
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 06:18:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jj2yyU8vaQeQp8A26NcOUTJr9V0vmsbuzeW6iYfBmo8=;
 b=ah+6/JfJrAymoyASV58kOZlHtvKs6e69MklBVm7dApCTM8FhEt9N4/NIh2yQDAot9j
 7Wk86byO3d6pE4pF2lsC6ob2u2bTn3CxNE08/bnbajdQZOcqzDVLonu4bPTBIdHO/OML
 w/gFis3IPwIYe7SxQ8Ikt5Jw0TSgRsrWwmqyIuQ6O0xhy8NWaHK5JKYK3+3uB6GoGBPB
 /Mp+4YbG25aF6n5Ny153QaDRCGF/vBWJGiaYjZUexxiZatDkAg2xB0JRyxer6Y8VEoWM
 AG5GckJF4UCZsf+xG8H6CYyrDuUasRsFxm6nZ+o3a+lSnkF4bQJ6wk1TvxF5fCRttB/N
 SS6w==
X-Gm-Message-State: AJIora+3yMRa1ofN4AKGwUONglr+kLwVucXOjm+EpMjRZQS4V5CoOt5j
 YPK0+GM6V/jJNmZzyD1OxblebQ+siKtB/Sk65iKjKrAsFpQGkWCIA3mXTBkgAiReTAzxZ90EJkW
 2spZ+ZRijdVIM4Dw=
X-Received: by 2002:a5d:508c:0:b0:21b:8cd2:2210 with SMTP id
 a12-20020a5d508c000000b0021b8cd22210mr17050431wrt.527.1656422324723; 
 Tue, 28 Jun 2022 06:18:44 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tKx/UF0K96YyszjxT7sWZ/GN0ROso+9pSdAEwbkt+1vZrRzUz5ycG/ADZskweY4N6Qc7jeLQ==
X-Received: by 2002:a5d:508c:0:b0:21b:8cd2:2210 with SMTP id
 a12-20020a5d508c000000b0021b8cd22210mr17050394wrt.527.1656422324312; 
 Tue, 28 Jun 2022 06:18:44 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 z9-20020adfec89000000b0021b89f8662esm13465854wrn.13.2022.06.28.06.18.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jun 2022 06:18:43 -0700 (PDT)
Message-ID: <c23d007c-98d3-a8b4-269c-5b65d53064db@redhat.com>
Date: Tue, 28 Jun 2022 15:18:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC PATCH 5/5] tests: stop skipping migration test on s390x/ppc64
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Juan Quintela <quintela@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-s390x@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20220628105434.295905-1-berrange@redhat.com>
 <20220628105434.295905-6-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220628105434.295905-6-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 28/06/2022 12.54, Daniel P. Berrangé wrote:
> There have been checks put into the migration test which skip it in a
> few scenarios
> 
>   * ppc64 TCG
>   * ppc64 KVM with kvm-pr
>   * s390x TCG
> 
> In the original commits there are references to unexplained hangs in
> the test. There is no record of details of where it was hanging, but
> it is suspected that these were all a result of the max downtime limit
> being set at too low a value to guarantee convergance.
> 
> Since a previous commit bumped the value from 1 second to 30 seconds,
> it is believed that hangs due to non-convergance should be eliminated
> and thus worth trying to remove the skipped scenarios.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   tests/qtest/migration-test.c | 21 ---------------------
>   1 file changed, 21 deletions(-)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 9e64125f02..500169f687 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -2085,7 +2085,6 @@ static bool kvm_dirty_ring_supported(void)
>   int main(int argc, char **argv)
>   {
>       char template[] = "/tmp/migration-test-XXXXXX";
> -    const bool has_kvm = qtest_has_accel("kvm");
>       int ret;
>   
>       g_test_init(&argc, &argv, NULL);
> @@ -2094,26 +2093,6 @@ int main(int argc, char **argv)
>           return g_test_run();
>       }
>   
> -    /*
> -     * On ppc64, the test only works with kvm-hv, but not with kvm-pr and TCG
> -     * is touchy due to race conditions on dirty bits (especially on PPC for
> -     * some reason)
> -     */
> -    if (g_str_equal(qtest_get_arch(), "ppc64") &&
> -        (!has_kvm || access("/sys/module/kvm_hv", F_OK))) {
> -        g_test_message("Skipping test: kvm_hv not available");
> -        return g_test_run();
> -    }
> -
> -    /*
> -     * Similar to ppc64, s390x seems to be touchy with TCG, so disable it
> -     * there until the problems are resolved
> -     */
> -    if (g_str_equal(qtest_get_arch(), "s390x") && !has_kvm) {
> -        g_test_message("Skipping test: s390x host with KVM is required");
> -        return g_test_run();
> -    }

I'm in favor of giving this now a try ... we still can revert the patch if 
it does not work out.

Reviewed-by: Thomas Huth <thuth@redhat.com>


