Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EDF5656B2
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 15:14:17 +0200 (CEST)
Received: from localhost ([::1]:57738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Lu3-00059m-SZ
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 09:14:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8Li3-0006E9-AY
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:01:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8Li1-000876-M3
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:01:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656939708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GZed/lV7Bp5NQmI5+VRLaH+5UMOlGI6VCOgf+iycbHs=;
 b=a8fSnrS9UDIAPd/Vzce0zBN+wHwJQUpSm88gBb4PIn8otxlAUaIiwjcPiu6ACwvQa/fDh/
 Lz8MHNf8De/xFvVBWichoGI75tytxMc+NEURSLbG4vwhUTxyzHxM8l2+3xx7GuJ0AIN30M
 sbdTLPsawieNvmpBoOdwgxse2OYv1ok=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-157-o2HmX0pOM3GhKV9dM-tRtA-1; Mon, 04 Jul 2022 09:01:47 -0400
X-MC-Unique: o2HmX0pOM3GhKV9dM-tRtA-1
Received: by mail-il1-f197.google.com with SMTP id
 b8-20020a92c568000000b002dc0d54f7b1so1427749ilj.19
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:01:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GZed/lV7Bp5NQmI5+VRLaH+5UMOlGI6VCOgf+iycbHs=;
 b=r02fa7ekTZOGblWWT3d2XlBfjx7vDs5kXgeOVkGXRlv4bBsR+RHi+xjuiOZ9s79P8W
 NQOZaWxvhDAWDVaXipygeQZeYZXpp4WC457GX6D19J2AayM4TSRNw3n7/1zJQWPF5K24
 O6unbdmGo8wtOL03Rm4vQZaON734RzeY7z11RmnlcDv1ixkjxLcgE5LgIOYtAkPGjcIt
 bE+TlSUiH8WYRMB8SVFpqWT7pCjVNtZRfU92YPKOe7rHlCpO4VSJWHL+tkc6gf5aaDBg
 ejTnT8SMorDr4OeHRDe32S3wkYvgeB6+daXpzhELjRojFUA9vpLgtddY3ii2j4Ut8UoN
 ELmw==
X-Gm-Message-State: AJIora/l3RNgdkF2ojC8HVmDnyguqcwWnUZM96+QDx+vbnnNX18vJch1
 VvMScYtmN1Um2A1eSvjuy7deZDqDSy1sSV0ju1RTwtEsPb1Ytyl+BCtYVdXnY15IOmYGdZrUra6
 MjfuB1W0wz3ytXOVSn2aXLYWbZr1jhmI=
X-Received: by 2002:a05:6602:2e0c:b0:669:b7a8:fb0a with SMTP id
 o12-20020a0566022e0c00b00669b7a8fb0amr14974542iow.121.1656939706396; 
 Mon, 04 Jul 2022 06:01:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tSgtLfPyO3166c60iABntBkG36+KXRIn06XoUjtbiwICvq7s9HdSquu5rA7KQyKYwiLranyhRO1qgRBlnkfCQ=
X-Received: by 2002:a05:6602:2e0c:b0:669:b7a8:fb0a with SMTP id
 o12-20020a0566022e0c00b00669b7a8fb0amr14974530iow.121.1656939706121; Mon, 04
 Jul 2022 06:01:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220509103019.215041-1-pbonzini@redhat.com>
 <20220509103019.215041-18-pbonzini@redhat.com>
In-Reply-To: <20220509103019.215041-18-pbonzini@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Mon, 4 Jul 2022 14:01:10 +0100
Message-ID: <CAELaAXzxceaktWsdrrqV2eCPKMvnt4f9X2QFFGuqAu8fWus6Cw@mail.gmail.com>
Subject: Re: [PATCH v2 17/26] qed: add missing coroutine_fn annotations
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 9, 2022 at 12:05 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/qed.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Alberto Faria <afaria@redhat.com>


