Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 647FF669B4A
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 16:02:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGL8e-0005WY-Bm; Fri, 13 Jan 2023 09:34:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1pGL7T-0005AH-Rw; Fri, 13 Jan 2023 09:33:55 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1pGL7R-0008Iy-Hu; Fri, 13 Jan 2023 09:33:23 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 116AE60863;
 Fri, 13 Jan 2023 14:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673620398; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cD3E44kRD9iuQuGVAMay0dJLO9VRSWvTxEAE0xawEsA=;
 b=K5MAx4WTqMeeoYRk8R/h7bCGxuXH7k2S7ExSNDIr6Qz26Yw7jmhySQ4W8JDhWVQl5KZyhV
 /hkZuCkVL9AHmZmZO7RO9MHxMQiCCq4CkG33zaSUUurwkMP/xS/YZM9Cnv5sLfXt/ncf9E
 Iy6HE2rYaDE2fRooDU1sWgY8/pWTOZM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673620398;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cD3E44kRD9iuQuGVAMay0dJLO9VRSWvTxEAE0xawEsA=;
 b=j+u7gbmBGe6Bme6/7A8fdIlz2izYeOIoi25LO95GreYN1a71fRbKFUS9ptYAv0IVEunJGm
 YZLFYhCjzIGjm3AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AA53E13913;
 Fri, 13 Jan 2023 14:33:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0evXJ61rwWMZHAAAMHmgww
 (envelope-from <cfontana@suse.de>); Fri, 13 Jan 2023 14:33:17 +0000
Message-ID: <3be55a1c-64cd-28f3-9c7f-ceb67b20c36e@suse.de>
Date: Fri, 13 Jan 2023 15:33:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH v3 20/28] target/arm: Set cortex-a57 as default cpu
 for KVM-only build
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-21-farosas@suse.de>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <20230113140419.4013-21-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 1/13/23 15:04, Fabiano Rosas wrote:
> The cortex-a15 is not present anymore when CONFIG_TCG=n, so use the
> cortex-a57 as default cpu for KVM.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>

Our recommendation currently for KVM on ARM is to always use CPU="host", as named cpu models generally don't work (yet?) with KVM.

https://qemu-project.gitlab.io/qemu/system/arm/cpu-features.html

Should then "host" be the default for KVM if CONFIG_TCG=N or CONFIG_TCG=M and the TCG .so is not loaded?

Thanks,

Claudio

> ---
>  hw/arm/virt.c                  | 6 ++++++
>  tests/qtest/arm-cpu-features.c | 3 +--
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index ea2413a0ba..19854f4137 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -203,8 +203,10 @@ static const int a15irqmap[] = {
>  };
>  
>  static const char *valid_cpus[] = {
> +#ifdef CONFIG_TCG
>      ARM_CPU_TYPE_NAME("cortex-a7"),
>      ARM_CPU_TYPE_NAME("cortex-a15"),
> +#endif
>      ARM_CPU_TYPE_NAME("cortex-a35"),
>      ARM_CPU_TYPE_NAME("cortex-a53"),
>      ARM_CPU_TYPE_NAME("cortex-a55"),
> @@ -3003,7 +3005,11 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>      mc->minimum_page_bits = 12;
>      mc->possible_cpu_arch_ids = virt_possible_cpu_arch_ids;
>      mc->cpu_index_to_instance_props = virt_cpu_index_to_props;
> +#ifdef CONFIG_TCG
>      mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
> +#else
> +    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a57");
> +#endif
>      mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
>      mc->kvm_type = virt_kvm_type;
>      assert(!mc->get_hotplug_handler);
> diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
> index 8691802950..4be1415823 100644
> --- a/tests/qtest/arm-cpu-features.c
> +++ b/tests/qtest/arm-cpu-features.c
> @@ -507,8 +507,7 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
>          char *error;
>  
>          assert_error(qts, "cortex-a15",
> -            "We cannot guarantee the CPU type 'cortex-a15' works "
> -            "with KVM on this host", NULL);
> +            "The CPU type 'cortex-a15' is not a recognized ARM CPU type", NULL);
>  
>          assert_has_feature_enabled(qts, "host", "aarch64");
>  


