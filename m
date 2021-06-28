Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADBF3B63AC
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 16:57:39 +0200 (CEST)
Received: from localhost ([::1]:51432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxshe-0005iV-Ag
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 10:57:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lxsfx-0003hB-MC
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 10:55:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lxsfv-0004pT-Tq
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 10:55:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624892151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wIXNaYag5SlNACVwuwbCc7mT5noDYGj9XV1/sT/Pwqc=;
 b=ZOfFf6jqdTc7BMLeCCan/yfLkj5Chi3Oa1Mg2bRXRflRk/nqOLElnZS/dfHsXCFKpkES2A
 qUOHhQwetjWnEBlzoSl6/Doyur70vVaLdp7s8M+UtMcf7ksFrVODJpgRrRFoe+x5oU8+hq
 RM6fQhuD2VgfC9LpHLyc8T5MZTfKtzY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-3a-3e8vMOTSexXrkuxbEHQ-1; Mon, 28 Jun 2021 10:55:48 -0400
X-MC-Unique: 3a-3e8vMOTSexXrkuxbEHQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 ds1-20020a0564021cc1b02903956bf3b50cso1242798edb.8
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 07:55:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=wIXNaYag5SlNACVwuwbCc7mT5noDYGj9XV1/sT/Pwqc=;
 b=uiid95YwOo3k87+RhbJWjfnckNhVWa1TDJ5a4vmbqMtUmaIDPak3oCdbS9ALDWBumb
 pzCZlbV5uafqLtXsl5N91kMzeSChMeOaf7zHnw1UkEdxRkTO1DRGCW9Ql1dG7aSddANK
 TmywTwJ2f2C58SEvsJ3W0MYaOjdj7DHzuXPE8tzZLZDDQklZcp1WpsNN5kswFpdKBxPA
 /eLNCpzJmMDQB7cOtjwZpgeMRdii7+bjopkWne/V0ahweSzv1VRCUYjJEHs6L3V5a+zD
 195MPvriuX4HGnKJIfWcXgGjI/7CMjVx96+KGNT9hlWml7JTWo50JLrdB1ISYHYtBE27
 CdTw==
X-Gm-Message-State: AOAM5321nevWWoCajLOlL1kGtOETOhGfmCn0PxKeT+my0WrGL0jfBlj6
 lK1oF/pYG7BDhszNGq+hklpg3dzGROwBVf8mhl8dfGG0oCMrGoaf3pDm3FQ2SBJUtn26A+8oEuc
 wkl4qPbERJSjYtN8=
X-Received: by 2002:a05:6402:3507:: with SMTP id
 b7mr34008247edd.66.1624892147578; 
 Mon, 28 Jun 2021 07:55:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIX7fPGXexukjAqP6Vjdu7zdBQ6X2ENHTNIALQ+D2OVT41JcWIkNSTfkx9BLM+oETx/atW+Q==
X-Received: by 2002:a05:6402:3507:: with SMTP id
 b7mr34008230edd.66.1624892147424; 
 Mon, 28 Jun 2021 07:55:47 -0700 (PDT)
Received: from gator (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id u4sm6946484eje.81.2021.06.28.07.55.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 07:55:46 -0700 (PDT)
Date: Mon, 28 Jun 2021 16:55:44 +0200
From: Andrew Jones <drjones@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 0/4] docs: improve -smp documentation
Message-ID: <20210628145544.6bsubol7ousdlbzl@gator>
References: <20210628113047.462498-1-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210628113047.462498-1-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "wangyanan \(Y\)" <wangyanan55@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 28, 2021 at 12:30:43PM +0100, Daniel P. Berrangé wrote:
> This is a spin off from this thread:
> 
>   https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg06135.html
> 
> to improve the documentation of the current behaviour of -smp
> arg. In that thread it is suggested that we change the behaviour
> to prefer use of cores over sockets, when topology is omitted. This
> documentation update explicitly notes that default topology is liable
> to change, to allow for this enhancement.
> 
> Daniel P. Berrangé (4):
>   docs: fix typo s/Intel/AMD/ in CPU model notes
>   qemu-options: re-arrange CPU topology options
>   qemu-options: tweak to show that CPU count is optional
>   qemu-options: rewrite help for -smp options
> 
>  docs/system/cpu-models-x86.rst.inc |  2 +-
>  qemu-options.hx                    | 37 ++++++++++++++++++++----------
>  2 files changed, 26 insertions(+), 13 deletions(-)
> 
> -- 
> 2.31.1
> 
>

For the series

Reviewed-by: Andrew Jones <drjones@redhat.com>


