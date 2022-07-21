Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1CC57CEA3
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 17:10:49 +0200 (CEST)
Received: from localhost ([::1]:52828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEXpA-0007uV-TN
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 11:10:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oEXkj-00034Y-NU
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 11:06:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oEXkf-0006g8-0K
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 11:06:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658415968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=twksRL4qLVbPN86F5BlIhjqNs/UfNtcIHyYa2psvfPk=;
 b=X6/aojL6lbJcuoQwwdQBm9fS+2r+mE+l7qoO2Gd6oFS+YTGMnRIo/MkGzRqU54BW7Dzmfi
 HOlYU3EOE6iNg2gZvm1VXUx9bzJbGak0A9C7J33+L2/KYrEQ6NVNS40Tpi+Nkd1NE2NuiZ
 ItX0PwITBX2nhIEbk2oBsJLHymjR1XY=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-226-IUwfTCnkPRG4ob105iOBBg-1; Thu, 21 Jul 2022 11:06:01 -0400
X-MC-Unique: IUwfTCnkPRG4ob105iOBBg-1
Received: by mail-oo1-f72.google.com with SMTP id
 n5-20020a4ab345000000b0040e5ffbd237so144966ooo.15
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 08:06:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=twksRL4qLVbPN86F5BlIhjqNs/UfNtcIHyYa2psvfPk=;
 b=jL82bXL5NYHtfLlfC6Ik4Zj3x2A6D83HnRwDlykxBeZ+9kn6+UEV1i0Cx3lCYlrj0B
 ZEhdiycc7wgLsJ1rELuua4gWrPMRwKlhiaEjiPpMoNzfmEOkasG/VAoO2qWr0As0GOr/
 /Y0G2cwE+C9ZqfsHutzQHnx0t7Tj9QbhEnMxA31IqDw0nIj4mATG4EvDCW/t+Ak2VL8u
 +SjZz37j8nTMrRkJ597AoJzrK1tpZtrOFW21pFzqVACNgPRIRzcGlqnpFhSxzZjE7pHE
 vEf1PkDRuEU47OLqqLgY0w4cI2O0gUsnqsBJA8sCKdwmnDjGJmRwF3UBIwxJFSehX4Kc
 6tCA==
X-Gm-Message-State: AJIora95sAOrBDswfiuSzpwKXoN7eb8PA7bkEIf2dx2r4tbqslkLPNBj
 A7N+A6kafflW4MpZ1IUSQwbOFuv2nn0A0w7qcj55xJOjJQ0l3fGESipBctImGDU+vqdqtdgNmkw
 cv3ynDdfGnHmFNq+3QsgSYRzQHwB7qsM=
X-Received: by 2002:a05:6808:23d4:b0:337:e764:90eb with SMTP id
 bq20-20020a05680823d400b00337e76490ebmr5004302oib.205.1658415959604; 
 Thu, 21 Jul 2022 08:05:59 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vkEuQWn+TO7hzQ4xitlGG/r5/gX9uzXoo6rZ6vZdBRq40SreNlSp0jFNI4Evswspu1z++kOdUW8TOVzWmheVY=
X-Received: by 2002:a05:6808:23d4:b0:337:e764:90eb with SMTP id
 bq20-20020a05680823d400b00337e76490ebmr5004289oib.205.1658415959383; Thu, 21
 Jul 2022 08:05:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220721132256.2171-1-frankja@linux.ibm.com>
 <20220721132256.2171-11-frankja@linux.ibm.com>
In-Reply-To: <20220721132256.2171-11-frankja@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 21 Jul 2022 19:05:48 +0400
Message-ID: <CAMxuvazJW2zuVQRfoQqHXF6AZyuhqV_HMfLA0D973eu2-yCF1w@mail.gmail.com>
Subject: Re: [PATCH v3 10/14] linux header sync
To: Janosch Frank <frankja@linux.ibm.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Bonzini, Paolo" <pbonzini@redhat.com>,
 mhartmay@linux.ibm.com, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, imbrenda@linux.ibm.com, 
 Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 "open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>, seiden@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, Jul 21, 2022 at 5:23 PM Janosch Frank <frankja@linux.ibm.com> wrote:
>
> Add the uapi data for KVM_CAP_S390_PROTECTED_DUMP which I expect to be
> added with 5.20.

It's going to be overwritten by the next update-linux-headers.sh. I'd
mark this patch as WIP or Draft: in the title until it's actually sync
and imported from the kernel.


>
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>  linux-headers/linux/kvm.h | 54 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
>
> diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
> index 0d05d02ee4..213216c27c 100644
> --- a/linux-headers/linux/kvm.h
> +++ b/linux-headers/linux/kvm.h
> @@ -1150,6 +1150,7 @@ struct kvm_ppc_resize_hpt {
>  #define KVM_CAP_DISABLE_QUIRKS2 213
>  /* #define KVM_CAP_VM_TSC_CONTROL 214 */
>  #define KVM_CAP_SYSTEM_EVENT_DATA 215
> +#define KVM_CAP_S390_PROTECTED_DUMP 217
>
>  #ifdef KVM_CAP_IRQ_ROUTING
>
> @@ -1651,6 +1652,55 @@ struct kvm_s390_pv_unp {
>         __u64 tweak;
>  };
>
> +enum pv_cmd_info_id {
> +       KVM_PV_INFO_VM,
> +       KVM_PV_INFO_DUMP,
> +};
> +
> +struct kvm_s390_pv_info_dump {
> +       __u64 dump_cpu_buffer_len;
> +       __u64 dump_config_mem_buffer_per_1m;
> +       __u64 dump_config_finalize_len;
> +};
> +
> +struct kvm_s390_pv_info_vm {
> +       __u64 inst_calls_list[4];
> +       __u64 max_cpus;
> +       __u64 max_guests;
> +       __u64 max_guest_addr;
> +       __u64 feature_indication;
> +};
> +
> +struct kvm_s390_pv_info_header {
> +       __u32 id;
> +       __u32 len_max;
> +       __u32 len_written;
> +       __u32 reserved;
> +};
> +
> +struct kvm_s390_pv_info {
> +       struct kvm_s390_pv_info_header header;
> +       union {
> +               struct kvm_s390_pv_info_dump dump;
> +               struct kvm_s390_pv_info_vm vm;
> +       };
> +};
> +
> +enum pv_cmd_dmp_id {
> +        KVM_PV_DUMP_INIT,
> +        KVM_PV_DUMP_CONFIG_STATE,
> +        KVM_PV_DUMP_COMPLETE,
> +        KVM_PV_DUMP_CPU,
> +};
> +
> +struct kvm_s390_pv_dmp {
> +        __u64 subcmd;
> +        __u64 buff_addr;
> +        __u64 buff_len;
> +        __u64 gaddr;
> +        __u64 reserved[4];
> +};
> +
>  enum pv_cmd_id {
>         KVM_PV_ENABLE,
>         KVM_PV_DISABLE,
> @@ -1659,6 +1709,8 @@ enum pv_cmd_id {
>         KVM_PV_VERIFY,
>         KVM_PV_PREP_RESET,
>         KVM_PV_UNSHARE_ALL,
> +        KVM_PV_INFO,
> +        KVM_PV_DUMP,
>  };
>
>  struct kvm_pv_cmd {
> @@ -2066,4 +2118,6 @@ struct kvm_stats_desc {
>  /* Available with KVM_CAP_XSAVE2 */
>  #define KVM_GET_XSAVE2           _IOR(KVMIO,  0xcf, struct kvm_xsave)
>
> +#define KVM_S390_PV_CPU_COMMAND _IOWR(KVMIO, 0xd0, struct kvm_pv_cmd)
> +
>  #endif /* __LINUX_KVM_H */
> --
> 2.34.1
>


