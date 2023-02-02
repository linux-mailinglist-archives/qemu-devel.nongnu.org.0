Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CA2688821
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 21:15:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNfy0-0004rC-Ni; Thu, 02 Feb 2023 15:13:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNfxt-0004qh-VA
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 15:13:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNfxr-0001mn-N7
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 15:13:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675368824;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Uhqjr+A0tH5IiJW1LG5h8ug7qhF3FtXUqx8hhdtz5e0=;
 b=OD3NEDNrFeaVGPmigPfvp65+sGm6Kjol8aLscpLR0iFXNcQgM2f7jf1jlLqbrZDAF/8+on
 15limy3+7Tb5kkjuwuI1FvMhMbSPcXlWatmnM7dxhAwTOieOcVEW+7iQYm6ouLUVollhlB
 vd3hdGX4mVLnasCJelypjZwXv8bwVTQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-626-sfot4qllMe2_tbeE6EIeWQ-1; Thu, 02 Feb 2023 15:13:41 -0500
X-MC-Unique: sfot4qllMe2_tbeE6EIeWQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 k9-20020a05600c1c8900b003dc5dec2ac6so3455551wms.4
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 12:13:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Uhqjr+A0tH5IiJW1LG5h8ug7qhF3FtXUqx8hhdtz5e0=;
 b=nPLM7i3mXDOq4X+myFSHZEO2VRAXCpXUk0F2CaklH1TZFcZpbVMAvmDKGCf11WS0/K
 zOiOp12rUcCba2D6rPIYwxMnnqkvVddiP1FU74HKWrlizPwKZLzafeHIgbeFMCMgwVJ8
 h32QDuVLYQY3ML1my8T7G7S8/7sRYxRLwBbzF+kj08qVNcSBjzLsb/4QB/TtaqIHltJg
 yzdThgG9vmwnm7oM3wC94nOZIZfAThNffuIfA/5me6EFjsaAKO3u5EjlUkuyhZyIsEXd
 aZY8YjARIjjFhDNRtegz1iVnOzSY53x+Jg+9c4o650bbyTYUM5t+4FcJ4h6QDexPFmbF
 7nsw==
X-Gm-Message-State: AO0yUKWR8Pxd1K/kkT22CTfSZCGvXzhg3sQuibTx5bsitKCAKH3+JdxK
 V51IhXYKo27Ej5C9RzwOur51Fkwk4ilffMZeQ1BZdwWNRCYb5R/QpbAYFY0h6MVryGlqoBEDv+/
 sBUhO38H8maNx36A=
X-Received: by 2002:a05:6000:1ce:b0:2bf:bf32:70c with SMTP id
 t14-20020a05600001ce00b002bfbf32070cmr5986058wrx.47.1675368819656; 
 Thu, 02 Feb 2023 12:13:39 -0800 (PST)
X-Google-Smtp-Source: AK7set/frYrj5hUTwS6RaLnoQwBPjoehGX+Fh6hPleb7UmprUbxKwy+XnyP7EFP52G0NEDuG2EeWPg==
X-Received: by 2002:a05:6000:1ce:b0:2bf:bf32:70c with SMTP id
 t14-20020a05600001ce00b002bfbf32070cmr5986046wrx.47.1675368819430; 
 Thu, 02 Feb 2023 12:13:39 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 k10-20020a5d6e8a000000b002bdda9856b5sm322389wrz.50.2023.02.02.12.13.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 12:13:38 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Zhenzhong Duan <zhenzhong.duan@intel.com>
Cc: qemu-devel@nongnu.org,  dgilbert@redhat.com
Subject: Re: [PATCH 1/2] multifd: Fix a race on reading MultiFDPages_t.block
In-Reply-To: <20221017075351.2974642-1-zhenzhong.duan@intel.com> (Zhenzhong
 Duan's message of "Mon, 17 Oct 2022 15:53:50 +0800")
References: <20221017075351.2974642-1-zhenzhong.duan@intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 02 Feb 2023 21:13:33 +0100
Message-ID: <871qn7u8pe.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Zhenzhong Duan <zhenzhong.duan@intel.com> wrote:
> In multifd_queue_page() MultiFDPages_t.block is checked twice.
> Between the two checks, MultiFDPages_t.block may be reset to NULL
> by multifd thread. This lead to the 2nd check always true then a
> redundant page submitted to multifd thread again.
>
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


