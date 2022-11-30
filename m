Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A955763CF69
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 07:58:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0H2w-0003Ds-RB; Wed, 30 Nov 2022 01:58:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p0H2r-0003DL-PB
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 01:58:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p0H2q-0001OH-Bi
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 01:58:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669791491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LNvSTArGOwiYNk8+S4s1ZqSUZfQMuhgOn5VwQrGrwxs=;
 b=VHWxCxZLhn9MbOdgDrsdOxsHEIoHQuyWzP/y9Z6gQCmpOireU0wjzKbwOf/M80QNAs5qAd
 ERIr/uWO/WDaT5M8M9tqCAREMyL6in6/1HVEQwq7pr1G3/WGpEvaxBv40xzIsta/xBY107
 yFIvIVH3cI+HOyh+tdmDSk4ZSFUtX40=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-599-FkqUprtdPdWLG8f2BCLYaA-1; Wed, 30 Nov 2022 01:58:03 -0500
X-MC-Unique: FkqUprtdPdWLG8f2BCLYaA-1
Received: by mail-wm1-f72.google.com with SMTP id
 v188-20020a1cacc5000000b003cf76c4ae66so574902wme.7
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 22:58:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LNvSTArGOwiYNk8+S4s1ZqSUZfQMuhgOn5VwQrGrwxs=;
 b=5Mh5ea3RrEFEkoEmsZUFgitm4qe+y2zWeJrcD43JdXt7iaph8EcVqkmNrDV1xOkVvm
 IfoALlakJRF9bQZsjbRF/TfX+b1VRC443RLJ3/pRwHjY7zNN7yVtxSdPKE+80Va+Bk5p
 WaU0zfVgAZmDko5QVicHn9xMXdvHzvAWS1LKSo9BjeYUCV+n1jv7Cw24sPaphUURJDmw
 D+BjTeG7u28zB3oZ82H8GrcWR35yxt4YViUKkC6ByAKS6x5eiQ1Ax0Q0Ce0lht0XKJCE
 frnME/ubHb1AFH1vv8K/6NhSd/WalDviN19YHkRmNLuOgHxICDe6/QImZzpdQ99ik0hw
 6aYg==
X-Gm-Message-State: ANoB5pmAPov+PpZKLsKIuMHHeGzQ8UM2RMAiOwz3rqX5luOQCrvNOkSy
 FH7RXdoXLl/1Z0qwr4KbbdHl/u9tB61li2qj5EjR6Dc1e1SabDLpowC+Nj+w4nEG951lyXZlt/z
 tahYAomCxdbOt8YI=
X-Received: by 2002:a05:6000:12d0:b0:242:14f5:7aa5 with SMTP id
 l16-20020a05600012d000b0024214f57aa5mr9061290wrx.465.1669791482555; 
 Tue, 29 Nov 2022 22:58:02 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7PRZZHqVyLL3G2cm9awD/iZM056lJlT8razCcbwHWam+OwYIw15X0t312OHp/2umVoKu+1ag==
X-Received: by 2002:a05:6000:12d0:b0:242:14f5:7aa5 with SMTP id
 l16-20020a05600012d000b0024214f57aa5mr9061282wrx.465.1669791482296; 
 Tue, 29 Nov 2022 22:58:02 -0800 (PST)
Received: from redhat.com ([2.52.19.245]) by smtp.gmail.com with ESMTPSA id
 n10-20020adffe0a000000b00241bd7a7165sm561907wrr.82.2022.11.29.22.58.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 22:58:01 -0800 (PST)
Date: Wed, 30 Nov 2022 01:57:58 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, slp@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org,
 viresh.kumar@linaro.org, sgarzare@redhat.com
Subject: Re: [PATCH for 7.2-rc3 v3 0/7] fix vhost-user issues with CI
Message-ID: <20221130015526-mutt-send-email-mst@kernel.org>
References: <20221128164105.1191058-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221128164105.1191058-1-alex.bennee@linaro.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

Patch 1 is good but inappropriate for 7.2
Patch 2 should be last in series.
Patch 4 we are dropping.
I thought hard about it, I think we should patch vhost user net too
because of the risk introduced by patch 2 (which affects everyone).
Can be a patch on top though.

Besides this, for series:

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

-- 
MST


