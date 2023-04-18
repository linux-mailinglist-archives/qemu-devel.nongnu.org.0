Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D786E6A40
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 18:55:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poobk-0008EJ-If; Tue, 18 Apr 2023 12:55:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hshan@google.com>) id 1poobf-0008EA-P4
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 12:55:03 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hshan@google.com>) id 1poobe-0007VE-4a
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 12:55:03 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-63b5465fc13so1753536b3a.3
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 09:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1681836900; x=1684428900;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kjxyy4RaGEC2WfRTXjfaQhWzDl507YlIkxr9MkVVYwc=;
 b=MUAsxiMLXMYtIJFcgEP2bO2xMTu1PqgbvZWGx7RfRy9gYsJlD868eCzk9Qy116j1TC
 cXfkeNJD7v/Tv7kidpfvR/DIQrZ2o46ik4bXTaqyKVrQgvKav6AAmo/lNoOHJRHJXR42
 PCl701VpI56NZ22+4HBaU8/b/utZdkwjPcc+tQnEfD4jtZY0bI99xqqQEvRbM54rTSAa
 0JMjhgDxevj34ymnlC8O5BGKq2H2JD2ieI2DqAMk5TlKMi7zFW9pL/rH4vXML9Q66588
 ha8kHn3qd5xP3QLmFGQVQcinV0eHhZniWfhlzaSB18LggZscc72SI1Vj16c4mWZVk/Kd
 wg9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681836900; x=1684428900;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kjxyy4RaGEC2WfRTXjfaQhWzDl507YlIkxr9MkVVYwc=;
 b=ZYChFRsb6QUPK2xolQsnZFFOi8f16VzKOn2CJR8dpq2IpHFdI8pAYo8YO8mAKYpS6I
 NLiY4CC/n8AcYWm6YOnmdxFY9Ad1jjxk5xOO2VmUvsi9otXdYGQNIPk0cdGEVUkL/88O
 Q6ri4la/naixRauOOobg7bKF1ndqxbxG9Hz4H64hRp8Y/aEImMbV3RMD2CTttDbyitp8
 inTiluAmmNkg1nGeoWeSF452eLW3ouADw6IXhzH6B+cd8bOsY/dq92Q7gxpacjDryDg0
 TwW3140AYova7JT9mgz6CTMI3v09Isgfx9IVBbEmyTgoZl0fh9CQiYwyuCPK2Ejgb3Za
 O8Lw==
X-Gm-Message-State: AAQBX9fUXRdfbIa+UfOxmXV8+vzhqrOxhvX+JqrtbLh9HYc+yaPV1sT7
 OQs2FK8+TeWvYPg36mdWBwlufT9QJvY6dQoaeZpKlQ==
X-Google-Smtp-Source: AKy350aVu3gFfhT4BBFRoUErFFbTXvHB5DO2RVFoaYXUl0qPmkmvFokCDQpGMHz1M7+6ftFNOKSxHWNXMFQtGDqSb84=
X-Received: by 2002:a17:902:e890:b0:1a8:16d2:a86b with SMTP id
 w16-20020a170902e89000b001a816d2a86bmr29020plg.8.1681836899725; Tue, 18 Apr
 2023 09:54:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAGD3tSzW1QoAsn+uGjoAkBegLt1iZ=9YWDFcvqbcHMr0S_5kVw@mail.gmail.com>
 <ZAHNEtV0N+9JyZTk@redhat.com>
 <CAGD3tSzZAa+zRv0xEetB-WW+zmnGNJUAzLj0CyGCek9YYDNq9g@mail.gmail.com>
 <ZAIqclU7BbH2vog7@redhat.com>
 <CAGD3tSw_OdDV3gZo7mxeKP0da-NrdikRGySKtFC9rhn4Dn_G1g@mail.gmail.com>
 <817fc488-6058-69b3-280b-611f9a77bcf0@redhat.com>
In-Reply-To: <817fc488-6058-69b3-280b-611f9a77bcf0@redhat.com>
From: Haitao Shan <hshan@google.com>
Date: Tue, 18 Apr 2023 09:54:48 -0700
Message-ID: <CAGD3tSxmsJmfvpCA2tODTakVFO0oE4Ezd78Qc85wNPCf2bkJ2g@mail.gmail.com>
Subject: Re: [PATCH 0/6] Adding the Android Emulator hypervisor driver
 accelerator
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=hshan@google.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

On Tue, Apr 4, 2023 at 4:55=E2=80=AFAM Paolo Bonzini <pbonzini@redhat.com> =
wrote:
>
> On 3/3/23 18:39, Haitao Shan wrote:
> >> No, we're always open to new proposals. It merely means that it
> >> might be harder to justify why the new hypervisor is a net benefit
> >> for QEMU, when there is a competing solution supported by the OS
> >> vendor.
> >
> > Thanks for the clarification. It is great that the door is not shut com=
pletely.
>
> Hi,
>
> sorry for not answering before.
Thanks for your reply. I was taking a long vacation and did not see
your reply earlier.

>
> I think in general QEMU should be open to merging work from the Android
> Emulator.  If AEHD is useful to the Android emulator, I would consider
> it interesting for QEMU as well.
Thanks for being open to us. For patchset V1, the most important
feedback we can have is that our work can be useful to the community
(not just the android emulator).

>
> However, I would rather have it as an extension to KVM if possible
> rather than a completely new emulator.  One possibility is to introduce
> a new file that encapsulates all KVM ioctls, with a struct that
> encapsulates the Unix file descriptor/Windows HANDLE.  For example
>
> int kvm_ioctl_get_supported_cpuid(KVMState *s, struct kvm_cpuid *cpuid,
>                                    int max)
> {
>      cpuid->nent =3D max;
> #ifdef CONFIG_POSIX
>      return ioctl(s, KVM_GET_SUPPORTED_VCPUID, cpuid);
> #else
>      size_t size =3D sizeof(*cpuid) + max * sizeof(*cpuid->entries);
>      return aehd_ioctl(s, AEHD_GET_SUPPORTED_CPUID, cpuid, size, cpuid,
> size);
> #endif
> }
>
> int kvm_ioctl_create_vcpu(KVMState *s, int vcpu_id, CPUState *out)
> {
> #ifdef CONFIG_POSIX
>      out.kvm_fd =3D kvm_vm_ioctl(KVM_CREATE_VCPU, vcpu_id);
>      return out.kvm_fd;
> #else
>      return aehd_vm_ioctl(s, AEHD_CREATE_VCPU, &vcpu_id, sizeof(vcpu_id),
>                           &out.kvm_fd, sizeof(out.kvm_fd));
> #endif
> }
>
> etc.
>
> These are just general examples, the actual level of abstraction is up
> to you.
I will work on the new patchset. And most likely it will take some time.

>
> Paolo
>


--=20
Haitao @Google

