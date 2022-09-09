Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BE05B3CBE
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 18:13:42 +0200 (CEST)
Received: from localhost ([::1]:53930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWgdR-0007PN-7h
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 12:13:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oWgbI-0004YX-AU
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 12:11:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oWgbB-0003Vs-ET
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 12:11:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662739875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZUab6LxhmYfy7dSgFwC4pEIogIAzeXkfkimelyJVvDY=;
 b=TGPn4Wqmowy8kxVAhu2G/NtbRc4QscMoKH3WwgNKa/FHN02dJdbBdsy6+ao59O0xm9bZlC
 14vhpkCYqrHbstENZK9hL/sufqSM0D7e+QMEGhM782+gO/cBpO3VXYxwhS2HRBynga+vae
 D1LiGpa6NW3dhtcRB0EHPqpzKbbvqV0=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-10-_sQA2F6oM32TGEHttEFFQg-1; Fri, 09 Sep 2022 12:11:13 -0400
X-MC-Unique: _sQA2F6oM32TGEHttEFFQg-1
Received: by mail-qk1-f200.google.com with SMTP id
 bk21-20020a05620a1a1500b006be9f844c59so1828588qkb.9
 for <qemu-devel@nongnu.org>; Fri, 09 Sep 2022 09:11:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=ZUab6LxhmYfy7dSgFwC4pEIogIAzeXkfkimelyJVvDY=;
 b=I8ug92NqbbIwcgNy5/xmBooCk4ca0JGmhIZKXI2yl67IIXUt2y3OHqZUj9Axg+OIny
 LXWiL4BndFmr2CehVO7NKVKce2/t8ghD4P6jL5z7M70qzufNMbKjIFaZpd0loCA1/Etk
 ZjWylSRmqpKVbs705B6vxhZpkRp/0nPPEMS9j3PW0KYR7oEkaW6P7CjpCuNhzPqJatu7
 /jeYmuInhMPpLD41Xs1PXGx2R84FcMZgy4PddrmF+3nbZYU7XEWRZKPamvxNv4+GlPm3
 agRx2Q3wtZk81rmYPM1l1vcVClcFKYH7P7OIfUVghbL3ijIA7dd0Yo6i3LHlKMUckuGO
 bn/w==
X-Gm-Message-State: ACgBeo3Olr9DP9xm1QrNYSL3+X1RNGEkqh3p3hMrKrMVqwGp7CZ2IeSD
 WlHgRpJgHLFBGLFbzRQnedJcXl7IXis4cGdqvRJOkqbjeYxEy5ev9NjDIOosmxfNidYdD2Jkigz
 zEShGllDxj5n9MS0=
X-Received: by 2002:ac8:5f09:0:b0:35b:a5a3:19e2 with SMTP id
 x9-20020ac85f09000000b0035ba5a319e2mr739581qta.238.1662739872929; 
 Fri, 09 Sep 2022 09:11:12 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6+rGrEM2mr2C+r9yxmXZea3Z28Q5EncVP8bQ5b7XIQZTQ4eRfAEFR/xuypacjNNb6HFK15CA==
X-Received: by 2002:ac8:5f09:0:b0:35b:a5a3:19e2 with SMTP id
 x9-20020ac85f09000000b0035ba5a319e2mr739555qta.238.1662739872703; 
 Fri, 09 Sep 2022 09:11:12 -0700 (PDT)
Received: from xz-m1.local
 (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
 by smtp.gmail.com with ESMTPSA id
 fd9-20020a05622a4d0900b00342f8d4d0basm695105qtb.43.2022.09.09.09.11.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Sep 2022 09:11:12 -0700 (PDT)
Date: Fri, 9 Sep 2022 12:11:10 -0400
From: Peter Xu <peterx@redhat.com>
To: Zeng Guang <guang.zeng@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org, Gao Chao <chao.gao@intel.com>
Subject: Re: [PATCH v3] target/i386: Set maximum APIC ID to KVM prior to vCPU
 creation
Message-ID: <Yxtlnv+jfN0FR6v8@xz-m1.local>
References: <20220825025246.26618-1-guang.zeng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220825025246.26618-1-guang.zeng@intel.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Thu, Aug 25, 2022 at 10:52:46AM +0800, Zeng Guang wrote:
> Specify maximum possible APIC ID assigned for current VM session to KVM
> prior to the creation of vCPUs. By this setting, KVM can set up VM-scoped
> data structure indexed by the APIC ID, e.g. Posted-Interrupt Descriptor
> pointer table to support Intel IPI virtualization, with the most optimal
> memory footprint.
> 
> It can be achieved by calling KVM_ENABLE_CAP for KVM_CAP_MAX_VCPU_ID
> capability once KVM has enabled it. Ignoring the return error if KVM
> doesn't support this capability yet.
> 
> Signed-off-by: Zeng Guang <guang.zeng@intel.com>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


