Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6706B4CF280
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 08:18:26 +0100 (CET)
Received: from localhost ([::1]:50290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR7dR-0000rC-0B
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 02:18:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nR7UQ-0006xB-LS
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 02:09:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nR7UN-0001W4-Ti
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 02:09:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646636943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3fEjqPNyhNHkvuPhu1pumSkdFp1WMIkiBoDRBZ5vakQ=;
 b=DusuVkVLsP7Tw8jxBhM0FvDSfw/bBm58+gqq+sJpjyarHKUPgWZ9WyhSKP0NUJZSzHKjIz
 XQdwt7L0TWtxnfruscE3hPw9WHcSkKeRFWT/YcY3YiEU5b3Vrr29R1Q/aSit5niOEW5Uh6
 lzRCET7yH+lF9hh0xf7AiAhQ5joEJJg=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-43-XZSMBgpCPX2QNXz1X-ryuQ-1; Mon, 07 Mar 2022 02:09:00 -0500
X-MC-Unique: XZSMBgpCPX2QNXz1X-ryuQ-1
Received: by mail-pj1-f71.google.com with SMTP id
 g19-20020a17090a579300b001b9d80f3714so9242183pji.7
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 23:09:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=3fEjqPNyhNHkvuPhu1pumSkdFp1WMIkiBoDRBZ5vakQ=;
 b=sl27ZFBiDwthvWnxzSGHb1cY5rNDROYtpFbjUE69ngSnFQ4WhvER8a0RYE20p6nlNu
 iNWXBoiavAakJI2686twHcc+Yvc46N0xXodWsJky/Lb3gjC3TFibrK7pekuDQwMG+eaN
 mLDgXEYOcYT0DBxmZ2vDWg8KRAikS33YQXpxqC+sFp4mQU9gSTbeHfJIOYyVkhGe1iZt
 pWRI+TXUk+f8ZXBH3rsheyPGUefgua84pvORNMHl8Ww2o1SKIrqgmtBiThSqx113m6tY
 wOHQct+vCeiz6CyD7SsTXW6Tfxt/aNLquzaou0ll32mz4cnqKb1pfQ/xknNeCoBud/BI
 mXXw==
X-Gm-Message-State: AOAM532TndOnHyUQFuVzd4hunxobuZgzk9t/alNIolP0G3/kQ38FZcpq
 94Fdmke8jvAm5ujdGioeR7ja2cHW0EpbK6CvOf21bWfD/LlieKsyXvH52g1hUFqrItjtpztIocH
 KHdYvKDbdOZEWH/E=
X-Received: by 2002:a17:90a:4b0d:b0:1bc:f9da:f334 with SMTP id
 g13-20020a17090a4b0d00b001bcf9daf334mr23869995pjh.75.1646636939072; 
 Sun, 06 Mar 2022 23:08:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzCjhh8Skdgs9ttspceav1EW5wP0ASDgsFjyqs0tbmwGUQ0fvz1ydSkDiTmcrwPXfpYQokW5w==
X-Received: by 2002:a17:90a:4b0d:b0:1bc:f9da:f334 with SMTP id
 g13-20020a17090a4b0d00b001bcf9daf334mr23869970pjh.75.1646636938812; 
 Sun, 06 Mar 2022 23:08:58 -0800 (PST)
Received: from xz-m1.local ([94.177.118.47]) by smtp.gmail.com with ESMTPSA id
 h22-20020a056a00231600b004e1784925e5sm14889356pfh.97.2022.03.06.23.08.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 23:08:58 -0800 (PST)
Date: Mon, 7 Mar 2022 15:08:53 +0800
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 07/18] migration: fix use of TLS PSK credentials with a
 UNIX socket
Message-ID: <YiWvhXEZrC/p4/2j@xz-m1.local>
References: <20220302174932.2692378-1-berrange@redhat.com>
 <20220302174932.2692378-8-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220302174932.2692378-8-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 02, 2022 at 05:49:21PM +0000, Daniel P. Berrangé wrote:
> The migration TLS code has a check mandating that a hostname be
> available when starting a TLS session. This is expected when using
> x509 credentials, but is bogus for PSK and anonymous credentials
> as neither involve hostname validation.
> 
> The TLS crdentials object gained suitable error reporting in the
> case of TLS with x509 credentials, so there is no longer any need
> for the migration code to do its own (incorrect) validation.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Do we need a Fixes tag for this?

-- 
Peter Xu


