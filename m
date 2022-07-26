Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E42F958119E
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 13:09:05 +0200 (CEST)
Received: from localhost ([::1]:43710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGIQy-0002r3-IX
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 07:09:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oGILP-00089E-Rs
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 07:03:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oGILL-0007iQ-VQ
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 07:03:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658833393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FW4YyJZugooeFe3Mgn44TV/6Dquieyt4IavaseG99lA=;
 b=HfMfNy7hfSBQHCFkFuuiXMg14EsRKXFs/vO5wHz31z/UMnNktkQBFiWHQNAd/B54Q8YeuX
 S+80jhkTrVAGuisrwknQu3eRhGUXlHQ7w5ytHnW5jx3msIJsan4I946FHvCTf28m3f9xK6
 Njv+58rOcrDk4dkbUppL1HrqXpUJmtI=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-42-AdBxG-a4Ov2Clp-xKs4ZrA-1; Tue, 26 Jul 2022 07:03:12 -0400
X-MC-Unique: AdBxG-a4Ov2Clp-xKs4ZrA-1
Received: by mail-oi1-f197.google.com with SMTP id
 17-20020a544191000000b0033a4b6ff677so5983612oiy.1
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 04:03:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FW4YyJZugooeFe3Mgn44TV/6Dquieyt4IavaseG99lA=;
 b=I5M8tPKtXNtst1irUT302QAtotmmf38sU6k42AdG5IyJVh7W1Z9d+11EpitU4edrmz
 ZopQs4Ouqe285yxJtht+ytaMDBmnJvBlGlb5B7y/4T6Mc/q98xz+Rf3G0sUuUrq/B8xg
 HXYr6GRGK9nIgT5HDtNbNVJI+8vIsWSapyd0t3Al8S2pvfS1WTaCHz/CIqP4xykV03AF
 P6UVYvIZPLItvFi4vRcDfNYbjYYwzpfRtoTlEV4sRK7xSvsJ5dw3DUAkIil0z79MVHFB
 zGx/eDF0ezse5OkcQ2oyz8kNLOEd2iX8DYKjhic/TvbOYT29hgCBc/ruOZr9zbQjOZK0
 x1oQ==
X-Gm-Message-State: AJIora91iVHkLgheUsEMy9S84DNJLhuQ3cQliIP74vAZj5Uaz8wSoWYu
 s0u0rLm/a6Qk9FWclYvT/8pda+lGSXUW2DLriB4/fFQLAKtvBLYRmO4+1yWb1BebNgx21X/iMmX
 3EQeaeID9q9oDJS5054CCf+8xkDFskzQ=
X-Received: by 2002:a05:6808:2187:b0:33a:c507:d4f3 with SMTP id
 be7-20020a056808218700b0033ac507d4f3mr7806230oib.205.1658833391228; 
 Tue, 26 Jul 2022 04:03:11 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tdfkGBMUO3f8+3k8XO3t3nFQVLYaE6U/gaSp3f0LNl7nZuMyuLj4zIzsE7NdxvhUBY6tRwVAw5f11SFdWqwGo=
X-Received: by 2002:a05:6808:2187:b0:33a:c507:d4f3 with SMTP id
 be7-20020a056808218700b0033ac507d4f3mr7806210oib.205.1658833390897; Tue, 26
 Jul 2022 04:03:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220726092248.128336-1-frankja@linux.ibm.com>
 <20220726092248.128336-14-frankja@linux.ibm.com>
In-Reply-To: <20220726092248.128336-14-frankja@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 26 Jul 2022 15:03:00 +0400
Message-ID: <CAMxuvax0630xZiq1GnfW7mfR3gViqrNCHVFw0LPK2EYz+s5zhw@mail.gmail.com>
Subject: Re: [PATCH v4 13/17] linux header sync
To: Janosch Frank <frankja@linux.ibm.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Bonzini, Paolo" <pbonzini@redhat.com>,
 mhartmay@linux.ibm.com, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, imbrenda@linux.ibm.com, 
 Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 "open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>, seiden@linux.ibm.com,
 scgl@linux.ibm.com
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

On Tue, Jul 26, 2022 at 1:24 PM Janosch Frank <frankja@linux.ibm.com> wrote:
>
> Add the uapi data for KVM_CAP_S390_PROTECTED_DUMP which I expect to be
> added with 5.20.
>
> Also add the missing NT_S390_RI_CB and the new NT_S390_PV_CPU_DATA elf
> note types.
>
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>

This patch could be committed by mistake, I keep my recommendation to
add a WIP: prefix in the title until it is officially in the kernel.
And it would be useful to link to the kernel patch submission.

> ---
>  include/elf.h             |  2 ++
>  linux-headers/linux/kvm.h | 54 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 56 insertions(+)
>
> diff --git a/include/elf.h b/include/elf.h
> index 3a4bcb646a..94fdcfd8dc 100644
> --- a/include/elf.h
> +++ b/include/elf.h
> @@ -1649,6 +1649,8 @@ typedef struct elf64_shdr {
>  #define NT_TASKSTRUCT  4
>  #define NT_AUXV                6
>  #define NT_PRXFPREG     0x46e62b7f      /* copied from gdb5.1/include/elf/common.h */
> +#define NT_S390_PV_CPU_DATA    0x30e   /* s390 protvirt cpu dump data */
> +#define NT_S390_RI_CB  0x30d           /* s390 runtime instrumentation */
>  #define NT_S390_GS_CB   0x30b           /* s390 guarded storage registers */
>  #define NT_S390_VXRS_HIGH 0x30a         /* s390 vector registers 16-31 */
>  #define NT_S390_VXRS_LOW  0x309         /* s390 vector registers 0-15 (lower half) */
> diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
> index f089349149..46133ef36c 100644
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
> @@ -2067,4 +2119,6 @@ struct kvm_stats_desc {
>  /* Available with KVM_CAP_XSAVE2 */
>  #define KVM_GET_XSAVE2           _IOR(KVMIO,  0xcf, struct kvm_xsave)
>
> +#define KVM_S390_PV_CPU_COMMAND _IOWR(KVMIO, 0xd0, struct kvm_pv_cmd)
> +
>  #endif /* __LINUX_KVM_H */
> --
> 2.34.1
>


