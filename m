Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AB1436350
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 15:46:16 +0200 (CEST)
Received: from localhost ([::1]:49888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdYOd-00019n-D2
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 09:46:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mdYLj-0006DJ-Kr
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 09:43:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mdYLe-0005oi-R9
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 09:43:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634823789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=op4KTM293q3Fsnup1+lsu48AEemdMbMO+XiUpk8nW0Q=;
 b=DWrM05kI4n/ayeulnCtB/VwUvtab/L8c0AmmU/KnRuulbKDmqOp9Wn1ZD2fj5PXmFzNHPF
 NHXgSC29TzZ3sA001NUn5BlQvN811Nmq+UyoBVlKSQlP9WVYOrBWYB9Fn3ecfTAUg2EANZ
 hynWvHtDFGNv7U9AAOqpmA+AnnCkbvM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-NZy4fd5DM-evePerA6nMTg-1; Thu, 21 Oct 2021 09:43:08 -0400
X-MC-Unique: NZy4fd5DM-evePerA6nMTg-1
Received: by mail-wm1-f72.google.com with SMTP id
 v10-20020a1cf70a000000b00318203a6bd1so349070wmh.6
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 06:43:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=op4KTM293q3Fsnup1+lsu48AEemdMbMO+XiUpk8nW0Q=;
 b=wYS7ROIcEH9VLstb1UlTwCtSyt92zKFrPLiZBxDBgPz76U4oC19LEydQHuTawYgHd3
 /Mg76WWZupyx9tZD5ujxu4wZ/RSFem0ITwf7Zx9ctACDISo4SJjXjk2BCppoaEpgYBqt
 g09w9Ny7gN2Dl/G+v7c+I+zARGXujhv0eYnZp74FHjIJ88wg0QiLDO/Pz/2PyFqHLPCx
 ZJj8RMWwH5gVQBaTdhRMOEcbSrlQltHUOnDmXejt0Xn7+5fTts6J1zzZfqwf0htdAj5N
 R+zDwt4A+FxkwZkCsO190ZcKER023T6imBayWg7TWgP7zmVrO5DEZI80k+oO5COoKZjD
 xBpA==
X-Gm-Message-State: AOAM533n++i72ql/Rh6CrvSJSeTxJ/RTZzGHbT5W6ledJ/Yt3eEcZj2J
 M9n0kJRMnbXysygrBQp7QsO8Ha9tH4LdIgO2liFF2wajkdLpw1QDViRiKYW3PBpyjrI1u5GkKjX
 qjDljjM4CzT11M/U=
X-Received: by 2002:a7b:c3cc:: with SMTP id t12mr6532420wmj.182.1634823786789; 
 Thu, 21 Oct 2021 06:43:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUV+huaevPwJVKATt9+Rh8jFwsd0n79NKWNsaHfMxT1Cw3/Sv4gcqQCT8w/2oX/3gLv0K0kg==
X-Received: by 2002:a7b:c3cc:: with SMTP id t12mr6532382wmj.182.1634823786622; 
 Thu, 21 Oct 2021 06:43:06 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id k17sm4895735wrq.7.2021.10.21.06.43.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 06:43:05 -0700 (PDT)
Date: Thu, 21 Oct 2021 09:43:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] microvm: add device tree support.
Message-ID: <20211021094244-mutt-send-email-mst@kernel.org>
References: <20211014193617.2475578-1-kraxel@redhat.com>
 <20211021125724.uvnmb3a4xjnu37au@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20211021125724.uvnmb3a4xjnu37au@sirius.home.kraxel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 21, 2021 at 02:57:24PM +0200, Gerd Hoffmann wrote:
> On Thu, Oct 14, 2021 at 09:36:17PM +0200, Gerd Hoffmann wrote:
> > Allows edk2 detect virtio-mmio devices and pcie ecam.
> > See comment in hw/i386/microvm-dt.c for more details.
> 
> Anyone picking this up?
> Or should I do a one-patch pull request?
> 
> take care,
>   Gerd

microvm is sergio and paolo ...

-- 
MST


