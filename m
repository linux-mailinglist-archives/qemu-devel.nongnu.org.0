Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 791F748523A
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 13:04:53 +0100 (CET)
Received: from localhost ([::1]:51496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n552C-0005ra-1V
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 07:04:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1n54y4-0004t2-6I
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 07:00:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1n54xz-0002JK-94
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 07:00:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641384029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HdcG1nnwMvh3mt8sV+1CnT/zj4F3MiOiUjlO99Slmmg=;
 b=h2OOfbhbuozGbamWf5jGLmz4haIifSKSkx0KnzVN9w2mK49U6p7MihGtkqr2MAwBPOCkbO
 cE3HwI7dGKpbMKyHCO4fncp9d/19+60RHI1x5FDMNxEITkk4obWuYH0dcIVkalJx5okg7p
 7jKHWB630Kd9/hrH2APGO2LpwsASwxQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-qzRDizJ9PmenzNCb6qomRQ-1; Wed, 05 Jan 2022 07:00:28 -0500
X-MC-Unique: qzRDizJ9PmenzNCb6qomRQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 v1-20020adfc5c1000000b001a37fd2fa2dso3488794wrg.22
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 04:00:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=HdcG1nnwMvh3mt8sV+1CnT/zj4F3MiOiUjlO99Slmmg=;
 b=uUkmuejmERsmbMB1QzGhEuODp2dPp6JCp0YB3vYP74q5M+s36rxCTnap89XOEp9xIR
 r1s6Hcob7LZQGRi1TnbjhA6/LjvmBzSRopPjTuqyErDUV02fzyuHvHZRuFRftEI+w5Me
 CJexNisFAfUcRGgQXTmPdNVjK4v4pRVSAWXRLEa43WVXCt+TmlurLsMdWwcPSpUjYf2h
 ivkRlGI6hs4plnAPyBNMPL/lUaQZkEjZIMfrdBPYAXOEszSBEr84XIT36324WbCbpCW2
 kzDKVcgBqBjape6/NICPOps2+465r81BIT3S8Hpa+9EdX9BLroIzdI7mbrxzkjCdqTX8
 TYSA==
X-Gm-Message-State: AOAM530Fq/RDw4Ufj5SdSwTWk/jOnrl9yYbwOe4u0vGbVtOdp6/V2a5V
 O4zBZWQxCmDMlLMsweI6UIjzHegZtnPTdcF6YgxTpG1LIVi0c4uyJjS3ukf4rgMBRPMwHwS7B+f
 JLRszQLU6/xRYEG4=
X-Received: by 2002:adf:e645:: with SMTP id b5mr28216441wrn.462.1641384027693; 
 Wed, 05 Jan 2022 04:00:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQb9LlwtqP/q+qyPowoetQ3Ywp7Y0nu98ldQk8CCIADJg4JqL13aVJcusVzmhK5kSQNQ5uww==
X-Received: by 2002:adf:e645:: with SMTP id b5mr28216427wrn.462.1641384027526; 
 Wed, 05 Jan 2022 04:00:27 -0800 (PST)
Received: from steredhat (host-79-51-11-180.retail.telecomitalia.it.
 [79.51.11.180])
 by smtp.gmail.com with ESMTPSA id p15sm2303882wmj.46.2022.01.05.04.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 04:00:27 -0800 (PST)
Date: Wed, 5 Jan 2022 13:00:24 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Subject: Re: [PATCH] optionrom: Turn off -fcf-protection
Message-ID: <20220105120024.eisp4nebq7pqf6ly@steredhat>
References: <20220103090112.312202-1-bjorn@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20220103090112.312202-1-bjorn@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CCing Paolo

On Mon, Jan 03, 2022 at 10:01:12AM +0100, Björn Töpel wrote:
>Ubuntu GCC enables -fcf-protection globally, which is not supported
>for x86 16-bit (realmode). This causes the build to fail.
>
>This commit turns off that option.
>
>Signed-off-by: Björn Töpel <bjorn@kernel.org>
>---
> pc-bios/optionrom/Makefile | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/pc-bios/optionrom/Makefile b/pc-bios/optionrom/Makefile
>index 5d55d25acca2..c5f5fa02ef06 100644
>--- a/pc-bios/optionrom/Makefile
>+++ b/pc-bios/optionrom/Makefile
>@@ -21,6 +21,7 @@ override CFLAGS += $(filter -W%, $(QEMU_CFLAGS))
> override CFLAGS += $(CFLAGS_NOPIE) -ffreestanding -I$(TOPSRC_DIR)/include
> override CFLAGS += $(call cc-option, -fno-stack-protector)
> override CFLAGS += $(call cc-option, -m16)
>+override CFLAGS += $(call cc-option, -fcf-protection=none)

LGTM!

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


