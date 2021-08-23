Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED963F4717
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 11:05:14 +0200 (CEST)
Received: from localhost ([::1]:43472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI5t9-0000zy-7d
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 05:05:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mI5r7-0007oK-Go
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 05:02:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mI5r5-0002Eq-RY
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 05:02:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629709375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pXbxD27RNJn6Zb7UmsWDzEYVociFGo5aey7QVDOayio=;
 b=EwDhrSkncjXdCsspgwRs+/RQl+y/D+Yr6htMrif1bVOGg3LRFwn9+dv5v7IlBxERhLpNco
 gZ6NTIeAxeuyyZzXT44+mFkmJAA6zphYCzmrLbS5fvRZhuBbHRgasl3fPaH6H0mXgISCRl
 Ds0CLZqPpBOm83QEOYqmxXgtobRXUlg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-FoFPjh1NMIG1ZUbZbXKOPw-1; Mon, 23 Aug 2021 05:02:50 -0400
X-MC-Unique: FoFPjh1NMIG1ZUbZbXKOPw-1
Received: by mail-ed1-f71.google.com with SMTP id
 d12-20020a50fe8c0000b02903a4b519b413so8414619edt.9
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 02:02:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pXbxD27RNJn6Zb7UmsWDzEYVociFGo5aey7QVDOayio=;
 b=Z9sCY5aKwC3BrbLSmDhdd3T+CyTGenMBovNjzGIvyBHk+TZjiDgP11U6WL1nexo2DC
 Dax3NCHXXbbNDtnyySN90N0z0gqMgS04cP87CEXrIstdbGikxl53Iydph4OuO5pyscZX
 gjKs8awYGUPtMGYqqpP1LFExLdR7FPkp6buqVJ9l9W9nbbOWfAI/sOvg6ztDsZ1KxBRk
 ALi4Tx72EJSKmKYtPw5Kjh9sAChxcZd0+qctpDEJXoHJn8WulcL16lA2B2UWZyszK8Hs
 EPdS01fBUqolVWKawmzVIkLVLT1bGFu4OpMLkrWnH8ETMmZet9kqqjR/bgEd2tEkyQSm
 ndog==
X-Gm-Message-State: AOAM531hSUSRXuEPJ/rSYV144vtCmPfJMhIElVsGgWTrC7Cs1HQz/mt7
 RSLwb6q9vNc1ShNUrE8MR9rMDDtnH7eRPrbnMaBWqXjvgtLeYgBFja91+QAoiTLEIDNHnpM36xE
 MTwTC9JLctTk5L78=
X-Received: by 2002:aa7:dc56:: with SMTP id g22mr2634586edu.187.1629709368962; 
 Mon, 23 Aug 2021 02:02:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmurMyS2s8JNb0yKxqTP/h8V90oObbwEiU2Zyv51PsNr5gdeRM3IotGV2SID3bNAN4WXXYow==
X-Received: by 2002:aa7:dc56:: with SMTP id g22mr2634570edu.187.1629709368801; 
 Mon, 23 Aug 2021 02:02:48 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id l16sm2522764ejg.42.2021.08.23.02.02.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 02:02:48 -0700 (PDT)
Date: Mon, 23 Aug 2021 11:02:46 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v2 2/3] docs/about: Unify the subject format
Message-ID: <20210823090246.oih65hbl7y63253d@gator.home>
References: <20210823030005.165668-1-wangyanan55@huawei.com>
 <20210823030005.165668-3-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210823030005.165668-3-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.746,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 libvir-list@redhat.com, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 23, 2021 at 11:00:04AM +0800, Yanan Wang wrote:
> There is a mixture of "since/removed in X.Y" vs "since/removed in X.Y.Z"
> in the subjects in deprecated.rst/removed-features.rst. It will be better
> to use an unified format. It seems unlikely that we will ever deprecate
> something in a stable release, and even more unlikely that we'll remove
> something in one, so the short versions look like the thing we want to
> standardize on.
> 
> So here we unify the subject format in deprecated.rst to "since X.Y", and
> unify the subject format in removed-features.rst to "removed in X.Y".
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  docs/about/deprecated.rst       | 56 ++++++++++++++++-----------------
>  docs/about/removed-features.rst | 28 ++++++++---------
>  2 files changed, 42 insertions(+), 42 deletions(-)
>

Reviewed-by: Andrew Jones <drjones@redhat.com>


