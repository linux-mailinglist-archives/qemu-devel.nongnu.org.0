Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6553302A63
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 19:37:09 +0100 (CET)
Received: from localhost ([::1]:60798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l46jc-0008Ci-GK
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 13:37:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l46h8-0006nf-Ce
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 13:34:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l46h1-000318-91
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 13:34:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611599665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pprfZIYi/+TC4FwgG2h9TXq3Oe98lmoX25vF+6Tewc0=;
 b=CiQuUdrOuwaAs6LtgtJ6sE+5rtts7bKJTb5bYyhjH3m1qGstP5vXIMRHmdB3inu5IsozTl
 9c8tUEvkVHvDKyuJ92ylMKXGyG7eOSpr3maXj2jHxwuApE/zJ1kYNcrW6CzRa1ctM7t/MD
 D6/OrWmhXAlCincaIGsvp0ktKmpPOdc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-e5n-av-NNMucyRD1_ptUrQ-1; Mon, 25 Jan 2021 13:34:21 -0500
X-MC-Unique: e5n-av-NNMucyRD1_ptUrQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D424C8144E2;
 Mon, 25 Jan 2021 18:34:18 +0000 (UTC)
Received: from work-vm (ovpn-114-3.ams2.redhat.com [10.36.114.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3CD2E5C737;
 Mon, 25 Jan 2021 18:34:13 +0000 (UTC)
Date: Mon, 25 Jan 2021 18:34:10 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH v5 1/6] sev/i386: Add initial support for SEV-ES
Message-ID: <20210125183410.GO2925@work-vm>
References: <cover.1610665956.git.thomas.lendacky@amd.com>
 <6403cdc0040bc07355b35fe56e26fb9cd11eb172.1610665956.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6403cdc0040bc07355b35fe56e26fb9cd11eb172.1610665956.git.thomas.lendacky@amd.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 Sean Christopherson <seanjc@google.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jiri Slaby <jslaby@suse.cz>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Tom Lendacky (thomas.lendacky@amd.com) wrote:
> From: Tom Lendacky <thomas.lendacky@amd.com>
> 
> Provide initial support for SEV-ES. This includes creating a function to
> indicate the guest is an SEV-ES guest (which will return false until all
> support is in place), performing the proper SEV initialization and
> ensuring that the guest CPU state is measured as part of the launch.
> 
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Co-developed-by: Jiri Slaby <jslaby@suse.cz>
> Signed-off-by: Jiri Slaby <jslaby@suse.cz>
> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
> ---
>  target/i386/cpu.c      |  1 +
>  target/i386/sev-stub.c |  6 ++++++
>  target/i386/sev.c      | 44 ++++++++++++++++++++++++++++++++++++++++--
>  target/i386/sev_i386.h |  1 +
>  4 files changed, 50 insertions(+), 2 deletions(-)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 35459a38bb..9adb34c091 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -5986,6 +5986,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>          break;
>      case 0x8000001F:
>          *eax = sev_enabled() ? 0x2 : 0;
> +        *eax |= sev_es_enabled() ? 0x8 : 0;

Yep, matches your docs - it would be great if these magic constants
could become enums or #defines somewhere.

anyway,


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

>          *ebx = sev_get_cbit_position();
>          *ebx |= sev_get_reduced_phys_bits() << 6;
>          *ecx = 0;
> diff --git a/target/i386/sev-stub.c b/target/i386/sev-stub.c
> index c1fecc2101..229a2ee77b 100644
> --- a/target/i386/sev-stub.c
> +++ b/target/i386/sev-stub.c
> @@ -49,8 +49,14 @@ SevCapability *sev_get_capabilities(Error **errp)
>      error_setg(errp, "SEV is not available in this QEMU");
>      return NULL;
>  }
> +
>  int sev_inject_launch_secret(const char *hdr, const char *secret,
>                               uint64_t gpa, Error **errp)
>  {
>      return 1;
>  }
> +
> +bool sev_es_enabled(void)
> +{
> +    return false;
> +}
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index 1546606811..fce2128c07 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -360,6 +360,12 @@ sev_enabled(void)
>      return !!sev_guest;
>  }
>  
> +bool
> +sev_es_enabled(void)
> +{
> +    return false;
> +}
> +
>  uint64_t
>  sev_get_me_mask(void)
>  {
> @@ -580,6 +586,20 @@ sev_launch_update_data(SevGuestState *sev, uint8_t *addr, uint64_t len)
>      return ret;
>  }
>  
> +static int
> +sev_launch_update_vmsa(SevGuestState *sev)
> +{
> +    int ret, fw_error;
> +
> +    ret = sev_ioctl(sev->sev_fd, KVM_SEV_LAUNCH_UPDATE_VMSA, NULL, &fw_error);
> +    if (ret) {
> +        error_report("%s: LAUNCH_UPDATE_VMSA ret=%d fw_error=%d '%s'",
> +                __func__, ret, fw_error, fw_error_to_str(fw_error));
> +    }
> +
> +    return ret;
> +}
> +
>  static void
>  sev_launch_get_measure(Notifier *notifier, void *unused)
>  {
> @@ -592,6 +612,14 @@ sev_launch_get_measure(Notifier *notifier, void *unused)
>          return;
>      }
>  
> +    if (sev_es_enabled()) {
> +        /* measure all the VM save areas before getting launch_measure */
> +        ret = sev_launch_update_vmsa(sev);
> +        if (ret) {
> +            exit(1);
> +        }
> +    }
> +
>      measurement = g_new0(struct kvm_sev_launch_measure, 1);
>  
>      /* query the measurement blob length */
> @@ -686,7 +714,7 @@ sev_guest_init(const char *id)
>  {
>      SevGuestState *sev;
>      char *devname;
> -    int ret, fw_error;
> +    int ret, fw_error, cmd;
>      uint32_t ebx;
>      uint32_t host_cbitpos;
>      struct sev_user_data_status status = {};
> @@ -747,8 +775,20 @@ sev_guest_init(const char *id)
>      sev->api_major = status.api_major;
>      sev->api_minor = status.api_minor;
>  
> +    if (sev_es_enabled()) {
> +        if (!(status.flags & SEV_STATUS_FLAGS_CONFIG_ES)) {
> +            error_report("%s: guest policy requires SEV-ES, but "
> +                         "host SEV-ES support unavailable",
> +                         __func__);
> +            goto err;
> +        }
> +        cmd = KVM_SEV_ES_INIT;
> +    } else {
> +        cmd = KVM_SEV_INIT;
> +    }
> +
>      trace_kvm_sev_init();
> -    ret = sev_ioctl(sev->sev_fd, KVM_SEV_INIT, NULL, &fw_error);
> +    ret = sev_ioctl(sev->sev_fd, cmd, NULL, &fw_error);
>      if (ret) {
>          error_report("%s: failed to initialize ret=%d fw_error=%d '%s'",
>                       __func__, ret, fw_error, fw_error_to_str(fw_error));
> diff --git a/target/i386/sev_i386.h b/target/i386/sev_i386.h
> index 4db6960f60..4f9a5e9b21 100644
> --- a/target/i386/sev_i386.h
> +++ b/target/i386/sev_i386.h
> @@ -29,6 +29,7 @@
>  #define SEV_POLICY_SEV          0x20
>  
>  extern bool sev_enabled(void);
> +extern bool sev_es_enabled(void);
>  extern uint64_t sev_get_me_mask(void);
>  extern SevInfo *sev_get_info(void);
>  extern uint32_t sev_get_cbit_position(void);
> -- 
> 2.30.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


