Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A803AB771
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 17:28:01 +0200 (CEST)
Received: from localhost ([::1]:33704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lttw0-0006Nl-ED
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 11:28:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lttvE-0005jI-KD
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 11:27:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lttvB-0001ug-19
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 11:27:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623943627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MnX/6PAv3kzqhUVvZoSFhpW7sakhKgisrslFxIEGcBs=;
 b=EbK9fgZ4h1U276ROTbjsiOwnAul9qS6A0OH5M6Cfh4BjkHm2b4l0KFjQeJ94XTOGAT0Ind
 /7+hHgG+B1t/gSRkczWAEdoroJPPZ6VwoEcW+ebjSaJxRB0JIEy8I1X6BYN1PpT6VSpXko
 tbzJI8FNmefJg6hyYQpHf/04FJXV1C8=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-oGsPEG8YNLKfB0uEIs1IMQ-1; Thu, 17 Jun 2021 11:27:06 -0400
X-MC-Unique: oGsPEG8YNLKfB0uEIs1IMQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 205-20020a3707d60000b02903aa9208caa2so2316664qkh.13
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 08:27:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MnX/6PAv3kzqhUVvZoSFhpW7sakhKgisrslFxIEGcBs=;
 b=LDoc7L74INug32EiAkEW3MgLsYeL2g0j0s9HUlJeR9ArwCD3MvqoS4kPX8y9ojj963
 ZF/GMPJHbnI2TdBSKRpnIKVPF5ABrXKhOxAV3HNcPyppH/Jl3a59BiGGHOPuYoJuJa86
 eB0Zoy7zhRirx+ydbqC3ngic/byGexxzQ8NATCQRGLlD2dWBCQ16qwiLJ376bwvN0Z0Z
 ZfmttCDzQboVryfaUg7rR8Q5qY0Mg69LXj74EkOSKnMpwnsgq5v7eIET6MfpjTNawQ9u
 SKc2zJRT+XCS2Q6bLkePo3G1oLRSVCAkBKiLnH/sw/KrY9B3yLGnk8bckrifjpwjPuyh
 sf1w==
X-Gm-Message-State: AOAM531orO8SQo+E711fsNtT+sInZviwZTxCDSn1lykcsuCLVbU1cYDB
 mSKE53Gn1hBDXI/gd6+duxWvh6hGXDJVtMWiWPF3VB4ZhNknsZPX+lJ4EQZlLtdGRPxjdoBQSx1
 NZwUj0zfLhSN1CnI=
X-Received: by 2002:a05:6214:1551:: with SMTP id
 t17mr355149qvw.50.1623943625581; 
 Thu, 17 Jun 2021 08:27:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZDigkQ/AFcRsi+8sqnr/08h2I0070lHS7U9WJ48+P+BKJKtJ0ggKOh+h+OY8MSfZX++teRw==
X-Received: by 2002:a05:6214:1551:: with SMTP id
 t17mr355132qvw.50.1623943625391; 
 Thu, 17 Jun 2021 08:27:05 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id 20sm1897781qky.124.2021.06.17.08.27.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 08:27:04 -0700 (PDT)
Date: Thu, 17 Jun 2021 11:27:03 -0400
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v7 4/7] migration/dirtyrate: introduce struct and adjust
 DirtyRateStat
Message-ID: <YMtpxwcxQgVKork7@t490s>
References: <cover.1623938622.git.huangy81@chinatelecom.cn>
 <d91f66916a28327105f62919092224a403a0067f.1623938622.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <d91f66916a28327105f62919092224a403a0067f.1623938622.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Chuan Zheng <zhengchuan@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 17, 2021 at 10:12:05PM +0800, huangy81@chinatelecom.cn wrote:
>  ##
> +# @DirtyRateMeasureMode:
> +#
> +# An enumeration of mode of measuring dirtyrate.
> +#
> +# @page-sampling: calculate dirtyrate by sampling pages.
> +#
> +# @dirty-ring: calculate dirtyrate by via dirty ring.
> +#
> +# Since: 6.1
> +#
> +##
> +{ 'enum': 'DirtyRateMeasureMode',
> +  'data': [ 'none', 'page-sampling', 'dirty-ring'] }

I still don't get why we need "none" mode.  Could you explain?

-- 
Peter Xu


