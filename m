Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D67625874
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 11:34:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otRLy-0001U2-AL; Fri, 11 Nov 2022 05:33:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1otRLR-0001Lr-Td
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 05:33:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1otRLP-0000ub-Gt
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 05:33:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668162787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rCLt9FSqNeXP1wVr2qH6MuZQcIugm0bJHKmlpsp6YCc=;
 b=Jl1zOPVJNB/opvZusoxrY5FMeKlIOFMH12gwV5XryP6iI6WKbZhz48a83H5CDZPPDDV1ZT
 fP6eW8Fxq14uGLwdJx9Mpk84NQuj40maRk3xorAHuVdK3Jh//5rMlLYKsVSGsidYzocjc5
 pAmIX28YSbfmHNZxG2NKq0HLeAdaH3I=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-314-f5tsLfOPPxezpzq3e8Nuxg-1; Fri, 11 Nov 2022 05:33:05 -0500
X-MC-Unique: f5tsLfOPPxezpzq3e8Nuxg-1
Received: by mail-qt1-f198.google.com with SMTP id
 gc12-20020a05622a59cc00b003a5444280e1so3372681qtb.13
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 02:33:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rCLt9FSqNeXP1wVr2qH6MuZQcIugm0bJHKmlpsp6YCc=;
 b=cNyigFKDpEJLUM4KpEZrugeX4b6BAXHt/nipYMtGD9DKmdS/mtVgFFkwZrr0XBsvrx
 2XNM3KGa/LMx2lmgJzjYtVY1piYmxRCGOOCG+Iapvby4yEaGE2Bi8ZHaAnk9KP/NQASG
 hBZP4VP9iaknmLrseYrcSLruphQlwdzAIJm8BJT2678AuTyR1HCpG/OSJJopN+fJRsVH
 wVRyrMG2kxBDw167xgv/cBP9BVuyHCDrk5bU3T+UdkEM5tUsGKi0QTvUtRDmvocKk88U
 /kRwqL5MIy+7Jn9+z6+1HT8w1B6tT+Mssyv51k9D8rqLM023MSkra4OX0VYwhlFSPts8
 Rplw==
X-Gm-Message-State: ANoB5pkM4C2BZKEVBRQSHzthdGsKrRyc93g0VN8x7wR2xlhsHy+SW9ic
 X8l+4NgM1GFUK2y4dY/KC3IXevjY4Sezn0a2xsi6NodTqnb3iJ85lIITTQCRtSJV/g7mtRKMvIP
 A39Qwln4Wr0BmzJc=
X-Received: by 2002:a37:a807:0:b0:6ec:5496:4e17 with SMTP id
 r7-20020a37a807000000b006ec54964e17mr466788qke.559.1668162784202; 
 Fri, 11 Nov 2022 02:33:04 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6xQIHCkuOfgFH1un5+bd/qFtjFQPizU2Hwn9IZHVgV1yadnv5h3BN2c6fEhSYOCgjVrvz8gw==
X-Received: by 2002:a37:a807:0:b0:6ec:5496:4e17 with SMTP id
 r7-20020a37a807000000b006ec54964e17mr466774qke.559.1668162783991; 
 Fri, 11 Nov 2022 02:33:03 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 h12-20020a05620a400c00b006b949afa980sm1205970qko.56.2022.11.11.02.33.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 02:33:03 -0800 (PST)
Date: Fri, 11 Nov 2022 11:33:00 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Dario Faggioli <dfaggioli@suse.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "eduardo@habkost.net"
 <eduardo@habkost.net>, "mst@redhat.com" <mst@redhat.com>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
Subject: Re: How about increasing max_cpus for q35 ?
Message-ID: <20221111113300.7dd39cdd@imammedo.users.ipa.redhat.com>
In-Reply-To: <c705d0d8d6ed1a520b1ff92cb2f83fef19522d30.camel@suse.com>
References: <c705d0d8d6ed1a520b1ff92cb2f83fef19522d30.camel@suse.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Wed, 9 Nov 2022 13:36:07 +0000
Dario Faggioli <dfaggioli@suse.com> wrote:

> Hello,
> 
> Sorry for the potentially naive question, but I'm not clear what the
> process would be if, say, I'd like to raise the number of maximum CPUs
> a q35 VM can have.
> 
> So, right now we have:
> 
> void pc_q35_2_7_machine_options(MachineClass *m) {
>   ...
>   m->max_cpus = 255;
> }
> 
> And:
> 
> void pc_q35_machine_options(MachineClass *m)
> {
>   ...
>   m->max_cpus = 288;
> }
> 
> Focusing on the latter, it comes from this commit:
> 
> https://gitlab.com/qemu-project/qemu/-/commit/00d0f9fd6602a27b204f672ef5bc8e69736c7ff1
>   
>   pc: q35: Bump max_cpus to 288
> 
>   Along with it for machine versions 2.7 and older keep
>   it at 255.
> 
> So, it was 255 and is now 288. This seems to me to be there since QEMU
> 2.8.0.
> 
> Now, as far as I understand, KVM can handle 1024, at least since this
> commit (and a couple of other related ones):
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=074c82c8f7cf8a46c3b81965f122599e3a133450
> "kvm: x86: Increase MAX_VCPUS to 1024"
> 
> Which basically does:
> 
> -#define KVM_MAX_VCPUS 288
> +#define KVM_MAX_VCPUS 1024
> 
> And it's included in kernels >= 5.15.
> 
> So, what's the correct way of bumping up the limit again? Just changing
> that assignment in pc_q35_machine_options()

that and preserve 288 limit for existing machine types.

Basically the same as above QEMU commit with difference
that pc_q35_2_8_machine_options() should be replaced by
7.2 equivalent.


PS:
we are still missing OVMF support for 1024,
but it's being worked on.

> ? Or do we want a new
> version of the machine type or something like that?
> 
> Thanks and Regards


