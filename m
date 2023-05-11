Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA926FEDF5
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:41:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px1qa-0004fi-Hp; Thu, 11 May 2023 04:40:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1px1qY-0004fH-Mv
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:40:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1px1qW-0008KT-B3
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:40:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683794418;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=KkiY2CX19VmrnDQghLVWoSw1fZuq/gJ/crDfJaUACnE=;
 b=URQdmmO+vlCLhNOy2kQ9Lr4jPQKJob/UdbPbedry/6d1DJfZJWaMGd6NtyCbXun9CtMM7i
 pdgSpGshsMb9IXkO95EA132dJ8MrOQxPyxm44xtsth16i7HBjvSCs4owxALbG69AwdxcMx
 rDsaZJe5gfdBKElKqqXipTQ+rnsmsgg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-547-02dOgagXMb6QKLlYQEnDFA-1; Thu, 11 May 2023 04:40:17 -0400
X-MC-Unique: 02dOgagXMb6QKLlYQEnDFA-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f315735edeso180776865e9.1
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 01:40:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683794416; x=1686386416;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KkiY2CX19VmrnDQghLVWoSw1fZuq/gJ/crDfJaUACnE=;
 b=X9tuKYGFZ8A3O1q7ZPk0SUCssLIEk7LtsjNXqgI0Zjr21MZftER9wilXz4eL3OjHgX
 K6kA+rZxJ5Jb2bdhAc8iOvb1HOTmT9NGj82TREGsq3yf0NeVhG6C87cf/KOs8rraXXRr
 jjr7MQzQoakzlkyn3ErnDN2vs+f2uNIgOQZzMiNfc3wXyxU7IyTOkKlyJdRYyx9xHRU5
 ZXkK/9cKu7nlbT8sgZ97ZRBkpjHbCfsRMEcM0i8c9Hro5nbDoei0+q5jhVmJgHdSTXap
 41KYOu6LgvGDMGW4KaKKGbB9ukbe/ml+oLXUedVcwXRV6eSiNxz7eN8j56moxGToVRVz
 85rw==
X-Gm-Message-State: AC+VfDxruWpoN/ORbSoCb9A5hyKzpcqtmzeIG826wPGO3MtqVo09IlKW
 OsO+pVTzxmDdx+E1cyGjn3qVgrHku4xi1Bcfeu4lvAzn48+TFF0BGLvP6Ubu/Vwkt+gL10AZGvx
 xlGYbLLdPHGCKGaI=
X-Received: by 2002:a5d:4052:0:b0:2f7:cfe2:6507 with SMTP id
 w18-20020a5d4052000000b002f7cfe26507mr16268800wrp.20.1683794415992; 
 Thu, 11 May 2023 01:40:15 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6NDJtDdPCEz+rhe5Lg8q89uj7TDTNO8/yg6wlP6bq71VOpeOxbG/uazHlSTHGLTkX6p3l3Hg==
X-Received: by 2002:a5d:4052:0:b0:2f7:cfe2:6507 with SMTP id
 w18-20020a5d4052000000b002f7cfe26507mr16268778wrp.20.1683794415564; 
 Thu, 11 May 2023 01:40:15 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 p1-20020a05600c204100b003f4e47c6504sm2642462wmg.21.2023.05.11.01.40.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 01:40:14 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Fiona Ebner <f.ebner@proxmox.com>
Cc: Leonardo Bras <leobras@redhat.com>,  Eduardo Habkost
 <eduardo@habkost.net>,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Yanan Wang
 <wangyanan55@huawei.com>,  "Michael S. Tsirkin" <mst@redhat.com>,  Peter
 Xu <peterx@redhat.com>,  qemu-devel@nongnu.org
Subject: Re: [PATCH v1 1/1] hw/pci: Disable PCI_ERR_UNCOR_MASK register for
 machine type < 8.0
In-Reply-To: <7f308149-5495-d415-5e51-1fa15fc20f84@proxmox.com> (Fiona Ebner's
 message of "Thu, 11 May 2023 10:27:35 +0200")
References: <20230503002701.854329-1-leobras@redhat.com>
 <7f308149-5495-d415-5e51-1fa15fc20f84@proxmox.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 11 May 2023 10:40:14 +0200
Message-ID: <87jzxf5ki9.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Fiona Ebner <f.ebner@proxmox.com> wrote:
> Am 03.05.23 um 02:27 schrieb Leonardo Bras:
>> Since it's implementation on v8.0.0-rc0, having the PCI_ERR_UNCOR_MASK
>> set for machine types < 8.0 will cause migration to fail if the target
>> QEMU version is < 8.0.0 :
>> 
>> qemu-system-x86_64: get_pci_config_device: Bad config data: i=0x10a read: 40 device: 0 cmask: ff wmask: 0 w1cmask:0
>> qemu-system-x86_64: Failed to load PCIDevice:config
>> qemu-system-x86_64: Failed to load e1000e:parent_obj
>> qemu-system-x86_64: error while loading state for instance 0x0 of device '0000:00:02.0/e1000e'
>> qemu-system-x86_64: load of migration failed: Invalid argument
>> 
>> The above test migrated a 7.2 machine type from QEMU master to QEMU 7.2.0,
>> with this cmdline:
>> 
>> ./qemu-system-x86_64 -M pc-q35-7.2 [-incoming XXX]
>> 
>> In order to fix this, property x-pcie-err-unc-mask was introduced to
>> control when PCI_ERR_UNCOR_MASK is enabled. This property is enabled by
>> default, but is disabled if machine type <= 7.2.
>> 
>> Fixes: 010746ae1d ("hw/pci/aer: Implement PCI_ERR_UNCOR_MASK register")
>> Suggested-by: Michael S. Tsirkin <mst@redhat.com>
>> Signed-off-by: Leonardo Bras <leobras@redhat.com>
>
> Thank you for the patch!
>
> Closes: https://gitlab.com/qemu-project/qemu/-/issues/1576
>
> AFAICT, this breaks (forward) migration from 8.0 to 8.0 + this patch
> when using machine type <= 7.2. That is because after this patch, when
> using machine type <= 7.2, the wmask for the register is not set and
> when 8.0 sends a nonzero value for the register, the error condition in
> get_pci_config_device() will trigger again.

I think that works correctly.
See https://lists.gnu.org/archive/html/qemu-devel/2023-05/msg02733.html

What we have (before this patch) (using abbrevs as in the doc before)

Current state:

(1) qemu-8.0 -M pc-8.0 -> qemu-8.0 -M pc-8.0 works

    not affected by the patch

(2) qemu-7.2 -M pc-7.2 -> qemu-8.0 -M pc-8.0 works

    works well because 7.2 don't change that field

(3) qemu-8.0 -M pc-7.2 -> qemu-7.2 -M pc-7.2 fails

With the patch we fixed 3, so once it is in stable, 1 and 2 continue as
usual and for (3) we will have:

(3) qemu-8.0.1 -M pc-7.2 -> qemu-7.2 -M pc-7.2 works

If what you mean is that:

(3) qemu-8.0 -M pc-7.2 -> qemu-8.0.1 -M pc-7.2 works

Will fail, that is true, but I can think a "sane" way to fix this.


> Is it necessary to also handle that? Maybe by special casing the error
> condition in get_pci_config_device() to be prepared to accept such a
> stream from 8.0?

Well, we can do that, but it is to the pci maintainers to decide if that
is "sane".


> If that is considered not worth it, consider this:
>
> Tested-by: Fiona Ebner <f.ebner@proxmox.com>
>
> Best Regards,
> Fiona

Later, Juan.


