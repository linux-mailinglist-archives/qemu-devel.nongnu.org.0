Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8AD63CC14
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 00:59:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0AVC-0006Pp-Mr; Tue, 29 Nov 2022 18:59:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p0AVA-0006LY-Cs
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 18:59:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p0AV9-0003qm-0x
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 18:59:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669766338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6QOEeEsrUVbPJBLydDlPvaPSFvvRVNF97/KLL8fmnx4=;
 b=RZVvfYnxNdUIfDW4Pp7sfxhRFsHtcP+7i7eOixlG04T2Z5oZu36qVsIPxdVCQ1Azfq0OxG
 2kiQfiYaW1w4rGvVFXiA+iRcTj/kg+2FYSynBTnXoE4WMg2OJ9uyLizFtme/gj8P3gCnP6
 EYQM8ktk0awMxm8Pu+NaBKJkjJBW8pU=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-53-pxU6McDuMZefIIcGZTza4g-1; Tue, 29 Nov 2022 18:58:57 -0500
X-MC-Unique: pxU6McDuMZefIIcGZTza4g-1
Received: by mail-qt1-f199.google.com with SMTP id
 bb32-20020a05622a1b2000b003a56991a048so24253509qtb.6
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 15:58:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6QOEeEsrUVbPJBLydDlPvaPSFvvRVNF97/KLL8fmnx4=;
 b=U47TXxMVH/9/v3/1T5Fc4cPa8HeY+jgA/EGCA0APzArzUFnfaaYlxPnDLBHyu6lMt9
 njPpwBsK9bCPG5dneoucofj/bvPl7SPNxcMVcverDIeP4JcCu+xBsie1Oj4nNJ96DTpi
 1jKxwpk8FChzrcK8zqRYhLydartYAHcj2/qEYvhJruaS0CzNYkYUu9C4PbvlF7dclPB5
 tdXJJvEBmk419xAP5zpOEU/6virnTZMbAR2BY5UABO+QqWQgEAIcl4+8oGbYsZqEngtd
 ghWzHa+ZzdiQxQdtpX7ncUJA5tGY8Nt20N2o/1hYcJaTodsliTu70IK+ZCqdHG/Wyann
 vWIA==
X-Gm-Message-State: ANoB5pl80lC57Gw/sf0WKupZhr8mkZeI6FODUF4Pks0AqjWyG0NTwM7M
 E2VMqiyGx15chgCXuZdFaDPgAMIR+epKOrkXmPmKeSEDOjK3xLTAY3bMe8GS8LlV/S2mp7Fd+bC
 3sSmLbE4PxuOBLwY=
X-Received: by 2002:a0c:ed47:0:b0:4c6:dd63:80fd with SMTP id
 v7-20020a0ced47000000b004c6dd6380fdmr26272607qvq.124.1669766336556; 
 Tue, 29 Nov 2022 15:58:56 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5oU3ZP/MjPCrkMskeVmTCZPe6otoDXefCg9NdU9nJEPoMbcuxU30EC6ktCgIXfg+ploUpyyg==
X-Received: by 2002:a0c:ed47:0:b0:4c6:dd63:80fd with SMTP id
 v7-20020a0ced47000000b004c6dd6380fdmr26272594qvq.124.1669766336356; 
 Tue, 29 Nov 2022 15:58:56 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 k2-20020ac81402000000b0039467aadeb8sm9297963qtj.13.2022.11.29.15.58.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 15:58:56 -0800 (PST)
Date: Tue, 29 Nov 2022 18:58:55 -0500
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Cc: qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 06/11] migration: Introduce dirty-limit capability
Message-ID: <Y4acv3nBbfO8yktu@x1n>
References: <cover.1669047366.git.huangy81@chinatelecom.cn>
 <ebcdcd608420e928d627740938ee9929f8940d38.1669047366.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ebcdcd608420e928d627740938ee9929f8940d38.1669047366.git.huangy81@chinatelecom.cn>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

On Mon, Nov 21, 2022 at 11:26:38AM -0500, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> Introduce migration dirty-limit capability, which can
> be turned on before live migration and limit dirty
> page rate durty live migration.
> 
> Introduce migrate_dirty_limit function to help check
> if dirty-limit capability enabled during live migration.
> 
> Meanwhile, refactor vcpu_dirty_rate_stat_collect
> so that period can be configured instead of hardcoded.
> 
> dirty-limit capability is kind of like auto-converge
> but using dirty limit instead of traditional cpu-throttle
> to throttle guest down. To enable this feature, turn on
> the dirty-limit capability before live migration using
> migratioin-set-capabilities, and set the parameters
> "x-vcpu-dirty-limit-period", "vcpu-dirty-limit" suitably
> to speed up convergence.
> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

Acked-by: Peter Xu <peterx@redhat.com>

PS: please replace 7.1 with 7.3 in this patch and the previous one.

-- 
Peter Xu


