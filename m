Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC5E69E8F0
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 21:14:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUZ0D-0004XF-2Z; Tue, 21 Feb 2023 15:12:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pUZ0A-0004Wm-52
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 15:12:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pUZ08-0004pM-OC
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 15:12:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677010356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6NQZbo5yyFMPpbBOZnyjvkcGxSEPl9WjIKfNtfpxwLI=;
 b=VzLyOQ41lKLGCP1PdQEtm6lp2cTidopwsZAI9kCpgOqt9nUsKeNc0VqcAigjD4tTsdKoqA
 URJP5a1WQrc9R2jYq+BYaLy0BENidTGqzPlDiKElhd9EWilIbZnInyezRxLkDNPXBwGlvJ
 V46o6RB6QMEBsqLZwbr/KL62MF0djx4=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-364-Nb5hkgBHMHCtydRdPVQ_XA-1; Tue, 21 Feb 2023 15:12:33 -0500
X-MC-Unique: Nb5hkgBHMHCtydRdPVQ_XA-1
Received: by mail-qk1-f198.google.com with SMTP id
 z23-20020a05620a101700b0073b328e7d17so2419569qkj.9
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 12:12:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6NQZbo5yyFMPpbBOZnyjvkcGxSEPl9WjIKfNtfpxwLI=;
 b=z9NItM9qFxrt5qCxXSvJOQtUDUMRWbQpZuDAZPWqktXkDBjVniVOyyXFphOzlOsZAc
 pOeoT2kb19DfWw9gbv6HUNK3+dFo7MfYjPVDAxM+N5qaOLarG4+CdZLlG5OFI+HQ/hjh
 tqlDJujH1MVw2unvVAplDzlLm0K+R8XzylyQ4SMSOS5qWRxPFwSrGCir0uBZk5lVWD0w
 knnQ23a7+d3M/+vvPlMyGqBFSnKpT/Ik9KIIqPS67C5sbQIIieGaSRrJeJT2B5vmyEKB
 xoYAmLOFKjRxCzxr6zvLruSdSLXjA+2GHJO3Uv+zwQkReeS/YRXKYw0DB2q0q25HCzDm
 wsCw==
X-Gm-Message-State: AO0yUKW3FhfNUZFi01AJtoaPmer1+EeX8wb/MeylArEqE8z9/J0PvIBd
 8edvZBzhZdccC59jHDBMANi2FzhHvg+6k9OTPnkeriESsfaRoejTAH57lu8NasqAiiRXfJTdTzZ
 qQjMMHKndEr1PiRI=
X-Received: by 2002:ac8:570e:0:b0:3a9:86dd:3c5d with SMTP id
 14-20020ac8570e000000b003a986dd3c5dmr11479749qtw.5.1677010353251; 
 Tue, 21 Feb 2023 12:12:33 -0800 (PST)
X-Google-Smtp-Source: AK7set9ckLIBFJCtBOH78XJxiKGSgrJJm/t1Bgz/4ZQTXEJxxF823WgbhNpBoqEpvVnZGF+PjWIKJA==
X-Received: by 2002:ac8:570e:0:b0:3a9:86dd:3c5d with SMTP id
 14-20020ac8570e000000b003a986dd3c5dmr11479717qtw.5.1677010352995; 
 Tue, 21 Feb 2023 12:12:32 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 c70-20020a379a49000000b0073bacce6ad7sm9164368qke.82.2023.02.21.12.12.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 12:12:32 -0800 (PST)
Date: Tue, 21 Feb 2023 15:12:30 -0500
From: Peter Xu <peterx@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, pbonzini@redhat.com,
 peter.maydell@linaro.org, david@redhat.com, philmd@linaro.org,
 mst@redhat.com, cohuck@redhat.com, quintela@redhat.com,
 dgilbert@redhat.com, maz@kernel.org, zhenyzha@redhat.com,
 shan.gavin@gmail.com
Subject: Re: [PATCH v1 4/6] kvm: Add helper kvm_dirty_ring_init()
Message-ID: <Y/UlriVMY7kTWPhj@x1n>
References: <20230213003925.40158-1-gshan@redhat.com>
 <20230213003925.40158-5-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230213003925.40158-5-gshan@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, Feb 13, 2023 at 08:39:23AM +0800, Gavin Shan wrote:
> Due to multiple capabilities associated with the dirty ring for different
> architectures: KVM_CAP_DIRTY_{LOG_RING, LOG_RING_ACQ_REL} for x86 and
> arm64 separately. There will be more to be done in order to support the
> dirty ring for arm64.
> 
> Lets add helper kvm_dirty_ring_init() to enable the dirty ring. With this,
> the code looks a bit clean.
> 
> No functional change intended.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


