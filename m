Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BFB573AFE
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 18:17:40 +0200 (CEST)
Received: from localhost ([::1]:33742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBf3T-0002eU-ED
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 12:17:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oBepz-0003Ku-KQ
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 12:03:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oBepx-00049i-Sn
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 12:03:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657728218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bQB2iPaNTWCGvdYsCTdcA/Uz3rGA0rxs51Q5VJV5Qpw=;
 b=D9INkgmsa1u6SE+PCvDIuPdgZqaTP8jLWZf8pWS+WJobx9ivUKveLkioy5K6JtmFR0rEqH
 Hl2/n54/aEz4zrHcjA6fwnXbTBduDDESBkNfnb/tXfImQWK85wpZMX46+QqQwIM3egYaVS
 6L76nLnGZgvj15+1fPswXJh5vBuZAqA=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-156-HrZxspwKM5SJ6tyXEtVXcg-1; Wed, 13 Jul 2022 12:03:37 -0400
X-MC-Unique: HrZxspwKM5SJ6tyXEtVXcg-1
Received: by mail-oi1-f199.google.com with SMTP id
 ay32-20020a056808302000b002f96abff093so7208395oib.23
 for <qemu-devel@nongnu.org>; Wed, 13 Jul 2022 09:03:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bQB2iPaNTWCGvdYsCTdcA/Uz3rGA0rxs51Q5VJV5Qpw=;
 b=EXVSfeceTft4hr8L5699c6AS3fFBWmoXze5lxgDetACJ/6fGOFNiRrH/J1Vu1UNltp
 BoDpZSJrOayjFXCJAEbTdzHuo6ChfAmClQK2Oruy6l8kRe5osy8ZffizvWhMQsniRDI6
 j/X3wpNaEqJj2yW1V3ihUe0UNUZcH9maRu0izdyEvkhUlWE9wYCA8tBBhPMWElxOUTKw
 p2ME+Ndu8RgdBfyw+fD4tMq+WeOfwUpv+lRlBAt1cqsFEUu+uj8CxrOLP/NGmehFT9Ok
 VmF+sZJZKCWHFHCGPrMkkhmXcvoCPWhE/raqEE5ia5Oz1TAIwzLWBttMfLX3+labDw+J
 vp7Q==
X-Gm-Message-State: AJIora+APiiH9oyb876xH2QIe4QxIHtipNrQ+SIb9iQYypFXqJILM7lM
 lsSi6mVPCBmKRzdRjkoHDD8YY+XmCKJEA9wqyrUJ0FBkfAH50Qqj89uYd3xLkt/5qEcBcJTSMGx
 e5hxl3zUFJt3GdFREroHktc/L9lcfRXM=
X-Received: by 2002:a05:6808:d4f:b0:339:afb0:ccce with SMTP id
 w15-20020a0568080d4f00b00339afb0cccemr2197154oik.53.1657728216904; 
 Wed, 13 Jul 2022 09:03:36 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tWOzAd6DaDzU/MPrbmXI8uVsCQyHHG/jcuG40AsI+HUeg8h+orhsw0GXZet3h+nRoWvbxy0634QjsxuT6yEkQ=
X-Received: by 2002:a05:6808:d4f:b0:339:afb0:ccce with SMTP id
 w15-20020a0568080d4f00b00339afb0cccemr2197138oik.53.1657728216727; Wed, 13
 Jul 2022 09:03:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220713130322.25517-1-frankja@linux.ibm.com>
 <20220713130322.25517-8-frankja@linux.ibm.com>
In-Reply-To: <20220713130322.25517-8-frankja@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 13 Jul 2022 20:03:25 +0400
Message-ID: <CAMxuvaxB==Cg3hkGjNHH8=rm3iJA8+rWACk2rkMz3fZ_zgAMsA@mail.gmail.com>
Subject: Re: [PATCH v2 07/11] linux header sync
To: Janosch Frank <frankja@linux.ibm.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Bonzini, Paolo" <pbonzini@redhat.com>,
 mhartmay@linux.ibm.com, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, imbrenda@linux.ibm.com, 
 Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 "open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>, "Henderson,
 Richard" <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, Jul 13, 2022 at 5:07 PM Janosch Frank <frankja@linux.ibm.com> wrote=
:
>
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>

Please tell which version this update come from. Otherwise, it should be fi=
ne
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  linux-headers/linux/kvm.h | 55 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>
> diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
> index 0d05d02ee4..ae5db2e44c 100644
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
> @@ -1733,6 +1785,7 @@ struct kvm_xen_vcpu_attr {
>  #define KVM_XEN_VCPU_ATTR_TYPE_RUNSTATE_DATA   0x4
>  #define KVM_XEN_VCPU_ATTR_TYPE_RUNSTATE_ADJUST 0x5
>
> +
>  /* Secure Encrypted Virtualization command */
>  enum sev_cmd_id {
>         /* Guest initialization commands */
> @@ -2066,4 +2119,6 @@ struct kvm_stats_desc {
>  /* Available with KVM_CAP_XSAVE2 */
>  #define KVM_GET_XSAVE2           _IOR(KVMIO,  0xcf, struct kvm_xsave)
>
> +#define KVM_S390_PV_CPU_COMMAND _IOWR(KVMIO, 0xd0, struct kvm_pv_cmd)
> +
>  #endif /* __LINUX_KVM_H */
> --
> 2.34.1
>


