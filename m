Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 615364432AA
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 17:25:38 +0100 (CET)
Received: from localhost ([::1]:48658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhwbR-0000UR-7o
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 12:25:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhwN9-00084o-4r
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:10:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhwN5-0006cq-GI
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:10:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635869446;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=98PqwyJBHFTygsFv+OZoYC0BCgs+WNAaHT3K0OJUzUs=;
 b=V2eDbTvrX78UfygVD83YBYCxnh7Ti6+Mhl9XdxUZFIAGfDHd12+MlvYnufkndCyTEc/zTB
 V8oRNYpGOAwLbU825dH1Rb8mDDY9mF1YDk6nT5ZAvSbCXXTEo8yTRDCF5P4UFT7ABxp+Xm
 /aTipWe/dnm0I5A/WxuhoejSYiovpyc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-gO6OByBLMoihPhx5_spsAA-1; Tue, 02 Nov 2021 12:10:45 -0400
X-MC-Unique: gO6OByBLMoihPhx5_spsAA-1
Received: by mail-wm1-f69.google.com with SMTP id
 m1-20020a1ca301000000b003231d5b3c4cso1373230wme.5
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 09:10:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=98PqwyJBHFTygsFv+OZoYC0BCgs+WNAaHT3K0OJUzUs=;
 b=hduDe5LHEDc/5+lQtQCHrgLICCICo2hUxpEnt2eesbGstJroPLhFzgBMPNJbE6KyZz
 amyL42B2noAQLgspgYXC0mjMp6IX1QrM0VvSw1T7EBuzMoTp1EhM6ndXfzymTV8CBJhI
 UKt3+ghKM0hv3AFuHs1zdP5FwiOBgvA5emthIygyAz244i5GT4CIxvWUPN3ky2RNoDqe
 Cbll4Wn79LiBuro/YSX7K9tISymBezal6RD0ckJkPrPUrDHve4MtpJFrGfE9+fNuuHkc
 GCqQhK0ZtRY8g+m24M8KuhQDA1EWuBcvQ3rC1vFi11AsjhZt6aSX9fDLE1LkuR2NEAeQ
 SfRA==
X-Gm-Message-State: AOAM530xIs4yA+elo075UnKuaLNEgYz8pv2lVBCaXO2J9ZOjFCixeAjm
 JHIdEAGPdgNmYj6zAteULC9TQFsWzN8Esrgc1Zezrxa7H3ObkjgTniepOpknn7zgjOD5PWyRzmV
 CFlObWrbu7mRjV0M=
X-Received: by 2002:a1c:8015:: with SMTP id b21mr7778248wmd.161.1635869444563; 
 Tue, 02 Nov 2021 09:10:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz//yCTGEdcVgfDbnpmCiVt2aWr5cPuFoZD1FYA21vjNziKmkcwk6uRcVi/buet9SWug7UQjw==
X-Received: by 2002:a1c:8015:: with SMTP id b21mr7778205wmd.161.1635869444343; 
 Tue, 02 Nov 2021 09:10:44 -0700 (PDT)
Received: from localhost ([188.26.219.212])
 by smtp.gmail.com with ESMTPSA id l26sm3173458wms.15.2021.11.02.09.10.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 09:10:43 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: "Rao, Lei" <lei.rao@intel.com>
Subject: Re: [PATCH v2 6/7] Changed the last-mode to none of first start COLO
In-Reply-To: <1635753425-11756-7-git-send-email-lei.rao@intel.com> (Lei Rao's
 message of "Mon, 1 Nov 2021 15:57:04 +0800")
References: <1635753425-11756-1-git-send-email-lei.rao@intel.com>
 <1635753425-11756-7-git-send-email-lei.rao@intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 02 Nov 2021 17:10:42 +0100
Message-ID: <87h7cuh725.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: lukasstraub2@web.de, zhang.zhanghailiang@huawei.com,
 lizhijian@cn.fujitsu.com, jasowang@redhat.com, dgilbert@redhat.com,
 qemu-devel@nongnu.org, chen.zhang@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Rao, Lei" <lei.rao@intel.com> wrote:
> From: "Rao, Lei" <lei.rao@intel.com>
>
> When we first stated the COLO, the last-mode is as follows:
> { "execute": "query-colo-status" }
> {"return": {"last-mode": "primary", "mode": "primary", "reason": "none"}}
>
> The last-mode is unreasonable. After the patch, will be changed to the
> following:
> { "execute": "query-colo-status" }
> {"return": {"last-mode": "none", "mode": "primary", "reason": "none"}}
>
> Signed-off-by: Lei Rao <lei.rao@intel.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued.


