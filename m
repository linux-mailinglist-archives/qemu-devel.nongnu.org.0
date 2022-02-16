Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 780014B83D4
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 10:18:41 +0100 (CET)
Received: from localhost ([::1]:37820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKGSO-0007F3-K3
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 04:18:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nKEhC-0004Ox-P2
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 02:25:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nKEh0-0001Vq-Cv
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 02:25:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644996335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RYb+3RRcwua5a20wq3o5INNdPDHq4kHd+sF08OgFRtA=;
 b=i/BYsxW7cWoaC3oGdbhM2qmcLCtz9xuLy8bl83GHs1RlPdrlfSurJYXcLiG2pIl9jkkluf
 u7TBAQSpIB9aDNyYRfMxzPfgULyUMImoXOJLMlW6ucr2bEd3H0bcE+RqF9nEyKN0yeDXrj
 /F3lh1H2c4qOY3zmTiVnVwF/Z8w1EAw=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-GjoY0nnLNMu_wVHJxl9-6A-1; Wed, 16 Feb 2022 02:25:33 -0500
X-MC-Unique: GjoY0nnLNMu_wVHJxl9-6A-1
Received: by mail-pj1-f71.google.com with SMTP id
 o5-20020a17090a4e8500b001b9c3948dd2so4111470pjh.3
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 23:25:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=RYb+3RRcwua5a20wq3o5INNdPDHq4kHd+sF08OgFRtA=;
 b=jpH2KdyfakQA/yUOiWGsVkR4prMvVHnfPpmykBsImM6mJ5OwOYdPwaVtPGJLp4qrIM
 q5zzlz08fPa5IROXXbcnsSXgzw5wIgl7m4+jQhVmxh2r/ybId2U+CshvAHOgfbf4EG1J
 ecpVpkCtINBfVMGEaoMBCmN+mIxTZe6RqOsMDkBI3AJO7NZpJ8TyVDfuabkZQALyLOgp
 H2Qy3QpbC9PzkrR/JIWQQBALl/lcGk9z2gzDFpefPwOc9VgJpzE8pwv3OI+qHSeeKJMo
 ewMDqNFuRyfpJNJxuzZTFW/n2rLAfczIYiNB6/i4NQmpNpt69lrjc4QbBqCnWpjuzpSn
 CICg==
X-Gm-Message-State: AOAM532xg81lPd4pU5VDriDYWfmcgcCVjXZwMJSbCPNcOKCA20eeQp1I
 hOiIwcSLQNRJx9rjJMYf/E0u4yLz/ZVzFabyjjoWmlp7UfHyghXAaw5lhq/laMY+6ZYmcVSE2hW
 nkQ5Bty8ll0f6+J8=
X-Received: by 2002:a05:6a00:1787:b0:4e0:6135:d5e8 with SMTP id
 s7-20020a056a00178700b004e06135d5e8mr1368666pfg.55.1644996332710; 
 Tue, 15 Feb 2022 23:25:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxw46i+c9l4oPuldZGvZPbz28qldSKrREmEt1xiLdAmvBGrgvz6kAvOcdhpCrrDy2QaNSrZGQ==
X-Received: by 2002:a05:6a00:1787:b0:4e0:6135:d5e8 with SMTP id
 s7-20020a056a00178700b004e06135d5e8mr1368650pfg.55.1644996332430; 
 Tue, 15 Feb 2022 23:25:32 -0800 (PST)
Received: from xz-m1.local ([64.64.123.81])
 by smtp.gmail.com with ESMTPSA id nl8sm11253926pjb.18.2022.02.15.23.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 23:25:31 -0800 (PST)
Date: Wed, 16 Feb 2022 15:25:20 +0800
From: Peter Xu <peterx@redhat.com>
To: Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Subject: Re: [PATCH] util: Add iova_tree_alloc
Message-ID: <Ygym4GASfEd0Koe4@xz-m1.local>
References: <345cd684-0cc2-a685-0611-e2fcf0dfc52b@redhat.com>
 <20220215193422.1777441-2-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220215193422.1777441-2-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 15, 2022 at 08:34:23PM +0100, Eugenio Pérez wrote:
> This iova tree function allows it to look for a hole in allocated
> regions and return a totally new translation for a given translated
> address.
> 
> It's usage is mainly to allow devices to access qemu address space,
> remapping guest's one into a new iova space where qemu can add chunks of
> addresses.
> 
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


