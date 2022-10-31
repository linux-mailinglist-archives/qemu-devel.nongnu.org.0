Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B0A613F13
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 21:39:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opbXO-0001ZB-BG; Mon, 31 Oct 2022 16:37:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opbWt-0001TD-Id
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 16:37:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opbWr-0000iY-MG
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 16:37:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667248624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8lCzyXQBQmvFPPsJsTi4QQLd3RBvxMZB4e2ReavBZtc=;
 b=eu1dvqiyb/lpJR9VRnb3Qh71f3esrlSkGPydUIi6M6u5zGeichUJECKo8YEz1D+0oNVw6J
 ricLSL7uW2LawreUmcZJpIap1z3C0Qjrz+PM3FisNZFUvmV2oUrY93lBibuohq6gtDlXvs
 6Cn1ry8UyyfOP/jHJOoHU9AueprumhE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-622-iwcsJEIhNbKl5sAXO29z0Q-1; Mon, 31 Oct 2022 16:37:03 -0400
X-MC-Unique: iwcsJEIhNbKl5sAXO29z0Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 e13-20020adf9bcd000000b00236b36cd8cbso1879088wrc.0
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 13:37:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8lCzyXQBQmvFPPsJsTi4QQLd3RBvxMZB4e2ReavBZtc=;
 b=2db7H7PC91bZt82y36jCasaelDTQfPl10ElZZJ4GVxft/6jtyozzZ/90GzGazJJ7oG
 Sui/Wn4owvBs+RQzSNzVTRNB90F4i0DO+gey2/EsEZMagLnZsWuu0uhOj1PeKm0b8awF
 1MLmsGTpVvbwQ1XDR6JushkE3bWYQOWFPA3laRXxC+PL7tD6eaTCDa6C9BOIqnHwZOH8
 HD361jPwR/i9UlZZYR3/s6oSdlxWPfx4bPGHX120RibucKbrW59myDAQaW/sK6V+i2kS
 lK/6WdqQTddYDRQwjAEz43mGeNv7spq/i7Gi9OB5ih7aVl4K8IDvj/5plFdun6hzMJ2k
 fEPw==
X-Gm-Message-State: ACrzQf0x611A5TlvbzNYGNZV9VKQKIZJh4pitRbogV1IRx0sbo7awZGu
 h5b385b0FQsaVUKEJlhwDcxgh5q2rfcWke276iVrLHbT8StMSiTwoeUyPIK2iu1PeGRhpQmNn0T
 Tcm+hR+wgq5lzOQg=
X-Received: by 2002:adf:a74a:0:b0:236:6dc8:f562 with SMTP id
 e10-20020adfa74a000000b002366dc8f562mr9215222wrd.717.1667248620587; 
 Mon, 31 Oct 2022 13:37:00 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7BQ1f8HCB0NnT/pvy7N2r9U1Gx4xfIABp9tXsmNz2EKrr6Cmyi5FjjoEH1HTT6fUPZd1gWWw==
X-Received: by 2002:adf:a74a:0:b0:236:6dc8:f562 with SMTP id
 e10-20020adfa74a000000b002366dc8f562mr9215215wrd.717.1667248620333; 
 Mon, 31 Oct 2022 13:37:00 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 g13-20020a05600c310d00b003b4cba4ef71sm9968984wmo.41.2022.10.31.13.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 13:36:59 -0700 (PDT)
Date: Mon, 31 Oct 2022 16:36:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/86] pci,pc,virtio: features, tests, fixes, cleanups
Message-ID: <20221031163608-mutt-send-email-mst@kernel.org>
References: <20221031124928.128475-1-mst@redhat.com>
 <CAJSP0QXz+7Yvde1-N4OjQQ+Vo95UsQoOONmRXQsBg8wEJFaC3g@mail.gmail.com>
 <CAJSP0QUPg2pMZ1Waxwz-gQM+ObmudiuPvPGbY2anzVf6GBLWZg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJSP0QUPg2pMZ1Waxwz-gQM+ObmudiuPvPGbY2anzVf6GBLWZg@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Oct 31, 2022 at 04:12:24PM -0400, Stefan Hajnoczi wrote:
> Another CI failure:
> https://gitlab.com/qemu-project/qemu/-/jobs/3253817492
> 
> Stefan

Thanks!
Freeze rules only require pull request on list so I think it's ok if I
handle the failout and resubmit day after tomorrow, right?

-- 
MST


